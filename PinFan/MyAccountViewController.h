//
//  MyAccountViewController.h
//  PinFan
//
//  Created by JCong on 16/3/18.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  enum
{
    balanceOfAccount = 0,   // 余额
    withdrawalOfAccount,    // 申请提现
    recordOfAccount,        // 提现记录
    shareOfAccount,         // 推荐好友
}AccounState;
@interface MyAccountViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) AccounState accounState;
@end
