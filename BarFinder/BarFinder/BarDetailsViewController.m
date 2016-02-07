//
//  BarDetailsViewController.m
//  BarFinder
//
//  Created by Kaloian on 2/1/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "BarDetailsViewController.h"
#import "ReservationViewController.h"
#import "FoodTableViewController.h"

@interface BarDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
- (IBAction)phoneButtonTapped:(id)sender;

@end

@implementation BarDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Детайли";
    
    self.nameLabel.text = self.bar.name;
    self.addressLabel.text = self.bar.address;
    self.phoneLabel.text = self.bar.phone;
    self.descriptionLabel.text = self.bar.textDescription;
    
    UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: self.bar.imageUrl]]];
    if (image == nil) {
        image = [UIImage imageNamed:@"defaultPictureBar"];
    }

    self.pictureView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString: @"goToReserveSegue"]) {
        ReservationViewController* reservationViewController = [segue destinationViewController];
        reservationViewController.reserveBar = self.bar;
    }
    if ([segue.identifier isEqualToString: @"detailsToFoodSegue"]) {
        FoodTableViewController* foodTableViewController = [segue destinationViewController];
        foodTableViewController.option = @"Foods";
    }
    if ([segue.identifier isEqualToString: @"detailsToDrinksSegue"]) {
        FoodTableViewController* foodTableViewController = [segue destinationViewController];
        foodTableViewController.option = @"Drinks";
    }
}


- (IBAction)phoneButtonTapped:(id)sender {
    NSString *phoneNumber = [@"tel://" stringByAppendingString:self.bar.phone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}
@end
