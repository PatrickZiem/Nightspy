//
//  DetailViewController.h
//  Nightspy
//
//  Created by NoName on 2016-06-08.
//  Copyright © 2016 ClubHub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2ViewControllerTouch.h"
#import "GTLService.h"


@interface DetailViewController : UIViewController {
    
    IBOutlet UILabel *SegmentLabel;
    IBOutlet UISegmentedControl *SegmentedControl;
}

@property (strong, nonatomic) NSArray *DetailData;

-(IBAction)SegmentButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *ClubName;
@property (strong, nonatomic) IBOutlet UIImageView *ClubImage;

@property (copy, nonatomic) NSArray *ClubData0;
@property (copy, nonatomic) NSArray *ClubData1;
@property (copy, nonatomic) NSArray *ClubData2;
@property (copy, nonatomic) NSArray *ClubData3;
@property (copy, nonatomic) NSArray *ClubData4;
@property (copy, nonatomic) NSArray *ClubData5;
@property (copy, nonatomic) NSArray *ClubData6;

@end
