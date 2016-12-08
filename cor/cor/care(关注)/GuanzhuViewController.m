//
//  GuanzhuViewController.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/12/1.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "GuanzhuViewController.h"
#import "CareTableViewCell.h"
#import "AddCareViewController.h"
#import "model1.h"

@interface GuanzhuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;


@end


@implementation GuanzhuViewController

- (NSMutableArray *)haArr{
    if (!_haArr) {
        _haArr = [NSMutableArray array];
    }
    return _haArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _haArr = [NSMutableArray array];
 
    
    
    [self setStartView];
    
    // Do any additional setup after loading the view.
}
- (void)setNav{
    UIBarButtonItem * bar1 = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(care)];
    self.navigationItem.rightBarButtonItem = bar1;
}

- (void)setTopView{
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 40)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UILabel * lable =[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 40)];
    [topView addSubview:lable];
    lable.textColor = [UIColor greenColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:20];
    lable.text = @"已关注";
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 5, 50, 30);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(care) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:button];
    

}
- (void)setStartView{
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(10,100, self.view.frame.size.width - 20, 40)];
    lable.text = [NSString stringWithFormat:@"小主还没有任何关注呦 >_<"];
    lable.font = [UIFont systemFontOfSize:17];
    lable.textColor = [UIColor blackColor];
    lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
    
    UIButton  * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"去关注" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    button.frame = CGRectMake(150, 160, self.view.frame.size.width - 300, 40);
    [button addTarget:self action:@selector(care) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)care{
    AddCareViewController * addVC = [[AddCareViewController alloc]init];
    addVC.getTagsBlock = ^(NSArray *array) {
        [_haArr addObjectsFromArray:array];
        for (int i = 0; i < _haArr.count; i ++) {
            model1 * model = [[model1 alloc]init];
            model = _haArr[i];
            //判断是否有重复的,
            for (int j = i+1; j < _haArr.count; j ++) {
                model1 * model1 = _haArr[j];
                // NSLog(@"%@  %@",model.media_name,model1.media_name);
                //如果名字相同,那么删除该元素
                if([model.media_name isEqualToString:model1.media_name] ){
                    [_haArr removeObjectAtIndex:i];
                    //补充下标
                    i --;
                    break;
                }
            }
        }

        if (_haArr.count == 0) {
                
        }else{
            [self setTopView];
            [self settableview];
        }
    };
    
    //得到label数组中所有label的值,组成一个新的数组
    addVC.models = [self.haArr mutableCopy];
    
    [self presentViewController:addVC animated:YES completion:nil];
}

- (void)settableview{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,104, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"CareTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _haArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CareTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = _haArr[indexPath.row];
    cell.add.hidden = YES;
    //NSLog(@"%@",_haArr[indexPath.row]);
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
