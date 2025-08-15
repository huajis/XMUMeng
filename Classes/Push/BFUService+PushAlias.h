//
//  BFUService+PushAlias.h
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ BFUServiceAliasCompletion)(NSInteger responseCode);

@interface BFUService (PushAlias)

+ (void)addAlias:(NSString * __nonnull)name type:(NSString * __nonnull)type completion:(nonnull BFUServiceAliasCompletion)completion;
+ (void)setAlias:(NSString *__nonnull )name type:(NSString * __nonnull)type completion:(nonnull BFUServiceAliasCompletion)completion;
+ (void)deleteAlias:(NSString * __nonnull)name type:(NSString * __nonnull)type completion:(nonnull BFUServiceAliasCompletion)completion;

@end

NS_ASSUME_NONNULL_END
