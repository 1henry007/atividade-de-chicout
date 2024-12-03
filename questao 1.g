#include <stdio.h>
#include <stdlib.h>

typedef struct No {
    int info;
    struct No *prox;
} Lista;

typedef struct NoContagem {
    int elem;
    int count;
    struct NoContagem *prox;
} ListaContagem;

Lista *criaLista()
{
    return NULL;
}

ListaContagem *criaListaContagem()
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

ListaContagem *insereNoListaContagem(ListaContagem *cursor, int valor, int contagem)
{
    ListaContagem *novoNo = (ListaContagem *)malloc(sizeof(ListaContagem));
    novoNo->elem = valor;
    novoNo->count = contagem;
    novoNo->prox = NULL;

    if (cursor == NULL)
        return novoNo;

    ListaContagem *p = cursor;
    while (p->prox != NULL)
        p = p->prox;

    p->prox = novoNo;
    return cursor;
}

int contarOcorrencias(Lista *L1, int valor)
{
    int contagem = 0;
    for (Lista *p = L1; p != NULL; p = p->prox)
    {
        if (p->info == valor)
            contagem++;
    }
    return contagem;
}

int existeEmListaContagem(ListaContagem *L2, int valor)
{
    for (ListaContagem *p = L2; p != NULL; p = p->prox)
    {
        if (p->elem == valor)
            return 1;
    }
    return 0;
}

ListaContagem *gerarListaContagem(Lista *L1)
{
    ListaContagem *L2 = criaListaContagem();
    Lista *atual = L1;

    while (atual != NULL)
    {
        if (!existeEmListaContagem(L2, atual->info))
        {
            int contagem = contarOcorrencias(L1, atual->info);
            L2 = insereNoListaContagem(L2, atual->info, contagem);
        }
        atual = atual->prox;
    }

    return L2;
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
        printf("%d \n", p->info);
    }
}

void imprimirListaContagem(ListaContagem *inicio)
{
    if (inicio == NULL)
    {
        printf("Lista Vazia\n");
        return;
    }

    for (ListaContagem *p = inicio; p != NULL; p = p->prox)
    {
        printf("Elemento: %d, Contagem: %d\n", p->elem, p->count);
    }
}

int main()
{
    Lista *L1 = criaLista();
    ListaContagem *L2;

    L1 = insereNoLista(L1, 10);
    L1 = insereNoLista(L1, 20);
    L1 = insereNoLista(L1, 10);
    L1 = insereNoLista(L1, 30);
    L1 = insereNoLista(L1, 20);
    L1 = insereNoLista(L1, 10);

    printf("Lista L1:\n");
    imprimirLista(L1);

    L2 = gerarListaContagem(L1);

    printf("Lista L2 (elementos e contagem):\n");
    imprimirListaContagem(L2);

    return 0;
}
