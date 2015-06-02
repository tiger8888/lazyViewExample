//
//    The MIT License (MIT)
//
//    Copyright (c) 2013 Paweł Szymański
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "PSSlowViewController.h"
#import "PSSlowView.h"

@interface PSSlowViewController ()

@end

@implementation PSSlowViewController

@synthesize scrollView = _scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGFloat offsetY = .0f;
    for (int i = 0; i < PS_VIEWS_COUNT; i++) {
        PSSlowView* slowView = [[PSSlowView alloc] initWithFrame:CGRectMake(0, offsetY, CGRectGetWidth(self.scrollView.frame), PS_VIEW_HEIGHT) andIndexString:[NSString stringWithFormat:@"%d", i]];
        offsetY += CGRectGetHeight(slowView.frame);
        [self.scrollView addSubview:slowView];
    }
    [self.scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.scrollView.frame), offsetY)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
