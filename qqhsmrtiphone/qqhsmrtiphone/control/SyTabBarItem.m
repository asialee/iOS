//
//  SyTabBarItem.m
//  SyFramework
//
//  Created by dadai on 13-12-18.
//  Copyright (c) 2013年 dadai. All rights reserved.
//

#import "SyTabBarItem.h"

@interface SyTabBarItem ()

@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,assign) id target;
@property (nonatomic,assign) SEL action;

@end

@implementation SyTabBarItem

@synthesize title = _title;
@synthesize icon = _icon;
@synthesize target = _target;
@synthesize action = _action;
@synthesize selected = _selected;


- (void)setTitle:(NSString *)aTitle icon:(NSString *)aIcon highlight:(NSString *)aHighlight
{
    self.title.text = aTitle;
    self.icon.image = [UIImage imageNamed:aIcon];
    self.icon.highlightedImage = [UIImage imageNamed:aHighlight];
}
- (void)addTarget:(id)aTarget action:(SEL)aAction
{
    self.target = aTarget;
    self.action = aAction;
}


- (void)setSelected:(BOOL)selected
{
//    if (selected !=_selected) {
//        _selected = selected;
//        
//        //self.icon.highlighted = _selected;
//        
//        [self setNeedsDisplay];
//    }
    
    if (selected == _selected) return;
    _selected = selected;
    if (selected) {
        [self.icon setImage:self.icon.highlightedImage];
        //self.backgroundColor = [UIColor redColor];
        self.title.textColor = [UIColor whiteColor];
        
    }else{
        //******************** modified by LiYazhou
        self.backgroundColor = [[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
        [self.icon setImage:Nil];
        //*****************************************
        self.title.textColor = [UIColor blackColor];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.selected = YES;
    
    if (self.target && self.action) {
        [self.target performSelector:self.action withObject:self];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _title.frame = CGRectMake(0, (self.frame.size.height - 20)/2.0, self.frame.size.width, 20);
}

- (void)dealloc
{
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //*********************** modified by LiYazhou
        UIColor *color = [[UIColor alloc] initWithRed:0.6 green:0.6 blue:0.6 alpha:0.0];
        self.backgroundColor = color;
        //********************************************
        
        self.icon = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.icon];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 10.0f, frame.size.width, 10.0f)];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.backgroundColor = [UIColor clearColor];
        //self.title.font = [UIFont fontWithName:@"" size:<#(CGFloat)#>]
        self.title.textColor = [UIColor blackColor];
        [self addSubview:self.title];
    }
    return self;
}

@end
