var="{% set version = \""$1"\" %}"
sed -e "1s/.*/$var/" ./meta.yaml
