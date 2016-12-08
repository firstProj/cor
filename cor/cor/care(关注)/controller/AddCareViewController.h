//
//  AddCareViewController.h
//  PointView
//
//  Created by  张瑞宁 on 2016/12/7.
//  Copyright © 2016年 -. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCareViewController : UIViewController

//从后向前传
/** 传递tag数据的block, block的参数是一个字符串数组 */
@property (nonatomic, copy) void (^getTagsBlock)(NSArray *);

//从前向后传
/** 从上一个界面传递过来的标签数据 */
@property (nonatomic, strong) NSMutableArray * models;

@end
