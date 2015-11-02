//
//  NSMutableArray+Enumeration.m
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "NSMutableArray+Enumeration.h"

@implementation NSMutableArray (Enumeration)

-(NSMutableArray *)loopLocations:(id(^)(id object))locationBlock
{
    
    
    NSMutableArray *output = [[NSMutableArray alloc] init];
    
    for (id object in self) {
        id blockReturn = locationBlock(object);
        [output addObject:blockReturn];
    }
    
    return output;
    
    
}

@end
