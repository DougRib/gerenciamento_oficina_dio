
# Banco de Dados para Gerenciamento de Oficina

Este projeto define a estrutura de um banco de dados relacional para gerenciamento de uma oficina mecânica. Ele abrange os principais aspectos de gestão, como cadastro de clientes, veículos, ordens de serviço, execução de serviços, controle de peças, mão de obra, pagamentos e mais.

---

## Visão Geral

O objetivo do banco de dados é fornecer uma estrutura eficiente e organizada para gerenciar as operações de uma oficina mecânica. O banco de dados é dividido em várias tabelas interconectadas que permitem:

- **Cadastro de Clientes e Veículos**: Gerenciar informações de clientes e os veículos associados a eles.
- **Gestão de Ordens de Serviço (OS)**: Criar, acompanhar e atualizar o status das OS.
- **Execução de Serviços**: Registrar a execução de serviços pelos mecânicos.
- **Controle de Peças e Mão de Obra**: Gerenciar itens utilizados em reparos e serviços.
- **Gestão de Pagamentos**: Acompanhar o pagamento de serviços realizados.
- **Histórico de Serviços**: Acompanhar revisões, consertos e autorizações.

---

## Estrutura do Banco de Dados

### Tabelas e Suas Finalidades

1. **`serviceOrder` (Ordem de Serviço - OS)**  
   Tabela principal do sistema, onde são registradas as ordens de serviço. Contém informações como cliente, veículo, tipo de serviço, orçamento, pagamento e status da OS.

2. **`clients` (Clientes)**  
   Armazena informações dos clientes da oficina, como nome, telefone e endereço.

3. **`vehicle` (Veículos)**  
   Registra os veículos dos clientes, incluindo marca, modelo, ano e placa.

4. **`mechanic` (Mecânicos)**  
   Contém informações dos mecânicos, como nome e especialidade.

5. **`serviceExecution` (Execução de Serviço)**  
   Relaciona mecânicos às ordens de serviço, detalhando os serviços realizados.

6. **`repairCar` (Conserto)**  
   Contém informações de consertos realizados em ordens de serviço, incluindo descrição e custo.

7. **`revision` (Revisões)**  
   Registra revisões realizadas, contendo recomendações, custo e descrição.

8. **`supplier` (Fornecedor)**   
    Fornecedor das peças.

9. **`parts` (Peças)**  
   Gerencia o estoque de peças disponíveis para consertos, incluindo nome, descrição, preço e quantidade.

10. **`payment` (Pagamentos)**  
    Registra pagamentos associados às ordens de serviço, incluindo o valor, forma de pagamento e data.

---

## Relacionamentos

- Cada **cliente** pode ter vários **veículos** registrados.
- Cada **veículo** pode estar associado a múltiplas **ordens de serviço**.
- Cada **ordem de serviço** (OS) pode ter:
  - Peças associadas.
  - Serviços executados por diferentes **mecânicos**.
  - Pagamentos registrados.
- Os **mecânicos** são responsáveis pela execução das OS, vinculados através da tabela `serviceExecution`.

---
