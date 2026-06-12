# Trabalho 3 - Linguagens de Programação

## Descrição

Implementação do jogo Rock, Paper, Scissor, Water e Fire em Haskell.

O projeto possui três bots:

* **GodBot**: sempre escolhe uma jogada vencedora.
* **DumbBot**: sempre escolhe uma jogada perdedora.
* **FairBot**: escolhe uma jogada aleatória.

## Requisitos

* GHC 8.8 ou superior
* Make

## Compilação e Execução

Na raiz do projeto execute:

```bash
make run
```

O comando irá compilar o projeto e executar o jogo automaticamente.

## Limpeza dos arquivos gerados

Para remover os arquivos de compilação:

```bash
make clean
```

## Estrutura do Projeto

```text
.
├── src/
│   ├── Main.hs
│   ├── Play.hs
│   ├── GodBot.hs
│   ├── DumbBot.hs
│   └── FairBot.hs
├── build/
├── Makefile
└── README.md
```
