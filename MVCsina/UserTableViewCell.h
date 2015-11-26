//
//  UserTableViewCell.h
//  MVCsina
//
//  Created by 老李 on 15-11-26.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView * userImage;
@property (retain, nonatomic) IBOutlet UILabel *userName;
@property (retain, nonatomic) IBOutlet UILabel *userSine;
@property (retain, nonatomic) IBOutlet UILabel *userMassage;
@property (retain, nonatomic) IBOutlet UILabel *massageTime;

@property (retain, nonatomic) IBOutlet UIWebView *sourcesWebView;

@end
