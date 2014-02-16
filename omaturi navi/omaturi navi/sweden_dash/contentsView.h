//
//  contentsView.h
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface contentsView : UIViewController<UIScrollViewDelegate>
{
    
    NSString *myStr;
    UIImage *swedenImg;
    
}
@property(nonatomic, retain)NSString *myStr;
@property(nonatomic, retain)UIImage *swedenImg;



@end
