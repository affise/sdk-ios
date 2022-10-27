//
//  ViewController.m
//  app-obj-c
//
//  Created by Sergey Korney
//

#import "ViewController.h"
#import <AfficeAttributionLib/AfficeAttributionLib-Swift.h>


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sendEvent:(UIButton *)sender {
    
    CustomId01Event *event = [[CustomId01Event alloc] initWithCustom:@"custom-objc"
                                                      timeStampMillis:[NSDate date].timeIntervalSince1970 * 1000
                                                             userData:@"custom-objc"];
    
    [event addPredefinedParameterWithParameter:@"affise_p_param_01" value:@"param1"];
    [Affise.shared sendEventWithEvent:event];
}

@end
