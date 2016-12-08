//
//  SecondTableViewCell.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/12/5.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "SecondTableViewCell.h"
@implementation SecondTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(Model22 *)model{
    if (_model!=model) {
        _titlelabel.text=model.title;
        // NSLog(@"%@",model.title);
        //NSLog(@"%@",model.middle_image.url);
        
        
        //[self.imageview1  sd_setImageWithURL:model.middle_image.url];
        
        _imageview1.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.middle_image.url]]]];
        _bofangcishu.text=[NSString stringWithFormat:@"播放%@次",model.read_count];
        //        NewcnButton *button=[[NewcnButton alloc]init];
        //        button.frame=CGRectMake(0, 0, 80, 80);
        //        button.titleLabel.text=model.media_name;
        
        //_button1.titleLabel.text=[NSString stringWithFormat:@"%@",model.media_name];
        
        
        
        //NSLog(@"%@",model.comment_count);
        // _button2.titleLabel.text=model.like_count;
        [_button1 setTitle:model.media_name forState:UIControlStateNormal];
        [_button1  setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.user_info.avatar_url]]]] forState:UIControlStateNormal];
        
        _keyWords.text=model.keywords;
        _button1.imageView.layer.masksToBounds=YES;
        _button1.imageView.layer.cornerRadius=_button1.imageView.frame.size.height/2;
        
        
        
        [_button2 setTitle:model.like_count forState:UIControlStateNormal];
        [_button2 setImage:[UIImage imageNamed:@"recomicon_dock_night"] forState:UIControlStateNormal];
        
        [_button3 setTitle:model.comment_count forState:UIControlStateNormal];
        [_button3 setImage: [UIImage imageNamed:@"commenticon_profile_night"] forState:UIControlStateNormal];
        //        _button3.titleLabel.text=model.comment_count;
        
        
        
    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
