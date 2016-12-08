//
//  SupercnViewController.m
//  haozheng-xiangmu1
//
//  Created by wyzc on 16/11/30.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "SupercnViewController.h"
#import "SupercnTableViewCell.h"
@interface SupercnViewController ()<UIScrollViewDelegate>

//上面所有按钮的父视图
@property(nonatomic,strong)UIView *titlesView;
//标题栏底部的指示器
@property(nonatomic,strong)UIView  *titleBottomView;
//存放所有的标签按钮
@property(nonatomic,strong)NSMutableArray *titleButtons;
//当前被选中的按钮
@property(nonatomic,strong)UIButton  *selectedTitleButton;

@property(nonatomic,strong)UIScrollView *scrollview;

@end
static  NSString *cellstring=@"cell";

@implementation SupercnViewController
-(NSMutableArray *)titleButtons{
    if (!_titleButtons) {
        _titleButtons=[NSMutableArray array];
    }
    return _titleButtons;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupChildVc];
    [self setupScrollView];
    [self setupTitleView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupScrollView{
    self.automaticallyAdjustsScrollViewInsets=NO;
    _scrollview=[[UIScrollView alloc]init];
    _scrollview.frame=self.view.bounds;
    _scrollview.backgroundColor=[UIColor grayColor];
    _scrollview.delegate=self;
    _scrollview.contentSize=CGSizeMake(self.childViewControllers.count*414, 0);
    _scrollview.pagingEnabled=YES;
    [self.view addSubview:_scrollview];
    
    
    [self scrollViewDidEndScrollingAnimation:_scrollview];
}


-(void)setupChildVc{
    Super1TableViewController  *one=[[Super1TableViewController alloc]init];
    one.title=@"标题1";
    [self addChildViewController:one];
    
    TwoTableViewController *two=[[TwoTableViewController alloc]init];
    two.title=@"标题2";
    [self addChildViewController:two];
    
    ThreeTableViewController  *three=[[ThreeTableViewController alloc]init];
    three.title=@"标题3";
    [self addChildViewController:three];
//    FourcnTableViewController *four=[[FourcnTableViewController alloc]init];
//    four.title=@"标题4";
//    [self addChildViewController:four];
    
    
}

-(void)setupTitleView{
    //标签栏整体
    UIView  *titleView=[[UIView alloc]init];
    titleView.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.7];
    
    titleView.frame=CGRectMake(0, 64, 414, 35);
    [self.view addSubview:titleView];
    self.titlesView=titleView;
    NSInteger  count=self.childViewControllers.count;
    CGFloat  titleButtonH=titleView.height;
    CGFloat titleButtonW=titleView.width/count;
    
    for(int i=0;i<count;i++){
        UIButton *titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton  setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal ];
        [titleButton  setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        titleButton.titleLabel.font=[UIFont systemFontOfSize:14] ;
         
         [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
        //文字
        NSString *title=[self.childViewControllers[i] title];
        [titleButton  setTitle:title forState:UIControlStateNormal ];
        // frame
        titleButton.y = 0;
        titleButton.height = titleButtonH;
        titleButton.width = titleButtonW;
        titleButton.x = i * titleButton.width;
        
    }
    //标签栏底部的指示器控件
    UIView *titleBottomView=[[UIView alloc]init];
    
    titleBottomView.backgroundColor=[self.titleButtons.lastObject titleColorForState:UIControlStateSelected];
    titleBottomView.height=1;
    
    titleBottomView.y=titleView.height-titleBottomView.height;
    [titleView addSubview:titleBottomView];
    self.titleBottomView=titleBottomView;
    //默认点击最前面的按钮
    UIButton  *firstTitleButton=self.titleButtons.firstObject;
    [firstTitleButton.titleLabel  sizeToFit];
    titleBottomView.width=firstTitleButton.titleLabel.width;
    titleBottomView.centerX=firstTitleButton.centerX;
    [self titleClick:firstTitleButton];
    

}
-(void)titleClick:(UIButton *)titleButton{
   //控制按钮状态
    self.selectedTitleButton.selected=NO;
    titleButton.selected=YES;
    self.selectedTitleButton=titleButton;
    //底部控件的位置和尺寸
    [UIView animateWithDuration:0.25 animations:^{
        self.titleBottomView.width=titleButton.titleLabel.width;
        self.titleBottomView.centerX=titleButton.centerX;
    }];
    //让scrollview 滚动到对应的位置
    CGPoint  offset=self.scrollview.contentOffset;
    offset.x=self.view.width *[self.titleButtons  indexOfObject:titleButton];
    [self.scrollview  setContentOffset:offset animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    int index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titleButtons[index]];
}
/*
 * 当滚动动画完毕的时候调用（通过代码setContentOffset:animated:让scrollView滚动完毕后，就会调用这个方法）
 * 如果执行完setContentOffset:animated:后，scrollView的偏移量并没有发生改变的话，就不会调用scrollViewDidEndScrollingAnimation:方法
 */

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 取出对应的子控制器
    int index = scrollView.contentOffset.x / scrollView.width;
    UIViewController *willShowChildVc = self.childViewControllers[index];
    
    // 如果控制器的view已经被创建过，就直接返回
    if (willShowChildVc.isViewLoaded) return;
    
    // 添加子控制器的view到scrollView身上
    willShowChildVc.view.frame = scrollView.bounds;
    [scrollView addSubview:willShowChildVc.view];
}

@end
