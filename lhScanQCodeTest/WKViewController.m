//
//  WKViewController.m
//  lhScanQCodeTest
//
//  Created by dozening on 2017/12/18.
//  Copyright © 2017年 bosheng. All rights reserved.
//

#import "WKViewController.h"
#import <WebKit/WebKit.h>

@interface WKViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView* webView;
@end

@implementation WKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [WKWebView new];
    self.webView.navigationDelegate = self;
    self.webView.frame = self.view.frame;
    [self.view addSubview:self.webView];
    //如果scheme是http或者https
    if ([self.url.scheme isEqualToString:@"http"] || [self.url.scheme isEqualToString:@"https"])
    {
        NSURLRequest* request = [NSURLRequest requestWithURL:self.url];
        [self.webView loadRequest:request];
    } else{
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"非法url" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    self.title = @"加载中";
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.title = webView.title;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
