####################################################################################
#
# Created By: Tom Burgoon
#
# Initial Creation Date: 3/1/2019
#
# Version: 0.0.1
#
# Comment:
####################################################################################

####################################################################################
#                                  Variables                                       #
####################################################################################
$numberPlayers = Read-Host -Prompt "Please enter the number of players."
$numberWeeks = Read-Host -Prompt "Please enter the number of weeks in the league."
$schedule = @{}
$schWeek = @{}
###################################################################################
#                                  Functions                                       #
####################################################################################
function Get-Number ($excnum) {
  $InputRange = 1..($numberPlayers)
  $Exclude = $excnum
  $RandomRange = $InputRange | Where-Object { $Exclude -notcontains $_ }
  $temp = Get-Random -InputObject $RandomRange
  #$Temp = Get-Random -Minimum 1 -Maximum (1 + $numberPlayers)
  Return $temp
}

function Get-Duplicate ($Dups,$pos,$pla,$opp,$num) {
  $ct = 0
    for ($y=1; $y -le $pos.count; $y++) {
      $NamePla = "Player$y"
      if (($Pos.$NamePla -eq $y) -or ($Pos.$NamePla -eq $num)) {write-host "Dup"; $ct++}
    }

  for ($w=1; $w -le $Dups.Count; $w++){
    $WeekName = "Week$w"
    #for ($y=1; $y -le $numberPlayers; $y++) {
      $NamePla = "Player$pla"
      if (($Dups.$WeekName.$NamePla -eq $num)) {write-host "Dup"; $ct++}
    #}
    }
  if ($ct -gt 0) {return $true} Else {return $false}
}

function Get-Player ($fnPlayerNumber) {
  $ExcludeNumber = [System.Collections.ArrayList]@()
  $player = @{}
  for ($i = 1; $i -le ($numberWeeks); $i++) {
      $fnWeekName = "Week $i"
      $TF = $true
      While ($tf -eq $true) {
        $number = Get-Number $ExcludeNumber
        while ($number -eq $fnPartnerNumber {
          $number = Get-Number $ExcludeNumber
        }
        $fnPartnerNumber = "Player $number"
        $TF = Get-Duplicate $schedule $player $i $x $number
        If (($null -ne $player.$PartNum)) {$TF = $true}
      }
      $player += @{"Player $i" = $number}
      $Player += @{"Player $number" = $i}
      $ExcludeNumber.add($number) | Out-Null
      $ExcludeNumber.add($i) | Out-Null
    }
  Return $player
}
####################################################################################
#                                    Body                                          #
####################################################################################
for ($x = 1; $x -le ($numberPlayers); $x++) {
  $Weeks= Get-Player $x
  $schedule += @{"Player $x" = $Weeks}
}

####################################################################################
#                               Script Cleanup                                     #
####################################################################################
#Remove-Variable -Name * -ErrorAction SilentlyContinue