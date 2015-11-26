//
//  SinaModel.m
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "SinaModel.h"
#import "ASIFormDataRequest.h"

@implementation SinaModel

+(NSURLRequest*)sendCodeRequest
{
    //请求
    NSURL * url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=4026941155&redirect_uri=http://weibo.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    return request;
}
//不能用+方法 因为代理
-(void)sendAccess_tokenRequest:(NSString*)codeStr
{
    NSString * urlStr = @"https://api.weibo.com/oauth2/access_token";
    NSURL * url = [NSURL URLWithString:urlStr];
    //第三方库请求
    ASIFormDataRequest * request = [ASIFormDataRequest requestWithURL:url];
    //设置post请求的值
    [request setPostValue:@"4026941155" forKey:@"client_id"];
    //应用安全码
    [request setPostValue:@"99eed877392104f1c014b81c8f753c9d" forKey:@"client_secret"];
    [request setPostValue:@"authorization_code" forKey:@"grant_type"];
    [request setPostValue:codeStr forKey:@"code"];
    [request setPostValue:@"http://weibo.com" forKey:@"redirect_uri"];
    
    request.delegate = self;//  代理方法不能是+方法
    //自定义代理方法
    [request setDidFinishSelector:@selector(didGetAccess_tokenSuccess:)];
    [request setDidFailSelector:@selector(didGetAccess_TokenFile:)];
    //异步请求
    [request startAsynchronous];
}
//获得access_token成功回调时调用的方法
-(void)didGetAccess_tokenSuccess:(ASIHTTPRequest*)request
{
    //选择器调用自定义协议方法
    if ([_delegate respondsToSelector:@selector(didGetAccess_tokenDataSuccess:WithAccess_tokenData:)])
    {
        [_delegate didGetAccess_tokenDataSuccess:self WithAccess_tokenData:request.responseData];
    }
    
}
//获得access_token失败回调时调用的方法
-(void)didGetAccess_TokenFile:(ASIHTTPRequest*)request
{
    //选择器调用自定义协议方法
    if ([_delegate respondsToSelector:@selector(didGetAccess_tokenDataFiles:WithAccess_tokenDataFile:)])
    {
        [_delegate didGetAccess_tokenDataFiles:self WithAccess_tokenDataFile:request.error];
    }
    
}
//以下同上
//发送get请求
-(void)getUserNewMassageRequest:(NSString*)Str
{
    NSString * urlStr =[NSString stringWithFormat: @"https://api.weibo.com/2/statuses/public_timeline.json?access_token=%@",Str];
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlStr]];
    request.delegate = self;
    
    [request setDidFinishSelector:@selector(getUserNewMassageRequestSuccess:)];
    [request setDidFailSelector:@selector(getUserNewMassageRequestFail:)];
    [request startAsynchronous];
}
//发送get请求成功
-(void)getUserNewMassageRequestSuccess:(ASIHTTPRequest*)request
{
    if ([_delegate respondsToSelector:@selector(didGetUserNewMassageRequestSuccess:WithData:)])
    {
        [_delegate didGetUserNewMassageRequestSuccess:self WithData:request.responseData];
    }
    
}
//发送get请求失败
-(void)getUserNewMassageRequestFail:(ASIHTTPRequest*)request
{
    if ([_delegate respondsToSelector:@selector(didGetUserNewMassageRequestFail:WithError:)])
    {
        [_delegate didGetUserNewMassageRequestFail:self WithError:request.error];

    }
    
}
//判断图片有没有存到本地
+(BOOL)idAccessTokenExit
{
    NSString * accessStr = [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
    if (accessStr) {
        return YES;
    }
    else
    {
        return NO;
    }
}
//判断时间
+(BOOL)isAccseeTokenNotOverdate
{
    NSDate * OverDate = [[NSUserDefaults standardUserDefaults]objectForKey:@"access_tokenDate"];
    if (OverDate) {
        NSDate * newDate = [NSDate date];
        NSTimeInterval timeInterval = [newDate timeIntervalSinceDate:OverDate];
        if (timeInterval < 0)
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return NO;
    }
    
}


@end
