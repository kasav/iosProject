//
//  ReservationViewController.h
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Bar.h"
#import "Reservation.h"

@interface ReservationViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *barNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *reservePeopleInput;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *showDateLabel;
- (IBAction)datePickedButton:(id)sender;
- (IBAction)reseveConfirmTapped:(id)sender;

@property (strong, nonatomic) Bar* reserveBar;

@end
