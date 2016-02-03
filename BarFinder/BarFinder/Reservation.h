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

-(instancetype) initWithDate: (NSDate*) date
              andPeopleCount: (NSInteger) peopleCount;

+(Reservation*) ReservationWithDate: (NSDate*) date
              andPeopleCount: (NSInteger) peopleCount;

@end
