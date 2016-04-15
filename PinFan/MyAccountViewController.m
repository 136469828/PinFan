//
//  MyAccountViewController.m
//  PinFan
//
//  Created by JCong on 16/3/18.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()
{
    NSArray *dataArr;
}
@end

@implementation MyAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataArr = @[@" "];
    [self setTableView];
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
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
#pragma mark - tableViewDelagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.accounState) {
        case recordOfAccount:
            return 60;
            break;
            
        default:
            break;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellInfier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfier];
    }
    switch (self.accounState) {
        case recordOfAccount: // 提现记录
        {
            NSArray *titles = @[@"￥100",@"收入",@"￥9999.99",@"余额"];
            for (int i = 0; i<4; i++) {
                UILabel *titleLab = [[UILabel alloc] init];
                titleLab.text = [NSString stringWithFormat:@"%d",i];
                if (i%2) {
                    titleLab.frame = CGRectMake(10, (i-1)*15+5, ScreenWidth/2-10, 20);
//                    titleLab.backgroundColor = [UIColor cyanColor];
                    
                }
                else
                {
                    titleLab.frame = CGRectMake(ScreenWidth/2+15, i*15+5, ScreenWidth/2-20, 20);
//                    titleLab.backgroundColor = [UIColor redColor];
                    titleLab.textAlignment = NSTextAlignmentLeft;
//                    if (i == 1) {
//                        titleLab.text = [NSString stringWithFormat:@"收入:%d",i];
//                    }
//                    else
//                    {
//                        titleLab.text = [NSString stringWithFormat:@"余额:%d",i];
//                    }
                }
                titleLab.text = titles[i];
                [cell.contentView addSubview:titleLab];
            }
        }
            break;
            
        default:
            break;
    }
    return cell;
}
@end
