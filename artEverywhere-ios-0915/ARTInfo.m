//
//  ARTInfo.m
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTInfo.h"

@implementation ARTInfo

-(instancetype)initWithTitle:(NSString *)title
                      artist:(NSString *)artist
                 yearCreated:(NSString *)yearCreated
                      image1:(UIImage *)image1
                      image2:(UIImage *)image2
                    latitude:(CGFloat)latitude
                   longitude:(CGFloat)longitude
              artDescription:(NSString *)artDescription

{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _yearCreated = yearCreated;
        _image1 = image1;
        _image2 = image2;
        _latitude = latitude;
        _longitude = longitude;
        _artDescription = artDescription;
        _location = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
        _annotation = [[ARTMapAnnotation alloc] initWithTitle:self.title Location:[self.location coordinate] Proximity:@""];
        
    }
    return self;
}

- (void)setupDistanceFromUserPropertyForArtwork:(ARTInfo *)art
                                   withLocation:(CLLocation *)location {
    
    CLLocationDistance meters = [art.location distanceFromLocation:location];
    CGFloat milesDistance = meters / 1609.344;
    art.distanceFromUser = [NSString stringWithFormat:@"%.2f",milesDistance];
    
}

- (NSString *)description {

    NSString *distance = @"";
    NSString *distanceOrder = @"";
    NSString *proximityNumber = @"";
    
    if (_distanceFromUser) {
        distance = _distanceFromUser;
    }
    if (_orderNumberDistanceFromUser) {
        distanceOrder = _orderNumberDistanceFromUser;
    }
    if (_annotation) {
        proximityNumber = _annotation.proximityNumber;
    }
    
    NSDictionary *properties = @{ @"Artist: ": _artist,
                                  @"Title: ": _title,
                                  @"Year Created: ": _yearCreated,
                                  @"Latitude: ": @(_latitude),
                                  @"Longitude: ": @(_longitude),
                                  @"Location: ": _location,
                                  @"Annotation: ": _annotation,
                                  @"Distance: ": distance,
                                  @"Distance Order: ": distanceOrder,
                                  @"Proximity: ": proximityNumber};
    
    return [NSString stringWithFormat:@"%@", properties];
    
}
@end
