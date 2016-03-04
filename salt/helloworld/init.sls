/tmp/hello:
  file:
    - managed
    - source: salt://helloworld/hello
    - user: root
    - group: root
    - mode: 644
