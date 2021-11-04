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
Essa função é responsável por classificar quais são os melhores individuos, faz toda a parte lógica de aplicação de regras pré estabelecidas e no final dá um retorno de qual a qualidade do cromossomo.

O valor varia de 0 a 1. Quanto mais próximo de 1, melhor o individuo é. 

Calculo feito: *totalDeLatas / TotalLatasEncontradas*.

Nome da função implementada: *funObjetivo*

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

# Referências
https://www.inf.ufpr.br/aurora/tutoriais/Ceapostila.pdf
