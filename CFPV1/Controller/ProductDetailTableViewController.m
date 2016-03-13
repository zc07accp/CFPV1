//
//  ProductDetailTableViewController.m
//  CFPV1
//
//  Created by zf on 16/3/10.
//  Copyright © 2016年 PY. All rights reserved.
//

#import "ProductDetailTableViewController.h"
#import "InvestmentViewController.h"
@interface ProductDetailTableViewController ()
@property (assign,nonatomic)BOOL isSelect;
@end

@implementation ProductDetailTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"聚财号";
    self.isSelect = NO;
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 160);
    self.tableView.tableHeaderView = view;
    UIView *view1 =[[UIView alloc]init];
    view1.backgroundColor = [UIColor blueColor];
    view1.frame = CGRectMake(0, 0, self.view.bounds.size.width, 75);
    UIButton *button = [[UIButton alloc]init];
    [button addTarget:self action:@selector(cheackbotton1) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 40, 70);
    [button setBackgroundColor:[UIColor whiteColor]];
    UIButton *button2 = [[UIButton alloc]init];
    [button2 addTarget:self action:@selector(cheackbotton2) forControlEvents:UIControlEventTouchUpInside];
    button2.frame = CGRectMake(60, 0, 200, 70);
    [button setBackgroundColor:[UIColor redColor]];
    [view1 addSubview:button];
    [view1 addSubview:button2];
    self.tableView.tableFooterView = view1;
}

-(void)viewDidAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
}
-(void)cheackbotton2
{

    InvestmentViewController *ivc = [[InvestmentViewController alloc]init];
    [self.navigationController pushViewController:ivc animated:YES];
}
-(void)cheackbotton1
{
    InvestmentViewController *ivc = [[InvestmentViewController alloc]init];
    [self.navigationController pushViewController:ivc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    
//    CGFloat sectionHeaderHeight = 40;
//
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0)
//    {
//        
//      scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//        
//    }
//    else if (scrollView.contentOffset.y>=sectionHeaderHeight)
//    {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//             
//     }
//    
//}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1)
    {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    UILabel *label = [[UILabel alloc]init];
    label.frame = view.frame;
    label.text  = @"资金安全有中信银行监管";
    [view addSubview:label];
    return view;
    }
    else
    {
        return nil;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section )
    {
        case 0:
            return 3;
            break;
            
        default:
            return 4;
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isSelect && indexPath.section == 0)
    {
        return 40;
    }
    else if ((_isSelect == NO && indexPath.section == 0 && indexPath.row == 0))
    {
        return 30;
    }
    else if ((_isSelect == NO && indexPath.section == 0 && indexPath.row != 0))
    {
        return 0;
    }
    else if(indexPath.section == 1)
    {
        return 50;
    }
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 3;
    }
    else
    {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = @"1";
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            _isSelect = !_isSelect;
            [self.tableView reloadData];
        }
        else
        {
            _isSelect = NO;
            [self.tableView reloadData];
        }
    }
    if (indexPath.section == 1)
    {
        NSLog(@"第二个分区");
    }
}
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
