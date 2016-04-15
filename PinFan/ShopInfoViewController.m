//
//  ShopInfoViewController.m
//  PinFan
//
//  Created by JCong on 16/3/17.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "ShopInfoViewController.h"
#import "SubmitViewController.h"
#import "DateViewController.h"
#import "ScrollView.h"

@interface ShopInfoViewController ()
{
    
    NSArray *titles;
    NSArray *entrees;
    ScrollView *scroll;
    NSString *selfTimeStr;
}
@end

@implementation ShopInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd "];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    //    NSLog(@"dateString:%@",dateString);
    // 菜品数组
    entrees = @[@"包含菜品",@"红烧大王蛇",@"红烧大王蛇"];
    titles = @[@[@" ",@" "],
               @[dateString],
               entrees,
               @[@"商家信息",@"地址"],
               @[@"商品详情",@" "]];
    [self setTableView];
    [self setBottomView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test:) name:@"date" object:nil];
}
- (void)test:(NSNotification *)obj
{
    NSLog(@"time :%@",obj.object);
    selfTimeStr = obj.object;
    [self.tableView reloadData];
    
}
- (void)setBottomView{
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 49, ScreenWidth, 49)];
    for (int i = 0; i<2; i++) {
        UIButton *bottomBtn         =
        [UIButton buttonWithType:UIButtonTypeCustom];
        
        bottomBtn.frame             =
        CGRectMake(i*(ScreenWidth/2+10)+10, 5, ScreenWidth/2-30, 30);
        
        bottomBtn.backgroundColor   =
        [UIColor orangeColor];
        [bottomBtn setTitle:@"加入收藏" forState:UIControlStateNormal];
        if (i == 1)
        {
            [bottomBtn setTitle:@"提交订单" forState:UIControlStateNormal];
        }
        [bottomBtn setTintColor:[UIColor whiteColor]];
        bottomBtn.titleLabel.font   =
        [UIFont systemFontOfSize:14];
        
        bottomBtn.tag               =
        2000+i;
        
        [bottomBtn addTarget:self action:@selector(bottomBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:bottomBtn];
    }
    [self.view addSubview:bottomView];
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 50) style:UITableViewStyleGrouped];
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
#pragma  mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section       == 0)
    {
        if (indexPath.row   == 0)
        {
            return 250;
        }
    }
    else if (indexPath.section == 4)
    {
        if (indexPath.row   == 1)
        {
            return 200;
        }
    }
    return 44;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 21322
    if (section == 2)
    {
        return entrees.count;
    }
    else if (section == 0 || section == 3 || section == 4)
    {
        return 2;
    }
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellInfier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfier];
    }
    UIImageView *shopImg = [[UIImageView alloc] init];
    cell.textLabel.text = titles[indexPath.section][indexPath.row];
    if (indexPath.row == 0)
    {
        cell.textLabel.textColor = RGB(103, 185, 192);
    }
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            // 此处为商品详情滚动广告 及其名称，价格
            scroll = [[ScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
            [cell.contentView addSubview:scroll];
            
            UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 188, ScreenWidth- 20, 30)];
            titleLab.font = [UIFont systemFontOfSize:14];
            titleLab.text = @"朱古力炸豆角皮";
            [cell.contentView addSubview:titleLab];
            
            UILabel *priceLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 188+30, 100, 30)];
            priceLab.font = [UIFont systemFontOfSize:15];
            priceLab.text = [NSString stringWithFormat:@"￥ %.2f",9999.99];
            priceLab.textColor = RGB(201, 61, 54);
            [cell.contentView addSubview:priceLab];
            
        }
        else
        {
            // 此处为商品类型，报名人数
            for (int i = 0; i<2; i++) {
                UILabel *shopLab = [[UILabel alloc] initWithFrame:CGRectMake(i*ScreenWidth*0.6+10, 10, 100, 20)];
                shopLab.font = [UIFont systemFontOfSize:13];
                shopLab.text = [NSString stringWithFormat:@"商品类型: %@",@"A"];
                if (i == 1)
                {
                    shopLab.text = [NSString stringWithFormat:@"已报名人数: %d人",5];
                }
                [cell.contentView addSubview:shopLab];
                
            }
        }
    }
    if (indexPath.section == 1) {
        if (selfTimeStr.length != 0) {
            cell.textLabel.text = selfTimeStr;
        }
    }
    if (indexPath.section == 4)
    {
        if (indexPath.row == 1)
            {
            shopImg.image   = [UIImage imageNamed:@"HomeBanner.jpg"];
            shopImg.frame   = CGRectMake(8, 8, ScreenWidth-16, 184);
            [cell.contentView addSubview:shopImg];
        }
    }
    cell.selectionStyle     =
    UITableViewCellSelectionStyleNone;
    NSLog(@"%@",timeS);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        DateViewController *dateVC = [[DateViewController alloc] init];
        [self.navigationController pushViewController:dateVC animated:YES];
    }
}
#pragma  mark - bottomBtnAction
- (void)bottomBtnAction:(UIButton *)sender{
    if (sender.tag == 2000)
    {
        // 加入收藏
    }
    if (sender.tag == 2001)
    {
        // 提交订单
        SubmitViewController *submitVC = [[SubmitViewController alloc] init];
        submitVC.title = @"订单提交";
        [self.navigationController pushViewController:submitVC animated:YES];
        NSLog(@"提交订单");
    }
}


@end
