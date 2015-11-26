//
//  UsersMassage.h
//  MVCsina
//
//  Created by 老李 on 15-11-26.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsersMassage : NSObject

@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * profile_image_url;
@property(nonatomic,copy)NSString * location;

-(id)initWithDic:(NSDictionary *)dic;

@end
