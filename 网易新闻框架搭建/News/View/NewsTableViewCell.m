//
//  NewsTableViewCell.m
//  网易新闻框架搭建
//
//  Created by mac on 16/7/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface NewsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLab;
@property (weak, nonatomic) IBOutlet UILabel *sourceLab;
@property (weak, nonatomic) IBOutlet UILabel *replyLab;

@end
@implementation NewsTableViewCell


-(void)setModel:(NewsModel *)model
{

    _model = model;
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.TitleLab.text = model.title;
    self.sourceLab.text = model.source;
    self.replyLab.text = [NSString stringWithFormat:@"%@",model.replyCount];


}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
