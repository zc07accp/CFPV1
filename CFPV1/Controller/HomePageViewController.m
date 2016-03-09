//
//  HomePageViewController.m
//  CFPV1
//
//  Created by zf on 16/3/9.
//  Copyright © 2016年 PY. All rights reserved.
//
#import "HomePageViewController.h"
#import "NoviceGuidanceTableViewCell.h"
#import "MJRefresh.h"
@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic)UIPageControl *pageControl;
@end

@implementation HomePageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.userInteractionEnabled = YES;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.scrollEnabled = NO;
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.tableView addGestureRecognizer:panGR];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.mj_header endRefreshing];
    }];
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
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
      if (indexPath.row == 0)
      {
          cell = [[[NSBundle mainBundle]loadNibNamed:@"HomePageScrollerTableViewCell" owner:nil options:nil]firstObject];
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
        return cell;
       }
        else
      {
          cell = [[[NSBundle mainBundle]loadNibNamed:@"NoviceGuidanceTableViewCell" owner:nil options:nil] firstObject];
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
         cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
        return cell;
      }
    }
    else
    {
        return cell;
    }
}
#pragma mark TableViewCellHight
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return  self.tableView.bounds.size.height/4;
    }
    else
    {
        return  self.tableView.bounds.size.height - self.tableView.bounds.size.height/4 - 80;
    }
    
}
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
