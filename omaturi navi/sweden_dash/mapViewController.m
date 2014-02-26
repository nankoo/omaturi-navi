//
//  mapViewController.m
//  BG
//
//  Created by kazuhiro on 2014/02/26.
//  Copyright (c) 2014年 kazuhiro. All rights reserved.
//

#import "mapViewController.h"
#import "CustomAnnotation.h"

@interface mapViewController ()

@end

@implementation mapViewController{
    NSArray *Title;
    NSArray *subTitle;
    NSArray *Coodinate;
}

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */

@synthesize locationManager;
@synthesize myMapView;



- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //self.myMapView.dataSource = self;
    self.myMapView.delegate = self;
    
    
    locationManager = [[CLLocationManager alloc] init];
    
    // 位置情報サービスが利用できるかどうかをチェック
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager.delegate = self; // ……【1】
        // 測位開始
        [locationManager startUpdatingLocation];
    } else {
        NSLog(@"Location services not available.");
    }
    
    
    /*
    [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(35.685623,139.763153)
                                                   title:@"大手町駅"
                                                subtitle:@"千代田線・半蔵門線・丸ノ内線・東西線・三田線"]];
  
*/
    
    
    ////////
  
    imgArray = @[@"1.jpg", @"2.jpg", @"3.jpeg", @"4.jpg", @"5.jpeg", @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", @"11.jpg", @"12.jpg"];
    UIImage *im1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *im2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *im3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *im4 = [UIImage imageNamed:@"4.jpg"];
    UIImage *im5 = [UIImage imageNamed:@"5.jpg"];
    UIImage *im6 = [UIImage imageNamed:@"6.jpg"];
    UIImage *im7 = [UIImage imageNamed:@"7.jpg"];
    UIImage *im8 = [UIImage imageNamed:@"8.jpg"];
    UIImage *im9 = [UIImage imageNamed:@"9.jpg"];
    UIImage *im10 = [UIImage imageNamed:@"10.jpg"];
    UIImage *im11 = [UIImage imageNamed:@"11.jpg"];
    UIImage *im12 = [UIImage imageNamed:@"12.jpg"];
    imgs = [NSArray arrayWithObjects:im1, im2, im3, im4, im5, im6, im7, im8, im9,im10, im11, im12, nil];
    
    explain = @[@"【死者の日】\n\n”11月1〜2日”\n\n死者の日には家族や友人達が集い、故人への思いを馳せて語り合う。祝祭はカトリックにおける諸聖人の日である11月1日と翌日2日に行われる。地域によっては、10月31日の晩も前夜祭として祝われる。市街地はマリーゴールドの香りに包まれ、公園には露店が立ち並ぶ。11月1日は子供の魂が、2日は大人の魂が戻る日とされ、供え物がチョコレートなどのお菓子からメスカルなどの酒に変わっていく。日本のお盆に近い位置付けであるが、あくまで楽しく明るく祝うのが特徴である。死を恐怖するのではなく、逆にあざ笑うというモチーフとなっている。墓地にも派手な装飾が施され、夜間にはバンドによる演奏なども行われる。カボチャを飾り仮装をしてパーティを行うなど、ハロウィンとも共通する点が多くあり、実際にルーツは近似している部分がある。",
                @"【ロケット花火祭り】\n\n”４月”\n\n世界的にも有名なギリシャ・ヒオス島（キオス島）のイースター（復活祭）行事「ロケット花火祭り」。2つの教会同士でロケット花火を打ち合うもので、その数一晩に65,000発以上です。",
                @"【シヌルグ】\n\n”１月”\n\n毎年１月に行われるセブ島最大のお祭り「Sinulog（シヌログ）」。サント・ニーニョ（幼きイエス / Sto. Nino）を祝うシヌログ祭は9日間続きます。ビサヤ語（セブアノ語）であるシヌログは踊りを意味する言葉で、お祭り期間中にはセブ住民の華麗なるダンスを楽しめます。\n1月11日のシヌログキックオフを皮切りにパレード、コンテスト、写真展など街中でさまざまなイベントが開催されます。フィナーレのパレードは1月3週目の日曜日に開催されます。サウスバスターミナルからアビリアナスポーツセンターまで約5kmの道のりを各地から選出された50組のダンサーがパレードします！",
                @"【チーズ転がし祭り】\n\n”５月”\n\n丘の頂上から丸型のダブルグロスターチーズ(Double Gloucester cheese)が転がされ、競技者たちがそれを追いかけて丘を駆け下りる。丘のふもとに引かれたゴールラインを最初に超えた者がチーズを獲得する。\n理論上、競技者たちの目的はチーズを捕まえることであるが、一秒ほど先にスタートしたチーズの速度は時速70マイル（時速112キロメートル）にも達することがあり、観客をなぎ倒すほどの勢いを持つこの物体を捕まえることは不可能に近い。",
                @"【トマティーナ（トマト投げ祭り）】\n\n”８月”\n\nトマティーナは前夜祭から始まる。前夜祭といっても特別な催し物があるわけではないが、街はイルミネーションで飾り付けられ、大通りには屋台が立ち並び、街中には移動遊園地などもやってきて、互いに酒を飲んだりダンスをしたりして盛り上がる。\nなおトマトをぶつけられては困るものや、一部の家屋では、トマトで汚されないよう通りに面している壁をビニールシートなどで覆うことで祭りに備える。これらは市から補助金が出る。",
                @"【バーニングマン】\n\n”８〜９月”\n\nバーニング・マンは、アメリカ北西部の人里離れた荒野で年に一度、約一週間に渡って開催される。会場となるブラックロック砂漠は、ネバダ州リノ市の約150km北北東に位置する乾湖である。\n各参加者は、この「プラーヤ」(Playa)と呼ばれる何もない塩類平原に街を作り上げ、新たに出会った隣人たちと共同生活を営み、そこで自分を表現しながら生き抜く。そして一週間後、すべてを無に還す。この実験的な地域社会は、みずからを架空の都市「ブラックロック・シティ」と呼称している。",
                @"【水かけ祭り（ソンクラーン）】\n\n”４月１３〜１５日”\n\nもともとは、純粋に新年のお祝いであり、家族が一堂に集って共同で仏像のお清めを行ったり、年輩の家族のお清めを行う期間であったが、ソンクラーンが一年でもっとも暑い時期に行われることなどから、特に若年層を中心に、単なる水掛け祭りに変質している。\nこの「祭り」においては見ず知らずの相手にさえ水を掛け合う。この場合、水を掛けるところは手のみに限定されず、水をかける行為自体「敬意を払う」ため無礼講状態となる（ただし、僧侶には水をかけない）。水の掛け合いには水鉄砲を用いる。他にも、家の前に水の入ったドラム缶を置くあるいは家の前までホースを延長させ、道行く人に水をかけたり、ピックアップトラックの積み荷部分に水の入ったドラム缶を載せ、町中の人に水をかけまわっている例もある。",
                @"【リオのカーニバル】\n\n”２月”\n\nカーニバル（謝肉祭）は世界中のカトリックの国の祭りで現在も行われており、以前は特にリスボンのカーニバルなども有名です。\nリオのカーニヴァルは世界中で最も熱狂的といわれており、この期間世界中から集まる見物客で市内は２倍にも３倍にも膨らむともいわれております。官公庁も休みとなり、リオの住人は大人、子供も各々の衣装を身に着け、お金の無い人も有る人もそれぞれ４日間狂ったように楽しみます。また、他州・外国からもカーニヴァルに参加する人がたくさんいます。",
                @"【メガボンバー】\n\n”３〜５月”\n\nこのお祭りは爆薬をテープでしっかりと括りつけて鉄板らしきものをめがけて思い切り振り下ろすというもので、毎年2万人ほどのヒトが参加するそうです。\n参加者の中には、振り下ろした際の爆風で吹き飛ばされる人も多く、怪我防止のために武装する事がお勧めされます",
                @"【牛追い祭り（サンフェルミン）】\n\n”７月６〜１４日”\n\nサン・フェルミンは9日間の間行われます。この期間中、牛追いだけではなく、毎日朝はやくから夜中の12時まで、ダンスや行進など、様々な催し物が開催されます。\nちなみにこの牛追い、スペイン語で「エンシエロ」囲い込むという意味の名前で呼ばれており、もともとこの牛追いは闘牛で使われる牛を闘牛場まで運ぶことが本来の目的だったと言われています。",
                @"【オレンジ投げ祭り（イブレアカーニバル）】\n\n”３月２〜４日”\n\nパレードなど通常のカーニバルもありますがメインイベントは期間中最後の3日間にはオレンジを投げあう「オレンジ合戦」が催されます。\n起源は中世の独裁君主に、民衆が一揆を起こしたという歴史に由来しているそうです。合戦は街区ごとに9チームに分かれ、5カ所の広場で繰り広げられます。",
                @"【スイカ祭り】\n\n”２月”\n\n世界中のスイカ好きが集まる世界でも類をみないお祭り、それが「スイカ祭り」"];
    

    ////////
    
    
    
     
     /*
     お祭りのアノテーション
     ・死者の日（メキシコシティ：）
     ・ロケット花火祭り（キオス島：）
     ・シヌルグ（セブ：２月）
     ・チーズ転がし祭り（イングランド：）
     ・トマティーナ（トマト投げ祭り）（スペイン：）
     ・バーニングマン（アメリカ：）
     ・水掛祭り（チェンマイ：）
     ・リオのカーニバル（リオデジャネイロ：）
     ・メガボンバー（メキシコ：）
     ・牛追い祭り（スペイン：）
     ・オレンジ投げ祭り（イタリア：）
     ・スイカ祭り（オーストラリア：）
     
     */
    Title = @[@"死者の日", @"ロケット花火祭り", @"シヌルグ", @"チーズ転がし祭り", @"トマト投げ祭り（トマティーナ）", @"バーニングマン", @"水かけ祭り（ソンクラーン）", @"リオのカーニバル", @"メガボンバー", @"牛追い祭り（サンフェルミン）", @"オレンジ投げ祭り（イブレアカーニバル）", @"スイカ祭り"];
    subTitle = @[@"Nov,", @"Apr,", @"Jan,", @"May,", @"Aug,", @"Aug,", @"Apr,", @"Feb,", @"Feb,", @"Jul,", @"Mar,", @"Feb,"];
    Coodinate = @[@"14.103746, -87.20482", @"38.362864, 26.123557", @"10.311579, 123.895935", @"51.864245, -2.238156", @"39.424357, -0.786317", @"40.949035, -118.887653", @"18.787742, 98.993108", @"-22.913395, -43.200710", @"17.562415, -99.513955", @"42.811663, -1.648265", @"45.467276, 7.880059", @"-26.739435, 150.625063"];
    
    [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(14.103746, -87.20482)
                                                   title:@"死者の日"
                                                subtitle:@"Nov,"
      ]];
    
    
    // day of the die
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(14.103746, -87.20482)
     title:@"死者の日"
     subtitle:@"Nov,"
      ]];
    
    // rocket fireworks
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(38.362864, 26.123557)
     title:@"ロケット花火祭り"
     subtitle:@"Apr,"]];
    
    // sinulog
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(10.311579, 123.895935)
     title:@"シヌルグ"
     subtitle:@"Jan,"]];
    
    // rolling cheez
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(51.864245, -2.238156)
     title:@"チーズ転がし祭り"
     subtitle:@"May,"]];
    
    // tomato
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(39.424357, -0.786317)
     title:@"トマト投げ祭り（トマティーナ）"
     subtitle:@"Aug,"]];
    
    // burning man
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(40.949035, -118.887653)
     title:@"バーニングマン"
     subtitle:@"Aug,"]];
    
    // water festival
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(18.787742, 98.993108)
     title:@"水かけ祭り（ソンクラーン）"
     subtitle:@"Apr,"]];
    
    // rio carnival
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(-22.913395, -43.200710)
     title:@"リオのカーニバル"
     subtitle:@"Feb,"]];
    
    // mega bomber
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(17.562415, -99.513955)
     title:@"メガボンバー"
     subtitle:@"Feb,"]];
    
    // cow festival
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(42.811663, -1.648265)
     title:@"牛追い祭り（サンフェルミン）"
     subtitle:@"Jul,"]];
    
    // iburea carnival
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(45.467276, 7.880059)
     title:@"オレンジ投げ祭り（イブレアカーニバル）"
     subtitle:@"Mar,"]];
    
    // water melon festival
     [myMapView addAnnotation:
     [[CustomAnnotation alloc]initWithLocationCoordinate:CLLocationCoordinate2DMake(-26.739435, 150.625063)
     title:@"スイカ祭り"
     subtitle:@"Feb,"]];
     
    
    
    
    //ナビゲーションバーの色を変更
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.2667 green:0.5216 blue:0.9608 alpha:1.0000];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UILabel *labelTop = [[UILabel alloc] initWithFrame:CGRectZero];
    labelTop.font = [UIFont boldSystemFontOfSize:20.0];
    labelTop.textColor = [UIColor whiteColor]; // 好きな文字色にする
    self.navigationItem.titleView = labelTop;
    labelTop.text = NSLocalizedString(@"omaturi navi", @"");//好きな文字を入れる
    [labelTop sizeToFit];
    

    

    //myMapView.showsUserLocation = YES;
    // 現在地を追従する
    //[myMapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
}


