//
//  SVProgressHUD+RSUserInteraction.h
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "SVProgressHUD.h"

@interface SVProgressHUD (RSUserInteraction)
+ (void)showAndLock;
+ (void)dismissAndUnlock;
@end
