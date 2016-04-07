//
//  EM+MessageBaseView.m
//  Changliao
//
//  Created by metthew on 15/7/3.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "EM+ChatBaseView.h"
#import "UIColor+Hex.h"

@implementation EM_ChatBaseView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexRGB:0xF8F8F8];;
    }
    return self;
}

@end