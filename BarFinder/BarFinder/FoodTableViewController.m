//
//  FoodTableViewController.m
//  BarFinder
//
//  Created by Kaloian on 2/6/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "FoodTableViewController.h"
#import "ProductTableViewCell.h"
#import <Parse/Parse.h>
#import "Product.h"
#import "CustomProductTableViewCell.h"

@interface FoodTableViewController ()

@property (strong, nonatomic) NSMutableArray* products;

@end

@implementation FoodTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.products = [[NSMutableArray alloc]init];
    PFQuery* query = [PFQuery queryWithClassName: self.option];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (!error) {
            
            for (PFObject* product in objects){
                
                NSString * name = [product objectForKey:@"name"];
                CGFloat price = [[product objectForKey:@"price"] floatValue];
                
                if ([self stringLengthIsValid:name]) {
                    id item = [[Product alloc] initWithName:name andPrice:price];
                    [self.products addObject:item];
                }
            }
            [self.tableView reloadData];
        }
        
    }];

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
    return self.products.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"FoodCell";
    
    UITableViewCell* thisCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (thisCell == nil) {
       thisCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
    }
    
    Product* product = [self.products objectAtIndex: indexPath.row];
    thisCell.textLabel.text = product.name;
    return thisCell;
}

-(BOOL) stringLengthIsValid:(NSString*) str {
    if (str.length > 0 ) {
        return YES;
    }
    return NO;
}


@end
