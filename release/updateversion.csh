#!/bin/csh
foreach filename (*.xml)
   sed s/3.6.20/3.6.21/g <$filename >$filename.$$
   mv $filename $filename.old
   mv $filename.$$ $filename
end
