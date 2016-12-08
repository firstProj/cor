//
//  ViewController.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
// http://is.snssdk.com/2/article/v31/stream
// http://is.snssdk.com/2/article/v30/stream
// http://is.snssdk.com/2/article/v29/stream
// http://is.snssdk.com/2/article/v28/stream

//http://io.snssdk.com/2/article/v31/stream
//http://io.snssdk.com/2/article/v30/stream
//http://io.snssdk.com/2/article/v29/stream
//http://io.snssdk.com/2/article/v28/stream
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self getDatacn];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)getDatacn{
    
    NSString  *string=@"http://io.snssdk.com/2/article/v31/stream";
    NSURL  *url=[NSURL URLWithString:string];
    
    NSURLRequest  *request=[NSURLRequest requestWithURL:url];
    
    NSURLSession *session=[NSURLSession sharedSession];
    
    NSURLSessionTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic=[NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil  ];
        NSLog(@"%@",dic);
    }];
    
    [task resume];
    

    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
