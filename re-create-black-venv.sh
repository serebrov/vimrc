cd ~/.vim
rm -r black_venv
virtualenv -p python3 black_venv
source black_venv/bin/activate
# pip install --upgrade git+https://github.com/psf/black.git
pip install black
