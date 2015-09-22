
    //
//  MyImage.m
//  Demo
//
//  Created by tom on 15/9/2.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "MyImageView.h"
#define Random (arc4random_uniform(255)+1)/255.0
    //展开菜单view的标记
#define MENUBGTAG 1
    //点击后扩大的大小
#define SCALESIZE 5
@interface MyImageView  ()
///展开菜单的view
@property(nonatomic,strong) UIView *bannerMenuV;
@property(nonatomic,strong) UIView *bgView;
@property(nonatomic,strong) UIImageView * logoV ;

@property(nonatomic,strong) UIButton  *report ;
@property(nonatomic,strong) UIButton  *save ;
@property(nonatomic,assign)  BOOL bShowMenu  ;
@property(nonatomic,assign)  BOOL bMoving  ;

@property(nonatomic,assign)  CGFloat nlogoWidth ;
@property(nonatomic,assign)  CGFloat nLogoHeight ;
@property(nonatomic,assign)  CGFloat nMenuWidth ;

@end

@implementation MyImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self setupView ];
        self.bShowMenu=NO;
    }
    return self;
}
- (void) setupView {
    self.nlogoWidth = self.frame.size.width;
    self.nLogoHeight=self.frame.size.height;
    self.nMenuWidth=100;
    UIImageView *bgView=[[UIImageView alloc] init];
    bgView.clipsToBounds=YES ;
    bgView.hidden=YES;
    bgView.userInteractionEnabled=YES;
    bgView.frame=CGRectMake(self.nlogoWidth, 0, 0, 0 );
    bgView.backgroundColor=[UIColor whiteColor];
    [self addSubview:bgView] ;
    
    UIImageView *bannerMenuV=[[UIImageView alloc] init ];
    self.bannerMenuV=bannerMenuV ;
    bannerMenuV.tag=MENUBGTAG;
    bannerMenuV.userInteractionEnabled=YES;
    bannerMenuV.frame=CGRectMake(0, 0, self.nMenuWidth, self.nLogoHeight);
    [bgView addSubview:bannerMenuV];
    
   UIButton *report=[UIButton buttonWithType:UIButtonTypeCustom];
   [report setTitle:@"举报" forState:UIControlStateNormal];
    report.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];
    self.report=report;
    UIButton *save=[UIButton buttonWithType:UIButtonTypeCustom];
    [save setTitle:@"收藏" forState:UIControlStateNormal];
    save.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];;
    self.save = save ;
    [bannerMenuV addSubview:report];
    [bannerMenuV addSubview:save];
    
    self.logoV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.nlogoWidth    , self.nLogoHeight)];
     self.logoV.image=[UIImage imageNamed:@"icon_more_friend_s"];
    [self addSubview:self.logoV];
    
    self.userInteractionEnabled=YES ;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    [self addGestureRecognizer:tap];
}
- (void) tapImageView:(UIGestureRecognizer *)recognizer {
    
    NSLog(@"Method=%s,Line=%d,log:%@",__FUNCTION__ ,__LINE__, @"<##>");

    if (!self.bShowMenu) {// 未显示
       [self.logoV setFrame:CGRectMake(self.logoV.frame.origin.x, self.logoV.frame.origin.y, self.logoV.frame.size.width - SCALESIZE, self.logoV.frame.size.height - SCALESIZE)];
    }
    
    if (!_bMoving){
        self.bShowMenu=!self.bShowMenu;
        [self showMenu:_bShowMenu time:0.3  ];
    }
}

- (void) showMenu:(BOOL ) bShowMenu time :(float) time {
    
    self.userInteractionEnabled=NO;
    if (bShowMenu) {
        _bgView.hidden=NO;
        UIImage *img = [UIImage imageNamed:@"lable_kantie_bg"];
        
        [((UIImageView *)[_bgView viewWithTag:MENUBGTAG]) setImage:[img resizableImageWithCapInsets:UIEdgeInsetsMake(img.size.height/2, img.size.width/2, img.size.height/2, img.size.width/2)]];
        [self setFrame:CGRectMake(self.frame.origin.x - self.nMenuWidth, self.frame.origin.y, _nMenuWidth + self.nlogoWidth, self.nLogoHeight)];
        
        [_logoV setFrame:CGRectMake(_nMenuWidth, 0, _nlogoWidth, _nLogoHeight)];
        
        [_bgView setFrame:CGRectMake(_nMenuWidth, 0, 0, _nLogoHeight)];
        [UIView animateWithDuration:time animations:^{
            [_bgView setFrame:CGRectMake(0, 0, _nMenuWidth, _nLogoHeight)];
        } completion:^(BOOL finished){
             self.userInteractionEnabled = YES;
         }];
    }else {
        
        [UIView animateWithDuration:time animations:^{
            [_bgView setFrame:CGRectMake(_nMenuWidth, 0, 0, _nLogoHeight)];
        } completion:^(BOOL finished) {
            [self setFrame:CGRectMake(self.frame.origin.x + _nMenuWidth, self.frame.origin.y, _nlogoWidth, _nLogoHeight)];
            [_logoV setFrame:CGRectMake(0, 0, _nlogoWidth, _nLogoHeight)];
            [_bgView setHidden:YES];
            self.userInteractionEnabled = YES;

        }];
    }
    
}
@end
