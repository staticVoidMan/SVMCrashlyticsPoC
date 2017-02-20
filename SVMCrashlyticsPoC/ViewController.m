//
//  ViewController.m
//  SVMCrashlyticsPoC
//
//  Created by staticVoidMan on 10/02/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

#import "ViewController.h"

#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@interface ViewController ()
{
    IBOutlet UIButton *btnUseDevelopmentServer;
    IBOutlet UIButton *btnUseStagingServer;
    
    IBOutlet UIButton *btnCrash;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)btnUseDevelopmentServer_Act:(UIButton *)sender {
    if (sender.selected == NO) {
        [sender setSelected:YES];
        [btnUseStagingServer setSelected:NO];
        
        [Crashlytics startWithAPIKey:@"aac300d2855f9d211b597051cc85d053a5aaf136"];
        /*
         [Fabric +with:] seems to be not needed as [Crashlytics +startWithAPIKey:] internally calls it
         */
        [Fabric with:@[[Crashlytics class]]];
        
        [btnUseStagingServer setTitle:@"Switch to Staging Server"
                             forState:UIControlStateNormal];
        [sender setTitle:@"Using Development Server"
                forState:UIControlStateNormal];
    }
}

-(IBAction)btnUseStagingServer_Act:(UIButton *)sender {
    if (sender.selected == NO) {
        [sender setSelected:YES];
        [btnUseDevelopmentServer setSelected:NO];
        
        [Crashlytics startWithAPIKey:@"50df2daaaf66ede2b11f7fde1faaee3ab28c6408"];
        /*
         [Fabric +with:] seems to be not needed as [Crashlytics +startWithAPIKey:] internally calls it
         */
        [Fabric with:@[[Crashlytics class]]];
        
        [btnUseDevelopmentServer setTitle:@"Switch to Development Server"
                                 forState:UIControlStateNormal];
        [sender setTitle:@"Using Staging Server"
                forState:UIControlStateNormal];
    }
}

-(IBAction)btnCrash_Act:(UIButton *)sender {
    if (btnUseDevelopmentServer.selected
        || btnUseStagingServer.selected) {
        [[Crashlytics sharedInstance] crash];
    }
    else {
        NSLog(@"Select a server to initialize Crashlytics");
    }
}


@end
