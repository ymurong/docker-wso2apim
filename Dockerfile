FROM isim/oraclejava:1.8.0_101
MAINTAINER Ivan Sim, ihcsim@gmail.com

ARG VCS_REF
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ihcsim/docker-wso2apim"

ARG APIM_VERSION=${APIM_VERSION:-2.1.0}
RUN wget  --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download"  http://product-dist.wso2.com/products/api-manager/${APIM_VERSION}/wso2am-${APIM_VERSION}.zip && \
    apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2am-${APIM_VERSION}.zip -d /opt && \
    rm /opt/wso2am-${APIM_VERSION}.zip

EXPOSE 9443 9763 8243 8280 10397 7711
WORKDIR /opt/wso2am-${APIM_VERSION}
ENTRYPOINT ["bin/wso2server.sh"]
