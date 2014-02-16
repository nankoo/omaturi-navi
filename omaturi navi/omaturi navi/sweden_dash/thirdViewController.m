//
//  thirdViewController.m
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "thirdViewController.h"
#import "Annotation.h"
#import "CustomAnnotationView.h"

@interface thirdViewController ()

@end


@implementation thirdViewController{
    NSDate *_startUpdatingLocationAt;
    MKPointAnnotation *_mapAnnotation;
    Annotation *ann;
    CLLocation *recentLocation;
    UIView *backView;
}
@synthesize myMapView;
//@synthesize locationManager;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"a");
    
    
    /* コード実装
    // 画面全体に表示
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
    //[self.view addSubview:mapView];
    
    // ユーザの現在位置を表示
    //mapView.showsUserLocation = YES;
    
    // 地図の種類をハイブリッドにする
    //mapView.mapType = MKMapTypeHybrid;
    
    // デバイスの向きに合わせて地図を回転
    //[mapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
   */
    
    
    __errorLabel.textColor = [UIColor whiteColor];
    __errorLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    __errorLabel.layer.cornerRadius = 5;
    __errorLabel.clipsToBounds = true;
    __errorLabel.text = nil;
    __errorLabel.hidden = YES;
    
    backView = [[UIView alloc] init];
    backView.frame = CGRectMake(30, 30, 260, 40);
    backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    backView.layer.cornerRadius = 5;
    backView.clipsToBounds = true;
    [self.view addSubview:backView];
    [backView addSubview: _distanceLabel];
    
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;

    
    
    ann = [[Annotation alloc]initWithLocation:CLLocationCoordinate2DMake(59.3332,18.0643)];
    [myMapView addAnnotation:ann];
    ann.title = @"sweden";
    ann.locationType = @"sweden";
    
    /*
    //指定した大きさまで拡大
    [myMapView setRegion:MKCoordinateRegionMake(ann.coordinate, MKCoordinateSpanMake(59.3332,18.0643))];
     */
   [myMapView selectAnnotation:ann animated:YES];
    
    
    CLLocationCoordinate2D coors[4];
    // 渋谷、原宿、代々木、新宿
    coors[0] = CLLocationCoordinate2DMake(59.3332,18.0643);
    coors[1] = CLLocationCoordinate2DMake(35.670168, 139.702687);
    coors[2] = CLLocationCoordinate2DMake(35.683061, 139.702042);
    coors[3] = CLLocationCoordinate2DMake(35.690921, 139.700258);
    MKPolyline *line = [MKPolyline polylineWithCoordinates:coors
                                                     count:4];
    [myMapView addOverlay:line];
    
    //現在地を表示
     //myMapView.showsUserLocation = YES;
    // 地図の種類をハイブリッドにする
    myMapView.mapType = MKMapTypeHybrid;

}

- (MKOverlayView *)mapView:(MKMapView *)mapView
            viewForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineView *view = [[MKPolylineView alloc] initWithOverlay:overlay];
    view.strokeColor = [UIColor blueColor];
    view.lineWidth = 5.0;
    return view;
}


///////////////////////////////////////////////////////////////



//
//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
//    // If it's the user location, just return nil.
//    if ([annotation isKindOfClass:[MKUserLocation class]])
//        return nil;
//    
//    // Handle any custom annotations.
//    if ([annotation isKindOfClass:[Annotation class]]){
//        // Try to dequeue an existing pin view first.
//        CustomAnnotationView* pinView = (CustomAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
//        if (!pinView){
//            // If an existing pin view was not available, create one.
//            pinView = [[CustomAnnotationView alloc] initWithAnnotation:annotation
//                                                       reuseIdentifier:@"CustomPinAnnotationView"];
//            [pinView setPinColor:MKPinAnnotationColorGreen];
//            [pinView setAnimatesDrop:YES];
//            [pinView setCanShowCallout:YES];
//            [pinView setDraggable:YES];
//        }
//        else
//            pinView.annotation = annotation;
//        
//        return pinView;
//    }
//    
//    return nil;
//}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}








//////////////////////////////////////////////////////////////







//viewが非表示の時は位置情報取得する必要がないため、_locationManagerを解放するようにしておきます。
- (void)viewDidUnload
{
    [super viewDidUnload];
    
     [_locationManager stopUpdatingLocation];
    _locationManager.delegate = nil;
    _locationManager = nil;
}



