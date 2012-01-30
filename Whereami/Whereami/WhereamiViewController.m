//
//  WhereamiViewController.m
//  Whereami
//
//  Created by 栗林健太郎 on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WhereamiViewController.h"
#import "MapPoint.h"

@implementation WhereamiViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // 位置情報管理
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDistanceFilter:kCLDistanceFilterNone];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    else {
        NSLog(@"location service disabled...");
    }
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSTimeInterval interval = [[newLocation timestamp] timeIntervalSinceNow];

    if (interval < -180) {
        return;
    }
    
    [self foundLocation:newLocation];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D coordinate = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 250, 250);
    [worldView setRegion:region animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)tf
{
    [self findLocation];
    [tf resignFirstResponder];

    return YES;
}

- (void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)location
{
    CLLocationCoordinate2D coordinate = [location coordinate];
    MapPoint *point = [[MapPoint alloc]
                       initWithCoordinate:coordinate                                                                           title:[locationTitleField text]];
    [worldView addAnnotation:point];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 250, 250);
    [worldView setRegion:region animated:YES];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

- (void)viewDidUnload
{
    worldView = nil;
    locationTitleField = nil;
    activityIndicator = nil;

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
