//
//  MainViewController.m
//  Converter
//
//  Created by Ammad on 07/04/16.
//  Copyright © 2016 Emy. All rights reserved.
//

#import "MainViewController.h"
#define ButtonHeight 35

#define OffsetBetweenButtons 10

#define ButtonHeightPlusOffsetBetweenButtons (ButtonHeight+OffsetBetweenButtons)

@interface MainViewController ()

@end
int NumberOfConverters=5;
NSMutableArray *myArray;

@implementation MainViewController
@synthesize ScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Select";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationItem.backBarButtonItem setTitle:@""];
    
    [self DrawButtons:NumberOfConverters];
}

-(void)DrawButtons:(int) Nr
{
    for (int i=0;i<Nr;i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [myArray addObject:button];
        [button addTarget:self
                   action:@selector(ButtonAction:)
         forControlEvents:UIControlEventTouchUpInside];
               button.backgroundColor = UIColorFromRGB(0x384093);
        button.titleLabel.textColor = [UIColor whiteColor];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        if(i == 0)
        {
            [button setTitle:@"Temperature" forState:UIControlStateNormal];
        }
        else if(i == 1)
        {
            [button setTitle:@"Pressure" forState:UIControlStateNormal];
        }
        else if(i == 2)
        {
            [button setTitle:@"Currency" forState:UIControlStateNormal];
        }
        else if(i == 3)
        {
            [button setTitle:@"Power" forState:UIControlStateNormal];
        }
        else if(i == 4)
        {
            [button setTitle:@"Volume" forState:UIControlStateNormal];
        }
        button.frame = CGRectMake(10,
                                  ButtonHeightPlusOffsetBetweenButtons * (i+1),
                                  300,
                                  35);

        [button setTag:i];
        [self.ScrollView addSubview:button];
    }
    

}

-(void)ButtonAction:(id)sender
{
    NSInteger i = [sender tag];
    if(i == 0)
    {
        TempViewController* controller = [[TempViewController alloc]initWithNibName:@"TempViewController" bundle:nil];
        [self.navigationController pushViewController:controller animated:true];
    }
    else
    {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Wait"
                                      message:@"I am not ready yet, please come back later."
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Ok, thanks."
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Donothing
                                        
                                    }];
        
        [alert addAction:yesButton];
       
        [self presentViewController:alert animated:YES completion:nil];
    }
    
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
