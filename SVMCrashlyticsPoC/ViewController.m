//
//  ViewController.m
//  SVMCrashlyticsPoC
//
//  Created by staticVoidMan on 10/02/17.
//  Copyright © 2017 svmLogics. All rights reserved.
//

#import "ViewController.h"
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

-(IBAction)btnCrash_Act:(UIButton *)sender {
    [[Crashlytics sharedInstance] crash];
}


@end
