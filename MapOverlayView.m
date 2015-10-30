//
//  MapOverlayView.m
//  art-everywhere-maps
//
//  Created by Joel Bell on 10/30/15.
//  Copyright © 2015 Joel Bell. All rights reserved.
//

#import "MapOverlayView.h"


@implementation MapOverlayView

- (instancetype)initWithOverlay:(id <MKOverlay>)overlay {
    self = [super initWithOverlay:overlay];
    if (self != nil) {
        self.overlayAlpha = 0.2;
        self.overlayColor = [UIColor blackColor];
    }
    return self;
}

- (BOOL)canDrawMapRect:(MKMapRect)mapRect
             zoomScale:(MKZoomScale)zoomScale {
    return true;
}

- (void)drawMapRect:(MKMapRect)mapRect
          zoomScale:(MKZoomScale)zoomScale
          inContext:(CGContextRef)ctx {
    CGContextSetAlpha(ctx, self.overlayAlpha);
    CGContextSetFillColorWithColor(ctx, self.overlayColor.CGColor);
    CGContextFillRect(ctx, [self rectForMapRect:MKMapRectWorld]);
    CGContextSetBlendMode(ctx, kCGBlendModeDifference);
    
}

@end
