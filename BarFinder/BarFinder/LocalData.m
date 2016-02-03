//
//  LocalData.m
//  BarFinder
//
//  Created by Kaloian on 2/2/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "LocalData.h"

@interface LocalData()

@property NSMutableArray* _bars;

@end
@implementation LocalData

-(instancetype) init {
    self = [super init];
    if (self) {
        self._bars = [NSMutableArray array];
    }
    
    return self;
}

-(NSMutableArray*) bars{
    return [NSMutableArray arrayWithArray:self._bars];
}

-(void) addBar: (Bar*) bar{
    [self._bars addObject: bar];
}
@end
