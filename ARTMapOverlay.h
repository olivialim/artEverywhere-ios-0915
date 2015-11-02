//
//  ARTMapOverlay.h
//  art-everywhere-maps
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ARTMapOverlay : NSObject <MKOverlay>

-(id)initWithMapView:(MKMapView *)mapView;

@end
