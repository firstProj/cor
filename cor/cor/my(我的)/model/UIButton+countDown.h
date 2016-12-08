//
//  UIButton+countDown.h
//  PointView
//
//  Created by 韩创显 on 2016/12/8.
//  Copyright © 2016年 -. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (countDown)

/**
  倒计时按钮
 
  timeLine 倒计时总时间
  title    还没倒计时的title
  subTitle 倒计时中的子名字，如时、分
  mColor   还没倒计时的颜色
  color    倒计时中的颜色
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;


@end
