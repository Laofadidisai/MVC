//
//  OneViewController.m
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "OneViewController.h"
#import "HomeStatuses.h"
#import "UserTableView.h"

#define ALERT_VIEW(title,mess)  UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:title message:mess delegate:nil cancelButtonTitle:@"好" otherButtonTitles:@"取消", nil];[alertView show];[alertView release];

@interface OneViewController ()

@end

@implementation OneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    [requestModel release];
    [totalArr release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    totalArr = [[NSMutableArray alloc]init];
    
    requestModel = [[SinaModel alloc]init];
    requestModel.delegate = self;
    //由 idAccessTokenExit 和 isAccseeTokenNotOverdate 判断数据是否存在
    if ([SinaModel idAccessTokenExit]&&[SinaModel isAccseeTokenNotOverdate])
    {
        NSLog(@"AccessToken存在");
        //单例类获取数据
        NSString * access_token = [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"];
        
        [requestModel getUserNewMassageRequest:access_token];
    }
    else
    {
        //网页视图
        SinaWebView * sinaWebView = [[SinaWebView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:sinaWebView];
        sinaWebView.delegate = self;//代理
        //调用sendCodeRequest的请求
        NSURLRequest * request = [SinaModel sendCodeRequest];
        [sinaWebView getCodeRequest:request];
        [sinaWebView release];
        
        NSLog(@"AccessToken不存在");
    }
}
#pragma mark —— SinaWebViewDelegate
//获得code字段后成功返回的方法
-(void)didGetCodeSuccess:(SinaWebView *)sinaWebView WithCode:(NSString *)acode
{
    NSLog(@"----->>>>%@",acode);
    //使用code值去请求access_token
    [requestModel sendAccess_tokenRequest:acode];
    
}
#pragma mark —— SinaModelDelegate
//获得Access_token成功
-(void)didGetAccess_tokenDataSuccess:(SinaModel *)request WithAccess_tokenData:(NSData *)data
{
     NSLog(@"111111");
    //获取json的数据字典 进行解析
    NSDictionary* dic = [ParserManager JsonParser:data];
    //获得Access_token的模型
    Access_token * access_token = [[Access_token alloc]initWithDic:dic];
    //单例类添加数据
    [[NSUserDefaults standardUserDefaults]setObject:access_token.access_token forKey:@"access_token"];
    //获取时间
    NSDate * access_tokenDate = [NSDate dateWithTimeIntervalSinceNow:[access_token.expires_in doubleValue]];
    //单例类添加数据
    [[NSUserDefaults standardUserDefaults]setObject:access_tokenDate forKey:@"access_tokenDate"];
    //单例类同步数据
    [[NSUserDefaults standardUserDefaults]synchronize];
    [requestModel getUserNewMassageRequest:access_token.access_token];
    
    ASIHTTPRequest * arequest = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/2/statuses/public_timeline.json?access_token=%@",access_token.access_token]]];
    arequest.delegate = self;
    [arequest setDidFinishSelector:@selector(weiboData:)];
    
    [arequest startAsynchronous];

    [access_token release];
    
    
    
}

-(void)weiboData:(ASIHTTPRequest*)request
{
    NSLog(@"%@",request.responseString);
//    [responseArray addObject:request.responseData];
//    NSArray * home_timelineStr = [[NSJSONSerialization JSONObjectWithData:[responseArray objectAtIndex:0] options:NSJSONReadingMutableContainers error:nil]objectForKey:@"statuses"];
//    
//    for () {
//        <#statements#>
//    }
    
}

//获得Access_token失败
-(void)didGetAccess_tokenDataFiles:(SinaModel *)request WithAccess_tokenDataFile:(NSError *)error
{
    NSLog(@"====????%@",error);
    //NSString * str = NSStringFromClass(error);
    ALERT_VIEW(@"请求错误", @"请返回");
    
}
//返回数据
-(void)didGetUserNewMassageRequestSuccess:(SinaModel *)request WithData:(NSData *)data
{
    NSDictionary * dic = [ParserManager JsonParser:data];
    NSArray * statuesArr = [dic objectForKey:@"statuses"];
    for (NSDictionary * massageDic in statuesArr)
    {
        HomeStatuses * model = [[HomeStatuses alloc]initWithDic:massageDic];
        [totalArr addObject:model];
        [model release];
    }
    UserTableView * tableView = [[UserTableView alloc]initWithFrame:self.view.bounds WithUserMassgeArr:totalArr];
    [self.view addSubview:tableView];
    [tableView release];
    
}

-(void)didGetUserNewMassageRequestFail:(SinaModel *)request WithError:(NSError *)error
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
