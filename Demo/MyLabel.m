//
//  MyLabel.m
//  Demo
//
//  Created by tom on 15/8/29.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "MyLabel.h"
#define Random (arc4random_uniform(255)+1)/255.0


@implementation MyLabel
- (instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.font=[UIFont systemFontOfSize:12];
        self.text=[self currentTime];

    }
    return  self ;
}
+(void)load{
    NSLog(@"0000");
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    NSLog(@"%s",__func__);
    self.text =[self currentTime];
    self.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];
    
    UIImage *image=[UIImage imageNamed:@"badge_bg"];
    UIImageView *img=[[UIImageView alloc] initWithImage:image];
    img.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    
//    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    NSString *text=@"1111111111111";
    
    
    [text drawInRect:CGRectMake(30, 0, 100, 20) withAttributes:nil];
    
}

- (NSString * ) currentTime{
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *current=[formatter stringFromDate:[NSDate date] ];
    
    int number = arc4random_uniform(5000)+3000 ;
    current =[NSString stringWithFormat:@"😄 %d",number] ;
    return  current;
}

@end
