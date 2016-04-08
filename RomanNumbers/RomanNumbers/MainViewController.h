//
//  MainViewController.h
//  RomanNumbers
//
//  Created by Ammad on 07/04/16.
//  Copyright © 2016 Emy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property(nonatomic,retain) IBOutlet UITextField *TextField;
@property(nonatomic,retain) IBOutlet UITextView *TextView;
@property(nonatomic,retain) IBOutlet UITextView *TextView2;
@property(nonatomic,retain) IBOutlet UIButton *Button;



- (int)RomanToNumbers:(NSString *)RomanNumeral;
-(int) DecimalOperation:(int )Decimal LastPossibleNumber:(int)LastNumber LastDeciamlCalculated:(int)LastDecimal;

@end
