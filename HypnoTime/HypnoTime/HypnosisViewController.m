//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by 栗林健太郎 on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];

    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Hypnosis"];
        
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (void)loadView
{
    HypnosisView *hv = [[HypnosisView alloc] initWithFrame:CGRectZero];
    [hv setBackgroundColor:[UIColor whiteColor]];
    [self setView:hv];
    [hv release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded the view for HypnosisViewController");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"Monitoring accelerometer");
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    
    [accelerometer setUpdateInterval:0.1];
    [accelerometer setDelegate:self];
    
    [[self view] becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer
        didAccelerate:(UIAcceleration *)acceleration
{
    NSLog(@"%f, %f, %f", [acceleration x], [acceleration y], [acceleration z]);

    HypnosisView *hv = (HypnosisView *)[self view];
    float xShift = [hv xShift] * 0.8 + [acceleration x] * 2.0;
    float yShift = [hv yShift] * 0.8 + [acceleration y] * 2.0;
    [hv setXShift:xShift];
    [hv setYShift:yShift];
    [hv setNeedsDisplay];
}

@end
