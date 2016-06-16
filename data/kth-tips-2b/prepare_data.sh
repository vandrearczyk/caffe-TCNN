# This file will download the database, untar it, convert all the png images into jpg and create txt fils for the creation of lmdbs.

# Download the database
wget http://www.nada.kth.se/cvap/databases/kth-tips/kth-tips2-b_col_200x200.tar

# Untar the database
tar -xvf kth-tips2-b_col_200x200.tar

# Remove tar file
rm kth-tips2-b_col_200x200.tar

# Convert png to jpg
for item in $(find KTH-TIPS2-b/ -iname "*.png"); do convert "$item"  "${item/%.png/.jpg}" && rm $item; done
