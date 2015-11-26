//
//  UsersMassage.m
//  MVCsina
//
//  Created by 老李 on 15-11-26.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "UsersMassage.h"

@implementation UsersMassage

-(void)dealloc
{
    [_name release];
    [_profile_image_url release];
    [_location release];
    [super dealloc];
}

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.name = [dic objectForKey:@"name"];
        self.profile_image_url = [dic objectForKey:@"profile_image_url"];
        self.location = [dic objectForKey:@"location"];
    }
    return self;
}

@end
