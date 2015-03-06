//
//  DropDownTableViewCell.m
//  MyDropListViewDemo
//
//  Created by stevenlfg on 15/3/5.
//  Copyright (c) 2015年 stevenlfg. All rights reserved.
//

#import "DropDownTableViewCell.h"
#import "UIColor+ColorCategory.h"
@implementation DropDownTableViewCell
@synthesize groupingBtn = _groupingBtn;
@synthesize groupingLb = _groupingLb;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"light_green_drop_down_button"];
        CGFloat top = 7; // 顶端盖高度
        CGFloat bottom = 7 ; // 底端盖高度
        CGFloat left = 10; // 左端盖宽度
        CGFloat right = 10; // 右端盖宽度
        UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
        // 伸缩后重新赋值
        image = [image resizableImageWithCapInsets:insets];
        
        
        _groupingBtn = [[UIButton alloc]init];
        
        
        _groupingLb = [[UILabel alloc]init];
        [_groupingLb setNumberOfLines:1];
        _groupingLb.textAlignment = NSTextAlignmentLeft;
        _groupingLb.backgroundColor = [UIColor clearColor];
        _groupingLb.textColor = [UIColor colorWithHexString:@"#888888"];
        _groupingLb.font = [UIFont boldSystemFontOfSize:15];
        _groupingLb.text = @"全部好友";
        [_groupingLb sizeToFit];
        
        _groupingLb.frame = CGRectMake(5, 6, _groupingLb.frame.size.width, 18);
        [_groupingBtn addSubview:_groupingLb];
        
        _groupingBtn.frame = CGRectMake(14, 0, _groupingLb.frame.size.width+20, 30);
        [_groupingBtn setBackgroundImage:image forState:UIControlStateSelected];
        _groupingBtn.userInteractionEnabled = NO;
        _groupingBtn.backgroundColor = [UIColor clearColor];
        [self addSubview:_groupingBtn];
        

        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
