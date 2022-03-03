FROM melezhik/sparky

RUN git clone https://github.com/melezhik/fastspec.git /tmp/fastspec/

RUN cp -r /tmp/fastspec/sparky/fastspec /home/raku/.sparky/projects/

