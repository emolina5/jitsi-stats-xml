#!/bin/bash
rm -rf colibri_stats.xml
colibri="http://your.ip:8080/colibri/stats"
bar=$(curl $colibri)
i=1
j=3

IFS=', '
read -ra ADDR <<< "$bar"
echo "${ADDR[84]}" >> tmp
echo "${ADDR[85]}" >> tmp
echo "${ADDR[116]}" >> tmp
echo "${ADDR[86]}" >> tmp
echo "${ADDR[10]}" >> tmp
echo "${ADDR[1]}" >> tmp
echo "${ADDR[4]}" >> tmp
echo "${ADDR[25]}" >> tmp
echo "${ADDR[9]}" >> tmp
echo "${ADDR[30]}" >> tmp
echo "${ADDR[113]}" >> tmp
echo "${ADDR[26]}" >> tmp
echo "${ADDR[6]}" >> tmp
echo "${ADDR[13]}" >> tmp
echo "${ADDR[87]}" >> tmp
echo "${ADDR[7]}" >> tmp
echo "${ADDR[127]}" >> tmp

IFS='":' command eval 'XYZ=($(cat tmp))'

echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>" >> colibri_stats.xml
echo "<root>" >> colibri_stats.xml
while [ $j -lt 52 ]
do
	echo  "<${XYZ[$i]}>${XYZ[$j]}</${XYZ[$i]}>" >> colibri_stats.xml
	i=$(( $i + 3 ))
	j=$(( $j + 3 ))
done
echo "</root>" >> colibri_stats.xml

cat colibri_stats.xml

rm -rf tmp
