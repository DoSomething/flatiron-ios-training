//
//  FISSongTableViewController.m
//  JukeboxTableViews
//
//  Created by Chris Gonzales on 9/2/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISSongTableViewController.h"

@interface FISSongTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIProgressView *songProgressView;
@property (strong,nonatomic) FISSong *nowPlaying;

@end

@implementation FISSongTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self setup];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.audioPlayer = nil;
}

-(void)setup
{
    [self.playlist sortSongsByTitle];
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.playlist.songs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FISSong *currentSong = self.playlist.songs[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ | %@",currentSong.title, currentSong.album];
    cell.detailTextLabel.text = currentSong.artist;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *songNumber = [NSNumber numberWithInteger:indexPath.row + 1];
    FISSong *selectedSong = [self.playlist songAtPosition:songNumber];
    if (selectedSong) {
        [self setupAVAudioPlayWithFileName:selectedSong.fileName];
        [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
        [self.audioPlayer play];
    }
    
}

- (void)updateTime:(NSTimer *)timer {
    [self.songProgressView setProgress:(self.audioPlayer.currentTime/self.audioPlayer.duration)];
}

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
{
//    NSLog(@"%@", self.audioPlayer.playing ? @"TRUE" : @"False");
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"mp3"]];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:url
                        error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

- (IBAction)stopButtonTapped:(id)sender {
    [self.audioPlayer stop];
}

- (IBAction)sortControlValueChanged:(id)sender {
    NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
    
    UISegmentedControl *segmentedControl = sender;
    NSInteger selectedIndex = segmentedControl.selectedSegmentIndex;
    switch (selectedIndex) {
        case 0:
            [self.playlist sortSongsByTitle];
            break;
        case 1:
            [self.playlist sortSongsByArtist];
            break;
        case 2:
            [self.playlist sortSongsByAlbum];
            break;
        default:
            break;
    }
    [self.tableView reloadData];
    [self.tableView selectRowAtIndexPath:ip animated:NO scrollPosition:UITableViewScrollPositionNone];
}



@end
