//
//  SinaWebView.h
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinaWebView : UIView<UIWebViewDelegate>
{
    UIWebView * sinaWebView;
}
@property(nonatomic,assign)id delegate;  //assign:防止循环引用
//code请求加载
-(void)getCodeRequest:(NSURLRequest*)request;

@end
//自定义协议方法
@protocol SinaWebViewDelegate <NSObject>
@optional
-(void)didGetCodeSuccess:(SinaWebView*)sinaWebView WithCode:(NSString*)code;

@end