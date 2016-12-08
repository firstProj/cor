//
//  XiaCeButtonViewController.m
//  头条新闻
//
//  Created by 韩创显 on 2016/12/2.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "XiaCeButtonViewController.h"
#import "YiJianViewController.h"
#import "YIJIANTableViewCell.h"

@interface XiaCeButtonViewController ()<UITextViewDelegate>
@property(nonatomic,strong)UILabel * placeHodelLabel;
@end

@implementation XiaCeButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREENWIDTH, SCREENHEIGHT - 20)];
    view.backgroundColor = [UIColor whiteColor];
    
    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
    view1.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 50);
    [button setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:button];
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake((414 - 100) / 2, 0, 100, 50)];
    label.text = @"意见反馈";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    [view1 addSubview:label];
    [view addSubview:view1];
    
    
    UIView * FanKuiView = [[UIView alloc] initWithFrame:CGRectMake(10, 60, SCREENWIDTH - 20, 100)];
    FanKuiView.backgroundColor = [UIColor colorWithRed:248.0 / 256.0 green:248.0 / 256.0 blue:248.0 / 256.0 alpha:1];
    
    UITextView * textView = [[UITextView alloc] init];
    textView.font = [UIFont systemFontOfSize:15];
    textView.delegate = self;
    [FanKuiView addSubview:textView];
    
    UIButton * shangchuanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    shangchuanButton.frame = CGRectMake(SCREENWIDTH - 80, 10, 50, 50);
    [shangchuanButton setImage:[UIImage imageNamed:@"shangchuan.png"] forState:UIControlStateNormal];
    [shangchuanButton addTarget:self action:@selector(shangchuanzhaopian) forControlEvents:UIControlEventTouchUpInside];
    [FanKuiView addSubview:shangchuanButton];
    
    
    UITextView * textView1 = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, SCREENWIDTH - 110, 40)];
    textView1.layer.cornerRadius = 4;
    textView1.layer.masksToBounds = YES;
    textView1.delegate = self;
    textView1.layer.borderWidth = 1;
    textView1.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    textView1.font = [UIFont systemFontOfSize:14];
    textView1.layer.borderColor = [[[UIColor lightGrayColor] colorWithAlphaComponent:0] CGColor];
    //加下面一句话的目的是，是为了调整光标的位置，让光标出现在UITextView的正中间
    textView1.textContainerInset = UIEdgeInsetsMake(10,0, 0, 0);
    //[textView becomeFirstResponder];
    textView1.keyboardType
    = UIKeyboardTypeDefault;
    textView1.backgroundColor = [UIColor colorWithRed:248.0 / 256.0 green:248.0 / 256.0 blue:248.0 / 256.0 alpha:1];
    textView1.tintColor = [UIColor redColor];
    
    //textView的占位符
    _placeHodelLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 200, 35)];
    _placeHodelLabel.text = @"如需传图 , 请点右边";
    _placeHodelLabel.enabled = NO;
    [textView1 addSubview:_placeHodelLabel];
    
    [FanKuiView addSubview:textView1 ];
    [view addSubview:FanKuiView];
    
    
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 170, SCREENWIDTH - 40, 50)];
    textField.placeholder = @"QQ , 邮件或者电话";
    textField.font = [UIFont systemFontOfSize:20];
    textField.backgroundColor = [UIColor colorWithRed:248.0 / 256.0 green:248.0 / 256.0 blue:248.0 / 256.0 alpha:1];
    [view addSubview:textField];
    
    UILabel * lable1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 230, SCREENWIDTH - 40, 20)];
    lable1.text = @"您的联系方式有助于我们沟通和解决问题 , 仅工作人员可见";
    lable1.font = [UIFont systemFontOfSize:12];
    lable1.textColor = [UIColor colorWithRed:200.0 / 256.0 green:200.0 / 256.0 blue:200.0 / 256.0 alpha:1];
    [view addSubview:lable1];
    
    [self.view addSubview:view];

    
    
    // Do any additional setup after loading the view.
}
//上传照片的方法
- (void)shangchuanzhaopian{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //实现该方法是需要注意view需要是继承UIControl而来的
    [self.view endEditing:YES];
}
//UITextView的代理方法  点击ruturn收起键盘
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    //判断输入的字是否是回车，即按下return
    if ([text isEqualToString:@"\n"]){
        
        //在这里做你响应return键的代码
        [self.view endEditing:YES];
        
        //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
        return NO;
    }
    return YES;
}

//UITextView的代理方法
- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length > 0) {
        //首先把占位符label隐藏
        _placeHodelLabel.hidden = YES;
    }else{
        _placeHodelLabel.hidden = NO;
    }
    
    CGRect frame = textView.frame;
    float height = [self heightForTextView:textView WithText:[NSString stringWithFormat:@"%@%@",textView.text,textView.text]];
    frame.size.height = height;
    [UIView animateWithDuration:0.5 animations:^{
        textView.frame = frame;
    } completion:nil];
    

}
//UITextView的代理方法
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
//{
//    
//    if (text.length > 0) {
//        //首先把占位符label隐藏
//        _placeHodelLabel.hidden = YES;
//    }else{
//        _placeHodelLabel.hidden = NO;
//    }
//    
//    CGRect frame = textView.frame;
//    float height = [self heightForTextView:textView WithText:[NSString stringWithFormat:@"%@%@",textView.text,text]];
//    frame.size.height = height;
//    [UIView animateWithDuration:0.5 animations:^{
//        textView.frame = frame;
//    } completion:nil];
//    return YES;
//}

- (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText{
    CGSize constraint = CGSizeMake(textView.contentSize.width , CGFLOAT_MAX);
    CGRect size = [strText boundingRectWithSize:constraint options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}context:nil];
    float textHeight = size.size.height + 22.0;
    return textHeight;
}

- (void)fanhui{
    YiJianViewController * yijian = [[YiJianViewController alloc] init];
    [self presentViewController:yijian animated:YES completion:nil];
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