- (void)viewDidAppear:(BOOL)animated
{
    //startUpdatingLocation：GPSの使用開始
    [_locationManager startUpdatingLocation];
    _startUpdatingLocationAt = [NSDate date];
    [self updateErrorLabelWithIgnoreAuthorized:YES];
    
    // 通知実行！
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleApplicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [_locationManager stopUpdatingLocation];
    _startUpdatingLocationAt = nil;
    //removeObserver:登録の解除
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//エラーラベルを更新するメソッド
- (void)updateErrorLabelWithIgnoreAuthorized:(BOOL)isIgnoreAuthorized
{
    
    // このアプリの位置情報サービスへの認証状態を取得する
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (isIgnoreAuthorized && (status == kCLAuthorizationStatusAuthorized)) {
        return;
        //kCLAuthorizationStatusAuthorized:ユーザにより位置情報サービスの利用が許可されている状態。
    }
    
    if (status == kCLAuthorizationStatusAuthorized) {
        __errorLabel.text = NSLocalizedString(@"Failed to get your location.", nil);
        
        //成功時表示するラベル
        backView.hidden = YES;
        _distanceLabel.hidden = YES;
    } else {
        __errorLabel.text = NSLocalizedString(@"Alert Location Service Disabled", nil);
        
        backView.hidden = YES;
        _distanceLabel.hidden = YES;
    }
    __errorLabel.hidden = NO;
    
    if (_mapAnnotation) {
        [myMapView removeAnnotation:_mapAnnotation];
        _mapAnnotation = nil;
    }
}



#pragma mark - NSNotification

//設定を開いて位置情報サービスのオン・オフを切り替えて、アプリに戻ってきた時のため。位置情報サービスの状態をチェックしエラー表示を更新します。
- (void)handleApplicationDidBecomeActive:(NSNotification *)notitication
{
    [self updateErrorLabelWithIgnoreAuthorized:YES];
}


//位置情報取得成功のdelegate。マップの中心位置とピンの位置を更新する
//didupdatelocations:緯度、経度を取得する為に使う
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    recentLocation = locations.lastObject;
    if (recentLocation.timestamp.timeIntervalSince1970 < _startUpdatingLocationAt.timeIntervalSince1970) {
        // 今回のstartUpdatingLocationによる位置情報で無い時は無視
        return;
    }
    //地図を現在地へ移動
    [myMapView setCenterCoordinate:recentLocation.coordinate animated:YES];
    //現在地への移動を停止。更新の度（？）に呼びだされるとうざい
    [_locationManager stopUpdatingLocation];
    
    //ピンに関して
    if (_mapAnnotation == nil) {
        _mapAnnotation = [[MKPointAnnotation alloc] init];
        _mapAnnotation.title = @"現在地";
        [myMapView addAnnotation:_mapAnnotation];
    }
    _mapAnnotation.coordinate = recentLocation.coordinate;
    
    
    
    __errorLabel.text = nil;
    __errorLabel.hidden = YES;
    
    
    
    
    
    ////////////////////////////
    // スウェーデンの経緯・緯度を設定
    double latA = 59.3332;
    double lngA = 18.0643;
    
    // 経緯・緯度からCLLocationを作成
    CLLocation *A = [[CLLocation alloc] initWithLatitude:latA longitude:lngA];
    
    // 距離計算
    CLLocationDistance distance = [A distanceFromLocation:recentLocation];
    [_distanceLabel setText: [NSString stringWithFormat:@"Distance to sweden %4.0f m.",distance]];
   


    ///////////////////////////
    
    
    
    NSLog(@"Updated location:%f %f timestamp:%@", recentLocation.coordinate.latitude, recentLocation.coordinate.longitude, recentLocation.timestamp.description);
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self updateErrorLabelWithIgnoreAuthorized:NO];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




















- (IBAction)hereTap:(id)sender {
    NSLog(@"a");
    
    [myMapView setCenterCoordinate:recentLocation.coordinate animated:YES];
    
}

- (IBAction)swedenTap:(id)sender {
    NSLog(@"b");
    
    [myMapView setCenterCoordinate:ann.coordinate animated:YES];
}






@end

