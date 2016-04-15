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

@interface SubHomeViewController ()

@end

@implementation SubHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTableView];
    [self registerNib];
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
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SubHomeTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubHomeTableviewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
