//
//  ARTMapOverlay.m
//  art-everywhere-maps
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTMapOverlay.h"


@interface ARTMapOverlay ()

@property (nonatomic) CLLocationCoordinate2D dimOverlayCoordinates;

@end

@implementation ARTMapOverlay

-(id)initWithMapView:(MKMapView *)mapView {
    self = [super init];
    if(self)
    {
        self.dimOverlayCoordinates = mapView.centerCoordinate;
    }
    return self;
}

-(CLLocationCoordinate2D)coordinate {
    
    return self.dimOverlayCoordinates;
}

// Return MKMapRectWorld in this method makes sure entire map view is covered with the dim overlay.
//
// @return boundingMapRect - MKMapRectWorld for our dim overlay

-(MKMapRect)boundingMapRect {
    return MKMapRectWorld;
}

@end
