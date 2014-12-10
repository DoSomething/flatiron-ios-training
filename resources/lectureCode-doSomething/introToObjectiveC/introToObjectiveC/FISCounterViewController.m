//
//  FISCounterViewController.m
//  introToObjectiveC
//
//  Created by Joe Burgess on 12/4/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "FISCounterViewController.h"
#import "FISTextFieldTableViewCell.h"
#import "ViewController.h"

@interface FISCounterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *counterTableView;

@property (strong, nonatomic) NSMutableArray *inputContent;

@end

@implementation FISCounterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.counterTableView.delegate = self;
    self.counterTableView.dataSource = self;

    self.inputContent = [[NSMutableArray alloc] init];

    for (NSInteger i=0; i<100; i++) {
        [self.inputContent addObject:@""];
    }

    // Do any additional setup after loading the view.
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    FISTextFieldTableViewCell *textFieldCell = (FISTextFieldTableViewCell *)cell;
    self.inputContent[indexPath.row] = textFieldCell.inputField.text;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FISTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell" forIndexPath:indexPath];

    NSString *indexPathString = [NSString stringWithFormat:@"%li",indexPath.row];

    cell.inputField.placeholder = indexPathString;
    cell.inputField.text = self.inputContent[indexPath.row];


    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    ViewController *destinationVC = segue.destinationViewController;

    NSIndexPath *selectedIndexPath = [self.counterTableView indexPathForSelectedRow];
    FISTextFieldTableViewCell *selectedCell = (FISTextFieldTableViewCell *)[self.counterTableView cellForRowAtIndexPath:selectedIndexPath];

    destinationVC.textFieldContents = selectedCell.inputField.text;
}

@end
