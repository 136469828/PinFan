//
//  SubHomeViewController.h
//  PinFan
//
//  Created by JCong on 16/3/16.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef   enum
{
    LeftType = 0,
    
    MidType,
    
    RightType
}TheType;
@interface SubHomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) TheType type;
+(UIViewController *)viewController:(UIView *)view;
@end
