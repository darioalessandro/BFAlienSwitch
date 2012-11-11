//
//  ViewController.m
//  BFAlienSwitch
//
//  Created by Dario Lencina on 11/10/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import "ViewController.h"
#import "BFAlienSwitch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.alienSwitch setHandler:^(BFAlienSwitch *alienSwitch) {
        NSLog(@"handler");
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
