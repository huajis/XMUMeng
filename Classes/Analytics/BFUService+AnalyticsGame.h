//
//  BFUService+AnalyticsGame.h
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFUService (AnalyticsGame)

+ (void)setUserLevelId:(int)levelId;
+ (void)setUserLevel:(NSString *)level;
+ (void)startLevel:(NSString *)level;
+ (void)finishLevel:(NSString *)level;
+ (void)failLevel:(NSString *)level;

+ (void)exchangeWithOrderId:(NSString *)orderId currencyAmount:(double)currencyAmount currencyType:(NSString *)currencyType virtualCurrencyAmount:(double)virtualCurrencyAmount payChannel:(int)payChannel;
+ (void)payForCoinWithCash:(double)cash source:(int)source coin:(double)coin;
+ (void)payForItemWithCash:(double)cash source:(int)source item:(NSString *)item amount:(int)amount price:(double)price;
+ (void)buyItem:(NSString *)item amount:(int)amount price:(double)price;
+ (void)useItem:(NSString *)item amount:(int)amount price:(double)price;
+ (void)bonusWithCoin:(double)coin source:(int)source;
+ (void)bonusWithItem:(NSString *)item amount:(int)amount price:(double)price source:(int)source;

@end

NS_ASSUME_NONNULL_END
