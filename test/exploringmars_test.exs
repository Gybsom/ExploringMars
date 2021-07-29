defmodule ExploringmarsTest do
  use ExUnit.Case
  doctest Exploringmars

  #ExUnit.start()

  test "Teste de leitura do arquivo de coordenadas" do
    assert is_list(Exploringmars.readCoordFile()) == true
  end

  test "Teste de rotacao para a esquerda" do
    assert Exploringmars.rotate("L", "N") == "W"
  end

  test "Teste de rotacao para a direita" do
    assert Exploringmars.rotate("R", "N") == "E"
  end

  test "Teste de movimentacao horizontal (x)" do
    assert Exploringmars.move(2, 3, "E") == {3,3}
  end

  test "Teste de movimentacao vertical (y)" do
    assert Exploringmars.move(2, 3, "S") == {2,2}
  end
end
