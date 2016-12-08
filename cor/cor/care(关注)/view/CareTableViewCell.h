//
//  CareTableViewCell.h
//  PointView
//
//  Created by  张瑞宁 on 2016/12/7.
//  Copyright © 2016年 -. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "model1.h"

@interface CareTableViewCell : UITableViewCell

@property (nonatomic,strong) model1 * model;
@property (strong, nonatomic) IBOutlet UIButton *add;

@end
