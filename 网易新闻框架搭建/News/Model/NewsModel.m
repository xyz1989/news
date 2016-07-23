//
//  NewsModel.m
//  网易新闻框架搭建
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NewsModel.h"
#import "NetworkTool.h"

@implementation NewsModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
+(instancetype)NewsModelWithDict:(NSDictionary *)dict
{
    NewsModel *model = [[NewsModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

+(void)downloadWithUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *))successBlock failureBlock:(void (^)(NSError *))failureBlock
{

    NSLog(@"NewsModel %@",urlstr);
    [[NetworkTool sharedNetworkTool]GET:urlstr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
       // NSLog(@"%@",responseObject);
        NSDictionary *dict = responseObject;
        NSString *key = dict.keyEnumerator.nextObject;
        
        NSArray *arr = [dict objectForKey:key];
        //可变数组
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        //遍历arr
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
        {
            NewsModel *model = [self NewsModelWithDict:obj];
            
            [arrM addObject:model];
        }];
        if (successBlock) {
            successBlock(arrM.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
        }
        
    }];

}
@end
