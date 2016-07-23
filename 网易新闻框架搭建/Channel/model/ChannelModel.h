//
//  ChannelModel.h
//  网易新闻框架搭建
//
//  Created by mac on 16/7/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

/*
 {
 "tList": [
 {
 "template": "manual",
 "topicid": "00040BGE",
 "hasCover": false,
 "alias": "The Truth",
 "subnum": "6.8万",
 "tag": "hot",
 "recommendOrder": 0,
 "isNew": 0,
 "img": "http://img2.cache.netease.com/m/newsapp/banner/zhenhua.png",
 "isHot": 1,
 "hasIcon": true,
 "cid": "C1348654575297",
 "recommend": "0",
 "headLine": false,
 "tagDate": "2015-06-16 10:45:34.0",
 "color": "",
 "bannerOrder": 105,
 "tname": "原创",
 "ename": "zhenhua",
 "showType": "comment",
 "special": 0,
 "tid": "T1370583240249"
 },
 
 
*/
#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

//频道标签名
@property (nonatomic, copy) NSString *tname;

//频道ID
@property (nonatomic, copy) NSString *tid;

//频道模型自己获取频道标签模型数据,返回模型数组
+(NSArray *)channels;
@end
