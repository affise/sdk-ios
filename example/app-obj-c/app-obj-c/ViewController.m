//
//  ViewController.m
//  app-obj-c
//
//  Created by Sergey Korney
//

#import "ViewController.h"
#import <AffiseAttributionLib/AffiseAttributionLib-Swift.h>


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sendEvent:(UIButton *)sender {
    
    CustomId01Event *event = [[CustomId01Event alloc] init:@"custom-objc"
                                           timeStampMillis:[NSDate date].timeIntervalSince1970 * 1000];
    
    [event addPredefinedParameter:PredefinedStringPARAM_01 string:@"param1"];
    // send event
    [event send];
    // or
    // [Affise sendEvent:event];
}

@end
