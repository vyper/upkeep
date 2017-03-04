# Upkeep

## start

```bash
docker-compose build
docker-compose up -d
docker-compose exec db createdb -U postgres upkeep_development
docker-compose exec db createdb -U postgres upkeep_test
# and...
open http://localhost/
```
