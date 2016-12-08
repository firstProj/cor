//
//  SearchViewController.m
//  PointView
//
//  Created by  张瑞宁 on 2016/12/8.
//  Copyright © 2016年 -. All rights reserved.
//

#import "SearchViewController.h"
#import "Model11.h"
#import "CareTableViewCell.h"

@interface SearchViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
//存在可以关注的人
@property (nonatomic,strong) NSMutableArray * array;

@property (nonatomic,strong) NSMutableArray * arr;

@property (nonatomic,strong) UITextField * textField;

@property (nonatomic,strong) UIButton * search;

@property (nonatomic,strong) UITableView * tableView;



@end

@implementation SearchViewController
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
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _arr = [NSMutableArray array];
    
    [self addSubView];
    
    // Do any additional setup after loading the view.
}

- (void)addSubView{
    
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    topView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:topView];
    
    UITextField * TextField = [[UITextField alloc]initWithFrame:CGRectMake(55, 20, [UIScreen mainScreen].bounds.size.width - 200, 39)];
    _textField = TextField;
    [topView addSubview:TextField];
    TextField.font = [UIFont systemFontOfSize:17];
    TextField.delegate = self;
    TextField.placeholder = @"搜你想搜的";
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 25, 30, 30);
     [button setImage:[UIImage imageNamed:@"foundsearch"] forState:UIControlStateNormal];
    [topView addSubview:button];
    
    UIButton * searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _search = searchButton;
    searchButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 25, 50, 30);
    [searchButton setTitle:@"取消" forState:UIControlStateNormal];
    searchButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [searchButton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:searchButton];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,  [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"CareTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
//判断是否含有搜索的内容
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //NSLog(@"%@",textField.text);
    if (textField.text.length != 1) {
        [_search setTitle:@"搜索" forState:UIControlStateNormal];
        //刷新tableView
        [self hasContant];
    }else{
         [_search setTitle:@"取消" forState:UIControlStateNormal];
    }
    return YES;
}

- (void)search:(UIButton *)button{
    if ([button.titleLabel.text isEqualToString:@"取消"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self hasContant];
    }
}

- (void)hasContant{
    for (model1 * model in _array) {
        //[_arr removeAllObjects];
        if([model.media_name rangeOfString:_textField.text].location !=NSNotFound)
        {
            [_arr addObject:model];
        }
    }
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CareTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = _arr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
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
