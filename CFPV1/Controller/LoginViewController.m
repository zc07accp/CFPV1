//
//  LoginViewController.m
//  CFPV1
//
//  Created by zf on 16/3/10.
//  Copyright © 2016年 PY. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginButton:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    // [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelBarButtonitem:(UIBarButtonItem *)sender
{
 
    [self.navigationController popViewControllerAnimated:YES];
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
