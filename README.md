# Aplicativo Taski TO-DO

Este é um aplicativo de tarefas simples desenvolvido usando Flutter, com base no design do [Figma](https://www.figma.com/design/RPnpIHgvIKobI7LieqNCcw/Taski-To-Do?node-id=12-387&t=BYUaJu2rE4Ha5Unx-0). Ele permite que os usuários gerenciem suas tarefas com funcionalidades básicas de CRUD (Criar, Ler, Atualizar, Excluir) e Buscar.

## Funcionalidades

- Adicionar novas tarefas
- Marcar tarefas como concluídas
- Excluir tarefas
- Pesquisar tarefas pelo título ou descrição
- Armazenamento local das tarefas utilizando **Hive**
- Navegação simples e eficiente usando **GoRouter**
- Interface intuitiva baseada na arquitetura **MVVM**
- Implementação de testes de widget e unitário com **Flutter Test**

## Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento multiplataforma para criar aplicações nativas com uma única base de código.
- **Dart**: Linguagem de programação utilizada pelo Flutter, com foco em desempenho e produtividade.
- **Hive**: Banco de dados NoSQL rápido e eficiente para armazenamento local.
  - **Hive Flutter**: Extensão do Hive para integração fácil com Flutter.
  - **Hive Generator**: Ferramenta para geração de adaptadores de tipos para o Hive.
  - **Hive Test**: Biblioteca para facilitar os testes envolvendo Hive, permitindo simulações sem a necessidade de armazenamento físico.
- **Provider**: Gerenciamento de estado reativo e simplificado para Flutter.
- **GoRouter**: Solução flexível para gerenciamento de rotas com suporte a navegação declarativa.
- **Flutter Test**: Ferramenta para realizar testes de unidade e de widgets na aplicação.
- **Mockito**: Biblioteca para criação de mocks em testes unitários.
- **Build Runner**: Ferramenta para gerar código automaticamente, utilizada com o Hive Generator.


## Arquitetura Utilizada

O aplicativo segue o padrão **MVVM (Model-View-ViewModel)** para manter o código modular, reutilizável e testável:

1. **Model**:
   - Representa os dados e a lógica do domínio.
   - No caso deste aplicativo, a entidade principal é a `Task`, gerenciada com o banco de dados **Hive**.

2. **ViewModel**:
   - Lida com a lógica de negócios e a interação entre os dados (Model) e a interface (View).
   - Gerenciado com **Provider** para estado reativo.
   - Exemplo: `TodoTaskViewModel`, `SearchTaskViewModel`.

3. **View**:
   - Camada de apresentação que exibe os dados para o usuário e captura as interações.
   - Implementada com widgets do Flutter, incluindo telas como `TodoTask`, `DoneTask`, `SearchTask`.

## Testes

O projeto inclui testes para garantir a funcionalidade e estabilidade do código:

- **Testes de Widgets**:
  - Verificação de transições entre páginas.
  - Garantia de que os widgets principais estão sendo exibidos corretamente.

- **Testes de Lógica**:
  - Validação de funcionalidades como busca e gerenciamento de tarefas.

Os testes foram desenvolvidos utilizando o **Flutter Test**.

## Como Rodar o Aplicativo

### Pré-requisitos

Certifique-se de ter o seguinte instalado na sua máquina:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Editor de código como [Visual Studio Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio)

### Passos para Configuração

1. Clone este repositório:
   ```bash
   git clone git@github.com:LucasPetruci/taski_to_do.git
2. Navegue até o diretório do projeto:
   ```bash
   cd taski_to_do
3. Instale as dependências:
   ```bash
   flutter pub get
4. Inicie o emulador: <br>
   No desenvolvimento foi utilzado a Pixel 3 API 30
   
6. Execute o aplicativo:
   ```bash
    flutter run
   

### Executando os testes

  Para rodar os testes, use o comando:
   ```bash
     flutter test
   ```
 Demo Online

Você pode acessar a versão online do aplicativo através deste link: [TODO App Online](https://virtual-cell-phone.vercel.app/app/Taski)


<p align="center">
  <img src="https://github.com/user-attachments/assets/a827cc3c-df04-4413-9923-c1308ef8aa15" alt="1" width="250"/>
  <img src="https://github.com/user-attachments/assets/7cce9f8f-9bce-482e-8c30-ac270e711b55" alt="2" width="250"/>
  <img src="https://github.com/user-attachments/assets/d09d8610-8fa0-4e30-808d-3ae0fc4b3274" alt="3" width="250"/>
  <img src="https://github.com/user-attachments/assets/f8404095-be6c-4b6c-a5e0-bcd0cfa032f6" alt="4" width="250"/>
  <img src="https://github.com/user-attachments/assets/a0b3d635-e606-42ce-9c81-78c8a068735d" alt="5" width="250"/>
  <img src="https://github.com/user-attachments/assets/26736dc9-cb49-4eee-a94d-7c76d610ab51" alt="6" width="250"/>
  <img src="https://github.com/user-attachments/assets/336d5887-d23f-41de-b354-d6e4c8f900ae" alt="7" width="250"/>
</p>
