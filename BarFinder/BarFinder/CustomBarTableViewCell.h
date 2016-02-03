//
//  CustomBarTableViewCell.h
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomBarTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end
