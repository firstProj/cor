//
//  Super1TableViewController.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "Super1TableViewController.h"
#import "PrefixHeader.pch"
#import "NetworkManagercn.h"
@interface Super1TableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *array2;

@property(nonatomic,strong)NSMutableArray  *array;

@end

@implementation Super1TableViewController
static NSString  *const  cellstring=@"cell";


- (void)viewDidLoad {
    [super viewDidLoad];

    _array=[NSMutableArray array];
    
    self.tableView.frame=CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-100);
    self.tableView.showsHorizontalScrollIndicator=NO;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    [self.tableView  registerNib:[UINib nibWithNibName:@"SupercnTableViewCell" bundle:nil] forCellReuseIdentifier:cellstring];
    [self setupRefresh];
    //[self netWork];
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
    [manager requestDatadizhi1Withfinish:^(NSArray *arr){
        //NSLog(@"%@",arr);
        _array=[arr mutableCopy];
        
        _array2=[NSMutableArray arrayWithCapacity:5];
        for(int i=0;i<5;i++){
            
            [_array2 addObject:_array[i]];
            
        }
        
        
        [self.tableView reloadData];
        [self.tableView.mj_header  endRefreshing];
        
    }];
    
}

-(void)loadMoreData{
    NetworkManagercn  *manager=[[NetworkManagercn  alloc]init];
    [manager requestDatadizhi1Withfinish:^(NSArray *arr){
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
    return [_array2 count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SupercnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstring forIndexPath:indexPath];
    cell.model=_array2[indexPath.row];
    // Configure the cell...
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 230;
}
//选中后执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XuanzhongViewController  *view=[[XuanzhongViewController alloc]init];
    
    view.string=[_array2[indexPath.row]  valueForKey:@"share_url"];
    
    
    [self.navigationController pushViewController:view animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
