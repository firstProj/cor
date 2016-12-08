//
//  DengLuViewController.m
//  头条新闻
//
//  Created by 韩创显 on 2016/12/2.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "DengLuViewController.h"
#import "WOViewController.h"
#import "QUDENGLUViewController.h"
#import "TabbarcnViewController.h"
#import "UIButton+countDown.h"//创建按钮倒计时的类目

@interface DengLuViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UIImageView * imageView1;
@property(nonatomic,strong)UIButton * addButton;
@property(nonatomic,strong)UIButton * JINRUButton;
@property(nonatomic,strong)UIButton * QUDENGLUButton;
@property(nonatomic,strong)UILabel * YOUZHANGHAOLabel;
@property(nonatomic,strong)UIButton * button;
@property(nonatomic,strong)UILabel * label;
@property(nonatomic,strong)UIButton * yanZhengMaButton;
@end

@implementation DengLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    view.backgroundColor = [UIColor whiteColor];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(0, 0, 50, 50);
    [_button setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(fanhui12) forControlEvents:UIControlEventTouchUpInside];
    _button.hidden = YES;
    [view addSubview:_button];
    
    //右上角返回按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREENWIDTH-50, 5, 50, 50);
    [button setImage:[UIImage imageNamed:@"zuoshangjiao.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    //中间图片
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景图片.png"]];
    imageView.frame = CGRectMake(0, 50, SCREENWIDTH, 200);
    [view addSubview:imageView];
    
    //输入手机号
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 260, SCREENWIDTH - 40, 50)];
    _textField.placeholder = @"请输入手机号";
    _textField.textAlignment = NSTextAlignmentCenter;
    //设置textField的边框,并且切角
    _textField.layer.cornerRadius = 30;
    _textField.layer.borderWidth = 1;
    _textField.delegate = self;
    _textField.layer.masksToBounds = YES;
    
    //注册一个通知,然后限制用户输入11位手机号
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:self.textField];
    _textField.layer.borderColor = ([UIColor grayColor]).CGColor;
    //设置光标的颜色
    _textField.tintColor = [UIColor redColor];
    //设置_textField成为第一响应者
    [_textField becomeFirstResponder];
    [view addSubview:_textField];
    
    //进入头条
    _JINRUButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _JINRUButton.frame = CGRectMake(20, 340, SCREENWIDTH - 40, 50);
    [_JINRUButton setTitle:@"进入头条" forState:UIControlStateNormal];
    [_JINRUButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    _JINRUButton.backgroundColor = [UIColor colorWithRed:153.0 / 256.0 green:153.0 / 256.0 blue:153.0 / 256.0 alpha:1];
     _JINRUButton.layer.cornerRadius = 30;
    [view addSubview:_JINRUButton];
    
    //已有账号的label
    _YOUZHANGHAOLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 400, 80, 40)];
    _YOUZHANGHAOLabel.text = @"已有账号?";
    _YOUZHANGHAOLabel.textAlignment = NSTextAlignmentRight;
    _YOUZHANGHAOLabel.font = [UIFont systemFontOfSize:12];
    [view addSubview:_YOUZHANGHAOLabel];
    
    _QUDENGLUButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_QUDENGLUButton setTitle:@"去登陆" forState:UIControlStateNormal];
    [_QUDENGLUButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_QUDENGLUButton addTarget:self action:@selector(denglu) forControlEvents:UIControlEventTouchUpInside];
    _QUDENGLUButton.frame = CGRectMake(208, 400, 70, 40);
    _QUDENGLUButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [view addSubview:_QUDENGLUButton];
    
    
    //最下侧
    _imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下侧.png"]];
    _imageView1.frame = CGRectMake(120, SCREENHEIGHT - 130, 150, 50);
    [view addSubview:_imageView1];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setImage:[UIImage imageNamed:@"返回1.png"] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    _addButton.frame = CGRectMake(270, SCREENHEIGHT - 120, 30, 30);
    [view addSubview:_addButton];
    
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 470, SCREENWIDTH - 40, 50)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:13];
    _label.hidden = YES;
    [view addSubview:_label];
    
    [self.view addSubview:view];
    
    //切view的上右和上左两个角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    
    // Do any additional setup after loading the view.
}

//点击空白处键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //实现该方法是需要注意view需要是继承UIControl而来的
    [self.view endEditing:YES];
}


