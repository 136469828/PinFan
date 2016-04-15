//
//  SubmitViewController.m
//  PinFan
//
//  Created by JCong on 16/3/17.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "SubmitViewController.h"
#import "MarkViewController.h"
@interface SubmitViewController ()
{
    NSArray *titles;
    BOOL isAliSelect;
    BOOL isWeiXinSelect;
}
@end

@implementation SubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    titles = @[@[@"微信支付",@"支付宝"],
               @[@"商品",@" "],
               @[@"备注"],
               @[@"总价",@"红包",@"还需支付"]];
    
    [self setTableView];
    [self setBottomView];
}
- (void)setTableView{
    _tableView              =
    [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 49) style:UITableViewStyleGrouped];
    _tableView.delegate     = self;
    _tableView.dataSource   = self;
    [self.view addSubview:_tableView];

}
- (void)setBottomView{
    UIView *bottomView  =
    [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 49, ScreenWidth, 49)];
    
    UIButton *bottomBtn         =
    [UIButton buttonWithType:UIButtonTypeCustom];
    bottomBtn.frame             =
    CGRectMake(20, 10, ScreenWidth - 40, 30);
    bottomBtn.backgroundColor   =
    [UIColor orangeColor];
    bottomBtn.titleLabel.font   =
    [UIFont systemFontOfSize:14];
    
    [bottomBtn setTintColor:[UIColor whiteColor]];
    [bottomBtn setTitle:@"立刻支付" forState:UIControlStateNormal];
    [bottomView addSubview:bottomBtn];
    [self.view  addSubview:bottomView];
    
    
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
    // 2213
    switch (section)
    {
        case 0:{return 2;} break;
        case 1:{return 2;} break;
        case 2:{return 1;} break;
        case 3:{return 3;} break;
        default:           break;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 1)
    {return 80;}
    
    return 44;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellFier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellFier];
    }
    cell.textLabel.text = titles[indexPath.section][indexPath.row];
    UIImageView *payImg = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - 25, 15,15, 15)];
    switch (indexPath.section)
    {
        case 0:
        {
            isWeiXinSelect = YES; isAliSelect = NO;
            if (indexPath.row == 0)
            {
                payImg.image = [UIImage imageNamed:@"validSelect"];
                payImg.tag =1200;
                [cell.contentView addSubview:payImg];
            }
            if (indexPath.row == 1)
            {
                payImg.image = [UIImage imageNamed:@"validUnselect"];
                payImg.tag =1201;
                [cell.contentView addSubview:payImg];
            }
            
        }
            break;
            
        default:
            break;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    {
        UIImageView *selectImg          =
        (UIImageView *)[self.view viewWithTag:1201];
        
        UIImageView *selectWeiXinImg    =
        (UIImageView *)[self.view viewWithTag:1200];
        
        isWeiXinSelect  = !isWeiXinSelect;
        isAliSelect     = !isAliSelect;
        if (isAliSelect)
        {
            selectImg.image         = [UIImage imageNamed:@"validSelect"];
            NSLog(@"选择了支付宝支付");
        }
        else
        {
           selectImg.image          = [UIImage imageNamed:@"validUnselect"];
        }
        if (isWeiXinSelect)
        {
            selectWeiXinImg.image   = [UIImage imageNamed:@"validSelect"];
            NSLog(@"选择了微信支付");
        }
        else
        {
            selectWeiXinImg.image   = [UIImage imageNamed:@"validUnselect"];
        }
        
    }
    if (indexPath.section == 2) {
        MarkViewController *markVC = [[MarkViewController alloc] init];
        [self.navigationController pushViewController:markVC animated:YES];
    }
}


@end
