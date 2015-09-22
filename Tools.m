//
//  Tools.m
//  Demo
//
//  Created by tom on 15/9/16.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "Tools.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
@implementation Tools
+(void)setImageWithPath:(NSString *)path imageView:(UIImageView *)imageView{
    NSURL *url=[NSURL URLWithString:path];
    imageView.userInteractionEnabled=YES ;
    __block UIActivityIndicatorView *indicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicatorView startAnimating];
    [indicatorView hidesWhenStopped];
    indicatorView.center=CGPointMake(imageView.frame.size.width/2, imageView.frame.size.height/2);
    [imageView addSubview:indicatorView];
    [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"green"] options:SDWebImageLowPriority|SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

        if (error) {
            NSLog(@"请求失败");
        }else{
            [indicatorView removeFromSuperview];
            indicatorView=nil;
        }
        
        [[SDImageCache sharedImageCache] clearDisk];
    } ] ;

}

@end
