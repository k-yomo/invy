# Invy

## Architecture
- Infra
  - GCP 
    - [inv-dev](https://console.cloud.google.com/welcome?project=invy-dev)
    - [invy-prod](https://console.cloud.google.com/welcome?project=invy-prod)
  - [Terraform](https://github.com/k-yomo/invy-terraform)
  - Cloud Run
  - PostgreSQL v13.0 (Cloud SQL)
  - Redis v6.2 ([Upstash](https://upstash.com/))
- Backend
  - Go
  - GraphQL (gqlgen, graphql_flutter)
  - Ent
- Mobile
  - Flutter
- CI
  - Github Actions (backend)
  - Codemagic (mobile)

## Prerequisites
- Go v1.20
- Flutter v3.7.x
- Docker

## Setup
```sh
make setup
```

## Development
```shell
docker-compose up -d
make run-api
make run-app
```


## Test accounts
SMS confirmation code is `123456` for all the accounts.
- Local
  - 00-1234-5678
  - 11-1234-5678
  - 22-1234-5678
- Prod
  - 00-1234-5678
  - 11-1234-5678
  - 22-1234-5678
  - ... 
  - 99-1234-5678

※ If you need to add new account, you can register phone number for test [here](https://console.firebase.google.com/u/0/project/invy-prod/authentication/providers).
