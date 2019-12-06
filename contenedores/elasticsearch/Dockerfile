FROM amazon/opendistro-for-elasticsearch:1.2.0

ENV AWS_ACCESS_KEY_ID <access-key>
ENV AWS_SECRET_ACCESS_KEY <secret-key>

# Optional
ENV AWS_SESSION_TOKEN <optional-session-token>

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch repository-s3
RUN /usr/share/elasticsearch/bin/elasticsearch-keystore create

RUN echo $AWS_ACCESS_KEY_ID | /usr/share/elasticsearch/bin/elasticsearch-keystore add --stdin s3.client.default.access_key
RUN echo $AWS_SECRET_ACCESS_KEY | /usr/share/elasticsearch/bin/elasticsearch-keystore add --stdin s3.client.default.secret_key

# Optional
RUN echo $AWS_SESSION_TOKEN | /usr/share/elasticsearch/bin/elasticsearch-keystore add --stdin s3.client.default.session_token
