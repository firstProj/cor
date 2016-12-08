//
//  GUANKANViewController.m
//  PointView
//
//  Created by 韩创显 on 2016/12/7.
//  Copyright © 2016年 -. All rights reserved.
//

#import "GUANKANViewController.h"
#import "GUANKANTableViewCell.h"
#import "Super1TableViewController.h"
#import "SupercnTableViewCell.h"


@interface GUANKANViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)NSMutableArray * muArray;


@end

@implementation GUANKANViewController

- (void)setModel:(model1 *)model{
    if (_model != model) {
        _model = model;
        [_muArray addObject:_model];
    }
}

- (NSMutableArray *)muArray{
    if (!_muArray) {
        _muArray = [NSMutableArray array];
    }
    return _muArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self setsubViews];
    
    // Do any additional setup after loading the view.
}
- (void)setsubViews{
    UITableView * tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"GUANKANTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    [self.view addSubview:tableView];
    
    
    //返回按钮
    UIButton * returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnButton setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(fanhuiAnNiu) forControlEvents:UIControlEventTouchUpInside];
    returnButton.frame = CGRectMake(0, 0, 50, 50);
    [self.view addSubview:returnButton];
    
    //编辑按钮
    UIButton * bianJiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bianJiButton.frame = CGRectMake(SCREENWIDTH - 70, 0, 70, 50);
    [bianJiButton setTitle:@"编辑" forState:UIControlStateNormal];
    [bianJiButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [bianJiButton setTitle:@"完成" forState:UIControlStateSelected];
    [bianJiButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [bianJiButton addTarget:self action:@selector(changeTableViewEditState:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bianJiButton];
    
    
    //观看历史label
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 100, 50)];
    label.text = @"观看历史";
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    
}
- (void)fanhuiAnNiu{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 这是button的方法
- (void)changeTableViewEditState:(UIButton *)sender{
    if (sender.selected == YES) {
        sender.selected = NO;
        [_tableView setEditing:NO animated:YES];
    }else{
        sender.selected = YES;
        [_tableView setEditing:YES animated:NO];
    }
}
//需要确定行的编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
   
        return UITableViewCellEditingStyleDelete;
   
}
//提交编辑样式
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GUANKANTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    //cell.label1.text = _dataArray[indexPath.row];
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
