# 1º Passo - Criar arquivo de políticas de segurança
# 2º Passo - Criar role de segurança na AWS

aws iam create-role \
  --role-name lambda-example \
  --assume-role-policy-document file://policies.json \
  | tee logs/role.log

# 3º Passo - Criar arquivo com conteúdo e zipá-lo
zip function.zip index.js

aws lambda create-function \
  --function-name hello-cli \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime nodejs14.x \
  --role arn:aws:iam::XXXXXXXXXXXX:role/lambda-example \
  | tee logs/lambda-create.log

  # 4º Passo - Invoke lambda!
  aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

  # Atualizar, zipar
  zip function.zip index.js

  aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# Invokar e ver o resultado
  aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec-update.log

# Remover
aws lambda delete-function \
  --function-name hello-cli

aws iam delete-role \
 --role-name lambda-example