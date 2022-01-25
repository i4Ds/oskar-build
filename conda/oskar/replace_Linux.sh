var="{% set version = \""$1"\" %}"
sed -i "1s/.*/$var/" ./meta.yaml
