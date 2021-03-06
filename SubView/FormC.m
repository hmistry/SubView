//
//  FormC.m
//  SubView
//
//  Created by Hiren on 2/6/15.
//  Copyright (c) 2015 Chai Monsters, LLC. All rights reserved.
//

#import "FormC.h"
#import "CMTextField.h"
#import "CMTextView.h"


@interface FormC() <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet CMTextField *midnight;
@property (weak, nonatomic) IBOutlet CMTextView *recipe;
@end

@implementation FormC

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
        [[NSBundle mainBundle] loadNibNamed:@"FormC" owner:self options:nil];
        [self addSubview: self.contentView];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.contentView.frame = self.bounds;
        
        self.midnight.delegate = self;
        self.recipe.delegate = self;
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
