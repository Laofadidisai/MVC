//
//  ParserManager.h
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserManager : NSObject
//json解析
+(id)JsonParser:(NSData*)data;
@end
