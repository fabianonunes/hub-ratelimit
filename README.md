# hub ratelimit

> Atenção: as consultas de cotas não são gratuitas, cada 2 consultas consome o equivalente a 1 pull.

Utilitário que consulta as cotas de uma conta e quantas ainda restam na janela de tempo:

Para consultar a cota anônima, limitada por IP, execute:

```bash
$ docker run --rm fabianonunes/hub-ratelimit
< HTTP/1.1 200 OK
< RateLimit-Limit: 100;w=21600
< RateLimit-Remaining: 89;w=21600
```

No exemplo acima, o acesso anônimo possuem 100 cotas (`RateLimit-Limit`) para a janela de 21600s (6 horas). Dessas 100, restam 89 (`RateLimit-Remaining`) .

Para consultar a cota de uma conta específica, passe as credenciais como primeiro parâmetro no formato `user:senha`:

```bash
$ docker run --rm fabianonunes/hub-ratelimit usuario:senha
< HTTP/1.1 200 OK
< RateLimit-Limit: 200=21600
< RateLimit-Remaining: 196;w=21600
```
