//
//  FourcnTableViewController.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/12/1.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "FourcnTableViewController.h"

@interface FourcnTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray  *array;


@end

@implementation FourcnTableViewController

static NSString  *const  cellstring4=@"cell4";

- (void)viewDidLoad {
    [super viewDidLoad];
    _array=[NSMutableArray array];
    
    self.tableView.frame=CGRectMake(0, 100, self.view.width, self.view.height);
    self.tableView.showsHorizontalScrollIndicator=NO;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    [self.tableView  registerNib:[UINib nibWithNibName:@"SupercnTableViewCell" bundle:nil] forCellReuseIdentifier:cellstring4];
    [self setupRefresh];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)setupRefresh{
    [self requestData];
    
    __weak  __typeof(self) weakSelf=self;
    //下拉
    //设置回调
    self.tableView.mj_header=[MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        [weakSelf requestData];
    }];
    
    //自动改变透明度
    
    //self.tableView.mj_header.automaticallyChangeAlpha=YES;
    [self.tableView.mj_header  beginRefreshing];
    //上拉
    //设置回调
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter   footerWithRefreshingBlock:^{
        [weakSelf  loadMoreData];
    }];
    
    
    
    
}

-(void)requestData{
    
    [_array removeAllObjects];
    NetworkManagercn  *manager=[[NetworkManagercn alloc]init];
    [manager requestDatadizhi4Withfinish:^(NSArray *arr){
        //NSLog(@"%@",arr);
        _array=[arr mutableCopy];
        [self.tableView reloadData];
        [self.tableView.mj_header  endRefreshing];
        
    }];
    
}

-(void)loadMoreData{
    NetworkManagercn  *manager=[[NetworkManagercn  alloc]init];
    [manager requestDatadizhi4Withfinish:^(NSArray *arr){
        [_array addObjectsFromArray:arr];
        [self.tableView  reloadData];
        [self.tableView.mj_footer  endRefreshing];
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SupercnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstring4 forIndexPath:indexPath];
    cell.model=_array[indexPath.row];
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 230;
}
//选中后执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XuanzhongViewController  *view=[[XuanzhongViewController alloc]init];
    
    view.string=[_array[indexPath.row]  valueForKey:@"share_url"];
    
    
    [self.navigationController pushViewController:view animated:YES];
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */



@end
