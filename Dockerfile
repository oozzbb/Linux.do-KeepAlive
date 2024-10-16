FROM python:alpine3.20

RUN apk add chromium && \
    apk add chromium-chromedriver

WORKDIR /app

COPY . /app

# 安装项目所需的任何依赖
# 如果你有 requirements.txt 文件，取消下面这行的注释
RUN pip install --no-cache-dir -r requirements.txt

# 如果没有 requirements.txt，你可以直接在这里安装所需的包
# 例如：RUN pip install --no-cache-dir package1 package2

CMD [ "python", "Linux.do.py" ]
