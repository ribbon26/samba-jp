#!/bin/csh
foreach filename (*.xml)
   sed s/3.4.4/3.5.1/g <$filename >$filename.$$
   mv $filename $filename.old
   mv $filename.$$ $filename
end