#pragma mark - UITextFieldDelegate 设置输入手机号只能输入11位
-(void)textFiledEditChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    
    NSString *toBeString = textField.text;
    if (toBeString.length > 10 && toBeString.length>1) {
        //限制只能输入11位
        textField.text = [toBeString substringToIndex:11];
        _JINRUButton.backgroundColor = [UIColor redColor];
        [_JINRUButton addTarget:self action:@selector(ShouJiHaoDengLu) forControlEvents:UIControlEventTouchUpInside];
    
    }else{
        _JINRUButton.backgroundColor = [UIColor colorWithRed:153.0 / 256.0 green:153.0 / 256.0 blue:153.0 / 256.0 alpha:1];
    }
}
- (void)ShouJiHaoDengLu{
    _textField.textAlignment = NSTextAlignmentLeft;

    _JINRUButton.frame = CGRectMake(20, 400, SCREENWIDTH - 40, 50);
    [_JINRUButton setTitle:@"验证登录" forState:UIControlStateNormal];
    [_JINRUButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _JINRUButton.backgroundColor = [UIColor colorWithRed:153.0 / 256.0 green:153.0 / 256.0 blue:153.0 / 256.0 alpha:1];
    _JINRUButton.layer.cornerRadius = 30;
    _YOUZHANGHAOLabel.hidden = YES;
    _QUDENGLUButton.hidden = YES;
    _imageView1.hidden = YES;
    _addButton.hidden = YES;
    _button.hidden = NO;
    _label.hidden = NO;
    _label.text = [NSString stringWithFormat:@"已向手机%@发送验证码",_textField.text];

    
    
    //做了一个空白的View的视图,把textField加上去
    UIView * textView = [[UIView alloc] initWithFrame:CGRectMake(20, 335, SCREENWIDTH - 40, 50)];
    textView.layer.borderWidth = 1;
    textView.layer.borderColor = [[UIColor blackColor] CGColor];
    textView.layer.cornerRadius = 30;
    
    //输入手机号的地方
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 0, (SCREENWIDTH - 40) / 2, 50)];
    textField.tintColor = [UIColor redColor];
    [textField becomeFirstResponder];
    textField.placeholder = @"请输入验证码";
    
    //判断输入验证码的位数
    NSString * panDuan = textField.text;
    if (panDuan.length > 3 && panDuan.length>1) {
        //限制只能输入4位
        textField.text = [panDuan substringToIndex:4];
        _JINRUButton.backgroundColor = [UIColor redColor];
    }
    
    [textView addSubview:textField];
    
    //输入手机号中间哪个线
    UIImageView * imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xian.png"]];
    imageView1.frame = CGRectMake(220, 10, 20, 30);
    [textView addSubview:imageView1];
    
    //发送验证码button
    _yanZhengMaButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _yanZhengMaButton.frame = CGRectMake(250, 10, 100, 30);
    [_yanZhengMaButton setTitle:@"重新发送" forState:UIControlStateNormal];
    [_yanZhengMaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [_yanZhengMaButton startWithTime:59 title:@"重新发送" countDownTitle:@"s" mainColor:[UIColor colorWithRed:84/255.0 green:180/255.0 blue:98/255.0 alpha:1.0f] countColor:[UIColor lightGrayColor]];
    [textView addSubview:_yanZhengMaButton];
    
    
   
    
    
    [self.view addSubview:textView];

    
}
- (void)fanhui12{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//- (void)post1{
//    NSString * str = @"http://www.pinxuejianyou.cn/api/get_verify_code";
//    NSURL * url = [NSURL URLWithString:str];
//    NSMutableURLRequest * requ = [NSMutableURLRequest requestWithURL:url];
//    requ.HTTPMethod = @"POST";
//    requ.HTTPBody = [[NSString stringWithFormat:@"mobile=%@",_textField.text] dataUsingEncoding:NSUTF8StringEncoding ];
//    
//    NSURLSession * session = [NSURLSession sharedSession];
//    
//    NSURLSessionDataTask * task = [session dataTaskWithRequest:requ completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@",dic[@"msg"]);
//        
//    }];
//    [task resume];
//}
//下侧增加按钮,就是把他们的位置重新布局
- (void)addButtonAction{
    _addButton.hidden = YES;
    _imageView1.frame = CGRectMake(110, SCREENHEIGHT - 130, 150, 50);
    UIImageView * imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"增加的.png"]];
    imageView2.frame = CGRectMake(260, SCREENHEIGHT - 80, 50, 45);
    [self.view addSubview:imageView2];
    
}

- (void)fanhui{
//    TabbarcnViewController * wo = [[TabbarcnViewController alloc] init];
//    [self presentViewController:wo animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)denglu{
    QUDENGLUViewController * QUDENGLU = [[QUDENGLUViewController alloc] init];
    QUDENGLU.text = _textField.text;
    [self presentViewController:QUDENGLU animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
