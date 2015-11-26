//
//  HomeStatuses.m
//  MVCsina
//
//  Created by 老李 on 15-11-25.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "HomeStatuses.h"
#import "UsersMassage.h"

@implementation HomeStatuses
-(void)dealloc
{
    [_text release];
    [_source release];
    [_created_at release];
    [_modelArr release];
    [super dealloc];
}

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.text = [dic objectForKey:@"text"];
        self.source = [dic objectForKey:@"source"];
        self.created_at = [dic objectForKey:@"created_at"];
        _modelArr = [[NSMutableArray alloc]init];
        
        NSDictionary * tempDic = [dic objectForKey:@"user"];
        
        UsersMassage * model = [[UsersMassage alloc]initWithDic:tempDic];
        [_modelArr addObject:model];
    }
    return self;
    
}

@end
