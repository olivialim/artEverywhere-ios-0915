//
//  ARTInfo.h
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "ARTMapAnnotation.h"

@interface ARTInfo : NSObject

@property (strong, nonatomic) NSString *artist;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *yearCreated;
@property (strong, nonatomic) UIImage *image1;
@property (strong, nonatomic) UIImage *image2;
@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (strong, nonatomic) NSString *distanceFromUser;
@property (strong, nonatomic) NSString *orderNumberDistanceFromUser;
@property (nonatomic) CLLocation *location;
@property (strong,nonatomic) ARTMapAnnotation *annotation;
@property (strong, nonatomic) NSString *artDescription;

-(instancetype)initWithTitle:(NSString *)title
                      artist:(NSString *)artist
                 yearCreated:(NSString *)yearCreated
                      image1:(UIImage *)image1
                      image2:(UIImage *)image2
                    latitude:(CGFloat)latitude
                   longitude:(CGFloat)longitude
              artDescription:(NSString *)artDescription;

- (void)setupDistanceFromUserPropertyForArtwork:(ARTInfo *)art
                                   withLocation:(CLLocation *)location;


- (NSString *)description;




@end
