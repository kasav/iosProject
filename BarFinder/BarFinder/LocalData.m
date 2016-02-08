//
//  LocalData.m
//  BarFinder
//
//  Created by Kaloian on 2/2/16.
//  Copyright © 2016 Kaloian. All rights reserved.
//

#import "LocalData.h"

@interface LocalData()

@property NSMutableArray* bars;

@end
@implementation LocalData

-(instancetype) init {
    self = [super init];
    if (self) {
        self.bars = [NSMutableArray array];
    }
    
    return self;
}

-(NSMutableArray*) pullBarsFromData{
    return [NSMutableArray arrayWithArray:self.bars];
}

-(void) addBar: (Bar*) bar{
    [self.bars addObject: bar];
}
@end
