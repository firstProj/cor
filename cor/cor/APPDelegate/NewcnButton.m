//
//  NewcnButton.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "NewcnButton.h"

@implementation NewcnButton
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews  ];
    
    self.imageView.y=0;
    self.imageView.x=0;
    self.imageView.height=self.frame.size.height*0.66;
    self.imageView.width=self.frame.size.height*0.66;

    self.titleLabel.x=0;
    self.titleLabel.y=CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width=self.frame.size.width;
    self.titleLabel.height=self.frame.size.height-self.titleLabel.y;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
