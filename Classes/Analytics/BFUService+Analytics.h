//
//  BFUService+Analytics.h
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFUService (Analytics)

+ (void)profileSignInWithPUID:(NSString *)PUID;
+ (void)profileSignInWithPUID:(NSString *)PUID provider:(NSString *)provider;
+ (void)profileSignOff;

+ (void)onEvent:(NSString *)eventId;
+ (void)onEvent:(NSString *)eventId label:(NSString *)label;
+ (void)onEvent:(NSString *)eventId attributes:(NSDictionary *)attributes;
+ (void)onEvent:(NSString *)eventId attributes:(NSDictionary *)attributes counter:(int)counter;

+ (void)logPageView:(NSString *)pageView second:(int)second;
+ (void)beginLogPageView:(NSString *)pageView;
+ (void)endLogPageView:(NSString *)pageView;

@end

NS_ASSUME_NONNULL_END
