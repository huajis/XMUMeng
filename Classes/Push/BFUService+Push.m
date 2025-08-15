//
//  BFUService+Push.m
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService+Push.h"
#import "NSData+DeviceToken.h"
#import <UMCommon/UMCommon.h>
#import <UMPush/UMessage.h>

@implementation BFUService (Push)

+ (void)setBadgeClear:(BOOL)value {
    [UMessage setBadgeClear: value];
}

+ (void)setAutoAlert:(BOOL)value {
    [UMessage setAutoAlert:value];
}

+ (NSString *)deviceToken {
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:@"kUMessageUserDefaultKeyForDeviceToken"];
    if ([data isKindOfClass:[NSData class]]) {
        return [data deviceToken];
    }
    return nil;
}

@end
