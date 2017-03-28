#how to find all files with a particular extension
find . -name "*.txt"
#find . means, "find (starting in the current directory)." 
#If you want to search the whole system, use find /; to search under /System/Library, use find /System/Library, etc.

#how to find all files without a particular extension
find .  ! -name "*.*" 
#the ! negates the following expression, here a filename that contains a '.'

#0zad
echo LIST/home
ls /home
echo
echo LIST current dir
ls 
echo
cat text.txt


#1zad
ps aux|grep vim|wc -l

#2zad
find . ! -name "*.txt"|wc -l

#3zad
sleep 5; ps| wc -l

#4zad
echo LIST/$1
ls /$1
echo
echo LIST current dir
ls 
echo
cat $2
