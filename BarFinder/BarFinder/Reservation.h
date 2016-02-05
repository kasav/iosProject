//
//  Reservation.h
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reservation : NSObject

@property (strong, nonatomic) NSDate* date;

@property NSInteger peopleCount;

@property (strong, nonatomic) NSString* senderEmail;

-(instancetype) initWithDate: (NSDate*) date
                 peopleCount: (NSInteger) peopleCount
              andSenderEmail: (NSString*) senderEmail;

+(Reservation*) ReservationWithDate: (NSDate*) date
                        peopleCount: (NSInteger) peopleCount
                     andSenderEmail: (NSString*) senderEmail;

@end
