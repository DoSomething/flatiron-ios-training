//
//  ViewController.m
//  workingWithViews
//
//  Created by Joe Burgess on 12/5/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "LabelsViewController.h"
#import "ButtonViewController.h"

@interface LabelsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)buttonTapped:(id)sender;

@end

@implementation LabelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Labels";
    self.myLabel.text = @"Hello from a nib";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {

    ButtonViewController *buttonVC = [[ButtonViewController alloc] initWithNibName:nil bundle:nil];

    [self.navigationController pushViewController:buttonVC animated:YES];
    NSLog(@"Button Tapped");
}
@end
