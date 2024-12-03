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

void imprimirLista(Lista *inicio)
{
    if (inicio == NULL)
    {
        printf("Lista Vazia\n");
        return;
    }

    for (Lista *p = inicio; p != NULL; p = p->prox)
    {
        printf("%d ", p->info);
    }
    printf("\n");
}

Lista *removerElemento(Lista *L1, int valor)
{
    Lista *atual = L1;
    Lista *anterior = NULL;

    while (atual != NULL)
    {
        if (atual->info == valor)
        {
            if (anterior == NULL)
            {
                Lista *temp = atual;
                atual = atual->prox;
                free(temp);
                L1 = atual;
            }
            else
            {
                Lista *temp = atual;
                anterior->prox = atual->prox;
                atual = atual->prox;
                free(temp);
            }
        }
        else
        {
            anterior = atual;
            atual = atual->prox;
        }
    }

    return L1;
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

int main()
{
    Lista *L1 = criaLista();

    L1 = insereNoFinal(L1, 10);
    L1 = insereNoFinal(L1, 20);
    L1 = insereNoFinal(L1, 20);
    L1 = insereNoFinal(L1, 30);
    L1 = insereNoFinal(L1, 40);
    L1 = insereNoFinal(L1, 40);
    L1 = insereNoFinal(L1, 50);

    printf("Lista L1 antes de remover elemento:\n");
    imprimirLista(L1);

    int valorRemover = 20;
    L1 = removerElemento(L1, valorRemover);

    printf("Lista L1 depois de remover elemento %d:\n", valorRemover);
    imprimirLista(L1);

    return 0;
}
