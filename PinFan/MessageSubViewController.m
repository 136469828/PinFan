//
//  MessageSubViewController.m
//  PinFan
//
//  Created by JCong on 16/3/15.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MessageSubViewController.h"
#import "MessageofAppraiseCell.h"
#import "MessageofFriendCell.h"
#import "MessageofWarningCell.h"
@interface MessageSubViewController ()

@end

@implementation MessageSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTableView];
    [self registerNib];
//    NSLog(@"%d",self.magState);
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate             = self;
    _tableView.dataSource           = self;
    _tableView.estimatedRowHeight   = 180;
    [self.view addSubview:_tableView];

}
#pragma mark - 注册Cell
- (void)registerNib{
    NSArray *registerNibs = @[@"MessageofAppraiseCell",@"MessageofFriendCell",@"MessageofWarningCell"];
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
#pragma mark - tableViewDalagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (self.magState)
    {
        case 0:{return 2;} break;
        case 1:{return 2;} break;
        case 2:{return 7;} break;
        default:           break;
    }
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellInfier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellInfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfier];
    }
    switch (self.magState) {
            // 评价cell
        case 0:
        {
            MessageofAppraiseCell *cellOfAppraise = [tableView dequeueReusableCellWithIdentifier:@"MessageofAppraiseCell"];
            cellOfAppraise.appraiseLabel.text = @"好好好好";
            return cellOfAppraise;

        }
            break;
        case 1:
        {
            MessageofWarningCell *cellOfWarning = [tableView dequeueReusableCellWithIdentifier:@"MessageofWarningCell"];
            return cellOfWarning;
            
        }
            break;
            
        case 2:
        {
            MessageofFriendCell *cellOfFriend = [tableView dequeueReusableCellWithIdentifier:@"MessageofFriendCell"];
            return cellOfFriend;
            
        }
            break;
            
        default:
            break;
    }
    return cell;
}
@end
