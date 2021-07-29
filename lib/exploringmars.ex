defmodule Exploringmars do

  def main do

    IO.puts "Bem vindo ao programa de exploracao de Marte. Para este programa, vamos utilizar duas sondas (probe1 e probe2) e percorrer o perimetro de 8x8 com as coordenadas de navegacao predefinidas no arquivo \"coords.txt\".\n"
    IO.puts "A primeira sonda inicia na posicao \"2 3 E\" e faz a movimentacao \"RMMMLMMLMRMLMRMM\"."
    IO.puts "A segunda sonda inicia na posicao \"7 8 W\" e faz a movimentacao \"MMMLMLMRMMRMMMLM\"\n"
    IO.gets "Pressione enter para visualizar a posicao final das sondas depois de percorrer as instrucoes.\n"

    coordRaw = readCoordFile()

    grid = Enum.at(coordRaw, 0) |> String.split()
    probe1Start  = Enum.at(coordRaw, 1) |> String.split()
    probe1Moves = for <<x::binary-1 <- (Enum.at(coordRaw, 2))>>, do: x
    probe2Start  = Enum.at(coordRaw, 3) |> String.split()
    probe2Moves = for <<x::binary-1 <- (Enum.at(coordRaw, 4))>>, do: x

    probeMovements(grid, probe1Start, probe1Moves)
    #probeMovements(grid, probe2Start, probe2Moves)

  end

  def readCoordFile() do
    {:ok, coordinates} = File.read("lib/coord.txt")
    coordinates |> String.split("\r\n", trim: true) |> Enum.to_list
  end

  def probeMovements(grid, probeCoords, probeMoves) do

    gridBase = Enum.at(grid, 0) |> String.to_integer
    gridHeight = Enum.at(grid, 1) |> String.to_integer

    probeX = Enum.at(probeCoords, 0) |> String.to_integer
    probeY = Enum.at(probeCoords, 1) |> String.to_integer
    #listCardinals = []
    cardinals = Enum.at(probeCoords, 2)


    #for x <- Enum.count(cardinals) do
      #if x == "L" or x == "R" do
     #   [(rotate(x, List.first(listCardinals))) | listCardinals]
     # end
    #end
    Enum.each(probeMoves, fn x ->
        if x == "L" or x == "R" do
          IO.puts inspect(rotate(x, rotate(x, cardinals)))
        end
      end)

      #Enum.each(probeMoves,
      #fn x -> cond do
        #x == "L" -> probeCardinal = rotate(x, probeCardinal)
        #x == "R" -> probeCardinal = rotate(x, probeCardinal)
        #IO.puts probeCardinal
        #x == "M" -> IO.puts inspect(move(probeX, probeY, probeCardinal))
        #probeCardinal = "L" -> rotate(x, probeCardinal)
        #probeCardinal = "R" -> rotate(x, probeCardinal)
        #probeMoved = "M" -> move(probeX, probeY, probeCardinal)
        #[probeX, probeY] = Tuple.to_list(probeMoved)
        #IO.puts inspect(probeCardinal)
      #end
    #end)
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
        {xaxis, yaxis, cardinalPosition},
        fn x, {acc1, acc2, card} ->
      cond do
        x == "N" -> {acc1, acc2 + 1, card}
        x == "E" -> {acc1 + 1, acc2, card}
        x == "S" -> {acc1, acc2 - 1, card}
        x == "W" -> {acc1 - 1, acc2, card}
      end
    end)
  end
end
