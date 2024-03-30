# flask-tutorial

## Commands

### データベースファイルの初期化

```sh
flask --app flaskr init-db
```

### アプリケーションの実行

```sh
flask --app flaskr --debug run
```

*http://127.0.0.1:5000/*

### テストの実行

```sh
pytest -v
```

カバレッジ（網羅率）を測定

```sh
coverage run -m pytest
```

カバレッジリポート

```sh
coverage report
  # Name                 Stmts   Miss Branch BrPart  Cover
  # ------------------------------------------------------
  # flaskr/__init__.py      23      0      4      0   100%
  # flaskr/auth.py          60      0     30      0   100%
  # flaskr/blog.py          58      0     36      0   100%
  # flaskr/db.py            23      0      8      0   100%
  # ------------------------------------------------------
  # TOTAL                  164      0     78      0   100%
```

HTMLでカバレッジリポートを出力

```sh
coverage html
```

### ビルド

```sh
python setup.py bdist_wheel
```

## 本番環境への展開

インストール

```sh
pip install flaskr-1.0.0-py3-none-any.whl
```

データベースを作成

```sh
flask --app flaskr init-db
```

秘密鍵の設定

```sh
cat << EOT | tee /home/vscode/.local/var/flaskr-instance/config.py
SECRET_KEY = '$(python -c 'import secrets; print(secrets.token_hex())')'
EOT
```

実行

```sh
pip install waitress
```

```sh
waitress-serve --call 'flaskr:create_app'
```

*http://0.0.0.0:8080*
