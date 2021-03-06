# hub ratelimit

![Docker Image Version (latest semver)](https://img.shields.io/docker/v/fabianonunes/hub-ratelimit?color=success&label=docker%20image%20version&sort=semver&style=flat-square)

Utilitário para consultar as cotas de uma conta e quantas ainda restam em uma determinada janela de tempo.

Para consultar a cota anônima, que é limitada por IP, execute:

```bash
$ docker run --rm fabianonunes/hub-ratelimit
< HTTP/1.1 200 OK
< RateLimit-Limit: 100;w=21600
< RateLimit-Remaining: 89;w=21600
```

No exemplo acima, o acesso anônimo possui 100 cotas no total (`RateLimit-Limit`) para a janela de 21.600 segundos (6 horas).
Dessas 100 cotas, restam apenas 89 (`RateLimit-Remaining`) .

Para consultar a cota de uma conta específica, passe as credenciais como primeiro parâmetro no formato `user:senha`:

```bash
$ docker run --rm fabianonunes/hub-ratelimit usuario:senha
< HTTP/1.1 200 OK
< RateLimit-Limit: 200=21600
< RateLimit-Remaining: 196;w=21600
```

## Limite excedido

Caso todo o limite tenha sido consumido dentro da respectiva janela de tempo, a seguinte mensagem será exibida:

```bash
$ docker run --rm fabianonunes/hub-ratelimit
< HTTP/1.1 429 Too Many Requests
```

## Crendenciais inválidas

Caso as credenciais sejam inválidas, a seguinte mensagem será exibida:

```bash
$ docker run --rm fabianonunes/hub-ratelimit abc:123
< HTTP/1.1 401 Unauthorized
```
