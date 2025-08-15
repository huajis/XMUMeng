//
//  BFUService+Analytics.m
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService+Analytics.h"
#import <UMCommon/UMCommon.h>
#import <UMCommon/MobClick.h>

@implementation BFUService (Analytics)

#pragma mark - Profile methods
+ (void)profileSignInWithPUID:(NSString *)PUID {
    if (PUID == nil || [PUID isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClick profileSignInWithPUID:PUID];
}

+ (void)profileSignInWithPUID:(NSString *)PUID provider:(NSString *)provider {
    if (PUID == nil || [PUID isKindOfClass:[NSNull class]]) {
        return;
    }
    if (provider == nil || [provider isKindOfClass:[NSNull class]]) {
        provider = nil;
    }
    [MobClick profileSignInWithPUID:PUID provider:provider];
}

+ (void)profileSignOff {
    [MobClick profileSignOff];
}

#pragma mark - Event methods

+ (void)onEvent:(NSString *)eventId {
    if (eventId == nil || [eventId isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClick event:eventId];
}

+ (void)onEvent:(NSString *)eventId label:(NSString *)label {
    if (eventId == nil || [eventId isKindOfClass:[NSNull class]]) {
        return;
    }
    if ([label isKindOfClass:[NSNull class]]) {
        label = nil;
    }
    [MobClick event:eventId label:label];
}

+ (void)onEvent:(NSString *)eventId attributes:(NSDictionary *)attributes {
    if (eventId == nil || [eventId isKindOfClass:[NSNull class]]) {
        return;
    }
    if ([attributes isKindOfClass:[NSNull class]]) {
        attributes = nil;
    }
    [MobClick event:eventId attributes:attributes];
}

+ (void)onEvent:(NSString *)eventId attributes:(NSDictionary *)attributes counter:(int)counter {
    if (eventId == nil || [eventId isKindOfClass:[NSNull class]]) {
        return;
    }
    if ([attributes isKindOfClass:[NSNull class]]) {
        attributes = nil;
    }
    [MobClick event:eventId attributes:attributes counter:counter];
}

#pragma mark - Page view methods
+ (void)logPageView:(NSString *)pageView second:(int)second {
    if (pageView == nil || [pageView isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClick logPageView:pageView seconds:second];
}

+ (void)beginLogPageView:(NSString *)pageView {
    if (pageView == nil || [pageView isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClick beginLogPageView:pageView];
}

+ (void)endLogPageView:(NSString *)pageView {
    if (pageView == nil || [pageView isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClick endLogPageView:pageView];
}

@end
