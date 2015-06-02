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

#import "PSLazyView.h"
#import "PSLazyViewRenderer.h"

@implementation PSLazyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentMode:(UIViewContentModeTopLeft)];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

-(void)setNeedsDisplay{
    [super setNeedsDisplay];
    [[PSLazyViewRenderer sharedInstance] renderView:self];
}

-(void)setNeedsDisplayInRect:(CGRect)rect{
    [super setNeedsDisplayInRect:rect];
}

-(UIImage*)renderInImageOfSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [self performDrawingRect:CGRectMake(.0f, .0f, size.width, size.height)];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)performDrawingRect:(CGRect)rect{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)] userInfo:nil];
}

-(void)drawRect:(CGRect)rect{
    // just in case that subclass call [super drawRect:rect];
}

@end
