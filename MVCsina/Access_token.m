//
//  Access_token.m
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "Access_token.h"

@implementation Access_token
-(void)dealloc
{
    [_uid release];
    [_expires_in release];
    [_access_token release];
    [super dealloc];
}
-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.uid = [dic objectForKey:@"uid"];
        self.expires_in = [dic objectForKey:@"expires_in"];
        self.access_token = [dic objectForKey:@"access_token"];
        
    }
    return self;
}
@end
