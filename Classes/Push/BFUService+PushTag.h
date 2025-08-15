//
//  BFUService+PushTag.h
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ BFUServiceTagCompletion)(NSInteger responseCode, NSInteger remain, NSArray<NSString *> *__nullable tags);

@interface BFUService (PushTag)

+ (void)getTagsWithCompletion:(nonnull BFUServiceTagCompletion)completion;
+ (void)addTag:(NSString *)tag completion:(nonnull BFUServiceTagCompletion)completion;
+ (void)deleteTag:(NSString *)tag completion:(nonnull BFUServiceTagCompletion)completion;

@end

NS_ASSUME_NONNULL_END
