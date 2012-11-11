//
//  BFAlienSwitch.m
//  BFAlienSwitch
//
//  Created by Dario Lencina on 11/10/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import "BFAlienSwitch.h"
#import <QuartzCore/QuartzCore.h>

@implementation BFAlienSwitch{
    BFAlienSwitchHandler _handler;
}

+(BFAlienSwitch *)alienSwitchWithHandler:(BFAlienSwitchHandler) handler{
    BFAlienSwitch * alienSwitch= [[BFAlienSwitch alloc] initWithHandler:handler];
    return alienSwitch;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self= [super initWithCoder:aDecoder];
    [self configure];
    return self;
}

-(id)initWithHandler:(BFAlienSwitchHandler) handler{
    CGRect frame=CGRectMake(0, 0, 81, 26);
    self= [super initWithFrame:frame];
    _handler=handler;
    [self configure];
    return self;
}

-(void)configure{
    self.opaque=NO;
    self.clearsContextBeforeDrawing=NO;
    self.on=NO;
    [self setBackgroundColor:[UIColor clearColor]];
    [self addTapGestureRecognizer];
}

-(void)addTapGestureRecognizer{
    UITapGestureRecognizer * tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleSwitch)];
    [self addGestureRecognizer:tap];
}

-(void)toggleSwitch{
    [self setOn:![self isOn]];
}

-(void)setHandler:(BFAlienSwitchHandler) handler{
    _handler=handler;
}

-(void)setOn:(BOOL)on{
    _on=on;
    [self setNeedsDisplay];
    if(_handler)
        _handler(self);
}

- (void)drawRect:(CGRect)rect
{
    UIImage * imgToShow=nil;
    if (self.isOn) {
        imgToShow=[UIImage imageNamed:@"button_ON_01"];
    }else{
        imgToShow=[UIImage imageNamed:@"button_OFF_01"];
    }
    [imgToShow drawInRect:rect];

}

@end
