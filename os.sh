#how to find all files with a particular extension
find . -name "*.txt"
#find . means, "find (starting in the current directory)." 
#If you want to search the whole system, use find /; to search under /System/Library, use find /System/Library, etc.

#how to find all files without a particular extension
find .  ! -name "*.*" 
#the ! negates the following expression, here a filename that contains a '.'

#0zad moq versiq
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

#4zad moq versiq
echo LIST/$1
ls /$1
echo
echo LIST current dir
ls 
echo
cat $2
#5
set $1 $2
bash 4zad $1 $2
#6
sleep $1; ps aux| wc -l
#v sluchaq t.k ne sum v sistemata moje i samo ps t.k ps aux e za obshtite
# procesi v sistemata, a ps e za lokalnite ot tekushtiq logicheski terminal

#7
cp $1 temp
cp $2 $1
cp temp $2
rm temp

#9
grep $1 < $2
grep $1 < $3
grep $1 < $4



Zaki
comproc5
echo LISt $1
ls $1
echo $2
ls $2

comproc6
set $1 $2
bash comproc5 $1 $2

comproc7
sleep $1; ps aux | wc -l

comproc8
cp $1 temp
cp $2 $1
cp temp $2
rm temp

comproc9
write $1 < $4
write $2 < $4
write $3 < $4

comproc10
grep $1 < $2
grep $1 < $3
grep $1 < $4

bash comproc10 ABC f1 f2 f3 # i vrushta redovete koito sudurjat ABC v tezi failove 
v moqta papka e taka: bash 9zad.txt ABC 9zt.txt 9ztt.txt
# grep abc f1= grep abc <f1
