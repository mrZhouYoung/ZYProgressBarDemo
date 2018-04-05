//
//  ViewController.m
//  WebProgressBar
//
//  Created by Young on 2018/4/5.
//  Copyright © 2018年 Young. All rights reserved.
//

#import "ViewController.h"
#import "ZYProgressBar.h"

@interface ViewController ()

@property (nonatomic, strong) ZYProgressBar *progressBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _progressBar = [[ZYProgressBar alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    _progressBar.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 20);
    _progressBar.tintColor = [UIColor blueColor];
    _progressBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:_progressBar];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_progressBar start];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_progressBar finish];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
