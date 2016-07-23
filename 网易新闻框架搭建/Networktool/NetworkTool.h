//
//  NetworkTool.h
//  网易新闻框架搭建
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetworkTool : AFHTTPSessionManager
+(instancetype)sharedNetworkTool;

@end
