FROM python:alpine3.20

RUN echo '0 8 * * * /app/entrypoint.sh 2>&1' > /var/spool/cron/crontabs/root && \
    apk add chromium && \
    apk add chromium-chromedriver

ENV LINUXDO_USERNAME= \
    LINUXDO_PASSWORD= \
    SCROLL_DURATION=0 \
    VIEW_COUNT=1000 \
    HOME_URL=https://linux.do/ \
    CONNECT_URL=https://connect.linux.do/ \    
    CRON_RULE=0 8 * * * \    
    TZ=Asia/Shanghai    

WORKDIR /app

COPY . /app
 
RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

CMD [ "crond", "-f" ]
