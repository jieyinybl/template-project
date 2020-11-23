# determine the right python binary
.PYTHON3:=$(shell PATH='$(subst $(CURDIR)/.venv/bin:,,$(PATH))' which python3)

# update packages from requirements.txt and create requirements.txt.freeze
install-packages:
	mkdir -p .venv
	cd .venv && $(.PYTHON3) -m venv --copies --prompt='[$(shell basename `pwd`)/.venv]' .
	.venv/bin/python -m pip install -r requirements.txt --no-cache-dir