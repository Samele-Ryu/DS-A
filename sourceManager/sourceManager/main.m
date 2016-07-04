//
//  main.m
//  sourceManager
//
//  Created by Ryu on 16/7/4.
//  Copyright © 2016年 Ryu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  struct  stu{
    char name[20];
    int age;
    int memberNum;
    
    struct stu *next;

}stu_t;

/*!
 *  @author Ryu, 16-07-04 18:07:15
 *
 *  @brief 创建节点
 *
 *  @return <#return value description#>
 *
 *  @since 1.0
 */
stu_t * create_node(void);

/*!
 *  @author Ryu, 16-07-04 18:07:31
 *
 *  @brief 添加节点
 *
 *  @param head <#head description#>
 *  @param node <#node description#>
 *
 *  @since 1.0
 */
void add_node(stu_t *head,stu_t *node);

int main(void) {

    stu_t *head;
    head = create_node();
    
    while (1) {
        printf("   **********************************\n   ***             menu           ***\n   ***       1.insert student     ***\n   ***       2.printf student     ***\n   **********************************\n");
        int ctl;
        scanf("%d",&ctl);
        if (1 == ctl) {
            printf("点击的是1\n");
            scanf("");
        } else if (2 == ctl) {
            printf("点击的是2\n");
        } else {
            printf("点击的是其他\n");
        }
    }
    
    
    return 0;
}


stu_t * create_node(void) {

    stu_t *head = (stu_t *)malloc(sizeof(stu_t));
    if (!head) {
        perror("malloc");
        exit(-1);
    }
    head->next = NULL;
    return head;

}

void add_node(stu_t *head,stu_t *node) {
    while (head->next) {
        head = head->next;
    }
    head->next = node;
}
