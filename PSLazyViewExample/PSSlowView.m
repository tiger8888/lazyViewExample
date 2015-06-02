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

#import "PSSlowView.h"

@implementation PSSlowView

@synthesize allPoints = _allPoints;
@synthesize indexString = _indexString;

- (id)initWithFrame:(CGRect)frame andIndexString:(NSString*)indexString
{
    self = [super initWithFrame:frame];
    if (self) {
        _allPoints = [self generateRandomPoints];
        _indexString = indexString;
        
        UIButton* button = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
        button.frame = CGRectInset(self.bounds, 50, 10);
        [button setTitle:self.indexString forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
    }
    return self;
}

-(void)buttonTapped:(id)sender{
    NSLog(@"Touch~");
}

-(NSArray*)generateRandomPoints{
    NSMutableArray* points = [NSMutableArray array];
    for (int i = 0; i < PS_POINTS_COUNT; i++) {
        CGPoint point = CGPointMake(arc4random() % (int)CGRectGetWidth(self.frame),
                                    arc4random() % (int)CGRectGetHeight(self.frame));
        [points addObject:[NSValue valueWithCGPoint:point]];
    }
    return points;
}

-(void)performDrawingRect:(CGRect)rect{    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextSetLineWidth(context, 2.0);
    
    if (self.allPoints.count > 0) {
        CGPoint point = ((NSValue*)self.allPoints[0]).CGPointValue;
        CGContextMoveToPoint(context, point.x, point.y);
        
        NSInteger count = self.allPoints.count;
        for (int i = 1; i < count; i++) {
            CGPoint point = ((NSValue*)self.allPoints[i]).CGPointValue;
            CGContextAddLineToPoint(context, point.x, point.y);
        }
    }
    
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor   ].CGColor);
    [self.indexString drawInRect:self.bounds withFont:[UIFont systemFontOfSize:15] lineBreakMode:(NSLineBreakByWordWrapping) alignment:(NSTextAlignmentCenter)];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self performDrawingRect:rect];
}

@end
