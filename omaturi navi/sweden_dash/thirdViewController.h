//
//  thirdViewController.h
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@class Annotation;
@interface thirdViewController : UIViewController<MKMapViewDelegate ,CLLocationManagerDelegate >
{
    MKMapView *myMapView;
    //CLLocationManager *locationManager;
    // CLLocationManager
    __strong CLLocationManager *_locationManager;
    
}
@property (retain, nonatomic) IBOutlet MKMapView *myMapView;
@property (weak, nonatomic) IBOutlet UIButton *hereBtn;
- (IBAction)hereTap:(id)sender;


//@property (nonatomic, retain) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *_errorLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;




@end