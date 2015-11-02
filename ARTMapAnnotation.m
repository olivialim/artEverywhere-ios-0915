//
//  ARTMapAnnotation.m
//  art-everywhere-maps
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTMapAnnotation.h"


@implementation ARTMapAnnotation

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
                                                                    reuseIdentifier:@"ARTMapAnnotation"];
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"pinIcon"];
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    

    
    UILabel *number = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 18)];
    number.textColor = [UIColor whiteColor];
    number.text = self.proximityNumber;
    number.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
    number.textAlignment = NSTextAlignmentCenter;
    [annotationView addSubview:number];

    
    return annotationView;
}


@end
