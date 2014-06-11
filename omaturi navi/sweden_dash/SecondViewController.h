//
//  SecondViewController.h
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"
#import "contentsView.h"



@interface SecondViewController : UIViewController
<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *imgArray;
    NSArray *imgs;
    NSArray *explain;
    NSArray *name;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end
