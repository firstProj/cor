//
//  Model22.h
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/12/5.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNmodel.h"
#import "SuperModel2.h"

@interface Model22 : NSObject
//阅读次数
@property(nonatomic,copy)NSString *read_count;
//媒体名称
@property(nonatomic,copy)NSString *media_name;
//文摘
@property(nonatomic,copy)NSString *abstract;
//图像列表
//@property(nonatomic,copy)NSString *image_list;
//是否有视频
@property(nonatomic,copy)NSString *has_video;

//关键字
@property(nonatomic,copy)NSString *keywords;
//踩的数量
@property(nonatomic,copy)NSString *bury_count;
//标题
@property(nonatomic,copy)NSString *title;
//详情页url
@property(nonatomic,copy)NSString *share_url;

//大图列表
//@property(nonatomic,strong)SuperModel2 *large_image_list;
//用户信息
@property(nonatomic,strong)SNmodel *user_info;
//喜欢的数量
@property(nonatomic,copy)NSString *like_count;
//推荐的数量
@property(nonatomic,copy)NSString *digg_count;
//中图
@property(nonatomic,strong)SuperModel2 *middle_image;
//推荐数
@property(nonatomic,copy)NSString *comment_count;


@property(nonatomic,assign)CGFloat cellHeight;



@end
