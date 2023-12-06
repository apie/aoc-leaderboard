#!/bin/bash
docker run -d -p 12345:80 --name aoc-leaderboard -v "$PWD"/index.php:/var/www/html/index.php -v "$PWD"/cookie.txt:/tmp/cookie.txt php:7.2-apache
