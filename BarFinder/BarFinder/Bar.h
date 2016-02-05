//
//  Bar.h
//  BarFinder
//
//  Created by Kaloian on 2/1/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Bar : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString* name;

@property (strong, nonatomic) NSString* address;

@property (strong, nonatomic) NSString* phone;

@property (strong, nonatomic) NSString* textDescription;

@property (strong, nonatomic) NSString* imageUrl;

-(instancetype) initWithName: (NSString*) name
                     address: (NSString*) address
                       phone: (NSString*) phone
             textDescription: (NSString*) textDescription
                 andImageUrl: (NSString*) imageUrl;

+(Bar*) BarWithName: (NSString*) name
            address: (NSString*) address
              phone: (NSString*) phone
    textDescription: (NSString*) textDescription
        andImageUrl: (NSString*) imageUrl;

+(NSString*)parseClassName;

@end
