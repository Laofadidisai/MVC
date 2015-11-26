//
//  UserTableViewCell.m
//  MVCsina
//
//  Created by 老李 on 15-11-26.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_userImage release];
    [_userName release];
    [_userMassage release];
    [_massageTime release];
    [_userSine release];
    [_sourcesWebView release];
    [super dealloc];
}
@end
