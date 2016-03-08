//
//  TimeSetViewController.h
//  TimeTravelObjC
//
//  Created by Mitchell Phillips on 3/7/16.
//  Copyright © 2016 Wasted Potential LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeSetViewController : UIViewController {
    
@public NSString *destinationDate;
    
}

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;



- (IBAction)datePickerAction:(UIDatePicker *)sender;


@end
