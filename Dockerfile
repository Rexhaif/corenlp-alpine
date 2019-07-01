FROM openjdk:13-alpine

RUN apk add wget
RUN apk add unzip

WORKDIR server

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-10-05.zip
RUN unzip ./stanford-corenlp-full-2018-10-05.zip ./

RUN mv ./stanford-corenlp-full-2018-10-05 ./corenlp

EXPOSE 9000

CMD ["java", "-mx4g", "-cp", "\"*\"", "edu.stanford.nlp.pipeline.StanfordCoreNLPServer", "-port", "9000", "-timeout", "15000"]
