print("============================================================\n")
print("Bem vindo ao jogo de RPG\n")

print("Crie seu personagem")

print("Digite seu nome:")

local nome_def = io.read()

print("Selecione sua classe (Digite 1 ou 2): \n")

print("(1) = Cavaleiro (ataque = 5, vida = 10, cura = 2)")
print("(2) = Clerigo (ataque = 3, vida = 14, cura = 5)")
print("(Outro numero) para encerrar o jogo")

local vida_def = 0
local atq_def = 0
local cura_def = 0

local n = tonumber(io.read())

local cont = 0

if n == 1 then
    atq_def = 5
    cura_def = 2
    vida_def = 10

    else if n == 2 then
        atq_def = 3
        cura_def = 5
        vida_def = 13
    else
        print("Insira um numero valido")
    end
end

local personagem = {
    nome = nome_def,
    atq = atq_def,
    vida = vida_def,
    cura = cura_def
}

local inimigo = {
    [1] = {inimigo_nome = "Formiga Gigante", inimigo_vida = 5, inimigo_atq = 2},
    [2] = {inimigo_nome = "Zumbi", inimigo_vida = 7, inimigo_atq = 3},
    [3] = {inimigo_nome = "Ogro", inimigo_vida = 12, inimigo_atq = 4},
    [4] = {inimigo_nome = "Morte", inimigo_vida = 99, inimigo_atq = 99}
}

local inimigo_reset = {
    [1] = 5,
    [2] = 7,
    [3] = 12,
    [4] = 99
}

local function ataque(personagem, inimigo)
    print("============================================================\n")
    print("Voce tirou", personagem.atq, "dos pontos de vida de ", inimigo.inimigo_nome, "\n")
    inimigo.inimigo_vida = inimigo.inimigo_vida - personagem.atq
end

local function curar(personagem)
    print("============================================================\n")
    print("Voce curou", personagem.cura, "pontos de vida\n")
    personagem.vida = personagem.vida + personagem.cura
end

local function atq_inimigo(inimigo, personagem)
    print("============================================================\n")
    print(inimigo.inimigo_nome, "tirou", inimigo.inimigo_atq, "da sua vida\n")
    personagem.vida = personagem.vida - inimigo.inimigo_atq
end

local function errou_inimigo(inimigo)
    print("============================================================\n")
    print(inimigo.inimigo_nome, "errou o ataque\n")
end

local function inimigo_morte(inimigo)
    print("============================================================\n")
    print(inimigo.inimigo_nome, "Morreu\n")
    cont = cont + 1
end

local function personagem_morte(personagem)
    print("============================================================\n")
    print(personagem.nome, " Morreu\n")
end

print("============================================================\n")

math.randomseed(os.time())

while personagem.vida > 0 do

    print("Seus atributos:\n")
    print("Nome:",personagem.nome)
    print("Vida:",personagem.vida)
    print("Ataque:",personagem.atq)
    print("Cura:",personagem.cura)

    print("============================================================\n")

    local rng = math.random(1, 4)

    if inimigo[rng] then
        print(inimigo[rng].inimigo_nome, "apareceu! O que voce vai fazer?\n")
        print("Status do inimigo:")
        print("Vida:", inimigo[rng].inimigo_vida)
        print("Ataque:", inimigo[rng].inimigo_atq, "\n")
        print("Digite: (1) para lutar, (2) para fugir")

        local n2 = tonumber(io.read())

        if n2 == 1 then
            while inimigo[rng].inimigo_vida > 0 do
                print("============================================================\n")
                print("Sua vida;", personagem.vida)
                print("Vida do inimigo:", inimigo[rng].inimigo_vida)

                print("Digite: (1) para atacar, (2) para se curar")

                local n3 = tonumber(io.read())

                if n3 == 1 then
                    ataque(personagem, inimigo[rng])

                    if inimigo[rng].inimigo_vida <= 0 then
                        inimigo_morte(inimigo[rng])
                        inimigo[rng].inimigo_vida = inimigo_reset[rng]
                        break
                    end

                    local rng2 = math.random(1, 4)

                    if rng2 == 3 then
                        atq_inimigo(inimigo[rng], personagem)
                    else
                        errou_inimigo(inimigo[rng])
                    end
                    
                    if personagem.vida <=0 then
                        personagem_morte(personagem)
                        break
                    end

                elseif n3 == 2 then
                    curar(personagem)

                    local rng3 = math.random(1,2)

                    if  rng3 == 2 then
                        atq_inimigo(inimigo[rng], personagem)
                    else
                        errou_inimigo(inimigo[rng])
                    end

                    if personagem.vida <=0 then
                        personagem_morte(personagem)
                        break
                    end
                end

                if personagem.vida <=0 then
                        personagem_morte(personagem)
                        break
                    end
            end
        else if n2 == 2 then
            print("============================================================\n")
            print("Voce arregou kkkkkkkkkkkk\n")
            inimigo[rng].inimigo_vida = inimigo_reset[rng]
            personagem.vida = 0
            n2 = 0
            n = 0
            end
        end
    end
end

print("Fim de Jogo acabou pra vc seu betinha\n")
print("Numero de inimigos derrotados:", cont)