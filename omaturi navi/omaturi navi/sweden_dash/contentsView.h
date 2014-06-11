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
    //お祭りの詳細テキストのプロパティ
    NSString *myStr;
    //お祭りの詳細イメージのプロパティ
    UIImage *contents_img;
    
}
@property(nonatomic, retain)NSString *myStr;
@property(nonatomic, retain)UIImage *contents_img;



@end
