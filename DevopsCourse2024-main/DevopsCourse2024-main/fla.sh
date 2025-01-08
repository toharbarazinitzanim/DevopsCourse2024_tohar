#!/bin/sh

if [ ! -d "flask" ]; then
  git clone https://github.com/pallets/flask
fi

cd flask || exit
latest_tag=$(git tag | tail -n 1)
git checkout "$latest_tag"

cd examples/tutorial || exit


python3 -m venv venv
. venv/bin/activate


pip install -e .
pip install '.[test]'

export FLASK_APP=flaskr
export FLASK_ENV=development

flask init-db

flask run --host=0.0.0.0
