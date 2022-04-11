#!/bin/bash

curl -sSL https://install.python-poetry.org | python3 - > /dev/null
poetry config virtualenvs.in-project true