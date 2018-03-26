//
//  ListeSquential.h
//  线性表
//
//  Created by pro on 2018/3/25.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Error -1
#define OK   1

typedef int ElementType;
typedef int Status;
#define MaxSize  40
typedef struct {
    
    ElementType data[MaxSize];
    int length;
}Sqlist;

//获得第i各元素
Status GetElem(Sqlist L , int i , ElementType *e);

//插入元素
Status insertElem(Sqlist * L, int i, ElementType e);

//删除元素
Status listDelete(Sqlist *L, int i, ElementType *e);

//打印
void Log(Sqlist *L);
