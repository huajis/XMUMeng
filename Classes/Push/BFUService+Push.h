//
//  BFUService+Push.h
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFUService (Push)

+ (void)setBadgeClear:(BOOL)value;
+ (void)setAutoAlert:(BOOL)value;
+ (NSString *)deviceToken;

@end

NS_ASSUME_NONNULL_END
