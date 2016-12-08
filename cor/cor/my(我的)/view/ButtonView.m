//
//  ButtonView.m
//  头条新闻
//
//  Created by 韩创显 on 2016/12/2.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ButtonView.h"
#define height self.frame.size.height
@interface ButtonView()
//指示器
@property (nonatomic,strong)UIView *indicatorView;
@property (nonatomic, strong)NSArray *array;
@end
@implementation ButtonView

- (instancetype)initWithFrame:(CGRect)rect TitleArray:(NSArray *)titleArray selectedArray:(NSArray *)selectedArray titleColor:(UIColor *)color selectedColor:(UIColor *)selColor backGroud:(id)backgroud selectedBack:(id)selBack{
    if (self = [super initWithFrame:rect]) {
        self.backgroundColor = [UIColor whiteColor];
        
        //根据外界传入的标题的数组判断按钮的长度
        CGFloat width = self.frame.size.width / titleArray.count;
        //根据视图的宽度来设置按钮的宽度
        _array = [NSArray arrayWithArray:titleArray];
        
        
        //添加按钮
        for (int i = 0; i < titleArray.count; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0 + width * i, 0, width, height);
            //narmal title
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            //normal color
            [button setTitleColor:color forState:UIControlStateNormal];
            //selected title
            [button setTitle:selectedArray[i] forState:UIControlStateSelected];
            //selected color
            [button setTitleColor:selColor forState:UIControlStateSelected];
            //按钮边界的宽度
            [button.layer setBorderWidth:0.6];
            //判断传入的背景是颜色还是图片
            if ([backgroud isKindOfClass:[UIColor class]]) {
                [button setBackgroundColor:backgroud];
            }else if ([backgroud isKindOfClass:[UIImage class]]){
                [button setBackgroundImage:backgroud forState:UIControlStateNormal];
                [button setBackgroundImage:selBack forState:UIControlStateSelected];
            }
            //第一个是选中状态
            if (i == 0) button.selected = YES;
            else button.selected = NO;
            
            button.tag = 100 + i;
            //添加方法
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
        }
        //添加指示器
        _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, height - 2, width, 2)];
        _indicatorView.backgroundColor = [UIColor redColor];
        [self addSubview:_indicatorView];
        
        //接受通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeButton:) name:@"BUTTON" object:nil];
        
        
    }
    return self;
}

#pragma mark 通知方法
- (void)changeButton:(NSNotification *)notifaction{
    NSDictionary *dic = notifaction.userInfo;
    CGFloat width = self.frame.size.width / _array.count;
    // CGFloat height = self.frame.size.height;
    for (int i = 0; i < _array.count; i ++) {
        UIButton *button = [self viewWithTag:100 + i];
        if (button.tag - 100 == (NSInteger)([dic[@"x"] floatValue] / SCREENWIDTH)) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
        
}
#pragma mark 按钮点击方法
- (void)buttonAction:(UIButton *)sender{
    for (int i = 0; i < _array.count; i ++) {
        UIButton *button = [self viewWithTag:100 + i];
        if (button.tag != sender.tag) {
            button.selected = NO;
        }else{
            button.selected = YES;
        }
    }
    CGFloat width = self.frame.size.width / _array.count;
    //CGFloat height = self.frame.size.height;
    [UIView animateWithDuration:0.5 animations:^{
        _indicatorView.frame = CGRectMake(width * (sender.tag - 100), height - 2, width, 2);
    }];
    if (_delegate != nil && [_delegate respondsToSelector:@selector(didSelectedTheButtonNumberIs:)]) {
        [_delegate didSelectedTheButtonNumberIs:(int)(sender.tag - 100)];
        
    }
}


@end
