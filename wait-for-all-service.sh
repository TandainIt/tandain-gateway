./wait-for-it.sh user-api:3001 -t 0 -s -- \
./wait-for-it.sh article-api:3002 -t 0 -s -- \
echo "All required services are up"


