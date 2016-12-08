//
//  NetworkManagercn.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "NetworkManagercn.h"
#import "PrefixHeader.pch"
#import "MJExtension.h"
@implementation NetworkManagercn
-(void)requestDatadizhi1Withfinish:(void(^)(NSArray *array) )array1
{
    NSString  *string=@"http://io.snssdk.com/2/article/v31/stream";
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *managercn=[AFHTTPSessionManager manager];
       
        [managercn  GET:string parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableArray *modelcnarray=[NSMutableArray array];
            
            NSArray *datacnarray=responseObject[@"data"];
            modelcnarray=[model1 mj_objectArrayWithKeyValuesArray:datacnarray];
            
            NSLog(@"%@",datacnarray);
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                array1(modelcnarray);
//               // NSLog(@"%@",array1);
//            });
            
            array1(modelcnarray);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
        
    });
    
    
    
    
}
-(void)requestDatadizhi2Withfinish:(void(^)(NSArray *array) )array1
{
    NSString  *string=@"https://lf.snssdk.com/2/article/v32/stream";
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *managercn=[AFHTTPSessionManager manager];
    
        [managercn  GET:string parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableArray *modelcnarray=[NSMutableArray array];
            
            NSArray *datacnarray=responseObject[@"data"];
            
                        modelcnarray=[Model22
                                      mj_objectArrayWithKeyValuesArray:datacnarray];
            array1(modelcnarray);
            NSLog(@"%@",array1);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
        
    });
    
    
    
    
}
-(void)requestDatadizhi3Withfinish:(void(^)(NSArray *array) )array1
{
    NSString  *string=@"http://is.snssdk.com/2/article/v29/stream";
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *managercn=[AFHTTPSessionManager manager];

        [managercn  GET:string parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableArray *modelcnarray=[NSMutableArray array];
            
            NSArray *datacnarray=responseObject[@"data"];
            modelcnarray=[Model33 mj_objectArrayWithKeyValuesArray:datacnarray];
            array1(modelcnarray);

            NSLog(@"%@",array1);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
        
    });
    
    
    
    
}
-(void)requestDatadizhi4Withfinish:(void(^)(NSArray *array) )array1
{
    NSString  *string=@"https://ic.snssdk.com/2/article/v32/stream";
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *managercn=[AFHTTPSessionManager manager];

        [managercn  GET:string parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableArray *modelcnarray=[NSMutableArray array];
            
            NSArray *datacnarray=responseObject[@"data"];
            modelcnarray=[Model44 mj_objectArrayWithKeyValuesArray:datacnarray];
            array1(modelcnarray);

            NSLog(@"%@",array1);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
        
    });
    
    
    
    
}




@end
