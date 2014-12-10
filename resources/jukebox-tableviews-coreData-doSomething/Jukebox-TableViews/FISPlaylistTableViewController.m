//
//  FISPlaylistTableViewController.m
//  JukeboxTableViews
//
//  Created by Chris Gonzales on 8/27/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISPlaylistTableViewController.h"
#import "FISPlaylist.h"
#import "FISSongTableViewController.h"

@interface FISPlaylistTableViewController ()

@property (strong, nonatomic) NSMutableArray *playlists;

@end

@implementation FISPlaylistTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setup];
    [self setupBackButton];
    
}

-(void)setup
{
    self.playlists = [[NSMutableArray alloc] init];
    [self.playlists addObject:[[FISPlaylist alloc] initWithName:@"Party and Bullsh*t (all songs)"]];
    [self.playlists addObject:[[FISPlaylist alloc] initWithName:@"Bracket Sounds"]];
    [self.playlists addObject:[[FISPlaylist alloc] initWithName:@"Songs to Code By"]];
}

-(void)setupBackButton
{
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButtonItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.playlists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    
    FISPlaylist *currentPlaylist = self.playlists[indexPath.row];
    cell.textLabel.text = currentPlaylist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)currentPlaylist.songs.count];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSInteger index = [self.tableView indexPathForSelectedRow].row;
    FISPlaylist *selectedPlaylist = self.playlists[index];
    
    FISSongTableViewController *nextVC = segue.destinationViewController;
    nextVC.playlist = selectedPlaylist;
}

@end
