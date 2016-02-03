//
//  LocalData.h
//  BarFinder
//
//  Created by Kaloian on 2/2/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bar.h"

@interface LocalData : NSObject

-(NSMutableArray*) bars;

-(void) addBar: (Bar*) bar;

@end
