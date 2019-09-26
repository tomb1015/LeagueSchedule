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
function Get-Number {
  $Temp = Get-Random -Minimum 1 -Maximum (1 + $numberPlayers)
  Return $Temp
}

function Get-Duplicate ($Dups,$pos,$pla,$opp,$num) {
  $ct = 0
    for ($y=1; $y -le $pos.count; $y++) {
      $NamePla = "Player$y"
      if (($Pos.$NamePla -eq $y) -or ($Pos.$NamePla -eq $num)) {write-host "Dup"; $ct++}
    }

  for ($w=1; $w -le $Dups.Count; $w++){
    $WeekName = "Week$w"
    for ($y=1; $y -le $numberPlayers; $y++) {
      $NamePla = "Player$pla"
      if (($Dups.$WeekName.$NamePla -eq $num)) {write-host "Dup"; $ct++}
    }
    }
  if ($ct -gt 0) {return $true} Else {return $false}
}
####################################################################################
#                                    Body                                          #
####################################################################################
for ($x=1; $x -le ($numberWeeks); $x++) {
  $player = @{}
  for ($i=1; $i -le ($numberPlayers); $i++) {
    $t = 0; $test = 0; for ($t; $t -le $numberPlayers; $t++) {$testpos = "Player$t";If ($null -eq $player.$testpos) {$test++}}; if ($test -eq 0) {break}
    $planam = "Player$i"
    if ($null -eq ($player.$planam)){
      $TF = $true
      While ($tf -eq $true) {
        $number = Get-Number
        while ($number -eq $i) {
          $number = Get-Number
      }
      $TF = Get-Duplicate $schedule $player $i $x $number
      $PartNum = "Player$number"
      If (($null -ne $player.$PartNum)) {$TF = $true}
      }
    $player += @{"Player$i" = $number}
    $Player += @{"Player$number" = $i}
    }
  }
  $schedule += @{"Week$x" = $player}
}

####################################################################################
#                               Script Cleanup                                     #
####################################################################################
#Remove-Variable -Name * -ErrorAction SilentlyContinue