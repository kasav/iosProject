//
//  Product.m
//  BarFinder
//
//  Created by Kaloian on 2/6/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype) initWithName: (NSString*) name
                    andPrice: (CGFloat) price {
    
    self = [super init];
    
    if (self) {
        self.name = name;
        self.price = price;
    }
    
    return self;
}

+(Product*) productWithName: (NSString*) name
                   andPrice: (CGFloat) price {
    
    return [[Product alloc] initWithName:name
                                andPrice:price];
}


@end
