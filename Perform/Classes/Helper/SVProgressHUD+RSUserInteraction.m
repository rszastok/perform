//
//  SVProgressHUD+RSUserInteraction.m
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "SVProgressHUD+RSUserInteraction.h"

@implementation SVProgressHUD (RSUserInteraction)

+ (void)showAndLock {
    [self _keyWindow].userInteractionEnabled = NO;
    [self show];
}

+ (void)dismissAndUnlock {
    [self _keyWindow].userInteractionEnabled = YES;
    [self dismiss];
}

+ (UIWindow *)_keyWindow {
    id<UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.window;
}

@end
