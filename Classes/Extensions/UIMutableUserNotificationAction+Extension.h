//
//  UIMutableUserNotificationAction+Extension.h
//  BFUMeng
//
//  Created by User on 2020/7/27.
//  Copyright © 2020 umeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIMutableUserNotificationAction (Extension)

+ (instancetype)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UIUserNotificationActivationMode)options;

@end

NS_ASSUME_NONNULL_END
