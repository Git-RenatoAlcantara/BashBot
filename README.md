# BashBot

# Sobre

---

O **ShellBot.sh**
 é um script desenvolvido em **Shell Script** que simula uma API  do [Telegram](https://core.telegram.org/api), para criação de bot's. O projeto teve inicio após a necessidade de criar um bot para gerenciar servidores. No inicio com códigos bagunçados e de difícil reutilização, resolvi deixar o código mais organizado. Apartir daí resolvi deixa-lo publico para estudos e reutilização para a comunidade shell do Brasil.

# Créditos

---

Desenvolvido por **Renato Alcântara**

Linguagem: **Shell Script**

# Contato

---

Para informações, sugestões ou reporte de falhas, envie e-mail para renatoalcantara2022@gmail.com

Rede Social**:**

Telegram: [https://t.me/renato_office](https://t.me/renato_office) Linkedin: [https://www.linkedin.com/in/canalrenatoalcantara](https://www.linkedin.com/in/canalrenatoalcantara?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BI27Sne9uR1K7A5keXeCHsg%3D%3D)

# Agradecimento

---

Agradeço ao grupo **Juliano Santos (SHAMAN)** por disponibilizar sua API que foi usado como base para a criação deste projeto e que continue com sua contribuição para o mundo do codigo aberto.

# Requerimentos

---

| acote |                        Descrição                                    |
| --- | --- |
| bash | Interpretador codigo shell script |
| jq | Processador de comandos JSON |
| curl | Ferramenta para transferir dados de url |

# Download

---

```bash
$ git clone [https://github.com/Git-RenatoAlcantara/BashBot.git](https://github.com/Git-RenatoAlcantara/BashBot.git) && cd BashBot
```

Copie o arquivo **BashBot.sh** para a pasta de projeto do seu bot.

Exemplo:

```bash
$ cp ShellBot.sh /projeto/meu_bot/
```

# Uso

---

Para utilizar as funções do BashBot, é necessário importá-lo em seu script.

```bash
#!/bin/bash
# Meu bot

# Importando 
source ShellBot.sh

...
```

# Funções

---

Todas as funções disponíveis no **ShellBot.sh** mantem a mesma nomenclatura dos métodos da *API telegram*, precedendo apenas o nome da *API ShellBot* antes de cada nome.

**Exemplo:**

`BashBot.funcao`

Cada função possui seus parâmetros, valores e tipos que devem ser passados juntamente com a função; Mantendo a metodologia de comandos `Unix/Linux`.

**Exemplo:**

`BashBot.funcao --param1 arg --param2 arg ...`

> O argumento é obrigatório quando o parâmetro é informado ou quando há parâmetros obrigatórios.
> 

As funções suportam parâmetros longos e curtos. Parâmetros longos são precedidos de `--` antes do nome, enquanto os curtos são precedidos de `-` seguido de um caractere único.

**Exemplos:**

`BashBot.funcao --param1 arg1 --param2 arg2 ...`

Sege as funções dísponiveis

- BashBot.init
- BashBot.token
- BashBot.id
- BashBot.getUpdate
- BashBot.sendMessage

# BashBot.init

---

Inicializa o bot apartir de uma chave válida (TOKEN).

> É necessário inciar o bot (BashBot.init) para obter acesso as suas funções.
> 

### **Uso:**

`BashBot.init --token token`

### **Parâmetros:**

[Untitled](https://www.notion.so/3d30ad7e24ff4a0d8b866253230464fe)

> Cada bot criado recebe sua chave única de autenticação (TOKEN) para obter privilégios no momento de invocar seus métodos.
>
