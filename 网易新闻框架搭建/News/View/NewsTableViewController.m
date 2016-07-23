//
//  NewsTableViewController.m
//  网易新闻框架搭建
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)setUrlstr:(NSString *)urlstr
{
    NSLog(@"%@",urlstr);
    
    [NewsModel downloadWithUrlstr:urlstr successBlock:^(NSArray *arr) {
                NSLog(@"arr %@",arr);
        //给dataArr赋值
        self.dataArr = arr;
        [self.tableView reloadData];

    } failureBlock:^(NSError *error) {
        NSLog(@"error %@",error);
    }];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     NewsModel *model = self.dataArr[indexPath.row];
    //判断是否是大图
    NSString *Identifier;
    if (model.imgType) {
        Identifier = @"bigCell";
    }else
    {
        Identifier = @"BaseCell";
    }

    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
   
    
    cell.model = model;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *model = self.dataArr[indexPath.row];
    
    if (model.imgType) {
        return 180;
    }else
    {
        return 80;
    }
    
}

@end
