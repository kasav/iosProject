//
//  Product.h
//  BarFinder
//
//  Created by Kaloian on 2/6/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString* name;
@property CGFloat price;


-(instancetype) initWithName: (NSString*) name
                    andPrice: (CGFloat) price;

+(Product*) productWithName: (NSString*) name
                   andPrice: (CGFloat) price;

@end
