//
//  Triangle.m
//  SubView
//
//  Created by Hiren on 2/5/15.
//  Copyright (c) 2015 Chai Monsters, LLC. All rights reserved.
//

#import "Square.h"

@interface Square()
@property (strong, nonatomic) CALayer *border;
@end

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
//        self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.contentView.frame = self.bounds;
        self.border = [CALayer layer];
        [self.contentView.layer addSublayer:self.border];
    }
}


// How to get drawRect to redraw the square and line after device rotation?
// Answer is calling setNeedsDisplay in layoutSubviews method

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
// Answer is overriding layoutSubviews method and calling method in there

- (void) drawBorderTop:(CGFloat)stroke color:(UIColor *)color {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"SquareView bounds, origin (%f,%f), size (%f,%f)", self.contentView.bounds.origin.x, self.contentView.bounds.origin.y, self.contentView.bounds.size.width, self.contentView.bounds.size.height);

    self.border.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, stroke);
    self.border.backgroundColor = color.CGColor;
    self.border.name = @"borderTop";

    NSLog(@"SubLayers %lu",(unsigned long)self.contentView.layer.sublayers.count);
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self setNeedsDisplay];
    [self drawBorderTop:4.0f color:[UIColor greenColor]];
}

@end
