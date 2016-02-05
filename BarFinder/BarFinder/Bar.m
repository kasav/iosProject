//
//  Bar.m
//  BarFinder
//
//  Created by Kaloian on 2/1/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "Bar.h"
#import <Parse/PFObject+Subclass.h>


@implementation Bar

@dynamic name;
@dynamic address;
@dynamic phone;
@dynamic textDescription;
@dynamic imageUrl;

-(instancetype) initWithName: (NSString*) name
                     address: (NSString*) address
                       phone: (NSString*) phone
             textDescription: (NSString*) textDescription
                 andImageUrl: (NSString*) imageUrl {
    
    self = [super init];
    
    if (self) {
        self.name = name;
        self.address = address;
        self.phone = phone;
        self.textDescription = textDescription;
        self.imageUrl = imageUrl;
    }
    
    return self;
}

+(Bar*) BarWithName: (NSString*) name
            address: (NSString*) address
              phone: (NSString*) phone
    textDescription: (NSString*) textDescription
        andImageUrl: (NSString*) imageUrl {
    
    return [[Bar alloc] initWithName:name
                             address:address
                               phone:phone
                      textDescription:textDescription
                         andImageUrl:imageUrl];
}

+(NSString*)parseClassName {
    return @"Bar";
}

+ (void)load {
    [self registerSubclass];
}

@end
