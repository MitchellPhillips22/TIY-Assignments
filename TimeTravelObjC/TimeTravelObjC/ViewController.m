//
//  ViewController.m
//  TimeTravelObjC
//
//  Created by Mitchell Phillips on 3/7/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

#import "ViewController.h"
#import "TimeSetViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
       [self dates];
}
-(void)dates {
    NSDate *presentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
    
    NSString *formattedDate = [formatter stringFromDate:presentDate];
    NSLog(@"presentTimeLabel%@", formattedDate);}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)updateUI {
    
    if (count > 0) {
        count-- ;
        NSString *warpCount = [NSString stringWithFormat:@"%d", count];
        self.timeUntilWarpLabel.text = warpCount;
    } else {
        [timer invalidate];
        timer = nil;
        self.timeUntilWarpLabel.text = @"WARP!!!";
        [self performSegueWithIdentifier: @"warpSegue" sender: self];
    }
    
}
- (IBAction)unwindSegue:(UIStoryboardSegue *)segue {
    
}
- (IBAction)setDateUnwind:(UIStoryboardSegue *)segue {
    if ([segue.identifier isEqualToString:@"getTheDateSegue"]) {
       TimeSetViewController *controller = (TimeSetViewController *) segue.sourceViewController;
        newStr = controller->destinationDate;
        self.destinationTimeLabel.text = newStr;
    };
    
}



- (IBAction)setDateButton:(UIButton *)sender {
    
    
}

- (IBAction)warpButton:(UIButton *)sender {
    
    count = 10;
    
    [NSTimer scheduledTimerWithTimeInterval:0.3
                                     target:self
                                   selector:@selector(updateUI)
                                   userInfo:nil
                                    repeats:NO];
    
}
@end
