#!/bin/csh
foreach filename (*.xml)
   sed s/3.5.9/3.5.11/g <$filename >$filename.$$
   mv $filename $filename.old
   mv $filename.$$ $filename
end
