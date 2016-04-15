//
//  UserTableViewCell.m
//  PinFan
//
//  Created by JCong on 16/3/14.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.imgUser.layer.cornerRadius = self.imgUser.bounds.size.height/2;
    self.imgUser.layer.masksToBounds = YES;
    self.imgUser.image = [UIImage imageNamed:@"logo_test"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
