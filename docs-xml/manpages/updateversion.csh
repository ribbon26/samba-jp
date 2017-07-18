#!/bin/csh
foreach filename (*.xml)
   sed "s/\- 4.3.10/\- 4.3.12/g" <$filename >$filename.$$
   mv $filename $filename.old
   mv $filename.$$ $filename
end
