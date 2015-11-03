//
//  ARTFullScreenViewController.m
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim on 11/3/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTFullScreenViewController.h"
#import "ARTInfoViewController.h"

@interface ARTFullScreenViewController ()

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *fullScreenTap;

@end

@implementation ARTFullScreenViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.fullSizeImage.image = self.fullScreenImage;
    
    
    
}

- (IBAction)fullScreenTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




-(BOOL)prefersStatusBarHidden {
    return YES;
}



@end
