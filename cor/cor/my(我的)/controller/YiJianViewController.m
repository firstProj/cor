//
//  YiJianViewController.m
//  头条新闻
//
//  Created by 韩创显 on 2016/12/2.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "YiJianViewController.h"
#import "WOViewController.h"
#import "ButtonView.h"
#import "XiaCeButtonViewController.h"

@interface YiJianViewController ()<selectedButtonDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView * scrollView ;
@end

@implementation YiJianViewController


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
    
    
    NSArray * titleArray = @[@"我的意见",@"常见问题"];
    UIColor *titleColor = [UIColor grayColor];
    UIColor *selColor = [UIColor redColor];
    UIColor *backGound = [UIColor whiteColor];
    //创建顶部的视图
    ButtonView * topview = [[ButtonView alloc] initWithFrame:CGRectMake(0, 50, SCREENWIDTH, 50) TitleArray:titleArray selectedArray:titleArray titleColor:titleColor selectedColor:selColor backGroud:backGound selectedBack:backGound];
    topview.delegate = self;
    [view addSubview:topview];
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + 50, SCREENWIDTH, SCREENHEIGHT - 64 - 50)];
    scrollView.contentSize = CGSizeMake(SCREENWIDTH * 2, SCREENHEIGHT - 64 - 50);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView = scrollView;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    
    NSArray * array = @[@"照片.png",@"常见问题.png"];
    for (int i = 0; i < 2; i ++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH * i, 0, SCREENWIDTH, SCREENHEIGHT - 100)];
        imageView.image = [UIImage imageNamed:array[i]];
        [scrollView addSubview:imageView];
    }
    scrollView.delegate = self;
    
    [view addSubview:scrollView];
    
        
    
  
    
    
    
    UIButton * buttonXia = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonXia setImage:[UIImage imageNamed:@"按钮图片.png"] forState:UIControlStateNormal];
    [buttonXia addTarget:self action:@selector(buttonXiaAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:buttonXia];
    
    [buttonXia mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left);
        make.right.equalTo(view.mas_right);
        make.bottom.equalTo(view.mas_bottom);
        make.height.equalTo(@50);
    }];
    
    
    
    
    [self.view addSubview:view];
    
    
    // Do any additional setup after loading the view.
}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    if ([scrollView isMemberOfClass:[UIScrollView class]] ) {
//        NSDictionary *dic = @{@"x":@(_scrollView.contentOffset.x)};
//        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"BUTTON" object:nil userInfo:dic];
//    }
//    
//}
- (void)didSelectedTheButtonNumberIs:(int)number{
    _scrollView.contentOffset = CGPointMake(SCREENWIDTH *number,0);

}

- (void)fanhui{

    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)buttonXiaAction{
    XiaCeButtonViewController * XiaCeButton = [[XiaCeButtonViewController alloc] init];
    [self presentViewController:XiaCeButton animated:YES completion:nil];
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
