//
//  AddCareViewController.m
//  PointView
//
//  Created by  张瑞宁 on 2016/12/7.
//  Copyright © 2016年 -. All rights reserved.
//

#import "AddCareViewController.h"
#import "careModel.h"
#import "model1.h"
#import "CareTableViewCell.h"
#import "MJExtension.h"
#import "SearchViewController.h"

@interface AddCareViewController ()<UITableViewDelegate,UITableViewDataSource>

//存在可以关注的人
@property (nonatomic,strong) NSMutableArray * array;


@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) NSMutableArray * modelARR;


@end

@implementation AddCareViewController


//获取数据
- (void)viewWillAppear:(BOOL)animated{
    NetworkManagercn * manager = [[NetworkManagercn alloc]init];
    [manager requestDatadizhi1Withfinish:^(NSArray *array) {
        _array = [array mutableCopy];
        
        
        for (int i = 0; i < _array.count; i ++) {
            model1 * model = [[model1 alloc]init];
            model = _array[i];
            //如果没有名字则删除
            
            if (model.media_name.length == 0) {
                [_array removeObjectAtIndex:i];
                //补充下标
                i--;
            }
            
        }
        for (int i = 0; i < _array.count; i ++) {
            model1 * model = [[model1 alloc]init];
            model = _array[i];
          //判断是否有重复的,
            for (int j = i+1; j < _array.count; j ++) {
                model1 * model1 = _array[j];
               // NSLog(@"%@  %@",model.media_name,model1.media_name);
                //如果名字相同,那么删除该元素
                if([model.media_name isEqualToString:model1.media_name] ){
                    [_array removeObjectAtIndex:i];
                    //补充下标
                    i --;
                    break;
                }
            }
        }
        for (int i = 0; i < _models.count; i++) {
            model1 * model = [[model1 alloc]init];
            model = _array[i];
            //判断是否有重复的,
            for (int j = 0; j < _array.count; j ++) {
                model1 * model1 = _array[j];
                //如果名字相同,那么删除该元素
                if([model.media_name isEqualToString:model1.media_name] ){
                    [_array removeObjectAtIndex:j];
                    break;
                }
            }
        }
        [_tableView reloadData];
    }];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setTopView];
    [self setTableView];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)setTopView{
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    topView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topView];
    
    UILabel * lable =[[UILabel alloc]initWithFrame:CGRectMake(100, 20, [UIScreen mainScreen].bounds.size.width - 200, 44)];
    [topView addSubview:lable];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:25];
    lable.text = @"为你推荐";
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 25, 30, 30);
    [button setTitle:@"<" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:button];
    
    UIButton * searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 25, 30, 30);
    [searchButton setImage:[UIImage imageNamed:@"foundsearch"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:searchButton];
    
    
}
- (void)back:(void(^)(NSArray *array) )array{
    NSMutableArray * modelArr = [NSMutableArray array];
    //在返回之前遍历所有的cell,获取已关注的model
    for (int rowIndex = 0; rowIndex < _array.count; rowIndex ++ ) {
        CareTableViewCell *cell = [_tableView  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:rowIndex inSection:0]];
        if ([cell.add.titleLabel.text isEqualToString:@"OK"]) {
            [modelArr addObject:cell.model];
        }
    }
    
    !self.getTagsBlock ? : self.getTagsBlock(modelArr);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)search{
    SearchViewController * searchVC = [[SearchViewController alloc]init];
     [self presentViewController:searchVC animated:YES completion:nil];
}

- (void)setTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"CareTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CareTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = _array[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
