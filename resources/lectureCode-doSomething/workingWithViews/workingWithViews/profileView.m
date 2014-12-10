//
//  profileView.m
//  workingWithViews
//
//  Created by Joe Burgess on 12/5/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "profileView.h"

@implementation profileView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                      owner:self
                                    options:nil];

        [self addSubview:self.view];

    }
    return self;
}

@end
