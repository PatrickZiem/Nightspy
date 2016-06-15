//
//  DetailViewController.m
//  Nightspy
//
//  Created by NoName on 2016-06-08.
//  Copyright © 2016 ClubHub. All rights reserved.
//

#import "DetailViewController.h"
#import "DataController.h"

@interface DetailViewController ()

@end


@implementation DetailViewController;

// When the view loads, create necessary subviews, and initialize the Google Sheets API service.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    _ClubName.text = _DetailData[0];
    _ClubImage.image = [UIImage imageNamed:_DetailData[1]];
    
    
    }



-(IBAction)SegmentButton:(id)sender {
    if (SegmentedControl.selectedSegmentIndex == 0)
        SegmentLabel.text = _ClubData1[0];
    else if (SegmentedControl.selectedSegmentIndex == 1)
        SegmentLabel.text = _ClubData1[1];
    else if (SegmentedControl.selectedSegmentIndex == 2)
        SegmentLabel.text = _ClubData1[2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
