//
//  WOViewController.m
//  头条新闻
//
//  Created by 韩创显 on 2016/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "WOViewController.h"
#import "WOTableViewCell.h"
#import "SheZhiViewController.h"
#import "YiJianViewController.h"
#import "DengLuViewController.h"
#import "GUANKANViewController.h"
#import "XIHUANViewController.h"

@interface WOViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray * array;
@property(nonatomic,strong)NSArray * array1;
@end

@implementation WOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setupSubs];
    
    
    
    _array = @[@"观看历史",@"喜欢的视频",@"消息",@"设置",@"反馈"];
    _array1 = @[@"1.1.png",@"1.2.png",@"1.3.png",@"1.4.png",@"1.5.png"];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)setupSubs{
    UITableView * tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerNib:[UINib nibWithNibName:@"WOTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 414, 200)];
    imageView.image = [UIImage imageNamed:@"1.png"];
    tableView.tableHeaderView = imageView;
    
    [self.view addSubview:tableView];
}

//UITableView 的代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WOTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.label1.text = _array[indexPath.row];
    cell.imageView1.image = [UIImage imageNamed:_array1[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    if (indexPath.row == 0) {
        GUANKANViewController * guankan = [[GUANKANViewController alloc] init];
        [self presentViewController:guankan animated:YES completion:nil];
    }else if (indexPath.row == 1){
        XIHUANViewController * xihuan = [[XIHUANViewController alloc] init];
        [self presentViewController:xihuan animated:YES completion:nil];
    }else if (indexPath.row == 2) {
        DengLuViewController * denglu = [[DengLuViewController alloc] init];
        [self presentViewController:denglu animated:YES completion:nil];

    }else if (indexPath.row == 3) {
    SheZhiViewController * shezhi = [[SheZhiViewController alloc] init];
    [self presentViewController:shezhi animated:YES completion:nil];
    }else if (indexPath.row == 4){
        YiJianViewController * yijian = [[YiJianViewController alloc] init];
        [self presentViewController:yijian animated:YES completion:nil];
    }
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
