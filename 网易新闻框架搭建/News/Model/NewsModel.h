//
//  NewsModel.h
//  网易新闻框架搭建
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
//新闻标题
@property (nonatomic, copy) NSString *title;
//新闻图标
@property (nonatomic, copy) NSString *imgsrc;
//新闻来源
@property (nonatomic, copy) NSString *source;
//新闻回复数
@property (nonatomic, strong) NSNumber *replyCount;
//多张图
@property (nonatomic, strong) NSArray *imgextra;
//大图标记
@property (nonatomic, assign) BOOL imgType;
//网络请求的方法
+(void)downloadWithUrlstr:(NSString *)urlstr successBlock:(void(^)(NSArray *arr))successBlock failureBlock:(void(^)(NSError *error))failureBlock;
@end
