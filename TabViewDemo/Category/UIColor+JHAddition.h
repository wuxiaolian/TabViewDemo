//
//  UIColor+JHAddition.h
//  Ganjiuhui
//
//  Created by 罗毅 on 16/5/20.
//  Copyright © 2016年 blueteam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JHAddition)

/**
 *  直接传rgb数值，不用除以255
 */
+ (UIColor *)setColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha;

+ (UIColor *)ColorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha;

@end
