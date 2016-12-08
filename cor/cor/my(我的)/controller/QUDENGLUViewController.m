//
//  QUDENGLUViewController.m
//  头条新闻
//
//  Created by 韩创显 on 2016/12/3.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "QUDENGLUViewController.h"
#import "WOViewController.h"
#import "DengLuViewController.h"
#import "UIButton+countDown.h"

@interface QUDENGLUViewController ()
@property(nonatomic,strong)UIImageView * imageView1;
@property(nonatomic,strong)UIButton * addButton;
@property(nonatomic,strong)UIButton * yanZhengMaButton;
@end

@implementation QUDENGLUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    view.backgroundColor = [UIColor whiteColor];
    
    //右上角返回按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREENWIDTH-50, 5, 50, 50);
    [button setImage:[UIImage imageNamed:@"zuoshangjiao.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    //中间图片
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登录中间的图片.png"]];
    imageView.frame = CGRectMake(0, 50, SCREENWIDTH, 200);
    [view addSubview:imageView];
    
    
    //做了一个空白的View的视图,把textField加上去
    UIView * textView = [[UIView alloc] initWithFrame:CGRectMake(20, 260, SCREENWIDTH - 40, 50)];
    textView.layer.borderWidth = 1;
    textView.layer.borderColor = [[UIColor blackColor] CGColor];
    textView.layer.cornerRadius = 30;
    
    //输入手机号的地方
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 0, (SCREENWIDTH - 40) / 2, 50)];
    textField.placeholder = @"手机号";
    textField.tintColor = [UIColor redColor];
    textField.text = _text;
    [textView addSubview:textField];
    
    //输入手机号中间哪个线
    UIImageView * imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xian.png"]];
    imageView1.frame = CGRectMake(220, 10, 20, 30);
    [textView addSubview:imageView1];
    
    //发送验证码button
    _yanZhengMaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _yanZhengMaButton.frame = CGRectMake(250, 10, 100, 30);
    [_yanZhengMaButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [_yanZhengMaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_yanZhengMaButton addTarget:self action:@selector(daojishi) forControlEvents:UIControlEventTouchUpInside];
    [textView addSubview:_yanZhengMaButton];
    
    [view addSubview:textView];
    

    //输入验证码的UIView
    UIView * textView1 = [[UIView alloc] initWithFrame:CGRectMake(20, 340, SCREENWIDTH - 40, 50)];
    textView1.layer.borderWidth = 1;
    textView1.layer.borderColor = [[UIColor blackColor] CGColor];
    textView1.layer.cornerRadius = 30;
    
    //输入验证码的地方
    UITextField * textField1 = [[UITextField alloc] initWithFrame:CGRectMake(30, 0, SCREENWIDTH - 80, 50)];
    textField1.placeholder = @"请输入验证码";
    textField1.tintColor = [UIColor redColor];
    [textView1 addSubview:textField1];
    [view addSubview:textView1];
    
    //下册label
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 395, SCREENWIDTH - 40, 20)];
    label.text = @"未注册手机验证后自动注册";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    [view addSubview:label];
    
    //验证登录
    UIButton * yanZhengButton = [UIButton buttonWithType:UIButtonTypeCustom];
    yanZhengButton.frame = CGRectMake(20, 415, SCREENWIDTH - 40, 50);
    [yanZhengButton setTitle:@"验证登录" forState:UIControlStateNormal];
    [yanZhengButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    yanZhengButton.backgroundColor = [UIColor colorWithRed:153.0 / 256.0 green:153.0 / 256.0 blue:153.0 / 256.0 alpha:1];
    yanZhengButton.layer.cornerRadius = 30;
    [view addSubview:yanZhengButton];

    //账号密码登录
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake((SCREENWIDTH - 200) / 2, 475, 200, 30);
    [button3 setTitle:@"账号密码登录" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button3 setFont:[UIFont systemFontOfSize:15]];
    [view addSubview:button3];
    
    UIButton * fanHuiAnNiu = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiAnNiu setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    fanHuiAnNiu.frame = CGRectMake(10, 0, 50, 50);
    [fanHuiAnNiu addTarget:self action:@selector(fanhuizhuce) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:fanHuiAnNiu];
    
    
    //最下侧
    _imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下侧.png"]];
    _imageView1.frame = CGRectMake(120, SCREENHEIGHT - 130, 150, 50);
    [view addSubview:_imageView1];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setImage:[UIImage imageNamed:@"返回1.png"] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _addButton.frame = CGRectMake(270, SCREENHEIGHT - 120, 30, 30);
    
    [view addSubview:_addButton];
    
    
    
    [self.view addSubview:view];
    
    //切view的上右和上左两个角
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = view.bounds;
    maskLayer1.path = maskPath1.CGPath;
    view.layer.mask = maskLayer1;
    
    
    // Do any additional setup after loading the view.
}
//设置点击按钮开始倒计时
- (void)daojishi{
     [_yanZhengMaButton startWithTime:59 title:@"重新发送" countDownTitle:@"s" mainColor:[UIColor colorWithRed:84/255.0 green:180/255.0 blue:98/255.0 alpha:1.0f] countColor:[UIColor lightGrayColor]];
}
//设置点击空白处时键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //实现该方法是需要注意view需要是继承UIControl而来的
    [self.view endEditing:YES];
}
//下侧增加按钮,就是把他们的位置重新布局
- (void)addButtonAction{
    _addButton.hidden = YES;
    _imageView1.frame = CGRectMake(110, SCREENHEIGHT - 130, 150, 50);
    UIImageView * imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"增加的.png"]];
    imageView2.frame = CGRectMake(260, SCREENHEIGHT - 80, 50, 45);
    [self.view addSubview:imageView2];
    
}
- (void)fanhuizhuce{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)fanhui{
    WOViewController * wo = [[WOViewController alloc] init];
    [self presentViewController:wo animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