// 位置情報更新時
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    //緯度・経度を出力
    NSLog(@"didUpdateToLocation latitude=%f, longitude=%f",
          [newLocation coordinate].latitude,
          [newLocation coordinate].longitude);
    
    MKCoordinateRegion region = MKCoordinateRegionMake([newLocation coordinate], MKCoordinateSpanMake(1.75, 1.75));
    [myMapView setCenterCoordinate:[newLocation coordinate]];
    [locationManager stopUpdatingLocation];
    [myMapView setRegion:region];
    
}

// 測位失敗時や、5位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError");
    
}


-(void) onResume {
    if (nil == locationManager && [CLLocationManager locationServicesEnabled])
        [locationManager startUpdatingLocation]; //測位再開
}

-(void) onPause {
    if (nil == locationManager && [CLLocationManager locationServicesEnabled])
        [locationManager stopUpdatingLocation]; //測位停止
}

//duplicate〜〜は重複しているサイン


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id )annotation
{
    static NSString* Identifier = @"PinAnnotationIdentifier";
    MKPinAnnotationView* pinView = (MKPinAnnotationView *)[mapView
                                                           dequeueReusableAnnotationViewWithIdentifier:Identifier];
    
    if (pinView == nil) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                  reuseIdentifier:Identifier];
        
        //  デスクロージャ追加
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = rightButton;
        //コールアウト表示
        pinView.canShowCallout = YES;
        
        return pinView;
    }
    pinView.annotation = annotation;
    return pinView;
}

