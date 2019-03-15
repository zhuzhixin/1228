//
//  Student.m
//  1228
//
//  Created by zhonghuishijia on 2018/12/28.
//  Copyright © 2018 zhuzhixin. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)copyWithZone:(NSZone *)zone{
    
    Student *student = [[Student allocWithZone:zone] init];
    student.name = self.name;
    return student;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    
    Student *student = [[Student allocWithZone:zone] init];
    student.name = self.name;
    return student;
}

@end
