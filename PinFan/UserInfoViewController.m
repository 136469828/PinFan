//
//  UserInfoViewController.m
//  PinFan
//
//  Created by JCong on 16/3/15.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "UserInfoViewController.h"
#import "ShopInfoViewController.h"
#import "MyAccountViewController.h"
#import "SelectViewController.h"
@interface UserInfoViewController ()
{
    NSArray *titles;
    
    NSMutableArray *dataArr;
    NSMutableArray *btnTitles;
    
    NSString *payState;
    NSString *payBtntitle;
    int payStateInt;
    NSString *sexStr;
    NSString *marital;
    int isSelfSex;
    
}
@end

@implementation UserInfoViewController
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 10; i++)
    {
        payStateInt = arc4random_uniform(3);
        switch (payStateInt) {
            case 0:// 待支付
            {
                payState    = @"待支付";
                payBtntitle = @"立刻支付";
            }
                break;
            case 1:// 已完成
            {
                payState    = @"已完成";
                payBtntitle = @"马上评价";
            }
                break;
                
            case 2:// 已超时
            {
                payState    = @"已超时";
                payBtntitle = @"查看详情";
            }
                break;
                
                
            default:
                break;
        }
        if (dataArr.count == 0) {
            dataArr     = [[NSMutableArray alloc] init];
            btnTitles   = [[NSMutableArray alloc] init];
        }
        [dataArr addObject:payState];
        [btnTitles addObject:payBtntitle];
        
    }

    
    // Do any additional setup after loading the view from its nib.
    titles = @[@[@"",@"用户",@"性别",@"手机号码",@"验证码",@"我的年龄",@"婚姻状况"],
               @[@"",@"申请提现",@"提现记录",@"推荐好友"]];
    [self DrawTableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboaedDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboaedDidappear:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tableViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentTableViewTouchInSide)];
    tableViewGesture.numberOfTapsRequired = 1;
    tableViewGesture.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:tableViewGesture];

}
- (void)DrawTableView{
    _tableView              =
    [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate     = self;
    _tableView.dataSource   = self;
    [self.view addSubview:_tableView];

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
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    /*
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
     */
    switch (self.infostate)
    {
        case infoOfUserInfo:    // 用户信息
        {return  7;} break;
            
        case infoOfFriend:      // 好友
        {return  0;} break;
            
        case infoOfCollection:  // 收藏
        {return  3;} break;
            
        case infoOfPay:         // 待支付
        {return 10;} break;
            
        case infoOfEvaluate:    // 评价
        {return  10;} break;
            
        case infoOfAll:         // 全部订单
        {return  10;} break;
            
        case infoOfAccount:     // 我的账户
        {return  4;} break;
            
        case infoOfRedEnvelope: // 我的红包
        {return  0;} break;
            
        case infoOfTake:        // 收到的礼物
        {return  2;} break;
            
        case infoOfSend:        // 发出礼物
        {return  2;} break;
        default:     break;
    }
    return 10;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.infostate) {
        case infoOfUserInfo:        // 用户信息
        {
            if (indexPath.row == 0) {
                return 100;
            }
            return 44;
        }
            break;
        case infoOfFriend:          // 好友
        {
            
        }
            break;
        case infoOfCollection:      // 收藏
        {
            return 120;
        }
            break;
        case infoOfPay:             // 待支付
        {
            return 120;
        }
            break;
        case infoOfEvaluate:        // 评价
        {
            
        }
            break;
        case infoOfAll:             // 全部订单
        {
            
        }
            break;
        case infoOfAccount:         // 我的账户
        {
            if (indexPath.row == 0) {
                return 80;
            }
        }
            break;
        case infoOfRedEnvelope:     // 我的红包
        {
            
        }
            break;
        case infoOfTake:            // 收到的礼物
        {
            return 100;
        }
            break;
        case infoOfSend:            // 发出礼物
        {
            return 100;
        }
            break;
        default:
            break;
    }
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellInfier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfier];
    }
    
    // cell控件
    UIImageView *userImg = [[UIImageView alloc] init];
    UILabel *subTitleLabel = [[UILabel alloc] init];
    UILabel *mainLabel = [[UILabel alloc] init];
    UITextField *textFiled = [[UITextField alloc] init];
    UILabel *stetaLabel = [[UILabel alloc] init];
    switch (self.infostate) {
        case infoOfUserInfo:        // 用户信息
        {
            if (indexPath.row == 0) {
                userImg.frame = CGRectMake(ScreenWidth/2-40, 10, 80, 80);
                userImg.layer.cornerRadius = 40;
                userImg.layer.masksToBounds = YES;
                userImg.image = [UIImage imageNamed:@"logo_test"];
                [cell.contentView addSubview:userImg];
            }// 头像
            else if (indexPath.row == 1)
            {
                subTitleLabel.frame = CGRectMake(ScreenWidth*0.28, 5, ScreenWidth-ScreenWidth*0.2-10, 40);
                subTitleLabel.text = @"测试";
                [cell.contentView addSubview:subTitleLabel];
            }//用户昵称
            else if (indexPath.row == 2)
            {
                subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth*0.28, 2, ScreenWidth-ScreenWidth*0.2-10, 40)];
                if (sexStr.length != 0) {
                    if (isSelfSex == 1)
                    {
                        subTitleLabel.text = sexStr;
                    }

                }
                else
                {
                    subTitleLabel.text = @"请选择你的性别";
                }
                [cell.contentView addSubview:subTitleLabel];
            }// 性别
            else if (indexPath.row == 3)
            {
                textFiled.frame = CGRectMake(ScreenWidth*0.28, 5, 140, 30);
                textFiled.tag = 999;
                textFiled.layer.borderWidth = 1;
                textFiled.layer.cornerRadius = 5;
                textFiled.layer.borderColor = [UIColor lightGrayColor].CGColor;
                [cell.contentView addSubview:textFiled];
                UIButton *getBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                getBtn.frame = CGRectMake(ScreenWidth - 85, 10, 75, 25);
                getBtn.titleLabel.font = [UIFont systemFontOfSize:14];
                [getBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                [getBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                getBtn.layer.cornerRadius = 5;
                getBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
                getBtn.layer.borderWidth = 0.5;
                [getBtn addTarget:self action:@selector(getCode:) forControlEvents:UIControlEventTouchUpInside];
                
//                NSLog(@"six %@",testStr);
                [cell.contentView addSubview:getBtn];
                
            }// 手机号码
            else if (indexPath.row == 4)
            {
                textFiled.frame = CGRectMake(ScreenWidth*0.28, 5, 140, 30);
                textFiled.tag = 999;
                textFiled.layer.borderWidth = 1;
                textFiled.layer.cornerRadius = 5;
                textFiled.layer.borderColor = [UIColor lightGrayColor].CGColor;
                [cell.contentView addSubview:textFiled];

            }// 验证码
            else if (indexPath.row == 5)
            {
                textFiled.frame = CGRectMake(ScreenWidth*0.28, 5, 140, 30);
                textFiled.tag = 999;
                textFiled.layer.borderWidth = 1;
                textFiled.layer.cornerRadius = 5;
                textFiled.layer.borderColor = [UIColor lightGrayColor].CGColor;
                [cell.contentView addSubview:textFiled];
            }// 我的年龄
            else if (indexPath.row == 6)
            {
                subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth*0.28, 2, ScreenWidth-ScreenWidth*0.2-10, 40)];
                if (marital.length != 0) {
                    if (isSelfSex == 0)
                    {
                        subTitleLabel.text = marital;
                    }
                }
                else
                {
                    subTitleLabel.text = @"请选择你的婚姻状况";
                }

//                subTitleLabel.text = @"请选择你的婚姻状况";
                [cell.contentView addSubview:subTitleLabel];
            }// 婚姻状况
            cell.textLabel.text = titles[0][indexPath.row];
        }
            break;
        case infoOfFriend:          // 推荐好友
        {
            
        }
            break;
        case infoOfCollection:      // 收藏
        {
            userImg.frame = CGRectMake(8, 8, 120, 100);
            userImg.image = [UIImage imageNamed:@"test_Img"];
            [cell.contentView addSubview:userImg];

            mainLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 10, 50, 30);
            mainLabel.font = [UIFont systemFontOfSize:14];
            mainLabel.textColor = [UIColor blackColor];
            mainLabel.text = @"测试";
            [cell.contentView addSubview:mainLabel];
            
            subTitleLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 50, 70, 30);
            subTitleLabel.font = [UIFont systemFontOfSize:14];
            subTitleLabel.textColor = [UIColor blackColor];
            subTitleLabel.text = @"测试2";
            [cell.contentView addSubview:subTitleLabel];

        }
            break;
        case infoOfPay:             // 待支付
        {
            userImg.frame = CGRectMake(8, 8, 120, 100);
            userImg.image = [UIImage imageNamed:@"test_Img"];
            [cell.contentView addSubview:userImg];
            mainLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 10, ScreenWidth - userImg.bounds.size.width-15, 30);
            mainLabel.numberOfLines = 0;
            mainLabel.font = [UIFont systemFontOfSize:14];
            mainLabel.textColor = [UIColor blackColor];
            mainLabel.text = @"测试,测试,测试,测试,测试,测试,测试,测试,测试,测试";
            [cell.contentView addSubview:mainLabel];
            
            subTitleLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 50, 100, 30);
            subTitleLabel.font = [UIFont systemFontOfSize:13];
            subTitleLabel.textColor = [UIColor blackColor];
            subTitleLabel.text = @"总价: ￥9999.99";
            [cell.contentView addSubview:subTitleLabel];
            
            stetaLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 90, 70, 30);
            stetaLabel.font = [UIFont systemFontOfSize:14];
            stetaLabel.textColor = [UIColor lightGrayColor];
            stetaLabel.text = dataArr[indexPath.row];
            [cell.contentView addSubview:stetaLabel];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:btnTitles[indexPath.row] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName : @"Helvetica-Bold"  size :13];
            [btn setTitleColor:RGB(108, 193, 200) forState:UIControlStateNormal];
            btn.frame = CGRectMake(ScreenWidth - 70, cell.bounds.size.height + 40, 60, 25);
            btn.layer.cornerRadius = 5;
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = RGB(108, 193, 200).CGColor;
            [cell.contentView addSubview:btn];
            
        }
            break;
        case infoOfEvaluate:        // 评价
        {
            
        }
            break;
        case infoOfAll:             // 全部订单
        {
            
        }
            break;
        case infoOfAccount:         // 我的账户
        {
            if (indexPath.row == 0)
            {
                userImg.frame = CGRectMake(20, 15, 50, 50);
                userImg.layer.cornerRadius = 25;
                userImg.layer.masksToBounds = YES;
                userImg.image = [UIImage imageNamed:@"logo_test"];
                [cell.contentView addSubview:userImg];
                mainLabel.frame = CGRectMake(100, 30, ScreenWidth - 150, 30);
                mainLabel.text = [NSString stringWithFormat:@"账户余额:￥ %.2f",9999.99];
                [cell.contentView addSubview:mainLabel];
            }
            cell.textLabel.text = titles[1][indexPath.row];
            
        }
            break;
        case infoOfRedEnvelope:     // 我的红包
        {
            
        }
            break;
        case infoOfTake:            // 收到的礼物
        {
            userImg.frame = CGRectMake(8, 8, 100, 80);
            userImg.image = [UIImage imageNamed:@"gift"];
            [cell.contentView addSubview:userImg];
            
            mainLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 10, 50, 30);
            mainLabel.font = [UIFont systemFontOfSize:14];
            mainLabel.textColor = [UIColor blackColor];
            mainLabel.text = @"测试";
            [cell.contentView addSubview:mainLabel];
            
            subTitleLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 30, 70, 30);
            subTitleLabel.font = [UIFont systemFontOfSize:14];
            subTitleLabel.textColor = [UIColor blackColor];
            subTitleLabel.text = @"测试2";
            [cell.contentView addSubview:subTitleLabel];
            // 时间
            stetaLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 70, ScreenWidth - userImg.bounds.size.width, 30);
            stetaLabel.font = [UIFont systemFontOfSize:14];
            stetaLabel.textColor = [UIColor lightGrayColor];
            stetaLabel.text = @"2016-12-16";
            [cell.contentView addSubview:stetaLabel];

        }
            break;
        case infoOfSend:            // 发出礼物
        {
            userImg.frame = CGRectMake(8, 8, 100, 80);
            userImg.image = [UIImage imageNamed:@"gift"];
            [cell.contentView addSubview:userImg];
            
            mainLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 10, 50, 30);
            mainLabel.font = [UIFont systemFontOfSize:14];
            mainLabel.textColor = [UIColor blackColor];
            mainLabel.text = @"测试";
            [cell.contentView addSubview:mainLabel];
            
            subTitleLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15,30, 70, 30);
            subTitleLabel.font = [UIFont systemFontOfSize:14];
            subTitleLabel.textColor = [UIColor blackColor];
            subTitleLabel.text = @"测试2";
            [cell.contentView addSubview:subTitleLabel];
            // 时间
            stetaLabel.frame = CGRectMake(userImg.bounds.origin.x+120+15, 70, ScreenWidth - userImg.bounds.size.width, 30);
            stetaLabel.font = [UIFont systemFontOfSize:14];
            stetaLabel.textColor = [UIColor lightGrayColor];
            stetaLabel.text = @"2016-12-16";
            [cell.contentView addSubview:stetaLabel];


        }
            break;
        default:
            break;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
    switch (indexPath.section) {
        case 0:
        {
            
        }
            break;
            
        default:
            break;
    }
    switch (self.infostate)
    {
        case infoOfAccount:
        {
            MyAccountViewController *myAccountVC = [[MyAccountViewController alloc] init];
            switch (indexPath.row) {
                case 0:
                {
                    myAccountVC.title = @"收支明细";
                }
                    break;
                case 1:
                {
                    myAccountVC.title = @"申请提现";
                }
                    break;
                case 2:
                {
                    myAccountVC.title = @"提现记录";
                }
                    break;
                case 3:
                {
                    myAccountVC.title = @"推荐好友";
                }
                    break;
                    
                default:
                    break;
            }
            myAccountVC.accounState = (int)indexPath.row;
            [self.navigationController pushViewController:myAccountVC animated:YES];
        }
            break;
        case infoOfUserInfo:
        {
            if (indexPath.row == 2)
            {
                
                [self pushAddVC:YES];
                
            }
            if (indexPath.row == 6)
            {
                
                [self pushAddVC:NO];
                
            }
           
        }
            break;
            
        default:

            break;
            
    }
}
#pragma mark - btnAction
- (void)clickOn:(UIButton *)sender{
    sender.selected = !sender.selected;
    
    if (self.sex == infoOfMan) {
        
    }
    else if (self.sex == infoOfWoman)
    {
        
    }
    else if (self.marital == infoOfUnmarried)
    {
    
    }
    else if (self.marital == infoOfMarried)
    {
    
    }
    
    else if (self.marital == infoOfDivorced)
    {
        
    }
    
    if (sender.selected == YES) {
        [sender setImage:[UIImage imageNamed:@"validSelect"] forState:UIControlStateNormal];
    }
    if (sender.selected == NO) {
        [sender setImage:[UIImage imageNamed:@"validUnselect"] forState:UIControlStateNormal];
    }


}
// 获取验证码
- (void)getCode:(UIButton *)sender{
    // 此处获取验证码
}
#pragma mark - 键盘相关
- (void)keyboaedDidShow:(NSNotification *)notif{
    //        NSLog(@"键盘出现 %@",notif);
    NSDictionary *info = [notif userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardWillShowNotification];
    CGSize keyboardSize = [aValue CGRectValue].size;
    CGRect viewRect = [self.tableView frame];
    viewRect.origin.y = viewRect.origin.y - keyboardSize.height - 30;
    self.tableView.frame = viewRect;
}
- (void)keyboaedDidappear:(NSNotification *)notif{
    NSLog(@"键盘消失");
    _tableView.frame = [UIScreen mainScreen].bounds;
}
- (void)commentTableViewTouchInSide{
    [self.tableView endEditing:YES];
    NSLog(@"clickOntableView");
}
- (void)pushAddVC:(BOOL)isMaritalorSix
{
    SelectViewController *selectVC = [[SelectViewController alloc] initWithNibName:@"SelectViewController" bundle:nil];
    selectVC.isMaritalorSix = isMaritalorSix;
    [self.navigationController pushViewController:selectVC animated:YES];
    selectVC.block = ^(NSString *str,BOOL isSex){
        sexStr = str;
        NSLog(@"%@ %d",sexStr,isSex);
        
        if (isSex == 1) {
            sexStr = str;
            isSelfSex = 1;
        }
        else if(isSex == 0)
        {
            marital = str;
            isSelfSex = 0;
        }
        [self.tableView reloadData];
        
    };
}
@end
