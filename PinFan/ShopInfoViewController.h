//
//  ShopInfoViewController.h
//  PinFan
//
//  Created by JCong on 16/3/17.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DateViewController.h"
@interface ShopInfoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSString *timeS;
}

@property (nonatomic, strong) UITableView *tableView;
@end
