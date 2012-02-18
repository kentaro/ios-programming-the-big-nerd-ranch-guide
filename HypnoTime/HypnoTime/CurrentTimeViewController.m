//
//  CurrentTimeViewController.m
//  HypnoTime
//
//  Created by 栗林健太郎 on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurrentTimeViewController.h"

@implementation CurrentTimeViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Time"];
        
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:i];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded the view for CurrentTimeViewController");
}

- (void)viewDidUnload
{
    NSLog(@"CurrentTimeViewController's view was unloaded due to memory warning");
    [super viewDidUnload];
    [timeLabel release];
    timeLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will appear");
    [super viewWillAppear:animated];
    [self showCurrentTIme:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"CurrentTimeViewController will Disappear");
    [super viewWillDisappear:animated];
}

- (IBAction)showCurrentTIme:(id)sender
{
    NSDate *now = [NSDate date];
    
    static NSDateFormatter *formatter = nil;

    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
    }
    
    [timeLabel setText:[formatter stringFromDate:now]];
}

- (void)dealloc
{
    [timeLabel release];
    [super dealloc];
}

@end
