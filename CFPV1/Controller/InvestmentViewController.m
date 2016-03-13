//
//  InvestmentViewController.m
//  CFPV1
//
//  Created by zf on 16/3/11.
//  Copyright © 2016年 PY. All rights reserved.
//

#import "InvestmentViewController.h"
#import "AuthenticationViewController.h"
@interface InvestmentViewController ()

@end

@implementation InvestmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nextButton:(UIButton *)sender
{
    AuthenticationViewController *avc = [[AuthenticationViewController alloc]init];
    [self.navigationController pushViewController:avc animated:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
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
