pdm:
	if command -v pdm >/dev/null 2>&1; then \
	    echo "pdm is already installed, skipping installation."; \
	else \
	    pip install pdm; \
	fi

setup:
	make pdm
	pdm install
	pdm run pre-commit install

check:
	make format
	make lint

format:
	pdm run ruff check src --select I --fix
	pdm run ruff format src

lint:
	pdm run pyrefly check
	pdm run ruff check src --fix --unsafe-fixes
