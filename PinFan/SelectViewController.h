//
//  SelectViewController.h
//  PinFan
//
//  Created by admin on 16/4/15.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ablock)(NSString *str,BOOL isSex);
@interface SelectViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isMaritalorSix; // YES Marital NO Six
@property (nonatomic, copy) ablock block;
@end
