//
//  ViewController.m
//  AnimationDemo
//
//  Created by Yioks-Mac on 17/3/22.
//  Copyright © 2017年 Yioks-Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"position"];
    //如果动画持续时间为3s，那么begintime设置为负数则从duration - beginTime处开始运行。
    ani.beginTime = CACurrentMediaTime() - 1.5;
    //timeOffset:时间偏移量,默认为0;既然它是时间偏移量,那么它即和动画时间相关.这么解释:假设我们设置一个动画时间为5s,动画执行的过程为1->2->3->4->5,这时候如果你设置timeOffset = 2s那么它的执行过程就会变成3->4->5->1->2如果你设置timeOffset = 4s那么它的执行过程就会变成5->1->2->3->4,这么说应该很明白了吧?
    ani.timeOffset = 2;
    /*
    //需要动画的属性值
    @property(nullable, copy) NSString *keyPath;
    //属性动画是否以当前动画效果为基础,默认为NO
    @property(getter=isAdditive) BOOL additive;
    //指定动画是否为累加效果,默认为NO
    @property(getter=isCumulative) BOOL cumulative;
    //此属性相当于CALayer中的transform属性,下面会详解
    @property(nullable, strong) CAValueFunction *valueFunction;
    */
    ani.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionScale];
    /*
     fromValue和toValue不为空,动画的效果会从fromValue的值变化到toValue.
     
     fromValue和byValue都不为空,动画的效果将会从fromValue变化到fromValue+byValue
     
     toValue和byValue都不为空,动画的效果将会从toValue-byValue变化到toValue
     
     只有fromValue的值不为空,动画的效果将会从fromValue的值变化到当前的状态.
     
     只有toValue的值不为空,动画的效果将会从当前状态的值变化到toValue的值.
     
     只有byValue的值不为空,动画的效果将会从当前的值变化到(当前状态的值+byValue)的值.
     
     */
    ani.fromValue = @1;
    ani.toValue = @3;
    ani.byValue = @2;
    
    CASpringAnimation *spani = [CASpringAnimation animationWithKeyPath:@""];
    spani.mass = 3;
    spani.stiffness = 4;
    spani.damping = 5;
    spani.initialVelocity = 4;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
