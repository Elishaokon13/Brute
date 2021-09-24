#!/bin/bash
while read directory_name; do
echo “Trying directory: $directory_name”
curl http://$1 $directory_name
done <$2
OR
#!/bin/bash
while read directory_name; do
echo “Trying directory: $directory_name”
curl http://$1$directory_name -o index.html 2>/dev/null
count=$(cat index.html| grep “Cannot GET” |wc -l)
if [[ $count -eq 0 ]]
then
echo “Found a Directory: “$directory_name
fi
done <$2
