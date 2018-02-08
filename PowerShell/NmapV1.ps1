#################################################
# DEFINITION DES VARIABLES
#################################################

$port = 445
$net = read-host “Waht's Your Network: ”
$rangefirst = read-host “What's Your First range IP: ”
$rangelast = read-host “What's Your last range IP: ”
$range = $rangefirst..$rangelast
$hotfixes = "KB3205409", "KB3210720", "KB3210721", "KB3212646", "KB3213986", "KB4012212", "KB4012213", "KB4012214", "KB4012215", "KB4012216", "KB4012217", "KB4012218", "KB4012220", "KB4012598", "KB4012606", "KB4013198", "KB4013389", "KB4013429", "KB4015217", "KB4015438", "KB4015546", "KB4015547", "KB4015548", "KB4015549", "KB4015550", "KB4015551", "KB4015552", "KB4015553", "KB4015554", "KB4016635", "KB4019213", "KB4019214", "KB4019215", "KB4019216", "KB4019263", "KB4019264", "KB4019472", "KB4015221", "KB4019474", "KB4015219", "KB4019473"
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
   
            #checks the computer it's run on if any of the listed hotfixes are present
            $hotfix = Get-HotFix -ComputerName $env:computername | Where-Object {$hotfixes -contains $_.HotfixID} | Select-Object -property "HotFixID"
            ""
            "---------------------------------------------------------"
            "$IP"
            "---------------------------------------------------------"
            #confirms whether hotfix is found or not
            if (Get-HotFix | Where-Object {$hotfixes -contains $_.HotfixID})
                {$foud = Write-Host "Found HotFix: " + $hotfix.HotFixID + "for $IP" -ForegroundColor Red
                $found
                }
            else 
                {$notfound = Write-Host ”Didn't Find HotFix for $IP" -ForegroundColor Green
                $notfound
                }

#-------------------------------------------------------------------
# On voit si le transfert à été éffectué
#-------------------------------------------------------------------

                if ($transfered.Exists){
                    ""
                    Write-Host "Port Open and File has been Transfered on $IP" -ForegroundColor Green
                    "---------------------------------------------------------"
                }
                Else {
                    ""
                    Write-Host "Port Open but Error on Identification for $IP" -ForegroundColor Red
                    "---------------------------------------------------------"
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
