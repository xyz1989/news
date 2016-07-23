//
//  NetworkTool.m
//  网易新闻框架搭建
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NetworkTool.h"

@implementation NetworkTool

static id _instancetype;
+(instancetype)sharedNetworkTool
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseurl = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        _instancetype = [[self alloc]initWithBaseURL:baseurl];
    });
    return _instancetype;
}
@end
