#!/bin/csh
foreach filename (*.xml)
   sed s/3.6.5/3.6.9/g <$filename >$filename.$$
   mv $filename $filename.old
   mv $filename.$$ $filename
end
