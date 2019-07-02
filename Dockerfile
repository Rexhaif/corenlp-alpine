FROM openjdk:13-alpine

RUN apk add wget
RUN apk add unzip
RUN mkdir /server

RUN cd /server && wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-10-05.zip
RUN cd /server && unzip ./stanford-corenlp-full-2018-10-05.zip ./

RUN mv /server/stanford-corenlp-full-2018-10-05 /server/corenlp

EXPOSE 9000

CMD ["java", "-mx4g", "-cp", "\"*\"", "edu.stanford.nlp.pipeline.StanfordCoreNLPServer", "-port", "9000", "-timeout", "15000"]
