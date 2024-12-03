#include <stdio.h>
#include <stdlib.h>

typedef struct No {
    int info;
    struct No *prox;
} Lista;

Lista *criaLista()
{
    return NULL;
}

Lista *insereNoLista(Lista *cursor, int valor)
{
    Lista *novoNo = (Lista *)malloc(sizeof(Lista));
    novoNo->info = valor;
    novoNo->prox = cursor;
    cursor = novoNo;
    return cursor;
}

Lista *insereNoFinal(Lista *cursor, int valor)
{
    Lista *novoNo = (Lista *)malloc(sizeof(Lista));
    novoNo->info = valor;
    novoNo->prox = NULL;

    if (cursor == NULL)
        return novoNo;

    Lista *p = cursor;
    while (p->prox != NULL)
        p = p->prox;

    p->prox = novoNo;
    return cursor;
}

void imprimir(Lista *inicio)
{
    if (inicio == NULL)
    {
        printf("Lista Vazia\n");
        return;
    }

    for (Lista *p = inicio; p != NULL; p = p->prox)
    {
        printf("%d \n", p->info);
    }
}

Lista *intercalarListasOrdenadas(Lista *L1, Lista *L2)
{
    Lista *L3 = criaLista();

    while (L1 != NULL && L2 != NULL)
    {
        if (L1->info <= L2->info)
        {
            L3 = insereNoFinal(L3, L1->info);
            L1 = L1->prox;
        }
        else
        {
            L3 = insereNoFinal(L3, L2->info);
            L2 = L2->prox;
        }
    }

    while (L1 != NULL)
    {
        L3 = insereNoFinal(L3, L1->info);
        L1 = L1->prox;
    }

    while (L2 != NULL)
    {
        L3 = insereNoFinal(L3, L2->info);
        L2 = L2->prox;
    }

    return L3;
}

int main()
{
    Lista *L1 = criaLista();
    Lista *L2 = criaLista();
    Lista *L3;

    L1 = insereNoFinal(L1, 1);
    L1 = insereNoFinal(L1, 3);
    L1 = insereNoFinal(L1, 5);

    L2 = insereNoFinal(L2, 2);
    L2 = insereNoFinal(L2, 4);
    L2 = insereNoFinal(L2, 6);

    printf("Lista L1:\n");
    imprimir(L1);

    printf("Lista L2:\n");
    imprimir(L2);

    L3 = intercalarListasOrdenadas(L1, L2);

    printf("Lista L3 (intercalada):\n");
    imprimir(L3);

    return 0;
}
