//
//  FirstViewController.m
//  sweden_dash
//
//  Created by kazuhiro on 2014/02/03.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "FirstViewController.h"
#import "SWRevealViewController.h"
#import <CoreLocation/CoreLocation.h>

@implementation SWUITableViewCell
@end


@interface FirstViewController ()

@end



@implementation FirstViewController
@synthesize center;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    self.myTable.dataSource = self;
    self.myTable.delegate = self;
    
    
    /////////////////////変数

    NSArray *asia = @[@"シヌルグ",
                      @"水かけ祭り（ソンクラーン）",
                      @"ハルビン氷祭り",
                      @"ホーリー祭",
                      @"クルクプナル",
                      @"保寧マッドフェスティバル",
                      @"台湾ランタン祭り"];
    NSArray *euro = @[@"ロケット花火祭り",
                      @"チーズ転がし祭り",
                      @"トマティーナ（トマト投げ祭り）",
                      @"牛追い祭り（サンフェルミン）",
                      @"オレンジ投げ祭り（イブレアカーニバル）",
                      @"ウップ・ヘリー・アー",
                      @"トゥモローランド",
                      @"オクトーバーフェスト",
                      ];
    NSArray *africa = @[@"砂漠のフェスティバル"];
    NSArray *nouth = @[@"バーニングマン", @"死者の日" ,@"メガボンバー", @"ワンダーラスト・ヨガ・フェスティバル"];
    NSArray *south = @[@"リオのカーニバル"];
    NSArray *oseania = @[@"スイカ祭り"];
    NSArray *world = [NSArray arrayWithObjects:asia, euro, africa, nouth, south, oseania, nil];

    
    latAsia = @[@"10.311579", @"18.787742", @"45.802270", @"27.485656", @"41.681808", @"36.333163", @"25.034598"];
    latEuro = @[@"38.362864", @"51.864245", @"39.424357", @"42.811663", @"45.467276", @"60.160218", @"51.086080", @"48.135125"];
    latAfrica = @[@"15.145346"];
    latNouth = @[@"40.949035", @"14.103746", @"17.562415",@"19.896766"];
    latSouth = @[@"-22.913395"];
    latOseania = @[@"-26.739435"];
    
    lonAsia = @[@"123.895935", @"98.993108", @"126.536260", @"77.916746", @"26.562269", @"126.612944", @" 121.753740"];
    lonEuro = @[@"26.123557", @"-2.238156", @"-0.786317", @"-1.648265", @"7.880059", @"-1.123025", @"4.366330", @"11.581981"];
    lonAfrica = @[@"-5.493053"];
    lonNouth = @[@"-118.887653", @"-87.20482", @"-99.513955", @"-155.582782"];
    lonSouth = @[@"-43.200710"];
    lonOseania = @[@"150.625063"];
 

    
    


    title =@[@"アジア", @"ヨーロッパ", @"アフリカ", @"北アメリカ", @"南アメリカ", @"オセアニア"];
    
    title_Cell = [[NSDictionary alloc]initWithObjects:world forKeys:title];
    
    

    //改善点１：デリゲートメソッドで。。
    //ナビゲーションバーの色を変更
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2667 green:0.5216 blue:0.9608 alpha:1.0000];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
  

}




//セクションに含まれる行の数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id key = [title objectAtIndex:section];
    return [[title_Cell objectForKey:key]count];
}


//セクションの数を返す
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [title count];
    
}


//section番目のセクション名を返す
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [title objectAtIndex:section];

}


//indexpathで指定された箇所のセルを作る
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"map";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:identifier];
    }
    id key = [title objectAtIndex:indexPath.section];
    
    //タイトル名を記述するテキスト
    NSString *textCell = [[title_Cell objectForKey:key]objectAtIndex:indexPath.row ];
    //NSString *cellText =[text objectAtIndex:indexPath.row];
    cell.textLabel.text = textCell;

    
    return cell;
}




//セルをタップしたときの動作
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UINavigationController *nv = (UINavigationController *)self.revealViewController.frontViewController;
    mapViewController* vc = (mapViewController *)(nv.viewControllers[0]);
    
    
    FrontViewPosition toogledFrontViewPosition = FrontViewPositionLeft;
        toogledFrontViewPosition = FrontViewPositionRight;
   
    
    if (indexPath.section == 0) {
        lat_map = [latAsia objectAtIndex:indexPath.row];
        lon_map = [lonAsia objectAtIndex:indexPath.row];

    }else if (indexPath.section == 1){
        lat_map = [latEuro objectAtIndex:indexPath.row];
        lon_map = [lonEuro objectAtIndex:indexPath.row];
        
    }else if (indexPath.section == 2){
        lat_map = [latAfrica objectAtIndex:indexPath.row];
        lon_map = [lonAfrica objectAtIndex:indexPath.row];

    }else if (indexPath.section == 3){
        lat_map = [latNouth objectAtIndex:indexPath.row];
        lon_map = [lonNouth objectAtIndex:indexPath.row];
        
    }else if (indexPath.section == 4){
        lat_map = [latSouth objectAtIndex:indexPath.row];
        lon_map = [lonSouth objectAtIndex:indexPath.row];

    }else if (indexPath.section == 5){
        lat_map = [latOseania objectAtIndex:indexPath.row];
        lon_map = [lonOseania objectAtIndex:indexPath.row];

    }
    //calloutを消す
    [vc closeAnnotation:NO];
    
    
    [vc setLocationCoodinate:CLLocationCoordinate2DMake([lat_map doubleValue], [lon_map doubleValue])];
    [self.revealViewController revealToggleAnimated:YES];
    
    
    //セレクトした後に解放
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
