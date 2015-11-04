.PHONY: clean-pyc clean-build test

clean: clean-build clean-pyc

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info
	rm -fr .tox
	rm -fr __pycache__

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

release: clean
	python setup.py sdist upload
	python setup.py bdist_wheel upload

sdist: clean
	python setup.py sdist
	ls -l dist

test:
	tox
