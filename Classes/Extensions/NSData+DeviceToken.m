//
//  NSData+DeviceToken.m
//  BFUMeng
//
//  Created by User on 2020/7/29.
//

#import "NSData+DeviceToken.h"

@implementation NSData (DeviceToken)

- (NSString *)deviceToken {
    const unsigned *tokenBytes = (const unsigned *)[self bytes];
    return [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                             ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                             ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                             ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
}

@end
