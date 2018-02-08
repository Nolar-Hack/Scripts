#################################################
# NAME        : PS1-TFS_Dispatcher.ps1
# AUTHOR    : mfaucon
# DATE      : 22/12/2015
# VERSION    : v1.0.0
# COMMENT    : Interface Graphique Script de Livraison
#################################################

# Chargement des Windows Form
#region
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
#endregion 


#################################################
# CONFIGURATION DE LA WINDOWS FORM
#################################################

# Creation de la form principale
$form = New-Object Windows.Forms.Form

# Pour bloquer le resize du form et supprimer les icones Minimize and Maximize
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $true
$form.MinimizeBox = $true

# Choix du titre
$form.Text = "Nmap Exploit"

# Choix de la taille
$form.Size = New-Object System.Drawing.Size(400,400)

#################################################
# DEFINITION DES VARIABLES
#################################################

#Taille TextBox
$hautip = 20
$longip = 160
$hautmask = 20
$longmask = 40
$longueur2 = 540


#################################################
# LABELS ET TEXTBOX
#################################################

#-------------------------------------------------------------------
# Label et TextBox NetworkIP
#-------------------------------------------------------------------
$label_Networkip = New-Object System.Windows.Forms.Label
$label_Networkip.AutoSize = $true
$label_Networkip.Location = New-Object System.Drawing.Point(20,100)
$label_Networkip.Name = 'label_Networkip'
$label_Networkip.Text = "Network IP :"

$textbox_Networkip = New-Object System.Windows.Forms.Textbox
$textbox_Networkip.Location = New-Object System.Drawing.Point(120,100)
$textbox_Networkip.Name = 'textbox_rfc'
$textbox_Networkip.Size = New-Object System.Drawing.Size($longip,$hautip)
$textbox_Networkip.Text = ""

#        # Apparition des champs une fois la RFC renseignee
#        $label_appli.Visible = $TRUE
#        $textbox_appli.Visible = $TRUE

#-------------------------------------------------------------------
# Label et TextBox Netmask
#-------------------------------------------------------------------
$label_Netmask = New-Object System.Windows.Forms.Label
$label_Netmask.AutoSize = $true
$label_Netmask.Location = New-Object System.Drawing.Point(20,150)
$label_Netmask.Name = 'label_Netmask'
$label_Netmask.Text = "Netmask :"

$textbox_Netmask = New-Object System.Windows.Forms.Textbox
$textbox_Netmask.Location = New-Object System.Drawing.Point(120,150)
$textbox_Netmask.Name = 'textbox_rfc'
$textbox_Netmask.Size = New-Object System.Drawing.Size($longmask,$hautmask)
$textbox_Netmask.Text = ""

#        # Apparition des champs une fois la RFC renseignee
#        $label_Netmask.Visible = $TRUE
#        $textbox_Netmask.Visible = $TRUE

#################################################
# INSERTION DES COMPOSANTS
#################################################

# Ajout des composants a la Form

$form.Controls.Add($label_Networkip)
$form.Controls.Add($textbox_Networkip)
$form.Controls.Add($label_Netmask)
$form.Controls.Add($textbox_Netmask)

# Affichage de la Windows
$form.ShowDialog()

#################################################
# END OF PROGRAM
#################################################