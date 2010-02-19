#! /bin/sh
cd output/htmldocs/Samba3-HOWTO
for file in *.html
do
   echo $file
   php ../../../htmlconv.php <$file >$file.new
done

