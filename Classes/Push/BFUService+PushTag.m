//
//  BFUService+PushTag.m
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService+PushTag.h"
#import <UMPush/UMessage.h>

static NSInteger responseCodeSuccess = 200;

@implementation BFUService (PushTag)

+ (void)getTagsWithCompletion:(nonnull BFUServiceTagCompletion)completion {
    [UMessage getTags:^(NSSet * _Nonnull responseTags, NSInteger remain, NSError * _Nullable error) {
        if (error) {
            completion(error.code, remain, nil);
        } else {
            if ([responseTags isKindOfClass:[NSSet class]]) {
                completion(responseCodeSuccess, remain, [responseTags allObjects]);
            } else {
                completion(-1, remain, nil);
            }
        }
    }];
}

+ (void)addTag:(NSString *)tag completion:(nonnull BFUServiceTagCompletion)completion {
    [UMessage addTags:tag response:^(id  _Nullable responseObject, NSInteger remain, NSError * _Nullable error) {
        if (error) {
            completion(error.code, remain, nil);
        } else {
            if ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject[@"success"] isEqualToString:@"ok"]) {
                completion(responseCodeSuccess, remain, nil);
            } else {
                completion(-1, remain, nil);
            }
        }
    }];
}

+ (void)deleteTag:(NSString *)tag completion:(nonnull BFUServiceTagCompletion)completion {
    [UMessage deleteTags:tag response:^(id  _Nullable responseObject, NSInteger remain, NSError * _Nullable error) {
        if (error) {
            completion(error.code, remain, nil);
        } else {
            if ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject[@"success"] isEqualToString:@"ok"]) {
                completion(responseCodeSuccess, remain, nil);
            } else {
                completion(-1, remain, nil);
            }
        }
    }];
}

@end
