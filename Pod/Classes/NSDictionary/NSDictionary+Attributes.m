//
//  NSDictionary+Attributes.m
//  Pods
//
//  Created by Jamie Evans on 2015-03-16.
//  Copyright (c) 2015 Jamie Riley Evans. All rights reserved.
//

#import "NSDictionary+Attributes.h"

@implementation NSAttributes
@end

@implementation NSDictionary (Attributes)

+ (instancetype)attributesWithFontType:(FontType)fontType pointSize:(CGFloat)pointSize andColor:(UIColor *)color
{
    return [self attributesWithFont:[UIFont fontWithType:fontType andSize:pointSize] textColor:color];
}

+ (instancetype)attributesWithFont:(UIFont *)font textColor:(UIColor *)textColor
{
    return [self attributesWithFont:font textColor:textColor lineSpacing:-1.0f];
}

+ (instancetype)attributesWithFont:(UIFont *)font textColor:(UIColor *)textColor lineSpacing:(CGFloat)lineSpacing
{
    NSMutableDictionary *attributesDictionary = @{NSFontAttributeName: font,
                                                  NSForegroundColorAttributeName: textColor}.mutableCopy;
    if(lineSpacing >= 0.0f)
    {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        [paragraphStyle setLineSpacing:lineSpacing];
        [attributesDictionary setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    
    return attributesDictionary.copy;
}

@end
