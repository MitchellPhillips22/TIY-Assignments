//
//  TimeSetViewController.m
//  TimeTravelObjC
//
//  Created by Mitchell Phillips on 3/7/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

#import "TimeSetViewController.h"

@interface TimeSetViewController ()

@end

@implementation TimeSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)datePickerAction:(UIDatePicker *)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    
    NSString *dateString = [formatter stringFromDate:self.datePicker.date];
    destinationDate = dateString;
    NSLog(@"%@",destinationDate);
}
@end
