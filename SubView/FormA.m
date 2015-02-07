//
//  FormA.m
//  SubView
//
//  Created by Hiren on 2/6/15.
//  Copyright (c) 2015 Chai Monsters, LLC. All rights reserved.
//

#import "FormA.h"

@interface FormA() <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *lunch;
@end

@implementation FormA

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
    if (self.subviews.count == 0) {
        [[NSBundle mainBundle] loadNibNamed:@"FormA" owner:self options:nil];
        [self addSubview: self.contentView];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.contentView.frame = self.bounds;
        
        self.lunch.delegate = self;
    }
}


#pragma mark - Delegate Methods

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}


@end
