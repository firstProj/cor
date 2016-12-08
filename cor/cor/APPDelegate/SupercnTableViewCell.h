//
//  SupercnTableViewCell.h
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Supermodel.h"
@interface SupercnTableViewCell : UITableViewCell


//图片
@property (weak, nonatomic) IBOutlet UIImageView *imageview1;
//标题
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
//播放次数
@property (weak, nonatomic) IBOutlet UILabel *bofangcishu;

@property (weak, nonatomic) IBOutlet UILabel *keyWords;

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property(nonatomic,strong)Supermodel *model;
@end
