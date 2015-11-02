//
//  ARTInfoDataStore.h
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "ARTInfo.h"


@interface ARTInfoDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *artworks;
@property (strong, nonatomic) ARTInfo *artworkDetail;

+ (instancetype)sharedArtInfoDataStore;





@end
