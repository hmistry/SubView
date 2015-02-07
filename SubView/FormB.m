//
//  FormB.m
//  SubView
//
//  Created by Hiren on 2/6/15.
//  Copyright (c) 2015 Chai Monsters, LLC. All rights reserved.
//

#import "FormB.h"

@interface FormB() <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *dinner;
@end

@implementation FormB

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
        [[NSBundle mainBundle] loadNibNamed:@"FormB" owner:self options:nil];
        [self addSubview: self.contentView];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.contentView.frame = self.bounds;
        
        self.dinner.delegate = self;
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

- (void) textViewDidEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
}

@end
