//
//  ListeSquential.m
//  线性表
//
//  Created by pro on 2018/3/25.
//  Copyright © 2018年 dfgsg. All rights reserved.
//

#import "ListeSquential.h"
//i 从1开始，表示第几个

//获得元素
Status GetElem(Sqlist L , int i , ElementType *e){
    if (i < 1 || i > L.length || L.length == 0) {
        return Error;
    }
    *e = L.data[i-1];
    return OK;
}

// 插入操作
Status insertElem(Sqlist * L, int i, ElementType e){
    if (L->length == MaxSize) {
        return errno;
    }
    
    if (i>L->length+1 || i < 1) {
        return Error;
    }
    
    L->length++;
    if (i < L->length) {
        for ( int j = L->length - 1; j >= i; j--) {
            L->data[j] = L->data[j-1];
        }
    }
    L->data[i-1] = e;
    return OK;
};

//删除操作
Status listDelete(Sqlist *L, int i, ElementType *e){
    if (L->length == 0) {
        return errno;
    }
    
    if (i < 1 || i > L->length) {
        return errno;
    }
    
    *e = L->data[i-1];
    
    for (int j = i; j <= L->length-1; j++) {
        
        L->data[j-1] = L->data[j];
    }
    
    L->length--;
    
    return OK;
};

void Log(Sqlist *L){
    printf("---------------\n");    
    for (int i = 0; i < L->length; i++) {
        printf("%d--",L->data[i]);
    }
    
}
