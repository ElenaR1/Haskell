#how to find all files with a particular extension
find . -name "*.txt"
#find . means, "find (starting in the current directory)." 
#If you want to search the whole system, use find /; to search under /System/Library, use find /System/Library, etc.

#how to find all files without a particular extension
find .  ! -name "*.*" 
#the ! negates the following expression, here a filename that contains a '.'
