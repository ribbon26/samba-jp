#!/bin/csh
foreach filename (*.html)
   tail +2 <$filename >$filename.$$
   mv $filename $filename.old
   mv $filename.$$ $filename
end
