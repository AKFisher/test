//
//  FloatView.h
//  Demo
//
//  Created by tom on 15/9/6.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FloatView ;

@protocol FloatViewDelegate <NSObject>
- floatView:(FloatView *) view replyClick:(UIButton *) btn ;

- floatView:(FloatView *) view reportClick:(UIButton *) btn ;

@end

@interface FloatView : UIView

@property(nonatomic,weak)  id<FloatViewDelegate >  delegate  ;


@end
