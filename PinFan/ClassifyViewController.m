//
//  ClassifyViewController.m
//  PinFan
//
//  Created by JCong on 16/3/14.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "ClassifyViewController.h"
#import "InfoTableViewCell.h"
#import "SubHomeViewController.h"
@interface ClassifyViewController ()
{
    NSArray *titles;
}
@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"全部分类";
    titles = @[@"粤菜",@"苏菜",@"浙菜",@"闽菜",@"湘菜",@"徽菜",@"川湘组合"];
    [self setTableView];
//    [self registerNib];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate     = self;
    _tableView.dataSource   = self;
    [self.view addSubview:_tableView];

}
//#pragma mark - 注册Cell
//- (void)registerNib{
//    NSArray *registerNibs = @[@"InfoTableViewCell"];
//    for (int i = 0 ; i < registerNibs.count; i++) {
//        [_tableView registerNib:[UINib nibWithNibName:registerNibs[i] bundle:nil] forCellReuseIdentifier:registerNibs[i]];
//    }
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell"];
//    cell.titleLabel.text = titles[indexPath.row];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    static NSString *cellIndenfier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenfier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = titles[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SubHomeViewController *SubHomeVC = [[SubHomeViewController alloc] init];
    SubHomeVC.hidesBottomBarWhenPushed = YES;
    SubHomeVC.title = @"商品列表";
    [self.navigationController pushViewController:SubHomeVC animated:YES];
}
@end
