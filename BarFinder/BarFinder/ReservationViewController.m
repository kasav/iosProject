//
//  ReservationViewController.m
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "ReservationViewController.h"
#import <Parse/Parse.h>
#import "Reservation.h"

@interface ReservationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *barNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *barAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *barPhoneLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *showDateLabel;
@property (weak, nonatomic) IBOutlet UITextField *reservePeopleInput;
- (IBAction)datePickedButton:(id)sender;
- (IBAction)reserveConfirmTapped:(id)sender;


@property (strong, nonatomic) NSString* dateAsString;
@property (strong, nonatomic) NSDate* date;
@property NSInteger peopleCount;
@property (strong, nonatomic) NSString* userEmail;

@end

@implementation ReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Резервация";
    
    self.barNameLabel.text = self.reserveBar.name;
    self.barAddressLabel.text = self.reserveBar.address;
    self.barPhoneLabel.text = self.reserveBar.phone;
    [self.datePicker setValue:[UIColor whiteColor] forKeyPath:@"textColor"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)datePickedButton:(id)sender {
    self.date = [self.datePicker date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm-dd/MM/yyyy"];
    self.dateAsString = [formatter stringFromDate:self.date];
    
    NSString* dateStamp = [[NSString alloc] initWithFormat:@"%@", self.dateAsString];
    self.showDateLabel.text = dateStamp;
}

- (IBAction)reserveConfirmTapped:(id)sender {
    
    self.peopleCount = [self.reservePeopleInput.text intValue];
    PFUser* currentUser = [PFUser currentUser];
    
    //check if there is an user logged in and build apropriate message
    if (currentUser) {
        self.userEmail = currentUser.email;
    }
    else {
        [self buildNotPossibleAlertWithTitle:@"Резервацията не е възможна!"
                                  andMessage:@"За да резервирате трябва да сте логнат потребител. Моля, логнете се от началната страница на приложението."];
        return;
    }
    
    //check if input is valid and build apropriate message
    if ([self reservationInputIsValid:self.date andCount:self.peopleCount]) {
        [self buildConformationAlertWithPeople:self.peopleCount barName:self.reserveBar.name andDateString:self.dateAsString];
    }
    else {
        [self buildNotPossibleAlertWithTitle:@"Резервацията не е възможна!"
                                  andMessage:@"Въведената информация не е коректна."];
        
    }

}


-(BOOL)reservationInputIsValid: (NSDate*)date andCount:(NSInteger)peopleCount {
    
    if([date compare: [NSDate date]]== NSOrderedAscending || date == nil || peopleCount <=0){
        return NO;
    }
    
    return YES;
    
}

-(void) buildNotPossibleAlertWithTitle: (NSString*) title andMessage:(NSString*) message {
    UIAlertController * alert= [UIAlertController alertControllerWithTitle: title
                                                                   message: message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"OK"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action)
                                {
                                    [self closeAlertview];
                                }];
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) buildConformationAlertWithPeople: (NSInteger)peopleCount barName:(NSString*) barName andDateString:(NSString*)dateOfReservation {
    UIAlertController * alert= [UIAlertController alertControllerWithTitle:@"Резервация"
                                                                   message:[NSString stringWithFormat: @"Резервирате маса %li души в %@ за %@?",(long)peopleCount, barName, dateOfReservation]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"Да"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action)
                                {
                                    Reservation* reservation = [Reservation object];
                                    reservation.senderEmail = self.userEmail;
                                    reservation.peopleCount= self.peopleCount;
                                    reservation.date = self.date;
                                    reservation.barName= self.reserveBar.name;
                                    [reservation saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                        if (!error) {
                                            [self buildNotificationForReserveInBar:self.reserveBar.name forDate:self.dateAsString];
                                        } else {
                                            [self buildNotPossibleAlertWithTitle:@"Резервацията неуспешна!"
                                                                      andMessage:@"Грешка при връзка с база данни."];
                                        }
                                    }];
                                    
                                    
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

-(void)closeAlertview
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}





-(void) buildNotificationForReserveInBar: (NSString*)barName forDate:(NSString*) dateAsString{    
    
    NSDate* fireAt = [NSDate dateWithTimeIntervalSinceNow:3];
    
    UIApplication* app = [UIApplication sharedApplication];
    UILocalNotification* notification = [[UILocalNotification alloc] init];
    notification.fireDate = fireAt;
    notification.alertTitle = @"Резервация";
    notification.alertBody = [NSString stringWithFormat: @"Направихте резервация в %@ за дата %@",barName, dateAsString];
    
   [app scheduleLocalNotification:notification];
    
}

@end
