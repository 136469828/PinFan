//
//  SubHomeViewController.h
//  PinFan
//
//  Created by JCong on 16/3/16.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubHomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
+(UIViewController *)viewController:(UIView *)view;
@end
