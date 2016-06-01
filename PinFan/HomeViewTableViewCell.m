//
//  HomeViewTableViewCell.m
//  PinFan
//
//  Created by admin on 16/4/12.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "HomeViewTableViewCell.h"
#import "SubHomeViewController.h"
@implementation HomeViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.foodBtn.layer.cornerRadius = 20;
    self.foodBtn.layer.masksToBounds = YES;
    self.friendBtn.layer.cornerRadius = 20;
    self.friendBtn.layer.masksToBounds = YES;
    self.eventBtn.layer.cornerRadius = 20;
    self.eventBtn.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)foodBtnAction:(UIButton *)sender {
    SubHomeViewController *subHomeVC = [[SubHomeViewController alloc] init];
    //    subHomeVC.title = @"我的项目";
    subHomeVC.type = 0;
    subHomeVC.hidesBottomBarWhenPushed = YES;
    [[SubHomeViewController viewController:self].navigationController pushViewController:subHomeVC animated:YES];
}
- (IBAction)friendBtn:(UIButton *)sender {
    SubHomeViewController *subHomeVC = [[SubHomeViewController alloc] init];
    //    subHomeVC.title = @"我的项目";
    subHomeVC.type = 1;
    subHomeVC.hidesBottomBarWhenPushed = YES;
    [[SubHomeViewController viewController:self].navigationController pushViewController:subHomeVC animated:YES];
}
- (IBAction)eventBtnAction:(UIButton *)sender {
    SubHomeViewController *subHomeVC = [[SubHomeViewController alloc] init];
    subHomeVC.type = 2;
    //    subHomeVC.title = @"我的项目";
    subHomeVC.hidesBottomBarWhenPushed = YES;
    [[SubHomeViewController viewController:self].navigationController pushViewController:subHomeVC animated:YES];
}

@end
