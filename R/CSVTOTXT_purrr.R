

purrr::walk(1:nrow(vacina),~{
  
  nome <- vacina %>% 
    dplyr::slice(.x) %>% 
    dplyr::pull("nome")
  
  
  vacina %>% 
    dplyr::slice(.x) %>% 
    dplyr::pull("texto") %>% 
    write(file = paste0(nome,".txt"))
  
})

Louvo o Pai, louvo o filho, louvo à última Trindade!
