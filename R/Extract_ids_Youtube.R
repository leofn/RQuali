library(stringr)
#### Função para extrair IDs do Youtube por https://github.com/thiagoalencar

## Regex para as ids

regex <- "(?:^|\\W)(?:youtube(?:-nocookie)?\\.com/(?:.*[?&]v=|v/|e(?:mbed)?/|[^/]+/.+/)|youtu\\.be/)([\\w-]+)"

## Criando a função
getVideoId <- function(text) {
  regex <- "(?:^|\\W)(?:youtube(?:-nocookie)?\\.com/(?:.*[?&]v=|v/|e(?:mbed)?/|[^/]+/.+/)|youtu\\.be/)([\\w-]+)"
  id <- stringr::str_match(text,regex)[2]
  return(id)
  }

## APlicando a função no vetor de strings (Substituir "revfont_TXT_FINAL$texto")
ids <- lapply(revfont_TXT_FINAL$texto,getVideoId)

## O resultado é uma lista, o passo agora é eliminar os NA values
ids <- ids[!is.na(ids)]

## Convertendo a lista em um vetor de strings
ids <- unlist(ids)

## Criar um df com as ids
ids <- data.frame(ids)

## Salvar um csv com as ids
write.csv(ids,"ids.csv")
