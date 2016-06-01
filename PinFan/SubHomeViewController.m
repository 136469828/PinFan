//
//  SubHomeViewController.m
//  PinFan
//
//  Created by JCong on 16/3/16.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "SubHomeViewController.h"
#import "SubHomeTableviewCell.h"
#import "ShopInfoViewController.h"
#import "NetManger.h"
#import "ProjectModel.h"
#import "UIImageView+WebCache.h"
@interface SubHomeViewController ()
{
    NetManger *manger;
}
@end

@implementation SubHomeViewController
// 销毁通知中心
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    manger = [NetManger shareInstance];
    switch (self.type) {
        case LeftType:
        {
            manger.isKeyword = NO;
            [manger loadData:RequestOfGetprojectlist];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadDatas) name:@"GetprojectlistWithKeyword" object:nil];
        }
            break;
        case MidType:
        {
            
        }
            break;
        case RightType:
        {
            
        }
            break;
            
        default:
            break;
    }

    
    [self setTableView];
    [self registerNib];
}
- (void)reloadDatas
{
    [self.tableView reloadData];
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

}
#pragma mark - 注册Cell
- (void)registerNib{
    NSArray *registerNibs = @[@"SubHomeTableviewCell"];
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
#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return manger.m_projectInfoArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SubHomeTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubHomeTableviewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ProjectModel *model = manger.m_projectInfoArr[indexPath.row];
    cell.titleLab.text = model.projectName;
    cell.subTitleLab.text = [NSString stringWithFormat:@"%ld 人",[model.manSum integerValue]+[model.femaleSum integerValue]];
    cell.priceLab.text = [NSString stringWithFormat:@"￥: %@",model.manPric];
    [cell.imgV sd_setImageWithURL:[NSURL URLWithString:model.projectImg]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopInfoViewController *shopInfoVC = [[ShopInfoViewController alloc] init];
    shopInfoVC.title = @"商品详情";
    [self.navigationController pushViewController:shopInfoVC animated:YES];
}
+(UIViewController *)viewController:(UIView *)view{
    
    /// Finds the view's view controller.
    
    // Traverse responder chain. Return first found view controller, which will be the view's view controller.
    
    UIResponder *responder = view;
    
    while ((responder = [responder nextResponder]))
        
        if ([responder isKindOfClass: [UIViewController class]])
            
            return (UIViewController *)responder;
    
    // If the view controller isn't found, return nil.
    
    return nil;
    
}
@end
