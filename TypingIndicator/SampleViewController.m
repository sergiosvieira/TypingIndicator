//
//  SampleViewController.m
//  TypingIndicator
//
//  Created by Paulo Pinheiro on 7/30/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "SampleViewController.h"

#import "UITypingIndicator.h"


@interface SampleViewController ()

@property (strong, nonatomic) IBOutlet UIButton *button;

@end

@implementation SampleViewController
{
    UITypingIndicator *_indicator;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _indicator = [[UITypingIndicator alloc] initWithFrame:CGRectMake(50, 50, 18, 8)];
    
    [self.view addSubview:_indicator];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouch:(id)sender
{
    if (_indicator.hidden)
    {
        [_indicator show];
    }
    else
    {
        [_indicator hide];
    }
}

@end
