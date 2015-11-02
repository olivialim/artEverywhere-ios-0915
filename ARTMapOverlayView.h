//
//  ARTMapOverlayView.h
//  art-everywhere-maps
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ARTMapOverlayView : MKOverlayView


// Color for the overlay. Default color is 'black'

@property (nonatomic, strong) UIColor *overlayColor;

// Overlay opacity. Default is '0.2'

@property (nonatomic) CGFloat overlayAlpha;


@end
