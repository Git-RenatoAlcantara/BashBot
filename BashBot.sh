#!/bin/bash
#================ CODIGOS DE ESTILOS ============|
Bold=$(tput bold)
Norm=$(tput sgr0)
Yellow=$(tput setaf 3)
Red=$(tput setaf 1)
Green=$(tput setaf 2)
#=============================================
setToken(){
    TOKEN=$2
 
}

sendMessage(){
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id=$1  -d text="$2"  -d parse_mode="HTML" 
}

getUpdates(){
  result=$(curl -s  --request POST \
     --url https://api.telegram.org/bot$TOKEN/getUpdates \
     --header 'Accept: application/json' \
     --header 'Content-Type: application/json' \
     --data '
{
     "offset": '$1',
     "limit": '$2',
     "timeout": '$3'
}
')

    ID=$(echo $result | jq -r '.result[-1].update_id')
    MESSAGE=$(echo $result | jq -r '.result[-1].message.text')
    CHAT_ID=$(echo $result | jq -r '.result[-1].message.chat.id')
    
}

BashBot.getMessage(){
  [[ $( echo $MESSAGE) == null ]] && {
    echo ""
  } ||{
    echo $MESSAGE
  }
}

BashBot.sendMessage(){
    #echo $@ | egrep '^\-\-chat_id'
    
    text=$(echo "$@" | egrep -o '\-\-text.*' | sed 's/--text//g')
    chat_id=$(echo "$@" | egrep -o '^\-\-chat_id\s\w+' | sed 's/--chat_id//')
    [[ -n $text ]] && [[ -n $chat_id ]] && sendMessage $chat_id "$text" || echo -e "${Red} Erro ao executar a função BashBot.sendMessage ${Norm}"

}

BashBot.token(){
    echo $TOKEN
}

BashBot.offsetNext(){
    (( OFFSET = ID + 1 ))
    echo $OFFSET
}

BashBot.getUpdate(){
    offset=$(echo "$@" | egrep -o '^\-\-offset\s\w+' | sed 's/--offset//')
    limit=$(echo "$@" | egrep -o '\-\-limit\s\w+' | sed 's/--limit//')
    timeout=$(echo "$@" | egrep -o '\-\-timeout\s\w+' | sed 's/--timeout//g')
    [[ -n $offset ]] && [[ -n $limit ]] && [[ -n $timeout ]] && {
        getUpdates $offset $limit $timeout
    } || {
        echo "${Red} Erro na função BashBot.getUpdate parametro não pode ficar vazio${Norm} "
    }
}

BashBot.init(){
    for args in "$@"; do
        case $args in
        "--token") setToken $@;;
        esac
    done
}

BashBot.id(){
    echo $CHAT_ID
}

help(){
cat << FECHA
 ${Bold}opções:${Norm}
 ${Bold}BashBot.init${Norm}    BashBot.init --token <token>           ${Green}# Comando necessário para inicinar o bot${Norm}
 ${Bold}BashBot.token${Norm}   BashBot.token                        ${Green}# Não precisa de parametro. Retorna o token do bot${Norm}
 
 ${Bold}BashBot.getUpdate${Norm} 
 BashBot.getUpdate --offset <numero> --limit <numero> --timeout <numero> 
 
 ${Bold}BashBot.sendMessage${Norm} BashBot.sendMessage --chat_id <id> --text <mensagem> ${Green}# <id> Identificador do chat - <text> Mensagem a ser enviada${Norm}
FECHA
}

for args in "$@"; do
    case $args in 
    "-h") help; exit 1
    ;;
    esac
done