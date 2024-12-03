 #include <stdio.h>
#include <stdlib.h>
#include <limits.h>

typedef struct No {
    int info;
    struct No *prox;
} Lista;

Lista *criaLista()
{
    return NULL;
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

int jaContado(Lista *valoresContados, int valor)
{
    for (Lista *p = valoresContados; p != NULL; p = p->prox)
    {
        if (p->info == valor)
            return 1;
    }
    return 0;
}

void encontrarMaiorEMenor(Lista *L1)
{
    Lista *valoresContados = criaLista();
    int maiorFrequencia = INT_MIN;
    int menorFrequencia = INT_MAX;
    int valorMaiorFreq, valorMenorFreq;

    for (Lista *p = L1; p != NULL; p = p->prox)
    {
        if (jaContado(valoresContados, p->info))
            continue;

        int frequencia = contarOcorrencias(L1, p->info);

        valoresContados = insereNoFinal(valoresContados, p->info);

        if (frequencia > maiorFrequencia)
        {
            maiorFrequencia = frequencia;
            valorMaiorFreq = p->info;
        }

        if (frequencia < menorFrequencia)
        {
            menorFrequencia = frequencia;
            valorMenorFreq = p->info;
        }
    }

    printf("Elemento com maior frequencia: %d (aparece %d vezes)\n", valorMaiorFreq, maiorFrequencia);
    printf("Elemento com menor frequencia: %d (aparece %d vezes)\n", valorMenorFreq, menorFrequencia);
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

int main()
{
    Lista *L1 = criaLista();

    L1 = insereNoFinal(L1, 10);
    L1 = insereNoFinal(L1, 20);
    L1 = insereNoFinal(L1, 10);
    L1 = insereNoFinal(L1, 30);
    L1 = insereNoFinal(L1, 20);
    L1 = insereNoFinal(L1, 10);

    printf("Lista L1:\n");
    imprimirLista(L1);

    encontrarMaiorEMenor(L1);

    return 0;
}
