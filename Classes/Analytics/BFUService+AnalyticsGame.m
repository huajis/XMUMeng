//
//  BFUService+AnalyticsGame.m
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService+AnalyticsGame.h"
#import <UMAnalyticsGame/MobClickGameAnalytics.h>

@implementation BFUService (AnalyticsGame)

#pragma mark - Level methods
+ (void)setUserLevelId:(int)levelId {
    [MobClickGameAnalytics setUserLevelId:levelId];
}

+ (void)setUserLevel:(NSString *)level {
    if (level == nil || [level isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClickGameAnalytics setUserLevel:level];
}

+ (void)startLevel:(NSString *)level {
    if (level == nil || [level isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClickGameAnalytics startLevel:level];
}

+ (void)finishLevel:(NSString *)level {
    if (level == nil || [level isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClickGameAnalytics finishLevel:level];
}

+ (void)failLevel:(NSString *)level {
    if (level == nil || [level isKindOfClass:[NSNull class]]) {
        return;
    }
    [MobClickGameAnalytics failLevel:level];
}

#pragma mark - Transaction methods
+ (void)exchangeWithOrderId:(NSString *)orderId currencyAmount:(double)currencyAmount currencyType:(NSString *)currencyType virtualCurrencyAmount:(double)virtualCurrencyAmount payChannel:(int)payChannel {
    if (orderId == nil || [orderId isKindOfClass:[NSNull class]]) {
        return;
    }
    if (currencyType == nil && [currencyType isKindOfClass:[NSNull class]]) {
        currencyType = nil;
    }
    [MobClickGameAnalytics exchange:orderId currencyAmount:currencyAmount currencyType:currencyType virtualCurrencyAmount:virtualCurrencyAmount paychannel:payChannel];
}

+ (void)payForCoinWithCash:(double)cash source:(int)source coin:(double)coin {
    [MobClickGameAnalytics pay:cash source:source coin:coin];
}

+ (void)payForItemWithCash:(double)cash source:(int)source item:(NSString *)item amount:(int)amount price:(double)price {
    if (item == nil && [item isKindOfClass:[NSNull class]]) {
        item = nil;
    }
    [MobClickGameAnalytics pay:cash source:source item:item amount:amount price:price];
}

+ (void)buyItem:(NSString *)item amount:(int)amount price:(double)price {
    if (item == nil && [item isKindOfClass:[NSNull class]]) {
        item = nil;
    }
    [MobClickGameAnalytics buy:item amount:amount price:price];
}

+ (void)useItem:(NSString *)item amount:(int)amount price:(double)price  {
    if (item == nil && [item isKindOfClass:[NSNull class]]) {
        item = nil;
    }
    [MobClickGameAnalytics use:item amount:amount price:price];
}

+ (void)bonusWithCoin:(double)coin source:(int)source {
    [MobClickGameAnalytics bonus:coin source:source];
}

+ (void)bonusWithItem:(NSString *)item amount:(int)amount price:(double)price source:(int)source {
    if (item == nil && [item isKindOfClass:[NSNull class]]) {
        item = nil;
    }
    [MobClickGameAnalytics bonus:item amount:amount price:price source:source];
}

@end
