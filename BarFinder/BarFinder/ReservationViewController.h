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

@property (strong, nonatomic) Bar* reserveBar;

@end
