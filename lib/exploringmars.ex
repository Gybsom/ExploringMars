defmodule Exploringmars do

  def main do

    IO.puts "Bem vindo ao programa de exploracao de Marte. Para este programa, vamos utilizar duas sondas (probe1 e probe2) e percorrer o perimetro de 8x8 com as coordenadas de navegacao predefinidas no arquivo \"coords.txt\".\n"
    IO.puts "A primeira sonda inicia na posicao \"2 3 E\" e faz a movimentacao \"RMMMLMMLMRMLMRMM\"."
    IO.puts "A segunda sonda inicia na posicao \"7 8 W\" e faz a movimentacao \"MMMLMLMRMMRMMMLM\"\n"
    IO.gets "Pressione enter para visualizar a posicao final das sondas depois de percorrer as instrucoes.\n"


  end

  def readCoordFile() do
    {:ok, coordinates} = File.read("lib/coord.txt")
    coordinates |> String.split("\r\n", trim: true) |> Enum.to_list
  end

  def rotate(direction, cardinalPosition) do
    if direction == "L" do
      case cardinalPosition do
        "N" -> "W"
        "W" -> "S"
        "S" -> "E"
        "E" -> "N"
        _ -> "Valor invalido"
      end
    else
      case cardinalPosition do
        "N" -> "E"
        "E" -> "S"
        "S" -> "W"
        "W" -> "N"
        _ -> "Valor invalido"
      end
    end
  end

  def move(xaxis, yaxis, cardinalPosition) do
    Enum.reduce(
        [cardinalPosition],
        {xaxis,yaxis},
        fn x, {acc1, acc2} ->
      cond do
        x == "N" -> {acc1, acc2 + 1}
        x == "E" -> {acc1 + 1, acc2}
        x == "S" -> {acc1, acc2 - 1}
        x == "W" -> {acc1 - 1, acc2}
      end
    end)
  end
end
