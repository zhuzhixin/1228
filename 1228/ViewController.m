//
//  ViewController.m
//  1228
//
//  Created by zhonghuishijia on 2018/12/28.
//  Copyright © 2018 zhuzhixin. All rights reserved.
//

#import "ViewController.h"
#import "NextPageViewController.h"
#import "Student.h"
#import "LZImageBrowserManger.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;

@property(nonatomic,strong)LZImageBrowserManger *imageBrowserManger;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(self.view.center.x-50, self.view.center.y-25, 100, 50);
//    [button setTitle:@"按钮" forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor redColor]];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self sortArray];
    
//    [self mutableStringCut];
    
//    [self numberTransformString];
//    [self removeTheSameElementsFromTheArray];
}

- (void)removeTheSameElementsFromTheArray{
    NSMutableArray *sortArray = [NSMutableArray array];
    NSMutableArray *arrayA = [NSMutableArray arrayWithArray:@[@(3), @(2), @(5), @(2), @(5), @(4), @(3)]];
    while (arrayA.count > 0) {
        [sortArray addObject:arrayA.firstObject];
        NSInteger first = [[NSString stringWithFormat:@"%@", arrayA.firstObject] integerValue];
        [arrayA removeObjectAtIndex:0];
        for (int i = 0; i < arrayA.count; ) {
            NSInteger second = [[NSString stringWithFormat:@"%@", arrayA[i]] integerValue];
            if (first == second) {
                [arrayA removeObjectAtIndex:i];
            }else{
                i ++;
            }
        }
    }
    NSLog(@"%@", sortArray);
}

- (void)numberTransformString{
    NSArray *numberArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
    NSArray *stringArray = @[@"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖"];
    NSArray *stringsArray = @[@"", @"拾", @"百", @"仟", @"万", @"十"];
    NSString  *numberString = @"70802";
    NSMutableArray *numbersArray = [[NSMutableArray alloc] init];
    for (NSInteger i = numberString.length-1; i >= 0 ; i --) {
        NSString *numString = [numberString substringWithRange:NSMakeRange(i, 1)];
        [numbersArray addObject:numString];
    }
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    BOOL is0 = NO;
    for (NSInteger i = numbersArray.count-1; i >= 0; i--) {
        NSString *num = numbersArray[i];
        if ([num isEqualToString:@"0"]) {
            if (is0 == YES) {
                is0 = NO;
            }else{
                if (i != 0) {
                    [resultStr appendString:@"零"];
                }
                is0 = YES;
            }
        }else{
            for (int m = 0; m < numberArray.count; m ++) {
                NSString *numStr = numberArray[m];
                if ([num isEqualToString:numStr]) {
                    NSString *newStr = stringArray[m];
                    NSString *newStr2 = stringsArray[i];
                    [resultStr appendString:newStr];
                    [resultStr appendString:newStr2];
                }
            }
            is0 = NO;
        }
    }
    NSLog(@"%@", resultStr);
}

- (void)mutableStringCut {
    
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendString:@"123456789"];
    
    NSString *subString = [string substringToIndex:string.length-1];
    NSLog(@"%@\t%@", string, subString);
    
}

- (void)buttonAction {
    
}

- (void)sortArray{
    NSMutableArray *sortArray = [NSMutableArray arrayWithArray:@[@(10), @(3), @(7), @(2), @(8), @(4), @(11), @(4), @(9)]];
    NSLog(@"排序前：%@", sortArray);
    for (int i = 0; i < sortArray.count-1; i ++) {
        for (int j = 0; j < sortArray.count-1-i; j ++) {
            NSInteger left = [sortArray[j] integerValue];
            NSInteger right = [sortArray[j+1] integerValue];
            if (left>right) {
                [sortArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
            NSLog(@"\ni=%d\tj=%d\n%@", i, j, sortArray);
        }
    }
    NSLog(@"排序后：%@", sortArray);
}

- (void)copyModel {
    Student *student = [[Student alloc] init];
    student.name = @"小明";
    
    self.dataArray = [NSMutableArray arrayWithArray:@[student]];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (Student *stu in self.dataArray) {
        Student *stud = [stu copy];
        [array addObject:stud];
    }
    
    NextPageViewController *controller = [[NextPageViewController alloc] init];
    controller.backDataArray = array;
    
    NSLog(@"\n%p\n%p\n\n%p\n%p", self.dataArray, controller.backDataArray, self.dataArray.firstObject, controller.backDataArray.firstObject);
    
    [self.navigationController pushViewController:controller animated:YES];
}

@end