//  デスクロージャタップ対応
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    printf("tap DetailDisclosure\n");
    contentsView *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentsView"];
    /*
    if (AnnotationView.annotation.title = @"死者の日") {
        NSLog(@"a");
    }
    */
    
    if ([view.annotation.title isEqualToString:@"死者の日"]) {
    viewController.myStr = @"【死者の日】\n\n”11月1〜2日”\n\n死者の日には家族や友人達が集い、故人への思いを馳せて語り合う。祝祭はカトリックにおける諸聖人の日である11月1日と翌日2日に行われる。地域によっては、10月31日の晩も前夜祭として祝われる。市街地はマリーゴールドの香りに包まれ、公園には露店が立ち並ぶ。11月1日は子供の魂が、2日は大人の魂が戻る日とされ、供え物がチョコレートなどのお菓子からメスカルなどの酒に変わっていく。日本のお盆に近い位置付けであるが、あくまで楽しく明るく祝うのが特徴である。死を恐怖するのではなく、逆にあざ笑うというモチーフとなっている。墓地にも派手な装飾が施され、夜間にはバンドによる演奏なども行われる。カボチャを飾り仮装をしてパーティを行うなど、ハロウィンとも共通する点が多くあり、実際にルーツは近似している部分がある。";
        
        viewController.swedenImg = [UIImage imageNamed:@"1.jpg"];
    [self.navigationController pushViewController:viewController animated:YES];
    
        
    }else if([view.annotation.title isEqualToString:@"ロケット花火祭り"]){
        viewController.myStr = @"【ロケット花火祭り】\n\n”４月”\n\n世界的にも有名なギリシャ・ヒオス島（キオス島）のイースター（復活祭）行事「ロケット花火祭り」。2つの教会同士でロケット花火を打ち合うもので、その数一晩に65,000発以上です。";
        
        viewController.swedenImg = [UIImage imageNamed:@"2.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
    
        
    }else if([view.annotation.title isEqualToString:@"シヌルグ"]){
        viewController.myStr = @"【シヌルグ】\n\n”１月”\n\n毎年１月に行われるセブ島最大のお祭り「Sinulog（シヌログ）」。サント・ニーニョ（幼きイエス / Sto. Nino）を祝うシヌログ祭は9日間続きます。ビサヤ語（セブアノ語）であるシヌログは踊りを意味する言葉で、お祭り期間中にはセブ住民の華麗なるダンスを楽しめます。\n1月11日のシヌログキックオフを皮切りにパレード、コンテスト、写真展など街中でさまざまなイベントが開催されます。フィナーレのパレードは1月3週目の日曜日に開催されます。サウスバスターミナルからアビリアナスポーツセンターまで約5kmの道のりを各地から選出された50組のダンサーがパレードします！";
        
        viewController.swedenImg = [UIImage imageNamed:@"3.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
    
        
    }else if([view.annotation.title isEqualToString:@"チーズ転がし祭り"]){
        viewController.myStr = @"【チーズ転がし祭り】\n\n”５月”\n\n丘の頂上から丸型のダブルグロスターチーズ(Double Gloucester cheese)が転がされ、競技者たちがそれを追いかけて丘を駆け下りる。丘のふもとに引かれたゴールラインを最初に超えた者がチーズを獲得する。\n理論上、競技者たちの目的はチーズを捕まえることであるが、一秒ほど先にスタートしたチーズの速度は時速70マイル（時速112キロメートル）にも達することがあり、観客をなぎ倒すほどの勢いを持つこの物体を捕まえることは不可能に近い。";
        
        viewController.swedenImg = [UIImage imageNamed:@"4.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
   
        
    }else if([view.annotation.title isEqualToString:@"トマティーナ（トマト投げ祭り）"]){
        
        viewController.myStr = @"【トマティーナ（トマト投げ祭り）】\n\n”８月”\n\nトマティーナは前夜祭から始まる。前夜祭といっても特別な催し物があるわけではないが、街はイルミネーションで飾り付けられ、大通りには屋台が立ち並び、街中には移動遊園地などもやってきて、互いに酒を飲んだりダンスをしたりして盛り上がる。\nなおトマトをぶつけられては困るものや、一部の家屋では、トマトで汚されないよう通りに面している壁をビニールシートなどで覆うことで祭りに備える。これらは市から補助金が出る。";
        
        viewController.swedenImg = [UIImage imageNamed:@"5.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
  
        
    }else if([view.annotation.title isEqualToString:@"バーニングマン"]){
        viewController.myStr = @"【バーニングマン】\n\n”８〜９月”\n\nバーニング・マンは、アメリカ北西部の人里離れた荒野で年に一度、約一週間に渡って開催される。会場となるブラックロック砂漠は、ネバダ州リノ市の約150km北北東に位置する乾湖である。\n各参加者は、この「プラーヤ」(Playa)と呼ばれる何もない塩類平原に街を作り上げ、新たに出会った隣人たちと共同生活を営み、そこで自分を表現しながら生き抜く。そして一週間後、すべてを無に還す。この実験的な地域社会は、みずからを架空の都市「ブラックロック・シティ」と呼称している。";
        
        viewController.swedenImg = [UIImage imageNamed:@"6.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
   
        
    }else if([view.annotation.title isEqualToString:@"水かけ祭り（ソンクラーン）"]){
        
        viewController.myStr =  @"【水かけ祭り（ソンクラーン）】\n\n”４月１３〜１５日”\n\nもともとは、純粋に新年のお祝いであり、家族が一堂に集って共同で仏像のお清めを行ったり、年輩の家族のお清めを行う期間であったが、ソンクラーンが一年でもっとも暑い時期に行われることなどから、特に若年層を中心に、単なる水掛け祭りに変質している。\nこの「祭り」においては見ず知らずの相手にさえ水を掛け合う。この場合、水を掛けるところは手のみに限定されず、水をかける行為自体「敬意を払う」ため無礼講状態となる（ただし、僧侶には水をかけない）。水の掛け合いには水鉄砲を用いる。他にも、家の前に水の入ったドラム缶を置くあるいは家の前までホースを延長させ、道行く人に水をかけたり、ピックアップトラックの積み荷部分に水の入ったドラム缶を載せ、町中の人に水をかけまわっている例もある。";
        
        viewController.swedenImg = [UIImage imageNamed:@"7.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
   
        
    }else if([view.annotation.title isEqualToString:@"リオのカーニバル"]){
        viewController.myStr = @"【リオのカーニバル】\n\n”２月”\n\nカーニバル（謝肉祭）は世界中のカトリックの国の祭りで現在も行われており、以前は特にリスボンのカーニバルなども有名です。\nリオのカーニヴァルは世界中で最も熱狂的といわれており、この期間世界中から集まる見物客で市内は２倍にも３倍にも膨らむともいわれております。官公庁も休みとなり、リオの住人は大人、子供も各々の衣装を身に着け、お金の無い人も有る人もそれぞれ４日間狂ったように楽しみます。また、他州・外国からもカーニヴァルに参加する人がたくさんいます。";
        
        viewController.swedenImg = [UIImage imageNamed:@"8.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
    
        
    }else if([view.annotation.title isEqualToString:@"メガボンバー"]){
        viewController.myStr = @"【メガボンバー】\n\n”３〜５月”\n\nこのお祭りは爆薬をテープでしっかりと括りつけて鉄板らしきものをめがけて思い切り振り下ろすというもので、毎年2万人ほどのヒトが参加するそうです。\n参加者の中には、振り下ろした際の爆風で吹き飛ばされる人も多く、怪我防止のために武装する事がお勧めされます";
        
        viewController.swedenImg = [UIImage imageNamed:@"9.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
    
        
    }else if([view.annotation.title isEqualToString:@"牛追い祭り（サンフェルミン）"]){
        viewController.myStr = @"【牛追い祭り（サンフェルミン）】\n\n”７月６〜１４日”\n\nサン・フェルミンは9日間の間行われます。この期間中、牛追いだけではなく、毎日朝はやくから夜中の12時まで、ダンスや行進など、様々な催し物が開催されます。\nちなみにこの牛追い、スペイン語で「エンシエロ」囲い込むという意味の名前で呼ばれており、もともとこの牛追いは闘牛で使われる牛を闘牛場まで運ぶことが本来の目的だったと言われています。";
        
        viewController.swedenImg = [UIImage imageNamed:@"10.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
   
        
    }else if([view.annotation.title isEqualToString:@"オレンジ投げ祭り（イブレアカーニバル）"]){
        viewController.myStr = @"【オレンジ投げ祭り（イブレアカーニバル）】\n\n”３月２〜４日”\n\nパレードなど通常のカーニバルもありますがメインイベントは期間中最後の3日間にはオレンジを投げあう「オレンジ合戦」が催されます。\n起源は中世の独裁君主に、民衆が一揆を起こしたという歴史に由来しているそうです。合戦は街区ごとに9チームに分かれ、5カ所の広場で繰り広げられます。";
        
        viewController.swedenImg = [UIImage imageNamed:@"11.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
    
    }else{
        
        viewController.myStr = @"【スイカ祭り】\n\n”２月”\n\n世界中のスイカ好きが集まる世界でも類をみないお祭り、それが「スイカ祭り」";
        
        viewController.swedenImg = [UIImage imageNamed:@"12.jpg"];
        [self.navigationController pushViewController:viewController animated:YES];
    }
  
}

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"annotationSegue"]) {
        contentsView *contents = (contentsView *)[segue destinationViewController];
    
        if (CustomAnnotation.annotation.title == @"死者の日") {
            contents.myStr = @"【死者の日】\n\n”11月1〜2日”\n\n死者の日には家族や友人達が集い、故人への思いを馳せて語り合う。祝祭はカトリックにおける諸聖人の日である11月1日と翌日2日に行われる。地域によっては、10月31日の晩も前夜祭として祝われる。市街地はマリーゴールドの香りに包まれ、公園には露店が立ち並ぶ。11月1日は子供の魂が、2日は大人の魂が戻る日とされ、供え物がチョコレートなどのお菓子からメスカルなどの酒に変わっていく。日本のお盆に近い位置付けであるが、あくまで楽しく明るく祝うのが特徴である。死を恐怖するのではなく、逆にあざ笑うというモチーフとなっている。墓地にも派手な装飾が施され、夜間にはバンドによる演奏なども行われる。カボチャを飾り仮装をしてパーティを行うなど、ハロウィンとも共通する点が多くあり、実際にルーツは近似している部分がある。";
    
            contents.swedenImg =
            
            
            }else{

            }
        }
        
    }
    
}
 */


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
