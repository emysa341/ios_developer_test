//
//  MainViewController.m
//  RomanNumbers
//
//  Created by Ammad on 07/04/16.
//  Copyright © 2016 Emy. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize TextField;
@synthesize TextView;
@synthesize TextView2;
@synthesize Button;

NSString *TextInput;
NSArray *SeperateWords;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Crazy numbers :)";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

-(IBAction)Convert:(id)sender
{

    TextInput = TextField.text;
    SeperateWords = [TextInput componentsSeparatedByString:@" "];
    NSMutableString * InputString = [NSMutableString new];
    [InputString appendString:@"Input-Values\n\n"];
    for (int i=0; i < SeperateWords.count; i++) {
        [InputString appendString:[NSString stringWithFormat:@"%@\n",SeperateWords[i]]];
    }
    TextView2.text = InputString;
    
    NSMutableString *Results = [NSMutableString new];
    [Results appendString:@"Corrected-Format\n\n"];
    for (int i=0; i < SeperateWords.count; i++) {
        int number = [self RomanToNumbers:SeperateWords[i]];
        NSString *Roman = [self NumbersToRomans:number];
        [Results appendString:[NSString stringWithFormat:@"%@\n",Roman]];
    }
    TextView.text = Results;
}

- (int)RomanToNumbers:(NSString *)RomanNumeral
{
    int decimal = 0;
    int lastNumber = 0;
    NSString *_RomanNumeral = RomanNumeral.uppercaseString;
   
    for (int i = _RomanNumeral.length - 1; i >= 0 ; i--)
    {
         const char Character = [_RomanNumeral characterAtIndex:i];
        
        switch (Character ) {
            case 'M':
               decimal = [self DecimalOperation:1000 LastPossibleNumber:lastNumber LastDeciamlCalculated:decimal];
                lastNumber = 1000;
                break;
                
            case 'D':
               decimal =[self DecimalOperation:500 LastPossibleNumber:lastNumber LastDeciamlCalculated:decimal];
                lastNumber = 500;
                break;
                
            case 'C':
               decimal = [self DecimalOperation:100 LastPossibleNumber:lastNumber LastDeciamlCalculated:decimal];
                lastNumber = 100;
                break;
                
            case 'L':
               decimal = [self DecimalOperation:50 LastPossibleNumber:lastNumber LastDeciamlCalculated:decimal];
                lastNumber = 50;
                break;
                
            case 'X':
               decimal = [self DecimalOperation:10 LastPossibleNumber:lastNumber LastDeciamlCalculated:decimal];
                lastNumber = 10;
                break;
                
            case 'V':
               decimal = [self DecimalOperation:5 LastPossibleNumber:lastNumber LastDeciamlCalculated:decimal];
                lastNumber = 5;
                break;
                
            case 'I':
               decimal = [self DecimalOperation:1 LastPossibleNumber:lastNumber LastDeciamlCalculated:decimal];
                lastNumber = 1;
                break;
        }
    }
    
    return decimal;
}

-(int) DecimalOperation:(int )Decimal LastPossibleNumber:(int)LastNumber LastDeciamlCalculated:(int)LastDecimal
{
    if (LastNumber > Decimal)
    {
        return LastDecimal - Decimal;
    }
    else
    {
        return LastDecimal + Decimal;
    }
}

-(NSString*) NumbersToRomans:(int)number
{
    
    if (number >= 1000) return [NSString stringWithFormat:@"M%@",[self NumbersToRomans:(number-1000)]];
    if (number >= 900) return [NSString stringWithFormat:@"CM%@",[self NumbersToRomans:(number-900)]];
    if (number >= 500) return [NSString stringWithFormat:@"D%@",[self NumbersToRomans:(number-500)]];
    if (number >= 400) return [NSString stringWithFormat:@"CD%@",[self NumbersToRomans:(number-400)]];
    if (number >= 100) return [NSString stringWithFormat:@"C%@",[self NumbersToRomans:(number-100)]];
    if (number >= 90) return [NSString stringWithFormat:@"XC%@",[self NumbersToRomans:(number-90)]];
    if (number >= 50) return [NSString stringWithFormat:@"L%@",[self NumbersToRomans:(number-50)]];
    if (number >= 40) return [NSString stringWithFormat:@"XL%@",[self NumbersToRomans:(number-40)]];
    if (number >= 10) return [NSString stringWithFormat:@"X%@",[self NumbersToRomans:(number-10)]];
    if (number >= 9) return [NSString stringWithFormat:@"IX%@",[self NumbersToRomans:(number-9)]];
    if (number >= 5) return [NSString stringWithFormat:@"V%@",[self NumbersToRomans:(number-5)]];
    if (number >= 4) return [NSString stringWithFormat:@"IV%@",[self NumbersToRomans:(number-4)]];
    if (number >= 1) return [NSString stringWithFormat:@"I%@",[self NumbersToRomans:(number-1)]];
    return @"";
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
