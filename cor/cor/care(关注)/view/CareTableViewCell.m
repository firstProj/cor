//
//  CareTableViewCell.m
//  PointView
//
//  Created by  张瑞宁 on 2016/12/7.
//  Copyright © 2016年 -. All rights reserved.
//

#import "CareTableViewCell.h"

@interface CareTableViewCell ()  
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *iamgeView;
@property (strong, nonatomic) IBOutlet UILabel *care;
@property (nonatomic,assign ) int i;


@end

@implementation CareTableViewCell

- (void)setModel:(model1 *)model{
    if (_model != model) {
        _model = model;
        _name.text = model.media_name;
        _care.text = [NSString stringWithFormat:@"%ld评论",(long)model.comment_count];
        
        _iamgeView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.user_info.avatar_url]]]];
       _iamgeView.layer.masksToBounds=YES;
        _iamgeView.layer.cornerRadius=_iamgeView.frame.size.height/2;
    }
}


- (IBAction)button:(UIButton *)sender {
    static dispatch_once_t h;
    dispatch_once(&h, ^{
        _i = 0;
    });
    if (_i % 2 == 0 ) {
        [_add setTitle:@"OK" forState:UIControlStateNormal];
        _i ++;
    }else{
         [_add setTitle:@"+" forState:UIControlStateNormal];
         _i ++;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
