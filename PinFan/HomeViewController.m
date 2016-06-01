//
//  HomeViewController.m
//  PinFan
//
//  Created by JCong on 16/3/14.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "HomeViewController.h"
#import "SubHomeViewController.h"
#import "SDCycleScrollView.h"
#import "UIImageView+WebCache.h"
#import "HomeViewTableViewCell.h"
#import "HomeImgTableViewCell.h"
#import "NetManger.h"
#import "ProjectModel.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
{
//    ScrollView *topScrollView;
    NetManger *manger;
}
@end

@implementation HomeViewController
// 销毁通知中心
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"首页";
    [self setTableView];
    [self registerNib];
    manger= [NetManger shareInstance];
//    manger.isKeyword = NO;
    [manger loadData:RequestOfGetlist];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drawHeardView) name:@"advertise" object:nil];
}
- (void)drawHeardView
{
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
    SDCycleScrollView *cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight*0.23) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    NSArray *arr = manger.m_imgArr;
    cycleScrollView3.imageURLStringsGroup = arr;
    _tableView.tableHeaderView = cycleScrollView3;
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate     = self;
    _tableView.dataSource   = self;

    [self.view addSubview:_tableView];
    
}

#pragma mark - 注册Cell
- (void)registerNib{
    NSArray *registerNibs = @[@"HomeViewTableViewCell",@"HomeImgTableViewCell"];
    for (int i = 0 ; i < registerNibs.count; i++) {
        [_tableView registerNib:[UINib nibWithNibName:registerNibs[i] bundle:nil] forCellReuseIdentifier:registerNibs[i]];
    }
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80;
    }
    if (indexPath.row == 1) {
        return 30;
    }
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndefier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndefier];
        cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    }
    switch (indexPath.row) {
        case 0:
        {
            HomeViewTableViewCell *secCell = [tableView dequeueReusableCellWithIdentifier:@"HomeViewTableViewCell"];
            secCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return secCell;
        }
            break;
        case 1:
        {
            UIView *baView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, 5, 30)];
            baView.backgroundColor = RGB(0, 207, 109);
            [cell.contentView addSubview:baView];
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.text = @"精彩推荐";
            return cell;
        }
            break;
        case 2:
        {
            HomeImgTableViewCell *imgCell = [tableView dequeueReusableCellWithIdentifier:@"HomeImgTableViewCell"];
            imgCell.cellImg.image = [UIImage imageNamed:@"4238b75bd1274157a678eabc53ab2ebf.jpg"];
            imgCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return imgCell;
        }
            break;
            
            
        default:
        {
            HomeImgTableViewCell *imgCell = [tableView dequeueReusableCellWithIdentifier:@"HomeImgTableViewCell"];
//            imgCell.imageView.image = [UIImage imageNamed:@"img2.jpg"];
            
            imgCell.cellImg.image = [UIImage imageNamed:@"9833d187a9434c938923f4b4517bad64.jpg"];
            imgCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return imgCell;
        }
            break;
    }
    return nil;
}


//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    SubHomeViewController *SubHomeVC = [[SubHomeViewController alloc] init];
//    SubHomeVC.hidesBottomBarWhenPushed = YES;
//    SubHomeVC.title = @"商品列表";
//    [self.navigationController pushViewController:SubHomeVC animated:YES];
//}
@end
