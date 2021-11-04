# Introdução

Esse trabalho tem o intuito de resolver o problema do [*robo coletor de latas*](https://github.com/guisoares1/AlgoritmoGenetico/blob/main/CE%20-%20Pr%C3%A1tica%2003.pdf).

# Ambiente de desenvolvimento

A linguagem utilizada para o trabalho foi o [*R*](https://pt.wikipedia.org/wiki/R_(linguagem_de_programa%C3%A7%C3%A3o)).

Para auxiliar no desenvolvimento foi utilizado a IDE [*Rstudio*](https://www.rstudio.com/).

# Descrição do projeto

Inicialmente foi criado uma malha que irá representar o local que o robo irá se movimentar.

![alt text](https://github.com/guisoares1/Imagens/blob/main/Algoritmogenetico1.png)

O *0* representa ausencia de lata e o *1* a sua existencia. 
O robo é representado por um vetor XY, que percorre a malha procurando pelas latas.
Para identificar o melhor individuo e executar o processo evolutivo, executei a seguinte estratégia:
- Criado uma população de individuos que irá percorrer a malha e procurar pelas latas.
- Atráver dos feedbacks apresentados, seleciono os melhores individuos.
- O algoritmo de geração de gerações executa até o valor limite colocado pelo usuário ou o melhor individuo ter consegui recolher todas as latas.

## População
Para a criação da população foi criado uma matriz de N por 5 elementos elementos.
Cada elemento da matriz é a representação de um cromossomo que segue a seguinte estrutura:

![alt text](https://github.com/guisoares1/Imagens/blob/main/Algoritmogenetico2.png)
- Posição 1: representa tendencia que o individuo tem de ir para cima.
- Posição 2: representa tendencia que o individuo tem de ir para baixo.
- Posição 3: representa tendencia que o individuo tem de ir para direita.
- Posição 4: representa tendencia que o individuo tem de ir para esquerda.
- Posição 5: representa o seu valor de função fitness.

## Função fitness
Seguindo o menu do tópico anterior, é utilizado uma roleta parametrizada com os seus genomas, isto é, quanto maior a tendencia do individuo de um dos números maiores serão a chance do número ser selecionado.

![alt text](https://github.com/guisoares1/Imagens/blob/main/algoritmoGenetico6.png)

A função fitness é responsável por classificar quais são os melhores individuos, faz toda a parte lógica de aplicação de regras pré estabelecidas e no final dá um retorno de qual a qualidade do cromossomo.

O valor varia de 0 a 1. Quanto mais próximo de 1, melhor o individuo é. 

Calculo feito: *totalDeLatas / TotalLatasEncontradas*.

## Gerações
Para geração de novos individuos utilizei a seguinte estratégia:

- No inicio de cada geração calculo o fitness de todos os individuos.
- Garanto o melhor individuo na próxima geração.
- Utilizo da função *Selecao* que contem uma estratégia de torneio para me fornecer os melhores individuos K% das vezes. 

![alt text](https://github.com/guisoares1/Imagens/blob/main/AlgoritmoGenetico3.png)

- Após a seleção é feito o crossover dos individuos. É selecionado dois cromossomo aleatóriamente e em K% das vezes o individuo 1 tem um dos seus genomas sobrescrito pelo individuo 2 .

![alt text](https://github.com/guisoares1/Imagens/blob/main/algoritmoGenetico4.png)

- A mutação ocorre após o passo anterior. É adicionado aleatóriamente um valor de 0 a 1 dentro de um dos genomas do cromossomo.

![alt text](https://github.com/guisoares1/Imagens/blob/main/algoritmoGenetico5.png)

# Resultados obtidos
Malha 10X10, máximo de movimentos 240.

Geração que catou todas as latas:

| Experimento         |  Geração            |
| ------------------- | ------------------- |
|  1                  |  84                 |
|  2                  |  35                 |
|  3                  |  48                 |
|  4                  |  20                 |
|  5                  |  72                 |
|  6                  |  23                 |
|  7                  |  10                 |
|  8                  |  05                 |
|  9                  |  45                 |
|  10                 |  37                 |
---------------
Malha 20X20, máximo de movimentos 1000.

Geração que catou todas as latas:

| Experimento         |  Geração            |
| ------------------- | ------------------- |
|  1                  |  502                |
|  2                  |  527                |
|  3                  |  487                |
|  4                  |  473                |
|  5                  |  469                |
|  6                  |  521                |
|  7                  |  533                |
|  8                  |  550                |
|  9                  |  520                |
|  10                 |  512                |

# Referências
- https://www.inf.ufpr.br/aurora/tutoriais/Ceapostila.pdf
- https://www.ic.unicamp.br/~rocha/teaching/2011s1/mc906/aulas/computacao-evolutiva-uma-abordagem-pragmatica.pdf
- https://proceedings.science/series/23/proceedings_non_indexed/60
- https://web.icmc.usp.br/SCATUSU/RT/nd_75.pdf

# Professor
[Paulo Henrique](http://www.portal.facom.ufu.br/pessoas/docentes/paulo-henrique-ribeiro-gabriel)
