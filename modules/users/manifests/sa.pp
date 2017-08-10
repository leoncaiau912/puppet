import "adduser.pp"

class linux::adduser::sa inherits linux::adduser
{
    add_user
    {
        "jiaxin":
        useruid     => 2000,
        username    => jiaxin,
        userhome    => "jiaxin",
        groups      => $operatingsystem ? {
        Ubuntu    => ["admin"],
        CentOS    => ["wheel"],
        RedHat    => ["wheel"],
        default    => ["wheel"],
    },
    }
}
