//
//  MapOverlay.h
//  art-everywhere-maps
//
//  Created by Joel Bell on 10/30/15.
//  Copyright © 2015 Joel Bell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapOverlay : NSObject <MKOverlay>

-(id)initWithMapView:(MKMapView *)mapView;

@end
