# Output Get

**A simple plugin for getting any output you want**

This plugin is designed to be simple and easy to use. It will read files under /var/lib/ocsinventory-agent/outputget/ and will return the content of each file to your OCS Interface (under the Miscellaneous on each computer). Then you can make filters or searches with this result.

**Use cases**

A good example, is a deploy that you make in OCS Inventory to the clients, but you would like to get the output of the command you ran, for example. Then, all you need to do is store the output of your command in a file under the path /var/lib/ocsinventory-agent/outputget/. This plugin will read all the files in it, and return, for each file, a row in the table with the name of the file and its content.

---

# Output Get (Traduzido para Português Brasileiro)

**Um plugin simples para retornar qualquer output que você desejar**

Este plugin foi feito para ser simples e fácil de usar. Ele vai ler todos os arquivos do caminho /var/lib/ocsinventory-agent/outputget/ e retornará o conteúdo de cada arquivo para sua interface do OCS (na tela Diversos em cada computador). Assim você pode fazer filtros ou buscas com esses resultados.

**Casos de Uso**

Um bom exemplo, é um deploy que você faz pelo OCS Inventory para os clientes, mas você gostaria de ter o output do comando que você rodou por exemplo. Então, tudo o que você precia fazer é gravar o output do seu comando em um arquivo qualquer no caminho /var/lib/ocsinventory-agent/outputget/. Este plugin vai ler todos os arquivos dentro desse caminho, e irá retornar, para cada arquivo, uma linha na tabela com o nome do arquivo e o conteúdo do mesmo.