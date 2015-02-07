//
//  ViewController.m
//  SubView
//
//  Created by Hiren on 2/5/15.
//  Copyright (c) 2015 Chai Monsters, LLC. All rights reserved.
//

#import "ViewController.h"
#import "Square.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet Square *sq;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.sq.contentView setNeedsLayout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self.sq.contentView setNeedsLayout];
}
@end
