//
//  ViewController.m
//  ColorWheelObjC
//
//  Created by Mitchell Phillips on 3/16/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

#import "ViewController.h"
#import "ISColorWheel.h"

@interface ViewController () <ISColorWheelDelegate>
{
    ISColorWheel* _colorWheel;
    UISlider* _brightnessSlider;
    UIView* _wellView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGSize size = self.view.bounds.size;
    
    CGSize wheelSize = CGSizeMake(size.width * .9, size.width * .9);
    
    _colorWheel = [[ISColorWheel alloc] initWithFrame:CGRectMake(size.width / 2 - wheelSize.width / 2,
                                                                 size.height * .1,
                                                                 wheelSize.width,
                                                                 wheelSize.height)];
    _colorWheel.delegate = self;
    _colorWheel.continuous = true;
    [self.view addSubview:_colorWheel];
    
    _brightnessSlider = [[UISlider alloc] initWithFrame:CGRectMake(size.width * .4,
                                                                   size.height * .8,
                                                                   size.width * .5,
                                                                   size.height * .1)];
    _brightnessSlider.minimumValue = 0.0;
    _brightnessSlider.maximumValue = 1.0;
    _brightnessSlider.value = 1.0;
    _brightnessSlider.continuous = true;
    [_brightnessSlider addTarget:self action:@selector(changeBrightness:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_brightnessSlider];
    
    _wellView = [[UIView alloc] initWithFrame:CGRectMake(size.width * .1,
                                                         size.height * .8,
                                                         size.width * .2,
                                                         size.height * .1)];
    
    _wellView.layer.borderColor = [UIColor blackColor].CGColor;
    _wellView.layer.borderWidth = 2.0;
    [self.view addSubview:_wellView];
}



- (void)changeBrightness:(UISlider*)sender
{
    [_colorWheel setBrightness:_brightnessSlider.value];
    [_wellView setBackgroundColor:_colorWheel.currentColor];
}

- (void)colorWheelDidChangeColor:(ISColorWheel *)colorWheel
{
    [_wellView setBackgroundColor:_colorWheel.currentColor];
    
    UIColor *uicolor = [_colorWheel currentColor] ;
    
    CGColorRef color = [uicolor CGColor];
    
    int numComponents = CGColorGetNumberOfComponents(color);
    
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        CGFloat red = components[0];
        CGFloat green = components[1];
        CGFloat blue = components[2];
        
        
        NSLog(@"red: %.2f" ,red);
        
        NSLog(@"blue: %.2f" ,blue);
        
        NSLog(@"green: %.2f" ,green);
        
        
    }
    

}

// Do any additional setup after loading the view, typically from a nib.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
