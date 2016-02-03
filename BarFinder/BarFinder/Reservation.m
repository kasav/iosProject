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
              andPeopleCount: (NSInteger) peopleCount{
    self = [super init];
    if (self) {
        self.date = date;
        self.peopleCount = peopleCount;
    }
    return self;
}

+(Reservation*) ReservationWithDate: (NSDate*) date
                     andPeopleCount: (NSInteger) peopleCount{
    return [[Reservation alloc] initWithDate:date andPeopleCount:peopleCount];
}


@end
