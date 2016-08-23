//
//  ThrowLineTool.h
//  demo_01_Animatation
//
//  Created by 小飞 on 16/8/23.
//  Copyright © 2016年 小飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol ThrowLineToolDelegate;


@interface ThrowLineTool : NSObject
@property (nonatomic,assign)id<ThrowLineToolDelegate>delegate;
@property (nonatomic,strong)UIView *showingView;
+(ThrowLineTool *)shareTool;

/**
 *     @author xiaofei, 16-08-23 15:08:38
 *
 *     @brief    将View或者是layer从起点抛到终点
 *
 *     @param obj        被抛的物体
 *     @param star       七点坐标
 *     @param end        终点坐标
 *     @param height     高度，抛物线最高点/终点与坐标最低（即高度最高）所超出的高度
 *     @param duratation 动画的时间
 */
-(void)throwObject:(UIView *)obj from:(CGPoint)star to:(CGPoint)end height:(CGFloat)height duratation:(CGFloat)duratation;
@end


@protocol ThrowLineToolDelegate <NSObject>

-(void)animatationDidFinished;

@end




