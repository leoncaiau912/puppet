deluser.pp
class linux::deluser
{
       user
       {
           "caojin":
           ensure  => absent,
       }
}
