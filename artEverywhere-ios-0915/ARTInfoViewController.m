//
//  ARTInfoViewController.m
//  artEverywhere-ios-0915
//
//  Created by Olivia Lim and Joel Bell on 10/29/15.
//  Copyright © 2015 Olivia Lim. All rights reserved.
//

#import "ARTInfoViewController.h"
#import "ARTLocationListTableViewController.h"

@interface ARTInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleYearLabel;
@property (weak, nonatomic) IBOutlet UITextView *artDescription;
@property (weak, nonatomic) IBOutlet UIView *superContentView;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;

@end

@implementation ARTInfoViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.artDescription.editable = NO;
    
    NSString *title = self.artwork.title;
    NSString *yearCreated = self.artwork.yearCreated;
    
    self.titleYearLabel.text = [NSString stringWithFormat:@"%@, %@", title, yearCreated];
    
    self.artDescription.text = self.artwork.artDescription;
    CGRect rect = self.artDescription.frame;
    rect.size.height = self.artDescription.contentSize.height;
    self.artDescription.frame = rect;
    
    CGFloat totalHeight = 0.0f;
    for (UIView *view in self.superContentView.subviews)
        if (totalHeight < view.frame.origin.y + view.frame.size.height) totalHeight = view.frame.origin.y + view.frame.size.height;
    
    self.image1.image = self.artwork.image1;
    self.image2.image = self.artwork.image2;

    

}

- (BOOL)prefersStatusBarHidden {
    return YES;
}



@end
