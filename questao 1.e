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

Lista *inverterLista(Lista *L1)
{
    Lista *anterior = NULL;
    Lista *atual = L1;
    Lista *proximo = NULL;

    while (atual != NULL)
    {
        proximo = atual->prox;
        atual->prox = anterior;
        anterior = atual;
        atual = proximo;
    }

    return anterior;
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

int main()
{
    Lista *L1 = criaLista();

    L1 = insereNoLista(L1, 10);
    L1 = insereNoLista(L1, 20);
    L1 = insereNoLista(L1, 30);

    printf("Lista L1 antes da inversa:\n");
    imprimir(L1);

    L1 = inverterLista(L1);

    printf("Lista L1 depois da inversao:\n");
    imprimir(L1);

    return 0;
}
