//
//  ButtonView.h
//  头条新闻
//
//  Created by 韩创显 on 2016/12/2.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理为了得到点击了第几个按钮
@protocol selectedButtonDelegate <NSObject>
@optional
- (void)didSelectedTheButtonNumberIs:(int)number;

@end

@interface ButtonView : UIView
@property (nonatomic,assign)id<selectedButtonDelegate> delegate;

//初始化方法 同时社会上侧按钮的标题 选中的标题...
- (instancetype)initWithFrame:(CGRect)rect TitleArray:(NSArray *)titleArray selectedArray:(NSArray *)selectedArray titleColor:(UIColor *)color selectedColor:(UIColor *)selColor backGroud:(id)backgroud selectedBack:(id)selBack;




@end
