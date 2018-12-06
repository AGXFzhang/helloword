subroutine readconfig(i)
use configuration
use irand
implicit none
integer :: i,k,j
open(unit=10,file=trim(path_string)//'conf'//trim(rank_string)//'.dat')
read(10,*) nh,l
read(10,*) conf
read(10,*) paraenv
read(10,*) i
read(10,*) x,y,z,w
close(10)

open(unit=10,file=trim(path_string)//'str'//trim(rank_string)//'.dat',form="unformatted",access="direct",recl=4)
do k=1,l
        read(10,rec=k) str(k)
enddo
do k=1,l
        read(10,rec=l+k) site(k)
enddo
close(10)

endsubroutine

subroutine saveconfig(i)
use irand
use configuration
implicit none
integer i,k,j
open(unit=10,file=trim(path_string)//'conf'//trim(rank_string)//'.dat')
write(10,*) nh,l
write(10,*) conf
write(10,*) paraenv
write(10,*) i
write(10,*) x,y,z,w
close(10)
open(unit=10,file=trim(path_string)//'str'//trim(rank_string)//'.dat',form="unformatted",access="direct",recl=4)
do k=1,l
write(10,rec=k) str(k)
enddo
do k=1,l
write(10,rec=l+k) site(k)
enddo
close(10)
endsubroutine
