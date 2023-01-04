FROM eclipse-temurin:17-jdk

LABEL "com.github.actions.name"="CrowdinCopyDeploy"
LABEL "com.github.actions.description"="Create a Crowdin's Over-The-Air distribution environment on local server"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.0.0"
LABEL repository="https://github.com/Ghost-chu/CrowdinCopyDeploy"
LABEL homepage="https://github.com/Ghost-chu/CrowdinCopyDeploy"
LABEL maintainer="Ghost_chu <ghostchu@111.com>"

ADD entrypoint.sh /entrypoint.sh
ADD crowdincopydeploy.jar /crowdincopydeploy.jar
RUN chmod +x entrypoint.sh

WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]