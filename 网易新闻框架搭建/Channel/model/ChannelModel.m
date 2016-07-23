//
//  ChannelModel.m
//  网易新闻框架搭建
//
//  Created by mac on 16/7/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel
//当外界调用model时会来到这个方法,把model转化为能够识别的信息
//把log添加进文件,把数组转化能够识别的字符串
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@",_tid,_tname];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //什么也不需要做,给没有声明的属性弄这个方法,它就会调用
}


+(instancetype)ChannelWithDict:(NSDictionary *)dict
{

    ChannelModel *model = [[ChannelModel alloc]init];
    
    //KVC实现字典转模型
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

+(NSArray *)channels
{
    //获取标签JSON路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    
    //通过路径获取JSON文件的二进制
    NSData *JSONData = [NSData dataWithContentsOfFile:path];
    
    //反序列化
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:nil];
    
    //dict = @{@"tList":@[@{},@{}]};
    
    //取出tList相对应的数组
    NSArray *arr = [dict objectForKey:@"tList"];
    
    //定义可变数组用来接收模型数据
    NSMutableArray *arrM = [NSMutableArray array];
    
    //遍历数组,取出字典转模型
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //获取model
        ChannelModel *model = [ChannelModel ChannelWithDict:obj];
        
        //把模型添加到可变数组
        [arrM addObject:model];
        
    }];
    
    //排序
    [arrM sortUsingComparator:^NSComparisonResult(ChannelModel * obj1, ChannelModel * obj2) {
        return [obj1.tid compare:obj2.tid];
    }];
    return arrM.copy;

}
@end
