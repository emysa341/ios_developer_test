//
//  TempViewController.m
//  Converter
//
//  Created by Ammad on 08/04/16.
//  Copyright © 2016 Emy. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@end

@implementation TempViewController
@synthesize CLabel1,CLabel2,CTextField;
@synthesize FLabel1,FLabel2,FTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Temperature";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    
    [self.CTextField setReturnKeyType:UIReturnKeyDone];
    [self.CTextField addTarget:self
                       action:@selector(CAction:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.FTextField setReturnKeyType:UIReturnKeyDone];
    [self.FTextField addTarget:self
                        action:@selector(FAction:)
              forControlEvents:UIControlEventEditingDidEndOnExit];
}

-(void)CAction:(id)sender
{
    CLabel2.text = CTextField.text;
   double F = [self ConvertCelsiusToFahrenheit:[CTextField.text doubleValue]];
    FTextField.text = [NSString stringWithFormat:@"%f",F];
    FLabel2.text = [NSString stringWithFormat:@"%f",F];
    CLabel1.textColor = [UIColor redColor];
    FLabel1.textColor = [UIColor greenColor];
    
}

-(void)FAction:(id)sender
{
    FLabel2.text = FTextField.text;
    double C = [self ConvertFahrenheitToCelsius:[FTextField.text doubleValue]];
    CTextField.text = [NSString stringWithFormat:@"%f",C];
    CLabel2.text = [NSString stringWithFormat:@"%f",C];
    FLabel1.textColor = [UIColor redColor];
    CLabel1.textColor = [UIColor greenColor];
}

- (double) ConvertCelsiusToFahrenheit:(double)c
{
    return ((9.0 / 5.0) * c) + 32;
}

- (double) ConvertFahrenheitToCelsius:(double)f
{
    return (5.0 / 9.0) * (f - 32);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
