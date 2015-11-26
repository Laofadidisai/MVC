//
//  ParserManager.m
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "ParserManager.h"

@implementation ParserManager
+(id)JsonParser:(NSData*)data
{
    //设置错误开始时为空
    NSError * error = nil;
    id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error)
    {
        NSLog(@"%@",error);
        return nil;
    }
    else
    {
        return jsonData;
    }
}
@end
