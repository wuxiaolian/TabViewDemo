//
//  UIColor+JHAddition.m
//  Ganjiuhui
//
//  Created by 罗毅 on 16/5/20.
//  Copyright © 2016年 blueteam. All rights reserved.
//

#import "UIColor+JHAddition.h"

@implementation UIColor (JHAddition)

+ (UIColor *)setColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

+ (UIColor *)ColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha {
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}
@end
