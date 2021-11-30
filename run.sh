echo "--[cloning flyway repository]--"
if [ ! -d "tmp_flyway" ]; then
  mkdir /tmp_flyway
fi
cd /tmp_flyway/
git clone ${1} flyway
echo "--[runnig gitsdiff2fly]----------"
cd /work
if [ "x$2" == "x" ]; then
  /opt/app/gitdiff2fly -flyway-repo-path=/tmp_flyway/flyway
else
  git config --global user.email "teamcity@mmbank.ru"
  git config --global user.name "teamcity"
  /opt/app/gitdiff2fly -flyway-repo-path=/tmp_flyway/flyway -next-version=$2
echo "--[done]------------------"