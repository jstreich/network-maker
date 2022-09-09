###############################################################################################
# Merge Network Layers
# Author: Jared Streich
# Created: 2020-01-25
# Version: 0.1.0
# Jacobson Group, Oak Ridge National Laboratory
###############################################################################################


##### Check argument length
if [ "$#" -ne 3 ]; then
    echo "Incorrect Number of Parameters, path/to/input  "
    echo " Correct intput [file to get data for] [file to get matches from] [output file name]"
        exit 1
fi



##### Print to command line
echo "Merge  $1  With $2,  And output the file:  $3 "

echo ""
echo " ===================================================================== "
echo " ==================== Select column from file one ==================== "
echo " ===================================================================== "
echo ""
echo "File 1 Name:  $1"
echo ""
head $1
echo ""
read -p "Input Column:" cl1



echo ""
echo " ===================================================================== "
echo " ==================== Select column from file two ==================== "
echo " ===================================================================== "
echo ""
echo "File 2 Name:  $2"
echo ""
head $2
echo ""
read -p "Input Column:" cl2


##### Execute Awk Command
echo "Processing ... "
awk -v col1=$cl1 -v col2=$cl2 'FNR==NR{a[$col1];next}($col2 in a){print}' $1 $2 > $3

##### Print file name data is written to
echo "Writing results to:  $3"


size=$(less $3 | wc -l)
echo "Number of intersects: $size"

echo ""
echo " Thanks for using CytoMerge™ "
echo " Done!"
echo ""