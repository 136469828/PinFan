//
//  SelectViewController.m
//  PinFan
//
//  Created by admin on 16/4/15.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "SelectViewController.h"

@interface SelectViewController ()
{
    NSArray *titles;
}
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (self.isMaritalorSix) {
        titles = @[@"男",@"女"];
    }
    else
    {
        titles = @[@"未婚",@"已婚",@"离异"];
    }
    
    [self setTableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setTableView{
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma  mark - tableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isMaritalorSix) {
        return 2;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndenfier = @"cell";
    UITableViewCell *cell = nil;
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenfier];
        
    }
    cell.textLabel.text = titles[indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell.textLabel.text);
    // 回调
    if (cell.textLabel.text.length != 0 )
    {
        
        if (self.block)
        {
            
            self.block(cell.textLabel.text,self.isMaritalorSix);
            
//            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    else
    {
        NSLog(@"nil");
    }

    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];

}
@end
