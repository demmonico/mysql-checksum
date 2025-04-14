from setuptools import setup, find_packages

with open('README.md', 'r') as f:
    description = f.read()

with open('requirements.txt') as f:
    required = f.read().splitlines()

setup(
    name='mysql_checksum',
    author='demmonico',
    version='0.9.12',
    long_description=description,
    long_description_content_type='text/markdown',

    packages=find_packages(),

    install_requires=required,

    entry_points={
        'console_scripts': [
            'mysql-checksum = mysql_checksum:main',
        ],
    },
)
