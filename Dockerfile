FROM python:alpine3.20

RUN apk add chromium && \
    apk add chromium-chromedriver

ENV LINUXDO_USERNAME= \
    LINUXDO_PASSWORD= \
    SCROLL_DURATION=0 \
    VIEW_COUNT=1000 \
    HOME_URL=https://linux.do/ \
    CONNECT_URL=https://connect.linux.do/ \    
    TZ=Asia/Shanghai    

WORKDIR /app

COPY . /app

# 安装项目所需的任何依赖
# 如果你有 requirements.txt 文件，取消下面这行的注释
RUN pip install --no-cache-dir -r requirements.txt

# 如果没有 requirements.txt，你可以直接在这里安装所需的包
# 例如：RUN pip install --no-cache-dir package1 package2

CMD [ "python", "Linux.do.py" ]
