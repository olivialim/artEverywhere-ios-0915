//
//  NSMutableArray+Enumeration.h
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Enumeration)

-(NSMutableArray *)loopLocations:(id(^)(id object))locationBlock;

@end
