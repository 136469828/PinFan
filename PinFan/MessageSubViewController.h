//
//  MessageSubViewController.h
//  PinFan
//
//  Created by JCong on 16/3/15.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    messageofAppraise  = 0,             // 评价
    
    messageofWarning,                   // 提醒
    
    messageofFriend,                    // 私信
    
}MessageState;
@interface MessageSubViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign)    MessageState magState;

@property (nonatomic, strong) UITableView *tableView;


@end
