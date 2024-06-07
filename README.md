# Tractian Interview App

## Apresentação em Vídeo

[result.webm](https://github.com/KevinKobori/tractian_interview/assets/143670993/74278972-0f75-4e4c-ac90-48456b8d0c65)

## Desafio

**Desafio:** [Challenge](https://github.com/tractian/challenges/tree/main/mobile)

**Design:** [Figma](https://www.figma.com/design/IP50SSLkagXsUNWiZj0PjP/[Careers]-Flutter-Challenge-v2?node-id=0-1&t=rQqI5YMKR3wiZDHd-0)

## Instruções para Iniciar

1. Execute o build_runner para criar os arquivos `.freezed` e `.g` dos modelos:

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

2. Para evitar possíveis problemas, rode o Flutter com a configuração feita no VSCode (arquivo `.vscode/launch.json`), devido à necessidade de instanciar o arquivo `.env.DEV` com o comando `--dart-define-from-file`.

## Observações

- **Ícone do Componente:** O ícone do componente está com problemas ao exportar para SVG. Por isso, ele pode aparecer distorcido no aplicativo.

- **Busca:** A implementação da busca foi feita apenas pelo nome do componente. Poderia facilmente ser expandida para incluir `sensorType`, `status` ou `gatewayId`, mas decidi não fazer isso para evitar confusão, já que durante o uso da feature o usuário só tem acesso de feedback na tela dele o nome do item em si.

## Funcionalidades Removidas

- **Animações:** Inicialmente, implementei algumas animações ao abrir os nós da árvore, mas, após alguns testes, percebi que isso estava impactando o desempenho, especialmente em árvores grandes como a da unidade Apex.

## Melhorias caso tivesse mais tempo

**Detalhes Gerais:**

- Melhorar a pesquisa por ativo ou local.

**Documentação e Organização:**

- Separar o desafio em tasks documentadas, branches e merges bem documentados.
- Melhorar a documentação dos commits.

**Testes:**

- Implementar testes unitários para garantir máxima cobertura de funcionalidades.
- Implementar testes de widgets para verificar as páginas, views, widgets e design system.
- Implementar testes de integração para máxima cobertura.

**Configuração e Arquitetura:**

- Criar uma camada de configuração robusta, isolando factories, singletons, adaptadores, constantes e configurações de ambientes.
- Criar um pacote externo para o design system e outro para o storybook, isolando temas e componentes para reutilização em diferentes aplicações, incluindo testes de temas e componentes.
- Criar um pacote "Core" para regras de negócio e configurações compartilhadas entre aplicações.
- Implementar um tratamento de erros mais eficiente e detalhado.

**Gerenciamento e Navegação:**

- Implementar um `NavigatorManager` para isolar a navegação e evitar bugs comuns, adicionando tratamentos específicos se necessário.
- Implementar InheritedWidgets para controlar instancias na arvore, ou utilizar pacotes como flutter_modular ou provider para fazerem isso.
