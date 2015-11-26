//
//  HomeStatuses.h
//  MVCsina
//
//  Created by 老李 on 15-11-25.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeStatuses : NSObject

@property(nonatomic,copy)NSString * created_at;
@property(nonatomic,copy)NSString * text;
@property(nonatomic,copy)NSString * source;
@property(nonatomic,retain)NSMutableArray * modelArr;

-(id)initWithDic:(NSDictionary *)dic;

@end
