//
//  ReservationViewController.m
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "ReservationViewController.h"

@interface ReservationViewController ()

@property (strong, nonatomic) NSDate* date;
@property (strong, nonatomic) NSString* dateAsString;
@property NSInteger peopleCount;

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
    self.date = [self.datePicker date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm-dd/MM/yyyy"];
    self.dateAsString = [formatter stringFromDate:self.date];
    
    NSString* dateStamp = [[NSString alloc] initWithFormat:@"Избрана дата: %@", self.dateAsString];
    self.showDateLabel.text = dateStamp;
}

- (IBAction)reseveConfirmTapped:(id)sender {
    
    self.peopleCount = [self.reservePeopleInput.text intValue];
    
    
    
    if ([self reservationInputIsValid:self.date andCount:self.peopleCount]) {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Резервация"
                                    message:[NSString stringWithFormat: @"Резервирате маса %li души в %@ за %@?",(long)self.peopleCount, self.reserveBar.name, self.dateAsString]
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Да"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        [[Reservation alloc] initWithDate:self.date andPeopleCount:self.peopleCount];
                                        
                                        
                                    }];
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"Не"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       [self closeAlertview];
                                   }];
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else {
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Резервация"
                                    message: @"Невалидни данни за резервация"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        [self closeAlertview];
                                    }];
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];

    }
    
}
                                    
-(void)closeAlertview
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)reservationInputIsValid: (NSDate*)date andCount:(NSInteger)peopleCount {
    
    if([date compare: [NSDate date]]== NSOrderedAscending || peopleCount <=0){
        return NO;
    }
    
    return YES;
    
}
@end
