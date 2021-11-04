## malha 20X20
#tamanhoMalha = 20
#movimentosMaximos = 500 
## malha 10X10
tamanhoMalha = 10
movimentosMaximos = 240

tamanhoPopulacao = 100
numeroGeracoes = 100

#gera malha
malha <- matrix(0, nrow = tamanhoMalha, ncol = tamanhoMalha) 
preenchido = 0
preencher = (((tamanhoMalha*tamanhoMalha)/100)*20)
while (preenchido <= preencher){
  linha = sample(1:tamanhoMalha, 1, replace = TRUE)
  coluna = sample(1:tamanhoMalha, 1, replace = TRUE)
  if (malha[linha,coluna]== 0)
  {
    malha[linha,coluna] = 1
    preenchido = preenchido + 1
  } 
}


funObjetivo <- function (cromossomo, malhaLatas)
{
   
  posicaoXY = c(1,1)
  latasEncontradas = 0
  caracteristicasIndividuo = c(0,0,0,0)
  numeroDeLatas = (((tamanhoMalha*tamanhoMalha)/100)*20)
  numeroDeMovimentos = 0
  while (latasEncontradas < numeroDeLatas && numeroDeMovimentos < movimentosMaximos )
  { 
    caracteristicasIndividuo = c(cromossomo[1],cromossomo[2],cromossomo[3],cromossomo[4]) 
    # tratamento para os limites da malha
    if (posicaoXY[1] == 1) 
    {
      caracteristicasIndividuo[4] = 0
    } 
    else if (posicaoXY[1] == tamanhoMalha) 
    {
      caracteristicasIndividuo[3] = 0
    } 
    if (posicaoXY[2] == 1) 
    {
      caracteristicasIndividuo[1] = 0
    } 
    else if (posicaoXY[2] == tamanhoMalha) 
    {
      caracteristicasIndividuo[2] = 0
    }
    
    movimento = Movimento(caracteristicasIndividuo)
    # cima (1), para baixo (2), para a direita (3) e para esquerda (4).
    if (movimento ==1)
    {
      posicaoXY[2] = posicaoXY[2]-1 
    }
    else if (movimento ==2)
    {
      posicaoXY[2] = posicaoXY[2]+1 
    }
    else if (movimento ==3)
    {
      posicaoXY[1] = posicaoXY[1]+1 
    }
    else 
    {
      posicaoXY[1] = posicaoXY[1]-1 
    }
    # verifico se existe lata na nova posição da malha
    if (malhaLatas[posicaoXY[1],posicaoXY[2]] == 1)
    {
       malhaLatas[posicaoXY[1],posicaoXY[2]] = 0
       latasEncontradas = latasEncontradas + 1
    }
    
    numeroDeMovimentos = numeroDeMovimentos+1
  }
  return (latasEncontradas/numeroDeLatas)
}

Movimento <- function(candidato) 
{
  return (sample( c(1,2,3,4), 1, replace=TRUE, prob=candidato))
}


mutacao <- function(pop, posicao) {
   c = sample(1:4, size = 1)
   mutacao = runif(1, min=0, max=1)
   pc = 0.5
   #aumento a tendencia do seu percorrimento para um dos lados, respeitando o limite de 1
  if (runif(1) < pc) {
    if ((pop[posicao,c] + mutacao)>1)
    {
        pop[posicao,c] = 1
    }
     else
     {
        pop[posicao,c] = pop[posicao,c] + mutacao
     }
  }
   return(pop[posicao,])
}

fitness <- function(pop, malha){
  vet_fitness = c()
  i = 1
  for (i in 1:nrow(pop)) 
  {
    cromoss = pop[i,]
    nbits = funObjetivo(cromoss,malha)
    vet_fitness = c(vet_fitness, nbits)
  }
  return(vet_fitness)
}

crossover <- function(pop, pos1, pos2) {
  pc = 0.75
  posCrossover = sample(1:4, 1, replace = FALSE)
  if (runif(1) < pc) {
    pop[pos1, posCrossover] = pop[pos2, posCrossover]
  }
  
  return(pop)
}
#parei aqui
selecao <- function(populacao){
  k = 0.75
  popSelecao <- matrix(0, nrow = tamanhoPopulacao, ncol = 5 )
  i = 1
  for (i in 1:(tamanhoPopulacao))
  {
    posicao1=sample(1:tamanhoPopulacao, 1, replace = FALSE)
    posicao2=sample(1:tamanhoPopulacao, 1, replace = FALSE)
    
    if (runif(1)<k)
    { #escolhe o melhor individuo
      if (populacao[posicao1,5] > populacao[posicao1,5])
      {
        popSelecao[i,] =populacao[posicao1,]
      }else
      {
        popSelecao[i,] =populacao[posicao1,]
      }
    }else
    {
      #escolhe o pior individuo
      if (populacao[posicao1,5] < populacao[posicao1,5])
      {
        popSelecao[i,] =populacao[posicao1,]
      }else
      {
        popSelecao[i,] =populacao[posicao1,]
      }
    }
  }
  return(popSelecao)
}

ga_v1 <- function(tp, ng){
  
  # Cria uma população de indivíduos
  # Cada cromossomo é uma linha da matriz, 4 para o genoma, e 1 para o fit do individuo
  pop <- matrix(0, nrow = tamanhoPopulacao, ncol = 5 )
  print(pop)
  
  for (i in 1:tp)
  {
    # Caracteristica que faz a movimentação na malha (genoma)
    pos1 <- runif(1, min=0, max=1)
    pos2 <- runif(1, min=0, max=(1 - pos1))
    pos3 <- runif(1, min=0, max=(1 - (pos1+pos2)))
    pos4 <- (1 - (pos1+pos2+pos3))
    
    pop[i,] <- c(pos1, pos2, pos3, pos4, 0)
  }
  
  gen=0
  #testar gerações
  while (gen < ng && max(fit)!=1) {
    fit = fitness(pop, malha)
    #atribuo o fit ao individuo
    i=1
    for (i in 1:nrow(pop))
    {
      pop[i, 5] = fit[i]
    }
    
    #fit
  #  cat(gen, "\t", max(fit), "\t", mean(fit), "\n")
    Better = pop[which.max(fit),]
    pop[1, ] = Better
    pool = matrix(0, nrow = tamanhoPopulacao, ncol = 5 )
    pool = selecao(pop)
    
    oldpop = pop
    oldfit = fit
    #seleção
    
    i = 2
    for (i in 1:nrow(pop)) {
      pop[i,] = pool[i,]
    }
    
    i = 2
    #crossover
    while (i < nrow(pop)) {
      pop = crossover(pop, i, i+1)
      i = i+2
    }
    i = 2
    #mutacao
    for (i in 1:nrow(pop)) {
      pop[i,] = mutacao(pop,i)
    }
    
    fit = fitness(pop,malha)
    melhor = which.max(fit)
    pior = which.min(oldfit)
    
    if (fit[melhor] > oldfit[pior]) {
      oldpop[pior,] = pop[melhor,]
    }
    pop = oldpop
    
    gen = gen+1
    cat(gen, "\t", max(fit), "\t", mean(fit), "\n")
  } 
  melhor = which.max(fit)
  cat(gen,"cima", pop[melhor,1], "\t Baixo ",pop[melhor,2], "\t Direita ",pop[melhor,3], "\t Esquerda ",pop[melhor,4] )
  # mutações
  #resultado
  
}