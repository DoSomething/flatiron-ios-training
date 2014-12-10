//
//  profileView.h
//  workingWithViews
//
//  Created by Joe Burgess on 12/5/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (strong, nonatomic) IBOutlet UIView *view;

@end
