//
//  SinaModel.h
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

@interface SinaModel : NSObject<ASIHTTPRequestDelegate>
//代理
@property(nonatomic,assign)id delegate;
+(NSURLRequest*)sendCodeRequest;

-(void)sendAccess_tokenRequest:(NSString*)codeStr;

+(BOOL)idAccessTokenExit;
+(BOOL)isAccseeTokenNotOverdate;

-(void)getUserNewMassageRequest:(NSString*)Str;
@end
//代理  SinaModelDelegate
@protocol SinaModelDelegate <NSObject>
//代理方法
-(void)didGetAccess_tokenDataSuccess:(SinaModel*)request WithAccess_tokenData:(NSData*)data;
-(void)didGetAccess_tokenDataFiles:(SinaModel*)request WithAccess_tokenDataFile:(NSError*)error;

-(void)didGetUserNewMassageRequestSuccess:(SinaModel*)request WithData:(NSData*)data;
-(void)didGetUserNewMassageRequestFail:(SinaModel*)request WithError:(NSError*)error;
@end