//
//  MessageofWarningCell.m
//  PinFan
//
//  Created by JCong on 16/3/15.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "MessageofWarningCell.h"

@implementation MessageofWarningCell

- (void)awakeFromNib {
    // Initialization code
    self.imgView.layer.cornerRadius = 6;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
