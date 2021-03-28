######### Função para transformar um vetor de strings em txt individuais para cada linha by https://github.com/jjesusfilho

purrr::walk(1:nrow(df),~{
  ## Escolher um vector do df com os nomes do arquivos txts que serão criados 
  nome <- df %>% 
  dplyr::slice(.x) %>% 
  dplyr::pull("nome")
  ## Selecionar o df 
  df %>% 
    dplyr::slice(.x) %>% 
    dplyr::pull("texto") %>% 
    write(file = paste0(nome,".txt"))
  })

### Os txts serão criados no wd
