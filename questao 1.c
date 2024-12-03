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

int existeNaLista(Lista *inicio, int valor)
{
    for (Lista *p = inicio; p != NULL; p = p->prox)
    {
        if (p->info == valor)
        {
            return 1;
        }
    }
    return 0;
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

Lista *insereNoLista(Lista *cursor, int valor)
{
    Lista *novoNo = (Lista *)malloc(sizeof(Lista));
    novoNo->info = valor;
    novoNo->prox = cursor;
    cursor = novoNo;
    return cursor;
}

Lista *copiaListaSemRepetidos(Lista *L1)
{
    Lista *L2 = criaLista();
    Lista *atual = L1;

    while (atual != NULL)
    {
        if (!existeNaLista(L2, atual->info))
        {
            L2 = insereNoLista(L2, atual->info);
        }

        atual = atual->prox;
    }

    return L2;
}

int main()
{
    Lista *L1 = criaLista();
    Lista *L2;

    L1 = insereNoLista(L1, 10);
    L1 = insereNoLista(L1, 20);
    L1 = insereNoLista(L1, 30);
    L1 = insereNoLista(L1, 20);
    L1 = insereNoLista(L1, 10);

    printf("Lista L1 (com repetidos):\n");
    imprimir(L1);

    L2 = copiaListaSemRepetidos(L1);

    printf("Lista L2 (sem repetidos):\n");
    imprimir(L2);

    return 0;
}
