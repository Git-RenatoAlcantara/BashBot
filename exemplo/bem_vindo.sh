#!/bin/bash
source BashBot.sh

token="5364826966:AAGfUb1i8HZsEHbHPfUmnxerkbITyig_WJk"
BashBot.init --token $token

bem_vindo(){
    BashBot.sendMessage --chat_id $id --text "Bem vindo!"
}


while :  
do
    BashBot.getUpdate --offset $(BashBot.offsetNext) --limit 1  --timeout 10
    mensagem=$(BashBot.getMessage)
    (
    [[ -n $mensagem ]] && {
        id=$(BashBot.id)
        case $mensagem in 
        "/start") bem_vindo
        ;;
        esac
    }
    )&
done