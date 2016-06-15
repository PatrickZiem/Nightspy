//
//  DataController.m
//  Nightspy
//
//  Created by NoName on 2016-06-13.
//  Copyright © 2016 ClubHub. All rights reserved.
//

#import "DataController.h"
#import "GTLDrive.h"
#import "DetailViewController.h"

static NSString *const kKeychainItemName = @"Google Sheets API";
static NSString *const kClientID = @"318137246017-phsi0h2ijchp97j7s7gf8tli4c90vtrc.apps.googleusercontent.com";

@implementation DataController

@synthesize service = _service;
@synthesize output = _output;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Initialize the Google Sheets API service & load existing credentials from the keychain if available.
    self.service = [[GTLService alloc] init];
    self.service.authorizer =
    [GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:kKeychainItemName
                                                          clientID:kClientID
                                                      clientSecret:nil];
}
// When the view appears, ensure that the Google Sheets API service is authorized, and perform API calls.
- (void)viewDidAppear:(BOOL)animated {
    if (!self.service.authorizer.canAuthorize) {
        // Not yet authorized, request authorization by pushing the login UI onto the UI stack.
        [self presentViewController:[self createAuthController] animated:YES completion:nil];
        
    } else {
        [self getData];
    }
}

- (void)getData {
    NSString *baseUrl = @"https://sheets.googleapis.com/v4/spreadsheets/";
    NSString *spreadsheetId = @"1TF8G6RgfFQQNkrdw05ZVxX7XMGx3h7sxxsaLfRGxzHE";
    NSString *range = @"Sheet1!A2:8";
    baseUrl = [baseUrl stringByAppendingString:spreadsheetId];
    baseUrl = [baseUrl stringByAppendingString:@"/values/"];
    baseUrl = [baseUrl stringByAppendingString:range];
    
    [self.service fetchObjectWithURL:[NSURL URLWithString:baseUrl]
                         objectClass:[GTLObject class]
                            delegate:self
                   didFinishSelector:@selector(displayMajorsWithServiceTicket:finishedWithObject:error:)];
}
int i =0;
// Displays the retrieved courses.
- (void)displayMajorsWithServiceTicket:(GTLServiceTicket *)ticket
                    finishedWithObject:(GTLObject *)object
                                 error:(NSError *)error {
    
    if (error == nil) {
        NSArray *rows = [object.JSON objectForKey:@"values"];
        for (NSArray *row in rows) {
            i++;
            if (i == 0)
                _Club0 = @[row[6],row[10],row[11]];
            else if (i == 1)
                _Club1 = @[row[6],row[10],row[11]];
            else if (i == 2)
                _Club2 = @[row[6],row[10],row[11]];
            else if (i == 3)
                _Club3 = @[row[6],row[10],row[11]];
            else if (i == 4)
                _Club4 = @[row[6],row[10],row[11]];
            else if (i == 5)
                _Club5 = @[row[6],row[10],row[11]];
            else if (i == 6)
                _Club6 = @[row[6],row[10],row[11]];
            
            
        }
    }
    
   /* DetailViewController *detailviewcontroller = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    detailviewcontroller.ClubData0 = _Club0;
    detailviewcontroller.ClubData1 = _Club1;
    detailviewcontroller.ClubData2 = _Club2;
    detailviewcontroller.ClubData3 = _Club3;
    detailviewcontroller.ClubData4 = _Club4;
    detailviewcontroller.ClubData5 = _Club5;
    detailviewcontroller.ClubData6 = _Club6;
*/
}



// Creates the auth controller for authorizing access to Google Sheets API.
- (GTMOAuth2ViewControllerTouch *)createAuthController {
    GTMOAuth2ViewControllerTouch *authController;
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    NSArray *scopes = [NSArray arrayWithObjects:@"https://www.googleapis.com/auth/spreadsheets.readonly", nil];
    authController = [[GTMOAuth2ViewControllerTouch alloc]
                      initWithScope:[scopes componentsJoinedByString:@" "]
                      clientID:kClientID
                      clientSecret:nil
                      keychainItemName:kKeychainItemName
                      delegate:self
                      finishedSelector:@selector(viewController:finishedWithAuth:error:)];
    return authController;
}

// Handle completion of the authorization process, and update the Google Sheets API
// with the new credentials.
- (void)viewController:(GTMOAuth2ViewControllerTouch *)viewController
      finishedWithAuth:(GTMOAuth2Authentication *)authResult
                 error:(NSError *)error {
    if (error != nil) {
        [self showAlert:@"Authentication Error" message:error.localizedDescription];
        self.service.authorizer = nil;
    }
    else {
        self.service.authorizer = authResult;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

// Helper for showing an alert
- (void)showAlert:(NSString *)title message:(NSString *)message {
    UIAlertController *alert =
    [UIAlertController alertControllerWithTitle:title
                                        message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok =
    [UIAlertAction actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action)
     {
         [alert dismissViewControllerAnimated:YES completion:nil];
     }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
    
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
