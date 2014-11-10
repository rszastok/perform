//
//  RSMainTabBarController.m
//  Perform
//
//  Created by Rafał Szastok on 09/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSMainTabBarController.h"

#import "RSMenuTableViewController.h"
#import <WYPopoverController.h>

@interface RSMainTabBarController ()<RSMenuTableViewControllerDelegate>
@property (nonatomic, strong) WYPopoverController *menuPopoverController;
@end

@implementation RSMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)menuButtonTapped:(UIBarButtonItem *)sender {
    CGRect frame = CGRectMake(0, 0, 300.0, 185.0);
    RSMenuTableViewController *menuController = [[RSMenuTableViewController alloc] initWithNibName:NSStringFromClass([RSMenuTableViewController class]) bundle:nil];
    [menuController.view setFrame:frame];
    menuController.preferredContentSize = frame.size;
    menuController.delegate = self;
    [self.menuPopoverController dismissPopoverAnimated:NO];
    self.menuPopoverController = [[WYPopoverController alloc] initWithContentViewController:menuController];
    self.menuPopoverController.popoverContentSize = frame.size;
    [self.menuPopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:WYPopoverArrowDirectionUp animated:YES];
}

#pragma mark - Menu table view controller delegate

- (void)menuController:(id)sender didSelectRow:(MyRowEnum)row {
    [self.menuPopoverController dismissPopoverAnimated:YES];
    if (self.selectedIndex == row) {
        // User chose the same view as visible. Do nothing.
        return;
    }
    UIView *startView = self.selectedViewController.view;
    UIView *endView = ((UIViewController *)self.viewControllers[row]).view;
    [UIView transitionFromView:startView toView:endView duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished) {
                        self.selectedIndex = row;
                    }];

}

@end
