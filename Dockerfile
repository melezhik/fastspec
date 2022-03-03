FROM melezhik/sparky

RUN git clone https://github.com/melezhik/fastspec.git /tmp/fastspec/

RUN cp -r /tmp/fastspec/sparky/fastspec /home/raku/.sparky/projects/

ENTRYPOINT echo "SPARKY_API_TOKEN: $SPARKY_API_TOKEN" > /home/raku/sparky.yaml &&  nohup sparkyd 2>&1 & cro run
