//
//  IWTitleButton.m
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "TalkButton.h"

#define ButtonImageW 20

@implementation TalkButton

+ (instancetype)titleButton
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        self.imageView.clipsToBounds = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter ;
        // 背景
//        [self setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = ButtonImageW;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width - ButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    // 根据title计算自己的宽度
//    CGFloat titleW = [title sizeWithFont:self.titleLabel.font].width;
    CGFloat titleW=100 ;
    CGRect frame = self.frame;
    frame.size.width = titleW + ButtonImageW + 5;
    self.frame = frame;
    
    [super setTitle:title forState:state];
}

@end
