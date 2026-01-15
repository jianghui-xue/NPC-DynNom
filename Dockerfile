# 1. 基础镜像：使用特定版本标签，避免因镜像更新导致意外问题
FROM rocker/shiny-verse:4.3.3

# 2. 安装系统依赖（涵盖了rms、survival等包编译所需的库）
RUN apt-get update && apt-get install -y --no-install-recommends \
    libnlopt-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libcairo2-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. 安装核心R包
# 注意：此处仅列出你的代码中直接调用的、且非基础镜像已包含的包
# shiny, ggplot2 等已包含在 shiny-verse 镜像中，无需重复安装
RUN R -e "install.packages(c('rms', 'survival', 'DynNom'), repos='https://cloud.r-project.org/')"

# 4. 复制应用文件并设置权限
COPY . /srv/shiny-server/
RUN chown -R shiny:shiny /srv/shiny-server

# 5. 暴露端口和启动命令
EXPOSE 3838
CMD ["/usr/bin/shiny-server"]
