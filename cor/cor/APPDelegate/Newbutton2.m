//
//  Newbutton2.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/12/2.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "Newbutton2.h"

@implementation Newbutton2
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
    self.imageView.width=self.frame.size.width/2;
    self.imageView.height=self.frame.size.height;
    self.titleLabel.x=self.frame.size.width/2;
    self.titleLabel.y=0;
    self.titleLabel.width=self.frame.size.width/2;
    self.titleLabel.height=self.frame.size.height;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
