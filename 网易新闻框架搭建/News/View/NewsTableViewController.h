//
//  NewsTableViewController.h
//  网易新闻框架搭建
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewController : UITableViewController
//接收HomeCollectionView传递过来的数据
@property (nonatomic, copy) NSString *urlstr;
@end
