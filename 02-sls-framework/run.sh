# Instalar
npm i -g serverless

# Iniciar o sls
sls

# Sempre fazer deploy antes de tudo para verificar se está com o ambiente ok
sls deploy

# Invocar na AWS
sls invoke -f hello

# Invocar na Local
sls invoke local -f hello

# Remover todo o conteúdo
sls remove