//
//  Access_token.h
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Access_token : NSObject
@property(nonatomic,copy)NSString * access_token;
@property(nonatomic,copy)NSString * expires_in;
@property(nonatomic,copy)NSString * uid;

-(id)initWithDic:(NSDictionary*)dic;

@end
