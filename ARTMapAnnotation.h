//
//  ARTMapAnnotation.h
//  art-everywhere-maps
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ARTMapAnnotation : NSObject <MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSString *proximityNumber;

-(id)initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D)location Proximity:(NSString *)number;
-(MKAnnotationView *)annotationView;

@end
