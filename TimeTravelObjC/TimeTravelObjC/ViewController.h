//
//  ViewController.h
//  TimeTravelObjC
//
//  Created by Mitchell Phillips on 3/7/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    int count;
    NSTimer *timer;
    NSString *newStr;
}


@property (weak, nonatomic) IBOutlet UILabel *destinationTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *presentTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *lastTimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeUntilWarpLabel;

- (IBAction)setDateButton:(UIButton *)sender;

- (IBAction)warpButton:(UIButton *)sender;


-(void)updateUI;


@end

