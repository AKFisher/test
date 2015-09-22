//
//  Config.m
//  Demo
//
//  Created by tom on 15/9/7.
//  Copyright (c) 2015年 tom. All rights reserved.
//

#import "Config.h"

@implementation Config
+(void)load {
    
}
- (instancetype)init {
    if (self=[super init]) {
        NSLog(@".......");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test) name:@"Test" object:nil];
        
        
    }
    return  self ;
}
- (void) test {
    NSLog(@"test");
}

- (void)dealloc {
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Test" object:nil];
}
@end
