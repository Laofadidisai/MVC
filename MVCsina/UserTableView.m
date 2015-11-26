//
//  UserTableView.m
//  MVCsina
//
//  Created by 老李 on 15-11-26.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "UserTableView.h"
#import "UserTableViewCell.h"
#import "HomeStatuses.h"
#import "UsersMassage.h"
#import "UIImageView+WebCache.h"

@implementation UserTableView

static NSString * cellid = @"cell";

-(void)dealloc
{
    [_userMassageArrry release];
    [super dealloc];
}
- (id)initWithFrame:(CGRect)frame WithUserMassgeArr:(NSMutableArray*)array
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _userMassageArrry = array;
        
        //设置表视图属性
        UITableView * userTableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        userTableView.delegate = self;
        userTableView.dataSource = self;
        userTableView.rowHeight = 170;
        //注册使用的xib文件
        [userTableView registerNib:[UINib nibWithNibName:@"UserTableViewCell" bundle:nil] forCellReuseIdentifier:cellid];
        
        [self addSubview:userTableView];
        [userTableView release];
        
    }
    return self;
}
# pragma mark 表的数据源结构
//表格行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _userMassageArrry.count;
    
}
//表格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建数据模型
    HomeStatuses * model = [_userMassageArrry objectAtIndex:indexPath.row];
    //自定义单元格
    UserTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    //设置单元格属性
    cell.massageTime.text = model.created_at;
    //cell.userSine.text = model.text;
    cell.userMassage.text = model.text;
    
    UsersMassage * userModel = model.modelArr[0];
    //同步下载图片
    //NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:userModel.profile_image_url]];
    //cell.userImage.image = [UIImage imageWithData:data];
    cell.userName.text = userModel.name;
    cell.userSine.text = userModel.location;
    //使用SDwebimage 下载图片
    //[cell.userImage sd_setImageWithURL:[NSURL URLWithString:userModel.profile_image_url]];
    
    //使用SDwebimage 下载图片 并可以使用占位符 第三方库的使用
    [cell.userImage sd_setImageWithURL:[NSURL URLWithString:userModel.profile_image_url] placeholderImage:[UIImage imageNamed:@"258.png"]];
    //让webview不能滑动
    cell.sourcesWebView.scrollView.scrollEnabled = NO;
    //加载网页
    [cell.sourcesWebView loadHTMLString:model.source baseURL:nil];
    
    return cell;
    
}
-(CGFloat)contentHeight:(NSString*)content
{
    //boundingRectWithSize：边界矩形的大小       “|”隔开 可以加载两个方式
    CGRect rect = [content boundingRectWithSize:CGSizeMake(300, 1000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil];
    //返回高度
    return rect.size.height;
}
//行高
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    HomeStatuses * model = [_userMassageArrry objectAtIndex:indexPath.row];
//    return [self contentHeight:model.text]+50+20+20;
//    return [self contentHeight:model.created_at]+90+20;
//    
//}
# pragma mark 表的代理协议  点击表格方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
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
