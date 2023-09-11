//
//  ViewController.m
//  Try Calculator app
//
//  Created by mohamed saad on 22/08/2023.
//

// ViewController.m

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (nonatomic, strong) NSMutableString *currentInput;
@property (nonatomic, assign) double storedValue;
@property (nonatomic, assign) BOOL operationSelected;
@property (nonatomic, strong) NSString *selectedOperator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentInput = [NSMutableString string];
    self.operationSelected = NO;
}

- (IBAction)digitButtonTapped:(UIButton *)sender {

    
    NSString *digit = sender.titleLabel.text;
    [self.currentInput appendString:digit];
    [self updateDisplay];
}


- (IBAction)operationButtonTapped:(UIButton *)sender {
    self.storedValue = [self.currentInput doubleValue];
    self.currentInput = [NSMutableString string];
    self.operationSelected = YES;
    self.selectedOperator = sender.titleLabel.text;
}

- (IBAction)equalButtonTapped:(UIButton *)sender {
    if (self.operationSelected) {
        double secondValue = [self.currentInput doubleValue];
        double result = 0;

        
        
        if ([self.selectedOperator isEqualToString:@"+"]) {
            result = self.storedValue + secondValue;
        } else if ([self.selectedOperator isEqualToString:@"-"]) {
            result = self.storedValue - secondValue;
        } else if ([self.selectedOperator isEqualToString:@"x"]) {
            result = self.storedValue * secondValue;
        } else if ([self.selectedOperator isEqualToString:@"÷"]) {
            if (secondValue != 0) {
                result = self.storedValue / secondValue;
            } else {
                self.displayLabel.text = @"Invalid";
                return;
            }
        }

        self.currentInput = [NSMutableString stringWithFormat:@"%g", result];
        [self updateDisplay];
        self.operationSelected = NO;
    }
}

- (IBAction)clearButtonTapped:(UIButton *)sender {
    self.currentInput = [NSMutableString string];
    [self updateDisplay];
    self.storedValue = 0;
    self.operationSelected = NO;
    self.selectedOperator = nil;
}

- (void)updateDisplay {
    self.displayLabel.text = self.currentInput;
}

@end
