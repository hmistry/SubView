//
//  CMTextField.m
//  SubView
//
//  Created by Hiren on 2/6/15.
//  Copyright (c) 2015 Chai Monsters, LLC. All rights reserved.
//

#import "CMTextField.h"

@implementation CMTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self configureView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if (self) {
        [self configureView];
    }
    return self;
}

-(void)awakeFromNib {
    [self configureView];
}

-(void) configureView {
    self.textColor = [UIColor blueColor];
    self.textAlignment = NSTextAlignmentLeft;
    
    self.layer.borderColor = [[UIColor orangeColor] CGColor];
    self.layer.borderWidth = 2.0f;
    self.layer.cornerRadius = 4.0f;
//    self.layer.masksToBounds = YES;
}

@end
