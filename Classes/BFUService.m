//
//  BFUService.m
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService.h"
#import <UMCommon/UMCommon.h>
#import <UMPush/UMessage.h>
#import <UserNotifications/UNUserNotificationCenter.h>
#import "UIMutableUserNotificationAction+Extension.h"

@interface BFUService () <UNUserNotificationCenterDelegate>

@property(class, readonly) BFUService *sharedInstance;
@property(class, readonly) BOOL isDeviceVersionBetween8to10;
@property(class, readonly) BOOL isDeviceVersionGreaterThanEqualTo10;
@property(class, readonly) BOOL isDeviceVersionLessThan10;

@end

@implementation BFUService

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static BFUService *instance;
    dispatch_once(&onceToken, ^{
        instance = [[BFUService alloc] init];
    });
    return instance;
}

+ (void)initWithAppKey:(NSString *)appKey launchOptions:(NSDictionary *)launchOptions {
    [UMConfigure initWithAppkey:appKey channel:@"App store"];
    [self registerPushWithLaunchOptions:launchOptions];
}

// For iOS 10
+ (void)receiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [UMessage setAutoAlert:NO];
    
    if (self.isDeviceVersionLessThan10) {
        [UMessage didReceiveRemoteNotification:userInfo];
    }
    
    //过滤掉Push的撤销功能，因为PushSDK内部已经调用的completionHandler(UIBackgroundFetchResultNewData)，
    //防止两次调用completionHandler引起崩溃
    if (![userInfo valueForKeyPath:@"aps.recall"]) {
        completionHandler(UIBackgroundFetchResultNewData);
    }
}

#pragma mark - Getter
+ (BOOL)isDeviceVersionBetween8to10 {
    if ((UIDevice.currentDevice.systemVersion.intValue >= 8) && (UIDevice.currentDevice.systemVersion.intValue < 10)) {
        return YES;
    }
    return NO;
}

+ (BOOL)isDeviceVersionGreaterThanEqualTo10 {
    if (UIDevice.currentDevice.systemVersion.intValue >= 10) {
        return YES;
    }
    return NO;
}

+ (BOOL)isDeviceVersionLessThan10 {
    if (UIDevice.currentDevice.systemVersion.intValue < 10) {
        return YES;
    }
    return NO;
}

#pragma mark - PushNotification methods
+ (void)registerPushWithLaunchOptions:(NSDictionary *)launchOptions {
    UMessageRegisterEntity *entity = [[UMessageRegisterEntity alloc] init];
    entity.types = UMessageAuthorizationOptionBadge | UMessageAuthorizationOptionSound | UMessageAuthorizationOptionAlert;
    
    //如果你期望使用交互式(只有iOS 8.0及以上有)的通知，请参考下面注释部分的初始化代码
    if (self.isDeviceVersionBetween8to10) {
        UIMutableUserNotificationAction *action1 = [UIMutableUserNotificationAction actionWithIdentifier:@"action1_identifier" title:@"打开应用" options:UIUserNotificationActivationModeForeground];
        UIMutableUserNotificationAction *action2 = [UIMutableUserNotificationAction actionWithIdentifier:@"action2_identifier" title:@"忽略" options:UIUserNotificationActivationModeBackground];
        
        UIMutableUserNotificationCategory *actionCategory1 = [[UIMutableUserNotificationCategory alloc] init];
        actionCategory1.identifier = @"category1";//这组动作的唯一标示
        [actionCategory1 setActions:@[action1,action2] forContext:(UIUserNotificationActionContextDefault)];
        NSSet *categories = [NSSet setWithObjects:actionCategory1, nil];
        entity.categories = categories;
    }
    //如果要在iOS10显示交互式的通知，必须注意实现以下代码
    else if (self.isDeviceVersionGreaterThanEqualTo10) {
        UNNotificationAction *action1_ios10 = [UNNotificationAction actionWithIdentifier:@"action1_identifier" title:@"打开应用" options:UNNotificationActionOptionForeground];
        UNNotificationAction *action2_ios10 = [UNNotificationAction actionWithIdentifier:@"action2_identifier" title:@"忽略" options:UNNotificationActionOptionForeground];
        
        //UNNotificationCategoryOptionNone
        //UNNotificationCategoryOptionCustomDismissAction  清除通知被触发会走通知的代理方法
        //UNNotificationCategoryOptionAllowInCarPlay       适用于行车模式
        UNNotificationCategory *category1_ios10 = [UNNotificationCategory categoryWithIdentifier:@"category1" actions:@[action1_ios10,action2_ios10]   intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
        NSSet *categories = [NSSet setWithObjects:category1_ios10, nil];
        entity.categories = categories;
        
        [UNUserNotificationCenter currentNotificationCenter].delegate = self.sharedInstance;
    }
    
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"Register successed");
        }
        else {
            NSLog(@"Register failed");
        }
    }];
}

#pragma mark - UNUserNotificationCenterDelegate
//iOS10新增：处理前台收到通知的代理方法
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSDictionary * userInfo = notification.request.content.userInfo;
    if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [UMessage setAutoAlert:NO];
        //应用处于前台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
    }
    else {
        //应用处于前台时的本地推送接受
    }
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}

//iOS10新增：处理后台点击通知的代理方法
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //应用处于后台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
    }
    else {
        //应用处于后台时的本地推送接受
    }
}

@end
