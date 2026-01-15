# 基础设置：使用预装了R和Shiny的官方镜像
FROM rocker/shiny-verse:latest

# 安装R应用所需的额外软件包
RUN R -e "install.packages(c('rms', 'survival', 'DynNom', 'ggplot2', 'survminer'), repos='https://cloud.r-project.org/')"

# 将GitHub仓库里的所有文件，复制到容器内的Shiny服务器目录
COPY . /srv/shiny-server/

# 设置正确的文件权限
RUN chown -R shiny:shiny /srv/shiny-server

# 告诉Render这个应用将在哪个端口运行
EXPOSE 3838

# 启动Shiny服务器
CMD ["/usr/bin/shiny-server"]
