//
//  ViewController.m
//  demo_01_Animatation
//
//  Created by 小飞 on 16/8/23.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import "ViewController.h"
#import "ThrowLineTool.h"
@interface ViewController ()<ThrowLineToolDelegate>
{
    UIView *view;
    NSInteger num;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    num = 0;
    
    [self test1];
    [self test2];
    [self test3];
    [self test4];
    [self test5];
    [self test6];
    [self testcycle];
    [self test7];
    self.view.backgroundColor = [UIColor blackColor];
    UIButton *btm = [[UIButton alloc]initWithFrame:CGRectMake(100, 460, 80, 40)];
    btm.backgroundColor = [UIColor redColor];
    [btm setTitle:@"clickMe" forState:UIControlStateNormal];
    [btm addTarget:self action:@selector(test7) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btm];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//实现类似心跳的动画
-(void)test1{
//  初始化layer
    CALayer *scaleLayer = [[CALayer alloc]init];
    scaleLayer.backgroundColor = [UIColor blueColor].CGColor;
    scaleLayer.frame = CGRectMake(60, 230, 50, 50);
    scaleLayer.cornerRadius = 10;
    [self.view.layer addSublayer:scaleLayer];
//  设置动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];//设置缩小级别
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];//设置放大级别
    scaleAnimation.autoreverses = YES;//正向反向是否都有动画
    scaleAnimation.fillMode = kCAFillModeBackwards;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 0.8;
//    开始动画
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
}
-(void)test2{
    CALayer *grouplayer = [[CALayer alloc]init];
    grouplayer.frame = CGRectMake(200, 200, 50, 50);
    grouplayer.cornerRadius= 10;
    grouplayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:grouplayer];
    
//    设置动画1
    CABasicAnimation *scaleAnimatation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimatation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimatation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimatation.autoreverses = YES;
    scaleAnimatation.repeatCount = MAXFLOAT;
    scaleAnimatation.duration = 0.8;
    
//    设置2Move
    CABasicAnimation *movenimatation = [CABasicAnimation animationWithKeyPath:@"position"];
    movenimatation.fromValue = [NSValue valueWithCGPoint:grouplayer.position];
    movenimatation.toValue= [NSValue valueWithCGPoint:CGPointMake(140, grouplayer.position.y)];
    movenimatation.autoreverses = YES;
    movenimatation.repeatCount = MAXFLOAT;
    movenimatation.duration = 2;
    
//    设置动画3
    CABasicAnimation *rotateAnimatatin = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotateAnimatatin.fromValue =[NSNumber numberWithFloat:0.0];
    rotateAnimatatin.toValue = [NSNumber numberWithFloat:6*M_PI];
    rotateAnimatatin.autoreverses = YES;
    rotateAnimatatin.repeatCount = MAXFLOAT;
    rotateAnimatatin.duration = 2;
    
//    把动画添加到组
    CAAnimationGroup *groupAnimatations = [CAAnimationGroup animation];
    groupAnimatations.duration = 2;
    groupAnimatations.autoreverses = YES;
    groupAnimatations.repeatCount = MAXFLOAT;
    groupAnimatations.animations= @[scaleAnimatation,movenimatation,rotateAnimatatin];
    
//    开启动画
    [grouplayer addAnimation:groupAnimatations forKey:@"groupAnnimatation"];
}







-(void)test3{
    CALayer *grouplayer = [[CALayer alloc]init];
    grouplayer.frame = CGRectMake(100, 60, 50, 50);
    grouplayer.cornerRadius= 10;
    grouplayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:grouplayer];

    
    //    设置2Move
    CABasicAnimation *movenimatation = [CABasicAnimation animationWithKeyPath:@"position"];
    movenimatation.fromValue = [NSValue valueWithCGPoint:grouplayer.position];
    movenimatation.toValue= [NSValue valueWithCGPoint:CGPointMake(140, grouplayer.position.y)];
    movenimatation.autoreverses = YES;
    movenimatation.repeatCount = MAXFLOAT;
    movenimatation.duration = 2;
    
    //    设置动画3
    CABasicAnimation *rotateAnimatatin = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimatatin.fromValue =[NSNumber numberWithFloat:0.0];
    rotateAnimatatin.toValue = [NSNumber numberWithFloat:6*M_PI];
    rotateAnimatatin.autoreverses = YES;
    rotateAnimatatin.repeatCount = MAXFLOAT;
    rotateAnimatatin.duration = 2;
    
    //    把动画添加到组
    CAAnimationGroup *groupAnimatations = [CAAnimationGroup animation];
    groupAnimatations.duration = 2;
    groupAnimatations.autoreverses = YES;
    groupAnimatations.repeatCount = MAXFLOAT;
    groupAnimatations.animations= @[movenimatation,rotateAnimatatin];
    
    //    开启动画
    [grouplayer addAnimation:groupAnimatations forKey:@"groupAnnimatation"];
}




