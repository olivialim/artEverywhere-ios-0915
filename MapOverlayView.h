//
//  MapOverlayView.h
//  art-everywhere-maps
//
//  Created by Joel Bell on 10/30/15.
//  Copyright © 2015 Joel Bell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapOverlayView : MKOverlayView

/**
 *  Color for the overlay. Default color is 'black'
 */
@property (nonatomic, strong) UIColor *overlayColor;

/**
 *  Overlay opacity. Default is '0.2'
 */
@property (nonatomic) CGFloat overlayAlpha;


@end
