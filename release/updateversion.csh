#!/bin/csh
foreach filename (*.xml)
   sed s/4.0.6/4.0.7/g <$filename >$filename.$$
   mv $filename $filename.old
   mv $filename.$$ $filename
end
