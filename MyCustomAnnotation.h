//
//  MyCustomAnnotation.h
//  art-everywhere-maps
//
//  Created by Joel Bell on 10/29/15.
//  Copyright © 2015 Joel Bell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyCustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSString *proximityNumber;

-(id)initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D)location Proximity:(NSString *)number;
-(MKAnnotationView *)annotationView;

@end
