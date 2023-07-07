######################
#   initialization   #
######################
init:
	pip install -U pip
	pip install pdm
	pdm install
	pre-commit install

#######################
#   static analysis   #
#######################
check: format lint

format:
	black .

lint:
	mypy src
	ruff src --fix
