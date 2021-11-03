# Introdução

Esse trabalho tem o intuito de resolver o problema do [*robo coletor de latas*](https://github.com/guisoares1/AlgoritmoGenetico/blob/main/CE%20-%20Pr%C3%A1tica%2003.pdf).

# Ambiente de desenvolvimento

A linguagem utilizada para o trabalho foi o [*R*](https://pt.wikipedia.org/wiki/R_(linguagem_de_programa%C3%A7%C3%A3o))
Para auxiliar no desenvolvimento foi utilizado a IDE [*Rstudio*](https://www.rstudio.com/)

# Descrição do projeto

Inicialmente foi criado uma malha que irá representar o local que o robo irá se movimentar.
![alt text](https://github.com/guisoares1/Imagens/blob/main/Algoritmogenetico1.png)

O 0 representa ausencia de lata e o 1 a sua existencia. 
O robo é representado por um vetor XY, que percorre a malha procurando pelas latas.
Para identificar o melhor individuo e executar o processo evolutivo, executei a seguinte estratégia:
- Criado uma população de individuos que irá percorrer a malha e procurar pelas latas.
- Atráver dos feedbacks apresentados, seleciono os melhores individuos.
- Faço esse processo até chegar em um resultado satisfatório (recolhimento das total das latas).

## População
Para a criação da população foi criado uma matriz de N por 5 elementos elementos.
Cada elemento da matriz é a representação de um cromossomo que segue a seguinte estrutura:

![alt text](https://github.com/guisoares1/Imagens/blob/main/Algoritmogenetico2.png)
 # cima (1), para baixo (2), para a direita (3) e para esquerda (4).
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
Um dos pilares dos algoritmos genéticos é a geração de novos elementos apartir dos melhores selecionados até o momento.
Para isso utilizei a seguinte estratégia:

- No inicio de cada geração calculo o fitness de todos os individuos.
- Após isso faço a seleção dos melhores cromossomos. Protótico do código:

![alt text](https://github.com/guisoares1/Imagens/blob/main/Algoritmogenetico2.png)
- O melhor elemento e já o garanto na próxima geração.
- 


Como ficou a representação do cromossomo?
Como ficou a função objetivo?
Como o cromossomo é decodificado em um indivíduo e como esse indivíduo é avaliado na função objetivo?
Como ficaram os operadores de recombinação e mutação?
Qual a estrutura do AG (geracional, steady-state)?
Houve algum outro operador implementado? (Elitismo, por exemplo.)
Quais experimentos foram conduzidos e quais os resultados e estatísticas gerados?
