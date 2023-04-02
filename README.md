# Fortis Criteris

Esse é um projeto desenvolvido para apresentação na Fetin (Feira de Tecnologias do Inatel). A Fetin é um evento promovido pelo Instituto Nacional de Telecomunicações (Inatel) no qual os alunos de graduação podem apresentar os trabalhos desenvolvidos durante o ano.

Baseado na crescente necessidade de tomarmos decisões assertivas a todo momento, desenvolvemos um aplicativo android que auxilia o usuário a tomar a melhor decisão, de forma lógica, baseado nos seus critérios e suas alternativas.

<h1 align="center">
    <img align="center" src="Images\Splash Screen.png" width="300px;" alt="splash_screen"/>
</h1>

Primeiro, pedimos ao usuário para entrar com o número de critérios que ele acha necessário para a decisão, junto ao número de alterativas que ele tem.

<h1 align="center">
    <img align="center" src="Images\Alter x Crit.png" width="300px;" alt="alter_crit"/>
</h1>

Caso fique com dúvidas em relação ao que seria a definição de critério e alternativa, é só tocar no ícon e de informação ao lado da entrada de dados e terá uma breve explicação.

| Critérios | Alternativas
|----------|----------|
| <img align="center" src="Images\Definição Criterios.png" width="300px;" alt="def_crit"/> |  <img align="center" src="Images\Definição Alternativas.png" width="300px;" alt="def_alt"/>

Após inseridos o número de critérios e alternativas, insere-se o nome do critério e seu respectivo peso.

<h1 align="center">
    <img align="center" src="Images\Entrada de Nome e Peso.png" width="300px;" alt="nome_peso"/>
</h1>

Em seguida, coloca-se as notas para os respectivos critérios. Nota: cada quadradinho é uma alternativa.

<h1 align="center">
    <img align="center" src="Images\Entrada de Notas.png" width="300px;" alt="notas"/>
</h1>

Por fim, é gerado um ranking da melhor para a pior escolha.

<h1 align="center">
    <img align="center" src="Images\Ranking.png" width="300px;" alt="ranking"/>
</h1>

### Clone
```
git clone https://github.com/wesley-marcos/C214_teste_mock
```

## Requisitos

* Dart => 2.17.5
* Flutter => 3.0.0

As seguintes dependências no arquivo pubspec.yaml:

dependencies:
* http: ^0.13.5

dev_dependencies:
* google_fonts: ^3.0.1
*  gender_picker: ^1.1.0
*  dio: ^4.0.6
*  flutter_native_splash: ^2.2.9
*  flutter_launcher_icons: ^0.10.0

## License
[MIT](https://choosealicense.com/licenses/mit/)


## Autores
- Antonio Victor Mendes Fonseca.
- Pedro Gabriel Garcia Ribeiro Balestra
- Wesley Marcos Borges
