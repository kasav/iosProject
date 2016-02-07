//
//  BarListTableViewController.m
//  BarFinder
//
//  Created by Kaloian on 2/1/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "BarListTableViewController.h"
#import "Bar.h"
#import "AppDelegate.h"
#import "CustomBarTableViewCell.h"
#import "BarDetailsViewController.h"


@interface BarListTableViewController ()

@property (strong, nonatomic) NSMutableArray* bars;

@end

@implementation BarListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Заведения";
    
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    self.bars = [delegate.data bars];
 
    if (self.wordToCheck) {
        NSString* filter = @"%K CONTAINS[c] %@";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:filter, self.propertyToCheck, self.wordToCheck];
        NSArray *remainingBars = [self.bars filteredArrayUsingPredicate:predicate];
        self.bars = [[NSMutableArray alloc] initWithArray:remainingBars];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellIdentifier = @"BarCell";
    
    CustomBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
    if (cell == nil) {
        NSArray* topCells = [[NSBundle mainBundle] loadNibNamed:@"CustomBarTableViewCell" owner:self options:nil];
        cell = [topCells objectAtIndex:0];
    }
    
    Bar* bar = [self.bars objectAtIndex: indexPath.row];
    
    cell.nameLabel.text = bar.name;
    cell.addressLabel.text = bar.address;
    cell.phoneLabel.text = bar.phone;
    
    UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: bar.imageUrl]]];
    if (image == nil) {
        image = [UIImage imageNamed:@"defaultPictureBar"];
    }
    
    cell.imageViewLabel.image = image;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Bar* selectedBar = [self.bars objectAtIndex:indexPath.row];
        
    NSString* storyboardId = @"detailsScene";
    BarDetailsViewController* barsViewController = [self.storyboard instantiateViewControllerWithIdentifier:storyboardId];
    barsViewController.bar = selectedBar;
    
    
    [self.navigationController pushViewController:barsViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


@end
