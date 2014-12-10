//
//  FISSongTableViewController.h
//  JukeboxTableViews
//
//  Created by Chris Gonzales on 9/2/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISPlaylist.h"
#import <AVFoundation/AVFoundation.h>

@interface FISSongTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) FISPlaylist *playlist;
@end
