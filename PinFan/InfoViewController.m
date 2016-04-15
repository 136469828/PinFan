//
//  InfoViewController.m
//  PinFan
//
//  Created by JCong on 16/3/14.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "InfoViewController.h"
#import "UserInfoViewController.h"

#import "InfoTableViewCell.h"
#import "UserTableViewCell.h"
@interface InfoViewController ()
{
    NSArray *titles;
}
@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"个人中心";
    
    titles = @[@[@""],
               @[@"推荐好友",
                 @"我的收藏"],
               
               @[@"待支付订单",
                 @"待评价订单",
                 @"全部订单"],
               
               @[@"我的账户",
                 @"我的红包",
                 @"我的推广好友",
                 @"我的推广订单"],
               
               @[@"收到礼物",
                 @"发出礼物"]];
    
    [self setTableView];
    [self registerNib];
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

}
#pragma mark - 注册Cell
- (void)registerNib{
    NSArray *registerNibs = @[@"InfoTableViewCell",@"UserTableViewCell"];
    for (int i = 0 ; i < registerNibs.count; i++) {
        [_tableView registerNib:[UINib nibWithNibName:registerNibs[i] bundle:nil] forCellReuseIdentifier:registerNibs[i]];
    }
    
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section)
    {
        case 0:{ return 1; } break;
        case 2:{ return 3; } break;
        case 3:{ return 4; } break;
    }
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    {
        return 95;
    }
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell"];
    if (indexPath.section == 0)
    {
        UserTableViewCell *userInfoCell =
        [tableView dequeueReusableCellWithIdentifier:@"UserTableViewCell"];
        
        userInfoCell.selectionStyle     =
        UITableViewCellSelectionStyleNone;
        return userInfoCell;
    }
    cell.titleLabel.text = titles[indexPath.section][indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int state;
    NSString *ctrTitle;
    if (indexPath.section == 0) {
        state = 0;
        ctrTitle = @"我的信息";
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            state = 1;
            ctrTitle = @"二维码";
        }
        else if (indexPath.row == 1)
        {
            state = 2;
            ctrTitle = @"我的收藏";
        }
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            state = 3;
            ctrTitle = @"待支付订单";
        }
        else if (indexPath.row == 1)
        {
            state = 3;
            ctrTitle = @"待评价订单";
        }
        else if (indexPath.row == 2)
        {
            state = 3;
            ctrTitle = @"全部订单";
        }
    }
    else if (indexPath.section == 3)
    {
        if (indexPath.row == 0)
        {
            state = 6;
            ctrTitle = @"我的账户";
        }
        else if (indexPath.row == 1)
        {
            state = 7;
            ctrTitle = @"我的红包";
        }
    }
    else if (indexPath.section == 4)
    {
        if (indexPath.row == 0)
        {
            state = 8;
            ctrTitle = @"收到礼物";
        }
        else if (indexPath.row == 1)
        {
            state = 9;
            ctrTitle = @"发出礼物";
        }
    }
    
    
    UserInfoViewController *userInfoVC = [[UserInfoViewController alloc] init];
    userInfoVC.infostate = state;
    userInfoVC.title = ctrTitle;
    userInfoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:userInfoVC animated:YES];

    
}
@end
