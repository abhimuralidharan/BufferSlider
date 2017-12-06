//
//  BufferSlider.m
//  SliderSample
//
//  Created by Apple on 05/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

#import "BufferSlider.h"

@implementation BufferSlider


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup {
    self.bufferProgress = [[UIProgressView alloc] initWithFrame:self.bounds];
    self.minimumTrackTintColor = [UIColor redColor];
    self.maximumTrackTintColor = [UIColor clearColor];
    self.value = 0.2;
    self.bufferProgress.backgroundColor = [UIColor clearColor];
    self.bufferProgress.userInteractionEnabled = NO;
    self.bufferProgress.progress = 0.7;
    self.bufferProgress.progressTintColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    self.bufferProgress.trackTintColor = [[UIColor lightGrayColor] colorWithAlphaComponent:2];
    [self addSubview:self.bufferProgress];
    [self setThumbImage:[UIImage imageNamed:@"redThumb"] forState:UIControlStateNormal];
    self.bufferProgress.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.bufferProgress attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:self.bufferProgress attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0.75];  // edit the constant value based on the thumb image
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.bufferProgress attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    [self addConstraints:@[left,right,centerY]];
    [self sendSubviewToBack:self.bufferProgress];
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}
    

-(void)setBufferValue:(CGFloat)value animated:(bool)animated {
    [_bufferProgress setProgress:value animated:animated];
}

@end
