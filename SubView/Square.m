//
//  Triangle.m
//  SubView
//
//  Created by Hiren on 2/5/15.
//  Copyright (c) 2015 Chai Monsters, LLC. All rights reserved.
//

#import "Square.h"

@implementation Square

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
        [[NSBundle mainBundle] loadNibNamed:@"Square" owner:self options:nil];
        [self addSubview: self.contentView];
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.contentView.frame = self.bounds;
        
        [self drawBorderTop:4.0f color:[UIColor greenColor]];
    }
}


// How to get drawRect to redraw the square and line after device rotation?

- (void) drawRect:(CGRect)rect {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"SquareView bounds, origin (%f,%f), size (%f,%f)", self.contentView.bounds.origin.x, self.contentView.bounds.origin.y, self.contentView.bounds.size.width, self.contentView.bounds.size.height);

    UIBezierPath *line = [UIBezierPath bezierPath];
    [line moveToPoint:CGPointMake(50, 95)];
    [line addLineToPoint:CGPointMake(250, 95)];
    
    [line setLineWidth:2.0f];
    [[UIColor redColor] setStroke];
    [line stroke];

    UIBezierPath *shape = [UIBezierPath bezierPath];
    [shape moveToPoint:CGPointMake(100, 10)];
    [shape addLineToPoint:CGPointMake(100, 90)];
    [shape addLineToPoint:CGPointMake(180, 90)];
    [shape addLineToPoint:CGPointMake(180, 10)];
    [shape closePath];

    [shape setLineWidth:2.0f];
    [[UIColor orangeColor] setStroke];
    [shape stroke];

}


// How to get drawBorderTop to use the final frame/bounds of the UIView after AutoLayout and not whats in IB?

- (void) drawBorderTop:(CGFloat)stroke color:(UIColor *)color {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"SquareView bounds, origin (%f,%f), size (%f,%f)", self.contentView.bounds.origin.x, self.contentView.bounds.origin.y, self.contentView.bounds.size.width, self.contentView.bounds.size.height);

    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, stroke);
    border.backgroundColor = color.CGColor;
    border.name = @"borderTop";

    [self.contentView.layer addSublayer:border];
}


@end
