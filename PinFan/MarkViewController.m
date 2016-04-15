//
//  MarkViewController.m
//  PinFan
//
//  Created by guofeng on 16/3/21.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MarkViewController.h"
#define Cell_W cell.contentView.bounds.size.width
#define Cell_H cell.contentView.bounds.size.height

@interface MarkViewController ()

@end

@implementation MarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self drawTableView];
}
- (void)drawTableView{
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.delegate     = self;
    self.tableView.dataSource   = self;
    [self.view addSubview:self.tableView];
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
#pragma mark - tableViewDelegata
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44*2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellInfier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfier];
    }
    UITextView *markTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, Cell_W+30, Cell_H*2 - 20)];
    markTextView.layer.cornerRadius = 5;
    markTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    markTextView.layer.borderWidth = 0.5;
    [cell.contentView addSubview:markTextView];
    return cell;
}
@end
