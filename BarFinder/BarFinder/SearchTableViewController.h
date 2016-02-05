//
//  SearchTableViewController.h
//  BarFinder
//
//  Created by Kaloian on 2/5/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Bar.h"
#import "CustomBarTableViewCell.h"
#import "BarDetailsViewController.h"

@interface SearchTableViewController : UITableViewController

@property (strong, nonatomic) NSString* wordToCheck;
@property (strong, nonatomic) NSString* propertyToCheck;

@end
