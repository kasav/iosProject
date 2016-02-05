//
//  Reservation.m
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "Reservation.h"

@implementation Reservation

-(instancetype) initWithDate: (NSDate*) date
                 peopleCount: (NSInteger) peopleCount
              andSenderEmail: (NSString*) senderEmail;{
    self = [super init];
    if (self) {
        self.date = date;
        self.peopleCount = peopleCount;
        self.senderEmail = senderEmail;
    }
    return self;
}

+(Reservation*) ReservationWithDate: (NSDate*) date
                        peopleCount: (NSInteger) peopleCount
                     andSenderEmail: (NSString *) senderEmail {
    return [[Reservation alloc] initWithDate:date peopleCount:peopleCount andSenderEmail:senderEmail];
}


@end
