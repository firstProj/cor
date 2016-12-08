//
//  TabbarcnViewController.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/12/1.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "TabbarcnViewController.h"
#import "SupercnViewController.h"
#import "WOViewController.h"
#import "GuanzhuViewController.h"
@interface TabbarcnViewController ()

@end

@implementation TabbarcnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"今日看点";

    SupercnViewController *one=[[SupercnViewController  alloc]init];
    [self addChildVC:one title:@"首页" image:@"icon_home_page_n"];
    GuanzhuViewController  *guanzhu=[[GuanzhuViewController alloc ]init];
    [self addChildVC:guanzhu title:@"关注" image:@"tabBar_me_icon-1"];
    WOViewController  *wode=[[WOViewController alloc]init];
    [self addChildVC:wode title:@"我的" image:@"tabBar_friendTrends_icon-1"];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)addChildVC:(UIViewController *)childViewController title:(NSString *)title image:(NSString *)image{
    
    UINavigationController *con = [[UINavigationController alloc] initWithRootViewController:childViewController];
    
    [self addChildViewController:con];
    
    childViewController.title = title;
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
   // UINavigationBar *bar = [UINavigationBar appearance];
   // [bar setBackgroundImage:[UIImage imageNamed:@"xzzm_Me_headerBg"] forBarMetrics:UIBarMetricsDefault];
    
    
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
