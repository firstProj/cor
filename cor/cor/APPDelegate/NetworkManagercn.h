//
//  NetworkManagercn.h
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManagercn : NSObject
//得到第一个路径的 数据
-(void)requestDatadizhi1Withfinish:(void(^)(NSArray *array) )array1;
//得到第二个路径的 数据

-(void)requestDatadizhi2Withfinish:(void(^)(NSArray *array) )array1;
//得到第三个路径的 数据

-(void)requestDatadizhi3Withfinish:(void(^)(NSArray *array) )array1;
//得到第四个路径的 数据

-(void)requestDatadizhi4Withfinish:(void(^)(NSArray *array) )array1;





@end
