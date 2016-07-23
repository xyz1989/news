//
//  NewsTableViewCell.h
//  网易新闻框架搭建
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsTableViewCell : UITableViewCell
@property (nonatomic, strong) NewsModel *model;
@end
