//
//  MapOverlay.m
//  art-everywhere-maps
//
//  Created by Joel Bell on 10/30/15.
//  Copyright © 2015 Joel Bell. All rights reserved.
//

#import "MapOverlay.h"


@interface MapOverlay ()

@property (nonatomic) CLLocationCoordinate2D dimOverlayCoordinates;

@end

@implementation MapOverlay

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

/**
 *  Return MKMapRectWorld in this method makes sure entire map view is covered with the dim overlay.
 *
 *  @return boundingMapRect - MKMapRectWorld for our dim overlay
 */
-(MKMapRect)boundingMapRect {
    return MKMapRectWorld;
}

@end
