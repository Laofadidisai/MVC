//
//  UserTableView.h
//  MVCsina
//
//  Created by 老李 on 15-11-26.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSMutableArray * userMassageArrry;
//重新定义初始化方法
- (id)initWithFrame:(CGRect)frame WithUserMassgeArr:(NSMutableArray*)array;
@end
