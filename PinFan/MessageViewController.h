//
//  MessageViewControllerViewController.h
//  PinFan
//
//  Created by JCong on 16/3/14.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end
