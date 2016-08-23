//
//  ThrowLineTool.m
//  demo_01_Animatation
//
//  Created by 小飞 on 16/8/23.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "ThrowLineTool.h"

static ThrowLineTool *s_shareInstance = nil;

@implementation ThrowLineTool

+(ThrowLineTool *)shareTool
{
    if (!s_shareInstance)
    {
        s_shareInstance = [[[self class]alloc] init];
    }
    return s_shareInstance;
}


-(void)throwObject:(UIView *)obj from:(CGPoint)star to:(CGPoint)end height:(CGFloat)height duratation:(CGFloat)duratation
{
    self.showingView = obj;
//    初始化抛物线的路径path
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat cpx = (star.x+end.x)/2;
    CGFloat cpy = -height;
    CGPathMoveToPoint(path, NULL, star.x, star.y);
    CGPathAddQuadCurveToPoint(path, NULL, cpx, cpy, end.x, end.y);
    CAKeyframeAnimation *animatation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animatation.path = path;
    CFRelease(path);
    CABasicAnimation *baseAnimatation = [CABasicAnimation animationWithKeyPath:@"transform.scal"];
    baseAnimatation.autoreverses = YES;
    baseAnimatation.toValue = [NSNumber numberWithFloat:(CGFloat)(arc4random()%4+4/10.0)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.repeatCount = -1;
    group.duration = duratation;
    group.removedOnCompletion = NO;
    group.animations = @[animatation,baseAnimatation];
    [obj.layer addAnimation:group forKey:@"position scale"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(animationDidFinish)])
    {
        [self.delegate performSelector:@selector(animationDidFinish) withObject:nil];
    }
    self.showingView = nil;
}





@end
