//
//  XuanzhongViewController.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/12/2.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "XuanzhongViewController.h"

@interface XuanzhongViewController ()

@end

@implementation XuanzhongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor=[UIColor redColor];
    UIWebView  *webview=[[UIWebView  alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    NSString   *str=_string;
    NSURL   *url=[NSURL URLWithString:str];
    
    NSURLRequest  *req=[NSURLRequest  requestWithURL:url];
    [webview  loadRequest:req];
    
    webview.allowsInlineMediaPlayback = YES;
    webview.mediaPlaybackAllowsAirPlay = YES;
    
    [self.view addSubview:webview];
    
    
    
    // Do any additional setup after loading the view.
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
