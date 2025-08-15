//
//  UIMutableUserNotificationAction+Extension.m
//  BFUMeng
//
//  Created by User on 2020/7/27.
//  Copyright © 2020 umeng. All rights reserved.
//

#import "UIMutableUserNotificationAction+Extension.h"

@implementation UIMutableUserNotificationAction (Extension)

+ (instancetype)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UIUserNotificationActivationMode)options {
    UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc] init];
    action.identifier = identifier;
    action.title = title;
    action.activationMode = options;
    
    if (options != UIUserNotificationActivationModeBackground) {
        action.authenticationRequired = YES;
        action.destructive = YES;
    }
    return action;
}

@end
