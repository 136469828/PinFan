//
//  MessageViewControllerViewController.m
//  PinFan
//
//  Created by JCong on 16/3/14.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageSubViewController.h"

#import "InfoTableViewCell.h"
@interface MessageViewController ()
{
    NSArray *titles;
}
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"我的消息";
    titles = @[@"订单评价",
               @"消息提醒"];
    [self setTableView];
    [self registerNib];
    
}
- (void)setTableView{
    _tableView              =
    [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate     = self;
    _tableView.dataSource   = self;
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
#pragma  mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView     numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell"];
    cell.accessoryType=
    UITableViewCellAccessoryDisclosureIndicator;
    cell.titleLabel.text = titles[indexPath.row];
    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageSubViewController *magSubVC = [[MessageSubViewController alloc] init];
    NSString *title;
    switch (indexPath.row)
    {
        case 0:{title = @"评价";} break;
        case 1:{title = @"消息";} break;
//        case 2:{title = @"私信";} break;
        default:                  break;
    }
    
    magSubVC.title                    = title;
    magSubVC.magState                 = (int)indexPath.row;
    magSubVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:magSubVC animated:YES];
    
}
@end
