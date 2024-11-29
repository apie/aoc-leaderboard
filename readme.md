## Run https://github.com/cwverhey/adventofcode/tree/main/leaderboard in docker
- Get original script + apply patch `run-in-docker.patch` (you can use `gen.bash` for this)
- Install docker
- Save your aoc cookie in a file `cookie.txt`
- Start container using `run.bash`
- Go to <http://localhost:12345>
- Optionally add to nginx:


        location /aoc {
            return 200 '<meta name="viewport" content="width=device-width, initial-scale=1.0">Kies <a href="/aoc/scintilla">/scintilla</a> of <a href="/aoc/dacom">/dacom</a>';
            add_header Content-Type text/html;
        }
        location /aoc/scintilla {
            rewrite ^/aoc/scintilla(.*)$ /$1 break;
            include proxy_params;
            proxy_pass http://localhost:12345;
        }
        location /aoc/dacom {
            rewrite ^/aoc/dacom(.*)$ /$1?id=523364 break;
            include proxy_params;
            proxy_pass http://localhost:12345;
        }


