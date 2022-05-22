## DBTPostgresDBTIntro

Репозиторий с исходниками для статьи по dbt


### Настройка проекта

Создаем окружение python3(для linux/mac os)
```buildoutcfg
python3 -m venv venv
source venv/bin/activate
```

Устанавливаем зависимости
```buildoutcfg
pip install -r requirements.txt
```

Проверить корректность установки dbt
```buildoutcfg
dbt --version
```

Необходимо прописать в `dbt_postgres_intro/profiles.yml` креды для вашего подключения к Postgres


### Запуск модели

```buildoutcfg

cd dbt_postgres_intro

dbt run --profiles-dir ./ --profile dbt_postgres_intro -m <model_name>

```