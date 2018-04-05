//
//  ZYProgressBar.h
//  WebProgressBar
//
//  Created by Young on 2018/4/6.
//  Copyright © 2018年 Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYProgressBar : UIProgressView

@property (nonatomic, copy) NSArray *colorArr;

- (void)start;

- (void)finish;

@end
