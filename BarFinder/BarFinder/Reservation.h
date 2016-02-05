//
//  Reservation.h
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Reservation : PFObject<PFSubclassing>

@property (strong, nonatomic) NSDate* date;

@property NSInteger peopleCount;

@property (strong, nonatomic) NSString* barName;

@property (strong, nonatomic) NSString* senderEmail;

-(instancetype) initWithDate: (NSDate*) date
                 peopleCount: (NSInteger) peopleCount
                     barName: (NSString*) barName
              andSenderEmail: (NSString*) senderEmail;

+(Reservation*) ReservationWithDate: (NSDate*) date
                        peopleCount: (NSInteger) peopleCount
                            barName: (NSString*) barName
                     andSenderEmail: (NSString*) senderEmail;

+(NSString*)parseClassName;

@end
