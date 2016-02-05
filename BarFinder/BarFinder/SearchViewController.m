//
//  SearchViewController.m
//  BarFinder
//
//  Created by Kaloian on 2/5/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputToCheckLabel;
@property (weak, nonatomic) IBOutlet UILabel *searchForInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *searchByInfoLabel;
- (IBAction)searchByNameTapped:(id)sender;
- (IBAction)searchByAddressTapped:(id)sender;

@property (strong, nonatomic) NSString* stringToCheck;
@property (strong, nonatomic) NSString* propertyToCheck;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Търсене";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString: @"searchToListSegue"]) {
        SearchTableViewController* searchTableViewController = [segue destinationViewController];
        searchTableViewController.wordToCheck = self.stringToCheck;
        searchTableViewController.propertyToCheck = self.propertyToCheck;
    }
}


- (IBAction)searchByNameTapped:(id)sender {

    [self setCommonInfoValues];
    self.propertyToCheck = @"name";
    self.searchByInfoLabel.text = @"име";
}

- (IBAction)searchByAddressTapped:(id)sender {
    [self setCommonInfoValues];
    self.propertyToCheck = @"address";
    self.searchByInfoLabel.text = @"адрес";
}

- (void) setCommonInfoValues {
        self.stringToCheck = self.inputToCheckLabel.text;
        self.searchForInfoLabel.text = self.stringToCheck;
}
@end
