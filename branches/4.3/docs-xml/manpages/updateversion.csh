#!/bin/csh
foreach filename (*.xml)
   sed "s/\- 4.3.7/\- 4.3.9/g" <$filename >$filename.$$
   mv $filename $filename.old
   mv $filename.$$ $filename
end
