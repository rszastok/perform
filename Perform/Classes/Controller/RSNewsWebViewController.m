//
//  RSNewsWebViewController.m
//  Perform
//
//  Created by Rafał Szastok on 08/11/14.
//  Copyright (c) 2014 RS Crazy Tools. All rights reserved.
//

#import "RSNewsWebViewController.h"
#import "SVProgressHUD+RSUserInteraction.h"

@interface RSNewsWebViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation RSNewsWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:self.url];
    self.webView.alpha = 0.0;
    [SVProgressHUD show];
    self.webView.delegate = self;
    [self.webView loadRequest:requestObj];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Web View Delegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD dismiss];
    [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Error occured", @"")];
    NSLog(@"Error: %@", error.localizedDescription);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIView animateWithDuration:0.6f animations:^{
        self.webView.alpha = 1.0;
    } completion:nil];
    [SVProgressHUD dismiss];
}

@end
