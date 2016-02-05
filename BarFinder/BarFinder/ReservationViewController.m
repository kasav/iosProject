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
@property (strong, nonatomic) NSDate* date;
@property NSInteger peopleCount;
@property (strong, nonatomic) NSString* userEmail;

@end

@implementation ReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barNameLabel.text = self.reserveBar.name;
    [self.datePicker setValue:[UIColor whiteColor] forKeyPath:@"textColor"];
    
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
    PFUser* currentUser = [PFUser currentUser];
    
    if (currentUser) {
        self.userEmail = currentUser.email;
    }
    else {
        [self buildNotPossibleAlertWithTitle:@"Резервацията не е възможна!"
                                  andMessage:@"За да резервирате трябва да сте логнат потребител. Моля, логнете се от началната страница на приложението."];
        return;
    }
    
    
    if ([self reservationInputIsValid:self.date andCount:self.peopleCount]) {
        [self buildConformationAlertWithPeople:self.peopleCount barName:self.reserveBar.name andDateString:self.dateAsString];
    }
    else {
        [self buildNotPossibleAlertWithTitle:@"Резервацията не е възможна!"
                                  andMessage:@"Въведената информация не е коректна."];
        
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

-(void) buildNotPossibleAlertWithTitle: (NSString*) title andMessage:(NSString*) message {
    UIAlertController * alert= [UIAlertController
                                alertControllerWithTitle: title
                                message: message
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

-(void) buildConformationAlertWithPeople: (NSInteger)peopleCount barName:(NSString*) barName andDateString:(NSString*)dateOfReservation {
    UIAlertController * alert= [UIAlertController
                                alertControllerWithTitle:@"Резервация"
                                message:[NSString stringWithFormat: @"Резервирате маса %li души в %@ за %@?",(long)peopleCount, barName, dateOfReservation]
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Да"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    
                                    
                                    
                                    
                                    
                                    
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

@end
