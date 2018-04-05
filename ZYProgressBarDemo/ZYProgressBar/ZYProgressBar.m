//
//  ZYProgressBar.m
//  WebProgressBar
//
//  Created by Young on 2018/4/6.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "ZYProgressBar.h"

@interface ZYProgressBar () {
    float _progressAcc;
}

@property (nonatomic, strong) NSTimer *progressTimer;

@end

@implementation ZYProgressBar

- (void)start {
    if (!_progressTimer) {
        self.hidden = NO;
        _progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.01667 target:self selector:@selector(progressCallback) userInfo:nil repeats:YES];
    }
}

- (void)finish {
    _progressAcc = (1 - self.progress) / 25;
}

- (void)progressCallback {
    float progress = self.progress;
    if (_progressAcc > 0) {
        if (progress >= 1) {
            [_progressTimer invalidate];
            _progressTimer = nil;
            self.hidden = YES;
            _progressAcc = 0;
            self.progress = 0;
            return;
        }
        progress += _progressAcc;
        if (progress > 1) {
            progress = 1;
        }
    }
    else if (progress < 0.95) {
        if ((progress += (0.95 - progress) * 0.01) > 0.95)
            progress = 0.95;
    }
    self.progress = progress;
}

- (void)setScaleY:(CGFloat)scaleY {
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, scaleY);
    self.transform = transform;
}

@end
