//
//  ReservationViewController.m
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "ReservationViewController.h"

@interface ReservationViewController ()

@property (strong, nonatomic) NSString* dateAsString;
@property int peopleCount;

@end

@implementation ReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barNameLabel.text = self.reserveBar.name;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)datePickedButton:(id)sender {
    NSDate* selectedDate = [self.datePicker date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm-dd/MM/yyyy"];
    self.dateAsString = [formatter stringFromDate:selectedDate];
    
    NSString* dateStamp = [[NSString alloc] initWithFormat:@"Избрана дата: %@", self.dateAsString];
    self.showDateLabel.text = dateStamp;
}

- (IBAction)reseveConfirmTapped:(id)sender {
    
    self.peopleCount = [self.reservePeopleInput.text intValue];
    
    if (self.peopleCount) {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Резервация"
                                    message:[NSString stringWithFormat: @"Резервирате маса %i души в %@ за %@?",self.peopleCount, self.reserveBar.name, self.dateAsString]
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Да"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                        
                                    }];
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"Не"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel no, thanks button
                                       [self closeAlertview];
                                   }];
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];

    }
    
    
}
-(void)closeAlertview
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
