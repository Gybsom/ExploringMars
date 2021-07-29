# Exploringmars

Entendimento do exercício e lógica utilizada

A área (grid) que será percorrida pelas sondas é retangular e segue as regras de um espaço cartesiano, sendo especificada por pontos que serão a referência de localização para as sondas.

Já que o modo de entrada do grid ficou em aberto, utilizei um arquivo de texto como input para a execução do código. Desta forma, os valores inseridos na primeira linha servirão para definir o ponto final da nossa área de exploração e, consequentemente, a base (b) e a altura (h) do nosso grid. Os valores contidos no arquivo serão do tipo inteiro.

Como a área e as coordenadas de movimentação foram previamente determinadas, não implementei uma regra de limitação de área de movimentação, caso uma sonda tentasse se mover para fora da área demarcada.

Não foi descrita nenhuma regra referente à colisão das sondas, então estou assumindo que a área de um ponto é grande o suficiente para comportar as duas sondas, caso as mesmas terminem em um ponto comum.

----------------------

Não finalizei a atividade, porque não consegui executar a lógica que tinha imaginado para a execução. Iterar os valores para atualizar a posição da sonda foi uma tarefa mais árdua do que tinha previsto, por falta de familiaridade com linguagens funcionais. Tinha organizado uma lógica que funcionava com "foreach", mas não consegui transpor para o Elixir por conta valores das variáveis imutáveis e a lógica de estruturas diferente. Fiz algumas tentativas com "Enum.each" e "Enum.reduce", mas acredito que não entendi o conceito da estrutura Enum o suficiente para resolver o problema proposto. Vou seguir estudando para finalizar a programação deste teste, desculpe pela inaptidão para finalizar no prazo proposto.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exploringmars` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exploringmars, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exploringmars](https://hexdocs.pm/exploringmars).

