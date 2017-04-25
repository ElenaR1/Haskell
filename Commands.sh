touch file-pravi datata na suzdavane na faila dneshniqt den i chas


if test -d $1
then
	for name in $1/* #?
	do
	   size=`wc -c < $name`
	   if [ -f $name -a $size -gt $2 ]
	   then  
		echo $name
	   fi
	done
else
	echo There is no such directory
fi 


if ! test -d $HOME/$1
then 
	mkdir $HOME/$1
fi
num=0
for var in *
do
	if  test -f $var -a -r $var 
	then
	  cp $var $HOME/$1
	else 
	  num=`expr $num + 1 `
	fi
done
echo "Number of nonreadable files = $num"


OUT_FILES
fdir1=`ls $1/*.out | wc -l`
fdir2=`ls $2/*.out |wc -l`
if [ $fdri1 -gt $fdir2 ]
then
	mkdir NEWdir
	echo Name of the new directory --> NEWdir
	tag_dir=$PWD/NEWdir
	cd $1
	for i in *
	do
	    if [ -f $i -a -r $i -a -w $i ]
	    then
		mv $i $tag_dir
	    fi
	done
fi


TOT_CI
fdir1=`ls $1/*.c | wc -l`
fdir2=`ls $2/*.c | wc -l`
totbr=`expr $fdir1 + $fdir2`
if [ $totbr -gt 20 ]
then
	ls $1/*.c > /temp/filenames
	ls $2/*.c >> /temp/filenames
	chmod 0444 /temp/filenames
else
	echo "Total number of files less than 20=$totbr" 
fi

LOGINFO
The \c keeps the cursor on the same line after the end of the echo, but to enable it, you need the -e flag:
echo -e "bla bla \c"
echo -e "The current date and time :  \c"
date
echo -e "Number of users logged --> \c"
who | wc -l

EXE_FILES #namira broq na vsichkmi failove koito ne sa s razshirenie .c
ls $1/*.c  > exenames
broiexe=`cat exenames | wc -w`
totalcount=`ls $1 | wc -l` #broq na vsichki failove
echo Count of files `expr $totalcount - $broiexe`

MESS_1 USER
read key
write $key << !
Hello
!

MESS_USERS
echo ENTER THE MESSAGE
read MESSAGE
for each
do
	if who | grep $each > /dev/null
	then
	    echo $MESSAGE | write $each
	fi
done

if test -f kkk > /dev/null
then
echo lala
else
echo f
fi

EXCHAN_NAMES
mv $1 work
mv $2 $1
mv work $2

NUMBER_TERM
a=`who |wc -l`
b=`who | grep $1 |wc -l`
c=`who | grep $2 |wc -l`
d=`expr $b + $c`
e=`expr $a - $d`
echo "Broyiat na terminalite e: $e"

STRING_SEARCH
echo "ENTER a string --->"
read STR
for each #kato ne e set-nat po default obkojda vsichki pozicionni parametri
 do
        echo $each
	grep  $STR $each  
 done


TRAS1
a=1
for i in 1 2 3 4
do a=`expr $a + 1`
   for j
    do if test $j -ne $#
       then echo $a $j
       else echo $i
       fi
    done
echo $*
done

TWO NUMBERS
read n1 
read n2
a=`expr $n1 + $n2`
echo "Sumata im e: $a"
b=`expr $n1 \* $n2`
echo "Proizvedenieto im e: $b"

USERLOG
until who | grep $1 > /dev/null
do
   sleep 5
done
echo $1 started a session!!!

USERLOG1
while true
do
  if who | grep $1 > /dev/null
  then 
      echo $1 works
      break
  else 
      sleep 5
  fi
done
