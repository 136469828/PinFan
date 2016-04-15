//
//  UserInfoViewController.h
//  PinFan
//
//  Created by JCong on 16/3/15.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    infoOfUserInfo = 0,            // 用户信息
    
    infoOfFriend,                  // 好友
    
    infoOfCollection,              // 收藏
    
    infoOfPay,                     // 待支付
    
    infoOfEvaluate,                // 评价
    
    infoOfAll,                     // 全部订单
    
    infoOfAccount,                 // 我的账户
    
    infoOfRedEnvelope,             // 我的红包
    
    infoOfTake,                    // 收到的礼物
    
    infoOfSend                     // 发出礼物
    
}InfoState;
typedef enum
{
    infoOfMan = 0,                  // 男
    
    infoOfWoman,                    // 女
    
    
}InfoSex;

typedef enum
{
    infoOfUnmarried = 0,            // 未婚
    
    infoOfMarried ,                 // 已婚
    
    infoOfDivorced,                 // 离异
    
    
}InfoMarital;
@interface UserInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, assign) InfoState infostate;
@property (nonatomic, assign) InfoMarital marital;
@property (nonatomic, assign) InfoSex sex;
@property (nonatomic, strong) UITableView *tableView;
@end
