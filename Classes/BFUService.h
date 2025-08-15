//
//  BFUService.h
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFUService : NSObject

+ (void)initWithAppKey:(NSString *)appKey launchOptions:(NSDictionary *)launchOptions;

// For iOS 10
+ (void)receiveRemoteNotification:(NSDictionary *)userInfo
       fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end

NS_ASSUME_NONNULL_END
