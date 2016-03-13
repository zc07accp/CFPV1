//
//  HomeTabBarViewController.m
//  CFPV1
//
//  Created by zf on 16/3/10.
//  Copyright © 2016年 PY. All rights reserved.
//
#import "HomeTabBarViewController.h"
#import "LoginViewController.h"
#import "HomePageViewController.h"
@interface HomeTabBarViewController ()<UITabBarControllerDelegate>
@property (assign,nonatomic) BOOL isLogin;
@end

@implementation HomeTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isLogin =NO;
    self.delegate = self;
}
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (viewController.tabBarItem.tag == 2 && _isLogin == NO )
    {
        LoginViewController *lvc = [[LoginViewController alloc]init];
        [((UINavigationController *)tabBarController.selectedViewController) pushViewController:lvc animated:YES];
        return NO;
    }
    return YES;
}
-(void)dis
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
