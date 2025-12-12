# Script-ak

Kode hau notepad-en pegatu

“#Enter a path to your import CSV file $ADUsers = Import-csv C:\scripts\newusers.csv foreach ($User in $ADUsers) { $Username = $User.username $Password = $User.password $Firstname = $User.firstname $Lastname = $User.lastname $Department = $User.department $OU = $User.ou #Check if the user account already exists in AD if (Get-ADUser -F {SamAccountName -eq $Username}) { #If user does exist, output a warning message Write-Warning "A user account $Username has already exist in Active Directory." } else { #If a user does not exist then create a new user account #Account will be created in the OU listed in the $OU variable in the CSV file; don’t forget to change the domain name in the"-UserPrincipalName" variable New-ADUser \` -SamAccountName $Username \` -UserPrincipalName "$Username@yourdomain.com" \` -Name "$Firstname $Lastname" \` -GivenName $Firstname \` -Surname $Lastname \` -Enabled $True \` -ChangePasswordAtLogon $True \` -DisplayName "$Lastname, $Firstname" \` -Department $Department \` -Path $OU \` -AccountPassword (convertto-securestring $Password -AsPlainText -Force) } }”

“Esto lo cogemos del notepad”

\
Gitano server-aren IP-a aldatuko dugu



<figure><img src="../.gitbook/assets/image (126).png" alt=""><figcaption></figcaption></figure>

luego en red buscamos \W10-2 y user y pawssrd uni uni

Gero red-ean bilatuko dugu \W10-2 eta user eta password-a uni uni da

Karpeta hori kopiatuko dugu eta gure disko lokalean jarriko dugu

<figure><img src="../.gitbook/assets/image (127).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (128).png" alt=""><figcaption></figcaption></figure>

CSV artxiboan sartuko gara eta hau daukagu

<figure><img src="../.gitbook/assets/image (129).png" alt=""><figcaption></figcaption></figure>

Hemen ; bakoitza , batekin aldatuko dugu baina OU barruan daudenak " artean jarriko ditugu

<figure><img src="../.gitbook/assets/image (130).png" alt=""><figcaption></figcaption></figure>

Extensioa aldatzeko hau jarriko behar dugu bisten barruan

<figure><img src="../.gitbook/assets/image (131).png" alt=""><figcaption></figcaption></figure>

Orain artxiboari .ps1 jarriko ahal diogu ejekutatzeko&#x20;

<figure><img src="../.gitbook/assets/image (132).png" alt=""><figcaption></figcaption></figure>

Orain dokumentuaren datuak gure domeinura adaptatuko beharko ditugu

<figure><img src="../.gitbook/assets/image (134).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (133).png" alt=""><figcaption></figcaption></figure>

Gordeko dugu eta ps1 irekiko dugu blok de notas-ekin

<figure><img src="../.gitbook/assets/image (135).png" alt=""><figcaption></figcaption></figure>

Direktorio lehenetsi bat izango dugu eta aldatuko beharko dugu

<figure><img src="../.gitbook/assets/image (136).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (137).png" alt=""><figcaption></figcaption></figure>

Beste gauza bat aldatuko beharko dugu "@yourdomain.com"

<figure><img src="../.gitbook/assets/image (138).png" alt=""><figcaption></figcaption></figure>

Almohadilla bat jarri beharko dugu ez dagoelako&#x20;

<figure><img src="../.gitbook/assets/image (139).png" alt=""><figcaption></figcaption></figure>

Orain powershell ISE irekiko dugu ejekutatzeko

<figure><img src="../.gitbook/assets/image (140).png" alt=""><figcaption></figcaption></figure>

Aldatzen dugu mezua



<figure><img src="../.gitbook/assets/image (141).png" alt=""><figcaption></figcaption></figure>

ORAIN 200 USUARIO SARTUKO DITUGU SKRIPT BATEKIN



Kodea berdina erabiliko dugu baina erabiltzaileak csv txt-an usuario gehiago jarri beharko ditugu eta ere bai aldatu dut OU beste batean sartzeko ( Gero errezago izango delako ezabatzeko)

Chatgpt sortutako erabiltzaileak sartuko ditugu "ScriptUser" OU-an

<figure><img src="../.gitbook/assets/image (243).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (242).png" alt=""><figcaption></figcaption></figure>

Gero skript-a ejekutatuko dugu&#x20;

<figure><img src="../.gitbook/assets/image (244).png" alt=""><figcaption></figcaption></figure>

Eta hemen ikusiko dira guztiak

<figure><img src="../.gitbook/assets/image (245).png" alt=""><figcaption></figcaption></figure>

Eta horain usuario haiek ezabatzeko beste skript bat jarriko dugu
