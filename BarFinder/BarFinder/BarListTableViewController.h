//
//  BarListTableViewController.h
//  BarFinder
//
//  Created by Kaloian on 2/1/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bar.h"

@interface BarListTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray* bars;

-(void) fillWithSampleBars;

@end
