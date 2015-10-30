//
//  MyCustomAnnotation.m
//  art-everywhere-maps
//
//  Created by Joel Bell on 10/29/15.
//  Copyright © 2015 Joel Bell. All rights reserved.
//

#import "MyCustomAnnotation.h"


@implementation MyCustomAnnotation

-(id)initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D)location Proximity:(NSString *)number
{
    self = [super init];
    if(self)
    {
        _title = newTitle;
        _coordinate = location;
        _proximityNumber = number;
    }
    
    return self;
}

-(MKAnnotationView *)annotationView
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self
                                                                    reuseIdentifier:@"MyCustomAnnotation"];
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"pinIconTest3"];
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 21, 19)];

    number.textColor = [UIColor whiteColor];
    number.text = self.proximityNumber;
    number.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12];
    number.textAlignment = NSTextAlignmentCenter;
    [annotationView addSubview:number];

    
    return annotationView;
}


@end
