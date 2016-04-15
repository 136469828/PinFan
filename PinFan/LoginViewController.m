//
//  LoginViewController.m
//  ManagementSystem
//
//  Created by JCong on 16/2/27.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "LoginViewController.h"
#import "RootTabbarController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *rememberBtn;
@property (weak, nonatomic) IBOutlet UIButton *aotuLoginBtn;
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UIImageView *passWordImg;

@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet UIImageView *nameImg;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.rememberBtn addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.rememberBtn  setImage:[UIImage imageNamed:@"gouxuan2"] forState:UIControlStateNormal];
    [self.rememberBtn  setImage:[UIImage imageNamed:@"gouxuan1"] forState:UIControlStateSelected];
    
    [self.aotuLoginBtn addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.aotuLoginBtn  setImage:[UIImage imageNamed:@"gouxuan2"] forState:UIControlStateNormal];
    [self.aotuLoginBtn  setImage:[UIImage imageNamed:@"gouxuan1"] forState:UIControlStateSelected];
    
    
    
    [self.aotuLoginBtn setTitle:@"" forState:UIControlStateNormal];
    self.nameImg.image = [UIImage imageNamed:@"loginName"];
    self.passWordImg.image = [UIImage imageNamed:@"loginPW"];
    
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
-(void)checkboxClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}




- (IBAction)loginOn:(UIButton *)sender {
    
    RootTabbarController *rootTabbarCtr = [[RootTabbarController alloc] init];
    [self presentViewController:rootTabbarCtr animated:YES completion:nil];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
