
# Rick & Morty Flutter App

Um aplicativo Flutter que consome a [Rick and Morty API](https://rickandmortyapi.com/) para exibir informações sobre **personagens**, **localizações** e **episódios** da série, com pesquisa, paginação e telas detalhadas para os personagens.

---

## ~> Funcionalidades

- **Listagem de personagens** com busca por nome.
- **Listagem de localizações** com busca por nome.
- **Listagem de episódios** com busca por nome.
- **Pagina de estatisticas** dos personagens.
- **Paginação** com scroll infinito.
- **Detalhes** de personagens.
- **Drawer de navegação** entre as telas.
- **Tema customizado** com paleta de cores e ícones.
- **Indicadores de carregamento** e mensagens de erro.
- **Easter Egg** ao abrir os detalhes do personagem 'Pickle Rick'.

---

## ~> Arquitetura

O projeto segue um padrão de separação por **camadas**, facilitando manutenção e escalabilidade:

- **`models/`** → Modelos de dados que representam as respostas da API.
- **`repositories/`** → Camada responsável por acessar a API usando [Dio](https://pub.dev/packages/dio) e retornar modelos.
- **`pages/`** → Telas principais e de navegação do app.
- **`widgets/`** → Componentes reutilizáveis e customizados.
- **`theme/`** → Definições de cores e imagens.
- **`util/`** → Funções utilitárias.

```
lib/
│
├── models/                
│   ├── detailed_character_model.dart
│   ├── episode_model.dart
│   ├── location_model.dart
│   ├── paginated_characters_model.dart
│   ├── paginated_episodes_model.dart
│   └── paginated_locations_model.dart
│
├── pages/                 
│   ├── details_page.dart
│   ├── episodes_page.dart
│   ├── home_page.dart
│   ├── locations_page.dart
│   └── statistics_page.dart
│
├── repositories/          
│   ├── character_repository.dart
│   ├── episodes_repository.dart
│   └── location_repository.dart
│
├── theme/                
│   ├── app_colors.dart
│   └── app_images.dart
│
├── util/                 
│   └── util.dart
│
├── widgets/             
│   ├── app_bar_widget.dart
│   ├── character_card_widget.dart
│   ├── character_list_widget.dart
│   ├── detail_character_card_widget.dart
│   ├── drawer_widget.dart
│   ├── episode_card_widget.dart
│   ├── episode_list_widget.dart
│   ├── location_card_widget.dart
│   ├── location_list_widget.dart
│   ├── search_bar_widget.dart
│   └── statistics_card_widget.dart
│
└── main.dart             
```

---

## ~> Padrões e Boas Práticas

- **Clean Code** → Nomes claros para variáveis, métodos e classes.
- **Camadas bem definidas** → Models, Repositories, Pages e Widgets separados.
- **Reutilização de componentes** → Widgets genéricos para listas, cards, barra de busca e Drawer.
- **Consumo de API desacoplado** → Toda requisição centralizada nos repositórios.


---

## ~> Tecnologias

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Audio Player](https://pub.dev/packages/audioplayers)
- [Dio](https://pub.dev/packages/dio)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Rick and Morty API](https://rickandmortyapi.com/)
- Gerenciamento de estado simples com `setState` e `FutureBuilder`

---

## ~> Como executar

1. **Clone este repositório**
   ```
   git clone https://github.com/JonasNogueira/kode-start.git
   cd rick_morty
   ```
2. **Instale as dependências**

    ```
    flutter pub get
    ```
3. **Execute o app**

    ```
    flutter run
    ```

