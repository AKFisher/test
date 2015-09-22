//
//  FloatView.m
//  Demo
//
//  Created by tom on 15/9/6.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "FloatView.h"
#define Random (arc4random_uniform(255)+1)/255.0

@interface FloatView  ()
@property(nonatomic,strong) UIButton   *reply ;
@property(nonatomic,strong) UIButton   *report ;

///展开菜单的view
@property(nonatomic,strong) UIImageView *bannerMenuV;
@property(nonatomic,strong) UIImageView *bgView;
@property(nonatomic,strong) UIButton *logoV ;
   ///是否在展开了菜单，展开时不允许移动浮标
@property(nonatomic,assign) BOOL bShowMenu;
    ///是否在移动浮标
@property(nonatomic,assign) BOOL bMoving;

@end

@implementation FloatView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self=[super initWithFrame:frame]) {
        
        _bShowMenu=NO;
        _bMoving=NO;
        self.bgView=[[UIImageView alloc] init];
        self.bgView.hidden=YES ;
        self.bgView.clipsToBounds=YES ;

        [self addSubview:self.bgView];
        
        self.bannerMenuV=[[UIImageView alloc] init];
        UIImage *img= [UIImage imageNamed:@"lable_kantie_bg"];
         img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height/2, img.size.width/2, img.size.height/2, img.size.width/2)];
        self.bannerMenuV.image=img ;
        
        [self.bgView addSubview:self.bannerMenuV ];
        
        UIButton *report=[UIButton buttonWithType:UIButtonTypeCustom];
        [report setTitle:@"举报" forState:UIControlStateNormal];
       
        [report addTarget:self action:@selector(reportClick:) forControlEvents:UIControlEventTouchUpInside];
        self.report=report;
        UIButton *reply=[UIButton buttonWithType:UIButtonTypeCustom];
        [reply setTitle:@"回复" forState:UIControlStateNormal];
        [reply addTarget:self action:@selector(replyClick:) forControlEvents:UIControlEventTouchUpInside];
        self.reply = reply ;
        [self.bannerMenuV addSubview:report];
        [self.bannerMenuV addSubview:reply];
        
        
        UIButton *logoV=[UIButton buttonWithType:UIButtonTypeCustom];
        [logoV setImage:[UIImage imageNamed:@"icon_more_friend_n"] forState:UIControlStateNormal];
        [logoV  setImage: [UIImage imageNamed:@"icon_more_friend_s"] forState:UIControlStateHighlighted];
        [logoV addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
        self.logoV=logoV ;
        [self addSubview:logoV ];
        

    }
    return  self ;
}

-(void)layoutSubviews {
    [super layoutSubviews] ;

    self.bgView.frame=CGRectMake(0, 0, 80, 30);
    self.bannerMenuV.frame=CGRectMake(80, 0, 80, 30);
    self.reply.frame=CGRectMake(0, 0, 40, 30);
    self.report.frame=CGRectMake(40, 0, 40, 30);
    self.logoV.frame=CGRectMake(80, 0, 40, 30);

}
- (void)showMenu:(UIButton *)btn{
    if (!_bShowMenu) {
        _bgView.hidden=NO;
        
        [UIView animateWithDuration:0.6 animations:^{
             self.bannerMenuV.transform=CGAffineTransformMakeTranslation(-80, 0);
        } completion:^(BOOL finished) {
            _bShowMenu=!_bShowMenu;
        }];
    }else {
        [UIView animateWithDuration:0.6 animations:^{
            self.bannerMenuV.transform=CGAffineTransformIdentity ;
        } completion:^(BOOL finished) {
            _bShowMenu=!_bShowMenu;
        }];
    }

}
- (void) reportClick :(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(floatView:reportClick:)]) {
        [self.delegate floatView:self reportClick:btn];
    }
    
}
- (void) replyClick:(UIButton *) btn  {
    if ([self.delegate respondsToSelector:@selector(floatView:replyClick:)]) {
        [self.delegate floatView:self replyClick:btn ];
    }
    
}
@end
