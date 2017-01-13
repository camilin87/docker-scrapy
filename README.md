# Docker images for Scrapy   
Docker Images to run [Scrapy](https://scrapy.org/) jobs  


## Usage  

    docker run -it \
        -v "$PWD":/usr/src/myapp \
        -w /usr/src/myapp \
        camilin87/scrapinghub \
        python my_scraping_code.py

    docker run -it \
        -v "$PWD":/usr/src/myapp \
        -w /usr/src/myapp \
        camilin87/scrapy \
        scrapy runspider my_spyder_code.py -o output.json

    docker run -it \
        -v "$PWD":/usr/src/myapp \
        -w /usr/src/myapp \
        camilin87/scrapy-pymongo \
        scrapy runspider my_spyder_code.py -o output.json


## Development  

### Building the images  

    rake build_all

### Publishing the images  

    rake publish["scrapinghub"]
    rake publish["scrapy"]
    rake publish["scrapy-pymongo"]
