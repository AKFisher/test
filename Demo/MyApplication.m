//
//  MyApplication.m
//  Demo
//
//  Created by tom on 15/9/8.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "MyApplication.h"

@implementation MyApplication

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"MyApplication");
    }
    return  self ;
}
//- (void)sendEvent:(UIEvent *)event {
//    if (event.type==UIEventTypeTouches) {
//        NSLog(@"触摸事件");
//    }
//    if (event.type==UIEventTypeMotion) {
//        NSLog(@"滑动事件");
//    }
//    [super sendEvent:event];
//}



@end
