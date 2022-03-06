FROM melezhik/sparky

RUN rm -rf /tmp/fastspec

RUN echo OK8 && git clone https://github.com/melezhik/fastspec.git /tmp/fastspec/

RUN echo OK8 && cp -r /tmp/fastspec/sparky/container /home/raku/.sparky/projects/

ENTRYPOINT echo "SPARKY_API_TOKEN: $SPARKY_API_TOKEN" > /home/raku/sparky.yaml &&  nohup sparkyd 2>&1 & cro run
