//
//  GUANKANViewController.h
//  PointView
//
//  Created by 韩创显 on 2016/12/7.
//  Copyright © 2016年 -. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "model1.h"
#import "Supermodel.h"

@interface GUANKANViewController : UIViewController
@property (nonatomic,strong) model1 * model;
@property (nonatomic,assign) Supermodel * superModel;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * JIESHOUArray;
@end
