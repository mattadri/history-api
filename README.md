# history

## To Start the API  
* `source .env`
* Once in the enviroment run: `python run.py`

## FOR PROD
* source .env
* gunicorn --bind 0.0.0.0:5000 wsgi:application
