//
//  AppMacro.h
//  TabViewDemo
//
//  Created by Wuxiaolian on 2017/5/11.
//  Copyright © 2017年 Wu. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#define kMainDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kDocumentsPath          [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define kScreenWidth            CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight           CGRectGetHeight([UIScreen mainScreen].bounds)

#define isEmptyString(str) ((str == nil) || (str.length == 0) || [str isEqual:[NSNull null]]) ? YES: NO
#endif /* AppMacro_h */
