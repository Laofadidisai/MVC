//
//  OneViewController.h
//  MVCsina
//
//  Created by 老李 on 15-11-24.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWebView.h"
#import "SinaModel.h"
#import "ParserManager.h"
#import "Access_token.h"

@interface OneViewController : UIViewController<SinaWebViewDelegate,SinaModelDelegate>
{
    SinaModel * requestModel;
    NSMutableArray * totalArr;
}
@end
