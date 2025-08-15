//
//  BFUService+PushAlias.m
//  Pods-BFUMeng
//
//  Created by User on 2020/7/31.
//

#import "BFUService+PushAlias.h"
#import <UMPush/UMessage.h>

static NSInteger responseCodeSuccess = 200;

@implementation BFUService (PushAlias)

+ (void)addAlias:(NSString * __nonnull)name type:(NSString * __nonnull)type completion:(nonnull BFUServiceAliasCompletion)completion {
    [UMessage addAlias:name type:type response:^(id _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            completion(error.code);
        } else {
            if ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject[@"success"] isEqualToString:@"ok"]) {
                completion(responseCodeSuccess);
            } else {
                completion(-1);
            }
        }
    }];
}

+ (void)setAlias:(NSString *__nonnull )name type:(NSString * __nonnull)type completion:(nonnull BFUServiceAliasCompletion)completion {
    [UMessage setAlias:name type:type response:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            completion(error.code);
        } else {
            if ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject[@"success"] isEqualToString:@"ok"]) {
                completion(responseCodeSuccess);
            } else {
                completion(-1);
            }
        }
    }];
}

+ (void)deleteAlias:(NSString * __nonnull)name type:(NSString * __nonnull)type completion:(nonnull BFUServiceAliasCompletion)completion {
    [UMessage removeAlias:name type:type response:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            completion(error.code);
        } else {
            if ([responseObject isKindOfClass:[NSDictionary class]] && [responseObject[@"success"] isEqualToString:@"ok"]) {
                completion(responseCodeSuccess);
            } else {
                completion(-1);
            }
        }
    }];
}

@end
