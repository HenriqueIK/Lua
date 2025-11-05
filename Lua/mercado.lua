print("============================================================\n")
print("Bem vindo ao sistema operacional de caixa de mercado\n")

local produtos = {
  [1] = {nome = "Arroz", preco = 26.80},
  [2] = {nome = "Feijao", preco = 7.60},
  [3] = {nome = "Carne", preco = 42.90},
  [4] = {nome = "Alface", preco = 4,50},
  [5] = {nome = "Batata", preco = 3,50},
  [6] = {nome = "Tomate", preco = 4,10},
  [7] = {nome = "Salgadinho", preco = 7,20},
  [8] = {nome = "Chocolate", preco = 14,90},
  [9] = {nome = "Sorvete", preco = 31,50},
  [10] = {nome = "Bolo", preco = 27,90}
}

print("============================================================\n")
print("Produtos:")
print("Nome - Codigo do produto - Preco(R$)")
print("Arroz - 1 - 26,80")
print("Feijao - 2 - 7,60")
print("Carne - 3 - 42,90")
print("Alface - 4 - 4,50")
print("Batata - 5 - 3,50")
print("Tomate - 6 - 4,10")
print("Salgadinho - 7 - 7,20")
print("Chocolate - 8 - 14,90")
print("Sorvete - 9 - 31,50")
print("Bolo - 10 - 27,90\n")
print("============================================================\n")

local lista = {}

local soma = 0

local cod = -1

while cod ~= 0 do

    print("Digite o codigo do produto (Digite 0 para finalizar a compra):\n")
    
    cod = tonumber(io.read())

    if produtos[cod] then
        print("Digite a quantidade:")

        local qtd = tonumber(io.read())
        
        soma = (produtos[cod].preco * qtd) + soma

        table.insert(lista, produtos[cod].nome)
    else
        print("Insira um numero valido")
    end
end

print("============================================================\n")

print("O preco final foi de:")

print(soma)

print("Sua lista de compras(sem a quantidade):")

for i, lista in ipairs(lista) do
    print(i, lista)
end