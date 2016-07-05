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


/*!
 *  @author Ryu, 16-07-05 12:07:59
 *
 *  @brief 打印用户信息
 *
 *  @param node <#node description#>
 *
 *  @since 1.0
 */
void printf_stu(stu_t *node);

/*!
 *  @author Ryu, 16-07-05 12:07:19
 *
 *  @brief 遍历
 *
 *  @param head <#head description#>
 *  @param func <#func description#>
 *
 *  @since 1.0
 */
void travelAllNode(stu_t *head,void(*func)(stu_t *));

/*!
 *  @author Ryu, 16-07-05 12:07:33
 *
 *  @brief 展示所有用户信息
 *
 *  @param node <#node description#>
 *
 *  @since 1.0
 */
void show_stu_info(stu_t *node);

/*!
 *  @author Ryu, 16-07-05 15:07:35
 *
 *  @brief 链表逆序
 *
 *  @param head <#head description#>
 *
 *  @since 1.0
 */
stu_t * revertAllNode(stu_t *head);

int main(void) {

    stu_t *head;
    head = create_node();
    
    while (1) {
        printf("   **********************************\n   ***             menu           ***\n   ***       1.insert student     ***\n   ***       2.printf student     ***\n   ***       3.revert student     ***\n   ***       4.clear  student     ***\n   **********************************\n");
        int ctl;
        scanf("%d",&ctl);
        switch (ctl) {
            case 1:
            {
                stu_t *node = create_node();
                scanf("%s %d %d",node->name,&node->age,&node->memberNum);
                add_node(head, node);
                printf("录入成功\n");
            }
                break;
            case 2:
            {
                show_stu_info(head);
            }
                break;
            case 3:
            {
                stu_t *node = create_node();
                add_node(head, node);
                show_stu_info(revertAllNode(head)) ;
                
            }
                break;
            case 4:
            {
            }
                break;
            default:
            {
                printf("点击的是其他\n");
            }
                break;
        }
    }
    
    
    return 0;
}


stu_t * create_node(void) {

    stu_t *node = (stu_t *)malloc(sizeof(stu_t));
    if (!node) {
        perror("malloc");
        exit(-1);
    }
    node->next = NULL;
    return node;

}

void add_node(stu_t *head,stu_t *node) {
    while (head->next) {
        head = head->next;
    }
    head->next = node;
}

stu_t * revertAllNode(stu_t *head) {
    stu_t *p;
    stu_t *r;
    if (head->next && head->next->next) {
        p = head->next;
        r = p->next;
        p->next = NULL;
        head = p;
        while (r) {
            p = r;
            r = r->next;
            p->next = head;
            head = p;
        }
        return head;
    }
    return head;
}

void travelAllNode(stu_t *head,void(*func)(stu_t *)) {
    
    while ( (head = head->next)) {
        func(head);
    }

}

void show_stu_info(stu_t *node) {
    travelAllNode(node,printf_stu);
}

void printf_stu(stu_t *node) {
    printf("name:%s age:%d memberNum:%d\n",node->name,node->age,node->memberNum);
}
