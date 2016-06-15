//
//  DataController.h
//  Nightspy
//
//  Created by NoName on 2016-06-13.
//  Copyright © 2016 ClubHub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2ViewControllerTouch.h"
#import "GTLService.h"


@interface DataController : UIViewController

@property (nonatomic, strong) GTLService *service;
@property (nonatomic, strong) UITextView *output;



@property (strong, nonatomic) NSArray *Club0;
@property (strong, nonatomic) NSArray *Club1;
@property (strong, nonatomic) NSArray *Club2;
@property (strong, nonatomic) NSArray *Club3;
@property (strong, nonatomic) NSArray *Club4;
@property (strong, nonatomic) NSArray *Club5;
@property (strong, nonatomic) NSArray *Club6;

@end
