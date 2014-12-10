//
//  ViewController.m
//  introToObjectiveC
//
//  Created by Joe Burgess on 12/2/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *woahGreeting;
- (IBAction)buttonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"View Loaded");

    self.inputField.text = self.textFieldContents;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    NSString *greeting = [NSString stringWithFormat:@"Welcome, %@",self.inputField.text];

    self.woahGreeting.text=greeting;
}
@end
