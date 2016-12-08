//
//  SheZhiViewController.m
//  头条新闻
//
//  Created by 韩创显 on 2016/12/1.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "SheZhiViewController.h"
#import "WOViewController.h"
#import "YiJianViewController.h"
#import "SDImageCache.h"


@interface SheZhiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSString * imageViewCacheSize;
@end

@implementation SheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubs];
    
    // Do any additional setup after loading the view.
}

- (void)setupSubs{
   self.view.backgroundColor = [UIColor whiteColor];
    UITableView * tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 414, 50)];
    UILabel * label = [[UILabel alloc] init];
    label.text = @"设置";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    [view addSubview:label];
    
    //布局label
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top);
        make.left.equalTo(view.mas_left).offset(157);
        make.right.equalTo(view.mas_right).offset(-157);
        make.height.equalTo(@50);
    }];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(fanHui) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    //布局左侧按钮
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top);
        make.height.equalTo(@50);
        make.width.equalTo(@50);
        make.left.equalTo(view.mas_left).offset(10);
    }];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"意见反馈" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(yijian) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button1];
    
    //布局右侧按钮
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top);
        make.bottom.equalTo(view.mas_bottom);
        make.right.equalTo(view.mas_right).offset(-10);
        make.width.equalTo(@80);
    }];
    tableView.tableHeaderView = view;
    tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"表尾.png"]];
    tableView.tableFooterView = imageView;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:tableView];
    [self getImageCache];
}

- (void)getImageCache{
    
    SDImageCache *cache = [SDImageCache sharedImageCache];
    float temp = [cache getSize];
    if (temp >= 1024) {
        
        _imageViewCacheSize = [NSString stringWithFormat:@"%.2fM",temp/1024/1024];
    }else{
        
        _imageViewCacheSize = [NSString stringWithFormat:@"%.2fKB",temp/1024];
    }
    
    
}


//返回方法
- (void)fanHui{
//    WOViewController * wo = [[WOViewController alloc] init];
//    [self presentViewController:wo animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)yijian{
    YiJianViewController * yijian = [[YiJianViewController alloc] init];
    [self presentViewController:yijian animated:YES completion:nil];
}
//代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;

    if (indexPath.section == 0) {
        cell.textLabel.text = @"账号管理";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"清除缓存";
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH - 160, 15, 140, 30)];
        label.text = _imageViewCacheSize;
        label.textColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentRight;
        cell.accessoryView = label;
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"推送通知";
        UISwitch * switc = [[UISwitch alloc] initWithFrame:CGRectMake(SCREENWIDTH - 160, 15, 140, 30)];
        switc.onTintColor = [UIColor greenColor];
        cell.accessoryView = switc;
    }else if (indexPath.section == 3){
        cell.textLabel.text = @"检查新版本";
        
        UILabel *labele = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH - 160, 15, 140, 30)];
        //获取当前版本
        NSString * nowVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
        labele.text = nowVersion;
        labele.textColor = [UIColor grayColor];
        labele.textAlignment = NSTextAlignmentRight;
        cell.accessoryView = labele;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"缓存清除将不会回复" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            SDImageCache *cache = [SDImageCache sharedImageCache];
            [cache clearDisk];
            
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"清除缓存成功" preferredStyle:UIAlertControllerStyleAlert];
            [self  showDetailViewController:alert1 sender:nil];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [alert1 dismissViewControllerAnimated:YES completion:^{
                    
                    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                    UILabel *label =(UILabel *)cell.accessoryView;
                    label.text = @"0.0";
                    
                }];
            });
            
        }];
        [alert addAction:action];
        [alert addAction:action1];
        [self showDetailViewController:alert sender:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
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
