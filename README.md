<p align="center"><img src="https://raw.githubusercontent.com/wiki/fga-gpp-mds/2017.1-Escola-X/images/Logo_Escola_X.jpg" width="350px"></p>

<p align="center">
  <a href="https://codeclimate.com/github/fga-gpp-mds/2017.1-Escola-X"><img src="https://codeclimate.com/github/fga-gpp-mds/2017.1-Escola-X/badges/gpa.svg"></a>
  <a href="https://travis-ci.org/fga-gpp-mds/2017.1-Escola-X/"><img src="https://api.travis-ci.org/fga-gpp-mds/2017.1-Escola-X.svg?branch=master"></a>
  <a href="https://coveralls.io/github/fga-gpp-mds/2017.1-Escola-X"><img src="https://coveralls.io/repos/github/fga-gpp-mds/2017.1-Escola-X/badge.svg"></a>
  <a href="https://www.gnu.org/licenses/gpl-3.0.en.html"><img src="https://img.shields.io/aur/license/yaourt.svg" alt="License: GPL"></a>  
</p>


# 2017.1 - Escola Centro de Ensino Médio 01 do Gama (CG).

<p align="justify">Escola X é um software livre de gerenciamento e controle de presenças de alunos e notificação aos respectivos responsáveis. O sistema foi inicialmente desenvolvido por estudantes do curso de Engenharia de Software da UnB-Gama como projeto das disciplinas Método de Desenvolvimento de Software e Gerência de Gestão de Portifólios e Projetos de Software.</p>

Escola X foi desenvolvido com a finalidade de atender a demanda e necessidade do Centro de Ensino Médio 01 (CG), escola localizada na cidade do Gama - DF.

Se tem o interesse em contribuir para a Escola X, confira o guia de contribuições.


## Instalação

Os comandos abaixo foram voltados para usuários que utilizam o sistema operacional Linux.

Primeiro passo para a instalação do projeto é baixar o repositório com o seguinte comando:

```git clone https://github.com/fga-gpp-mds/2017.1-Escola-X.git```

<p align="justify">Após clonar o repositório, configure o vangrat seguindo o tutorial do plano de gerenciamento de configuração <a href="https://github.com/fga-gpp-mds/2017.1-Escola-X/wiki/Plano-de-Gerenciamento-de-Configura%C3%A7%C3%A3o#21-instala%C3%A7%C3%A3o-do-vagrant">aqui</a>.</p>

Após configurar o vangrat, rode os seguintes comandos na máquina virtual. 

Para estruturar o banco de dados: 

```rails db:migrate```

Para rodar o servidor localmente:

```rails s -b 0.0.0.0```

Acesse a aplicação através do link: http://0.0.0.0:3000


## Principais funcionalidades

- Gerenciamento de alunos
- Manter funcionário
- Gerenciar turma
- Controle de Presença e Notas
- Gerar boletim
- Relatório Geral
- Notificação aos Pais
- Manter notificação
- Manter suspensão
- Manter advertência
- Enviar SMS    

## Como contribuir

Os contribuintes podem colaborar para manter e evoluir o sistema através da correção de bugs e implementação de novas funcionalidades, que estão listados na pipeline "Opened Issues" no zenhub <a href= "https://github.com/fga-gpp-mds/2017.1-Escola-X#boards?repos=84881923">Boards</a>. Para contribuir o projeto deve ser clonado do repositório oficial.

## Documentação 

Toda a documentação pode ser acessada através da wiki do projeto <a href="https://github.com/fga-gpp-mds/2017.1-Escola-X/wiki">aqui</a>.