-(void)test4{
    CALayer *grouplayer = [[CALayer alloc]init];
    grouplayer.frame = CGRectMake(300, 130, 50, 50);
    grouplayer.cornerRadius= 10;
    grouplayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:grouplayer];
    
    
    //    设置2Move
    CABasicAnimation *movenimatation = [CABasicAnimation animationWithKeyPath:@"position"];
    movenimatation.fromValue = [NSValue valueWithCGPoint:grouplayer.position];
    movenimatation.toValue= [NSValue valueWithCGPoint:CGPointMake(140, grouplayer.position.y)];
    movenimatation.autoreverses = YES;
    movenimatation.repeatCount = MAXFLOAT;
    movenimatation.duration = 2;
    
    //    把动画添加到组
    CAAnimationGroup *groupAnimatations = [CAAnimationGroup animation];
    groupAnimatations.duration = 2;
    groupAnimatations.autoreverses = YES;
    groupAnimatations.repeatCount = MAXFLOAT;
    groupAnimatations.animations= @[movenimatation];
    
    //    开启动画
    [grouplayer addAnimation:groupAnimatations forKey:@"groupAnnimatation"];
}




-(void)test5{
    CALayer *grouplayer = [[CALayer alloc]init];
    grouplayer.frame = CGRectMake(0, 310, 50, 50);
    grouplayer.cornerRadius= 10;
    grouplayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:grouplayer];

    //    设置2Move
    CABasicAnimation *movenimatation = [CABasicAnimation animationWithKeyPath:@"position"];
    movenimatation.fromValue = [NSValue valueWithCGPoint:grouplayer.position];
    movenimatation.toValue= [NSValue valueWithCGPoint:CGPointMake(310, grouplayer.position.x)];
    movenimatation.autoreverses = YES;
    movenimatation.repeatCount = MAXFLOAT;
    movenimatation.duration = 2;
    
    //    把动画添加到组
    CAAnimationGroup *groupAnimatations = [CAAnimationGroup animation];
    groupAnimatations.duration = 2;
    groupAnimatations.autoreverses = YES;
    groupAnimatations.repeatCount = MAXFLOAT;
    groupAnimatations.animations= @[movenimatation];
    
    //    开启动画
    [grouplayer addAnimation:groupAnimatations forKey:@"groupAnnimatation"];
}


-(void)test6{
    CALayer *grouplayer = [[CALayer alloc]init];
    grouplayer.frame = CGRectMake(0, 460, self.view.frame.size.width, 20);
    grouplayer.cornerRadius= 10;
    grouplayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:grouplayer];
}

-(void)testcycle{
//    绘制轨迹
    CALayer *rectlayer = [[CALayer alloc]init];
    rectlayer.frame =CGRectMake(0,0,30,30);
    rectlayer.cornerRadius = 15;
    rectlayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:rectlayer];
//
    CAKeyframeAnimation *rectAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    rectAnimation.values = @[[NSValue valueWithCGPoint:rectlayer.frame.origin],[NSValue valueWithCGPoint:CGPointMake(0, self.view.frame.size.height)],[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width, self.view.frame.size.height)],[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width, 0)],[NSValue valueWithCGPoint:rectlayer.frame.origin]];
    
    rectAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    rectAnimation.repeatCount = 10000;
    rectAnimation.autoreverses = NO;
    rectAnimation.calculationMode  = kCAMediaTimingFunctionLinear;
    rectAnimation.duration = 2;
    [rectlayer addAnimation:rectAnimation forKey:@"rectRunAnimation"];
}

-(void)test7{

//    ThrowLineTool *tool =  [ThrowLineTool new];
//    tool.delegate = self;
    
    view = nil;
    
    view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:rand()%4 green:rand()%4 blue:rand()%4 alpha:1.0];
    view.frame = CGRectMake(0, 0, 10, 10);
    view.layer.cornerRadius = 5;
    [self.view addSubview:view];
    CGFloat starX = 100+rand()%50;
    CGFloat starY = 360+rand()%50;
    CGFloat endX = 200+rand()%50;
    CGFloat endY = 460+rand()%50;
    CGFloat height = 20+rand()%50;
    //    初始化抛物线的路径path
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat cpx = (starX+endX)/2;
    CGFloat cpy = -height;
    CGPathMoveToPoint(path, NULL, starX, starY);
    CGPathAddQuadCurveToPoint(path, NULL, cpx, cpy, endX, endY);
    CAKeyframeAnimation *animatation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animatation.path = path;
    CFRelease(path);
    CABasicAnimation *baseAnimatation = [CABasicAnimation animationWithKeyPath:@"transform"];
    baseAnimatation.autoreverses = NO;
    baseAnimatation.toValue = [NSNumber numberWithFloat:6*M_PI];
    CAAnimationGroup *group = [[CAAnimationGroup alloc]init];
    group.repeatCount = 100000;
    group.duration = 1;
    group.animations = @[animatation,baseAnimatation];
    [view.layer addAnimation:group forKey:@"position scale"];
    num++;
    view.tag = num;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (num<100)
        {
            [self test7];
            
            [self testcycle];
        }
        
    });
    
}



@end
