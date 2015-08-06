//
//  ViewController.m
//  iweather
//
//  Created by dat on 7/30/15.
//  Copyright (c) 2015 dat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *doC;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"một con ngựa đau cả tàu bỏ cỏ", @"có công mài sắt có ngày lên kim", @"chớ thấy sóng cả mà ngã tay chèo", @"đi một ngày đàng học một sàng khôn"];
    locations = @[@"hai ba trung, hanoi", @"sydney, australia", @"newyork, usa"];
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex= arc4random_uniform(quotes.count);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex= arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];

    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    NSString* string =[NSString stringWithFormat:@"%2.1f" , [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    
}
- (float)getTemperature{
    return 14.0 +arc4random_uniform(18)+ (float)arc4random()/(float)INT32_MAX;
}
- (IBAction)changeC:(id)sender {
    if([self.doC.text isEqualToString:@"C"]){
        self.doC.text = @"F";
    } else {
        self.doC.text = @"C";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
