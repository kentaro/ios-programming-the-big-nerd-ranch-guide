//
//  WhereamiViewController.h
//  Whereami
//
//  Created by 栗林健太郎 on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKMapView.h>
#import <MapKit/MKUserLocation.h>

@interface WhereamiViewController : UIViewController
<CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>

{
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldView;
    IBOutlet UITextField *locationTitleField;
    IBOutlet UIActivityIndicatorView *activityIndicator;
}

- (void)findLocation;
- (void)foundLocation:(CLLocation *)location;

@end
