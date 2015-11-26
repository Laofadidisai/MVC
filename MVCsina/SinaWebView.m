//
//  SinaWebView.m
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "SinaWebView.h"
#import "SinaModel.h"

@implementation SinaWebView

-(void)dealloc
{
    [sinaWebView release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //初始化
        sinaWebView = [[UIWebView alloc]initWithFrame:self.bounds];
        //设置代理
        sinaWebView.delegate = self;
        
        [self addSubview:sinaWebView];
        
    }
    return self;
}
//负责code请求加载
-(void)getCodeRequest:(NSURLRequest*)request
{
    [sinaWebView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"加载开始");
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"加载完成");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"视图已加载");
    //根据range的范围判断是否存在字符串
    if ([request.URL.absoluteString rangeOfString:@"code="].location != NSNotFound)
    {
        //componentsSeparatedByString:字符串组
        NSArray * tempArr = [request.URL.absoluteString componentsSeparatedByString:@"code="];
        //最后一个
        NSString * codeStr = [tempArr lastObject];
        //代理  判断代理方法是否存在
        if ([_delegate respondsToSelector:@selector(didGetCodeSuccess:WithCode:)])
        {
            [_delegate didGetCodeSuccess:self WithCode:codeStr];
        }
    }
    
    
    return YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"加载失败%@",error);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
