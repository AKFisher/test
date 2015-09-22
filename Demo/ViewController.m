//
//  ViewController.m
//  Demo
//
//  Created by tom on 15/8/29.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "ViewController.h"
#import "MyLabel.h"
#import "UIImageView+WebCache.h"
#import "TalkButton.h"
#import "MyImageView.h"
#import <objc/runtime.h>
#import "ViewController2.h"
#import "FloatView.h"
#import "Tools.h"
#import "AFNetworking.h"
#define Random (arc4random_uniform(255)+1)/255.0



@interface ViewController ()
@property(nonatomic,strong) UILabel   *timeLabel ;
@property(nonatomic,strong)  MyImageView * advance;



@end

@implementation ViewController
- (IBAction)didEditingBegin:(id)sender {
    
}
- (IBAction)clickButton:(id)sender {
//    if (self.advance!=nil) {
//        [UIView animateWithDuration:.6 animations:^{
//            self.advance.transform=CGAffineTransformMakeTranslation(80, 0);
//        } completion:^(BOOL finished) {
//            [self.advance removeFromSuperview];
//            self.advance=nil;
//        }] ;
//    } else {
//       UIButton *btn=sender;
//        UIView *view =[[UIView alloc] init ];
//        view .clipsToBounds=YES ;
//        view.frame=CGRectMake(CGRectGetMinX(btn.frame)-80, CGRectGetMinY(btn.frame), 80, 30 );
//        [self.view addSubview:view ];
//       MyImageView *advance=[[MyImageView alloc] init];
//       advance.frame=CGRectMake(80, 0, 80, 30 );
//       self.advance=advance;
//        [view addSubview:advance];
//       [UIView animateWithDuration:.6 animations:^{
//        advance.frame=CGRectMake(0, 0, 80, 30 );
//      }];
//    
//    }
 
}

- (void)viewDidLoad {
    [super viewDidLoad];
     CGRect frame=CGRectMake(100, 30, 120, 30);
    FloatView *view =[[FloatView alloc] initWithFrame:frame];
    [self.view addSubview:view ];
    
    UIImageView *bundelImage=[[UIImageView alloc]init];
    bundelImage.frame=CGRectMake(100, 190, 120,  30);
    bundelImage.backgroundColor=[UIColor yellowColor];

    [self.view addSubview:bundelImage];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        ViewController2 *vc=[[ViewController2 alloc] init];
//        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
//        
//        [self presentViewController:nav animated:YES completion:nil];
//    });

    
    NSString *path=@"http://app.qingdaonews.com/shoujikehuduan/mdi_newslist202.php?type=ty&num=20&v=2.0";
    
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       NSLog(@"%ld", status);
    }];

    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mgr GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",html);
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败%@",error);
    }];
   
    
    UIImageView *imageView=[[UIImageView alloc] init];
    imageView.backgroundColor=[UIColor redColor];
    imageView.frame=CGRectMake(50, 300, 100, 100);
//    imageView.clipsToBounds=YES;
//    imageView.contentMode=UIViewContentModeTop;

//    NSURL *url=[NSURL URLWithString:@"http://i2.tietuku.com/5a633bed94031d48t.jpg"];
//    NSURL *url=[NSURL URLWithString:@"http://img4.duitang.com/uploads/blog/201407/12/20140712205726_redWt.thumb.700_0.gif"];
//    [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"green"] options:SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"complete");
//    } ];
    
    NSString *img=@"http://img4.duitang.com/uploads/blog/201407/12/20140712205726_redWt.thumb.700_0.gif";
    [Tools setImageWithPath:img imageView:imageView ];
    
    
    
    [self.view addSubview:imageView];
    
   
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 200, 100, 44);
    [btn setTitle:@"发送通知" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor colorWithRed:Random green:Random blue:Random alpha:1];
    [btn addTarget:self action:@selector(clickNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    NSString * htmlString = @"<html><body> Some html string \n <font size=\"13\" color=\"red\">This is some text!</font><img src=\"http://img.jiecao.fm/2014/12/1/55364158-13f2-4bc6-b519-8035548e4ce7.jpg?428_514\" alt=\"\" /> </body></html>";
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    UILabel * myLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    myLabel.attributedText = attrStr;
    myLabel.numberOfLines=0;
    [self.view addSubview:myLabel];

    
}
- (void) clickNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Test" object:nil];
}
/*
void swizzleMethod(Class clazz,SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod=class_getInstanceMethod(clazz, originalSelector);
    Method swizzledMethod=class_getInstanceMethod(clazz, swizzledSelector );

}
 */
@end
