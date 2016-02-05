//
//  Reservation.m
//  BarFinder
//
//  Created by Kaloian on 2/3/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "Reservation.h"

@implementation Reservation

@dynamic date;
@dynamic peopleCount;
@dynamic barName;
@dynamic senderEmail;

-(instancetype) initWithDate: (NSDate*) date
                 peopleCount: (NSInteger) peopleCount
                     barName: (NSString*) barName
              andSenderEmail: (NSString*) senderEmail
{
    self = [super init];
    if (self) {
        self.date = date;
        self.peopleCount = peopleCount;
        self.barName = barName;
        self.senderEmail = senderEmail;
    }
    return self;
}

+(Reservation*) ReservationWithDate: (NSDate*) date
                        peopleCount: (NSInteger) peopleCount
                            barName: (NSString*) barName
                     andSenderEmail: (NSString*) senderEmail
{
    return [[Reservation alloc] initWithDate:date peopleCount:peopleCount barName:barName andSenderEmail:senderEmail];
}

+(NSString*)parseClassName {
    return @"Reservation";
}

+ (void)load {
    [self registerSubclass];
}

@end
