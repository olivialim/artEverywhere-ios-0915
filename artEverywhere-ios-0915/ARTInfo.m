//
//  ARTInfo.m
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTInfo.h"

@implementation ARTInfo

-(instancetype)initWithTitle:(NSString *)title
                      artist:(NSString *)artist
                 yearCreated:(NSString *)yearCreated
              artDescription:(NSString *)artDescription
                      image1:(UIImage *)image1
                      image2:(UIImage *)image2
                    latitude:(CGFloat)latitude
                   longitude:(CGFloat)longitude
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _yearCreated = yearCreated;
        _artDescription = artDescription;
        _image1 = image1;
        _image2 = image2;
        _longitude = longitude;
        _latitude = latitude;
    }
    return self;
}

- (NSString *)description {

    NSString *distance = @"";
    
    if (_distanceFromUser) {
        distance = _distanceFromUser;
    }
    
    NSDictionary *properties = @{ @"Artist:": _artist,
                                  @"Title:": _title,
                                  @"Year Created:": _yearCreated,
                                  @"Latitude:": @(_latitude),
                                  @"Longitude": @(_longitude),
                                  @"DISTANCE:": distance };
    
    return [NSString stringWithFormat:@"%@", properties];
    
}
@end
