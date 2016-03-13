//
//  HomePageViewController.m
//  CFPV1
//
//  Created by zf on 16/3/9.
//  Copyright © 2016年 PY. All rights reserved.
//
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
#import "HomePageViewController.h"
#import "NoviceGuidanceTableViewCell.h"
#import "MJRefresh.h"
#import "LoginViewController.h"
#import "LoginNoPassWordViewController.h"
#import "RegisterViewController.h"
#import "ProductDetailTableViewController.h"
@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic)UIPageControl *pageControl;
@property (assign,nonatomic)BOOL isPassword;
@property (assign,nonatomic)BOOL isRegist;
@property (assign,nonatomic)BOOL isLogin;
@end

@implementation HomePageViewController
- (IBAction)loginButton:(UIBarButtonItem *)sender
{
    if(_isPassword && _isRegist)
    {
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:loginVC animated:YES];
    }
    if(_isRegist &&  _isPassword == NO)
    {
        LoginNoPassWordViewController *loginPVC = [[LoginNoPassWordViewController alloc]init];
        [self.navigationController pushViewController:loginPVC animated:YES];
    }
    else if ( (_isPassword == NO) && (_isRegist == NO))
    {
        RegisterViewController *rvc = [[RegisterViewController alloc]init];
        [self.navigationController pushViewController:rvc animated:YES];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isRegist = NO;
    _isPassword = NO;
    _isLogin = NO;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.tableHeaderView = [self scrollerView];
    self.view.userInteractionEnabled = YES;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.scrollEnabled = NO;
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.tableView addGestureRecognizer:panGR];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.mj_header endRefreshing];
    }];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gotoProductView) name:@"cheackButton" object:nil];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gotoLoginView) name:@"HomePage" object:nil];
}
//-(void)gotoLoginView
//{
//    LoginViewController *lvc = [[LoginViewController alloc]init];
//    [self.navigationController pushViewController:lvc animated:YES];
//}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    //四舍五入偏移量除以滚动视图的一屏宽
    self.pageControl.currentPage = round(offset.x/scrollView.frame.size.width);
    
}
-(UIView*)scrollerView
{
    UIView *view = [[UIView alloc]init];
    view .frame = CGRectMake(0, 0, WIDTH, 180);
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 0,WIDTH , 180);
    scrollView.contentSize = CGSizeMake(WIDTH*4, 180);
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    for (int i = 0 ; i < 4 ;i++)
    {
        UIImageView *imageView = [[UIImageView alloc]init];
        
        imageView.frame = CGRectMake(WIDTH *i, 0, WIDTH, 180);
        imageView.image = [UIImage imageNamed:@"edition1"];
        [scrollView addSubview:imageView];
    }
    
    //1.创建pageControl
    UIPageControl *pc = [[UIPageControl alloc]init];
    self.pageControl = pc;
    //2.常规设置
    pc.numberOfPages = 4;
    CGSize size = [pc sizeForNumberOfPages:pc.numberOfPages];
    //为了定位可使用bounds+center
    //定视图的位置时，为了居中，可以通过设置视图的中心点
    pc.bounds = CGRectMake(0, 0, size.width, size.width);
    pc.center = CGPointMake(WIDTH*0.5 , 160);
    pc.pageIndicatorTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    
    pc.currentPageIndicatorTintColor = [UIColor whiteColor];
    //关闭与用户的交互
    pc.userInteractionEnabled = NO;
    [view addSubview:scrollView];
    [view addSubview:self.pageControl];
    return view;
}
-(void)gotoProductView
{
    
    ProductDetailTableViewController *ProductDeatil = [[ProductDetailTableViewController alloc]init];
   [self.navigationController pushViewController:ProductDeatil animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_isLogin)
    {
        self.navigationItem.rightBarButtonItem.title = @"登出";
    }
}
-(void)viewDidDisappear:(BOOL)animated
{
        self.hidesBottomBarWhenPushed = NO;
}
-(void)viewDidAppear:(BOOL)animated
{
        self.hidesBottomBarWhenPushed = YES;
}
#pragma mark PanGestureRecognizer
-(void)pan:(UIPanGestureRecognizer *)gr
{
    //手势触点，在self.view坐标系下，点的坐标值
    CGPoint location = [gr locationInView:self.view];
    //手势移动到的新点，相对于手势起始点，的横向纵向距离
    //手势移动了多远
    CGPoint translation = [gr translationInView:self.view];
    
    NSLog(@"%@,%@",NSStringFromCGPoint(location),NSStringFromCGPoint(translation));
//    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        
//    }];
    [self.tableView.mj_header beginRefreshing];
    
}
#pragma mark TableViewDataSource& TableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
          cell = [[[NSBundle mainBundle]loadNibNamed:@"NoviceGuidanceTableViewCell" owner:nil options:nil] firstObject];
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
         cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
        return cell;
    }
    else
    {
        return cell;
    }
}
#pragma mark TableViewCellHight
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return  self.view.bounds.size.height -180;
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
