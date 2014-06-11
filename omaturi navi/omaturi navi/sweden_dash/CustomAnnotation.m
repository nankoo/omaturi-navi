//
//  CustomAnnotation.m
//  BG
//
//  Created by kazuhiro on 2014/02/26.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "CustomAnnotation.h"


@implementation CustomAnnotation


@synthesize coordinate;
@synthesize annotationTitle;
@synthesize annotationSubtitle;



- (NSString *)title {
    return annotationTitle;
}

- (NSString *)subtitle {
    return annotationSubtitle;
}

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle subtitle:(NSString *)_annotationSubtitle {
    coordinate = _coordinate;
    self.annotationTitle = _annotationTitle;
    self.annotationSubtitle = _annotationSubtitle;
    return self;
}




@end
