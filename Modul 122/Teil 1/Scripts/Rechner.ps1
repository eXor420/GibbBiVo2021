cls
echo Hello!
echo "So verwendest du den Rechner:"`n
echo "1.) Gib eine erste Zahl ein und dr�cke ENTER" "2.) Gib einen Operator ein und dr�cke ENTER" "3.) Gib falls danach gefragt wird eine zweite Zahl ein und dr�cke ENTER "`n
do { <# Mithilfe dieser Do-While-Schleife kann man so viele Berechnungen durchf�hren wie man m�chte #> 
  $finalResult = 0
  $number1 = "" 
  $number2 = ""
  $operator = ""
do { <# Hier wird Mithilfe des Read-Host-Befehls solange die erste Zahl eingelesen bis die Eingabe einer g�ltigen Ganzzahl entspricht #>
  $number1 = Read-Host "Gib deine erste Zahl ein (Nur positive Ganzzahlen)"  
}
while ( $number1 -notmatch '^[0-9]+$' )
echo "`n"
do { <# Hier wird Mithilfe des Read-Host-Befehls solange der Operator eingelesen bis die Eingabe einem g�ltigen Operator entspricht #>
  $operator = Read-Host "W�hle einen g�ltigen Operator (+, -, *, /, %, p(Potenz), s(Wurzel), b(toBinary))"
}
while ( $operator -notmatch '^[+]$|^[-]$|^[*]$|^[/]$|^[%]$|^["p"]$|^["s"]$|^["b"]$' )
echo "`n"
if($operator -ne "s" -and $operator -ne "b") <# In diesem If-Statement wird �berpr�ft ob eine Zweite Zahl f�r die Berechnung erforderlich ist #>
    {
    do { <# Hier wird Mithilfe des Read-Host-Befehls solange die zweite Zahl eingelesen bis die Eingabe einer g�ltigen Ganzzahl entspricht #>
    $number2 = Read-Host "Gib deine zweite Zahl ein (Nur positive Ganzzahlen)"  
    }
     while ( $number2 -notmatch '^[0-9]+$' )
    }
switch ($operator)  <# In diesem Switch-Case wird der Wert des Operators �berpr�ft und je nach dem welchen Wert er tr�gt wird eine andere berechnung durchgef�hrt #>      
    {                        
        "+" {$finalResult = [int]$number1+[int]$number2}            <# Hier wird die beiden Zahlen Addiert #>             
        "-" {$finalResult = [int]$number1-[int]$number2}            <# Hier wird die erste Zahl minus die zweite Zahl gerechnet #>                 
        "*" {$finalResult = [int]$number1*[int]$number2}            <# Hier wird die beiden Zahlen multipliziert #>     
        "/" {$finalResult = [int]$number1/[int]$number2}            <# Hier wird die erste Zahl durch die zweite dividiert #>     
        "%" {$finalResult = [int]$number1%[int]$number2}            <# Hier wird die erste Zahl modulo die zweite Zahl gerechnet #>    
        "p" {$finalResult=[math]::pow([int]$number1, [int]$number2)}  <# Hier wird die erste Zahl hoch die zeite gerechnet #>    
        "s" {$finalResult=[math]::Sqrt([int]$number1)}                <# Hier wird die Wurzel der ersten Zahl #>    
        "b" {$finalResult=""
              while($number1 -gt 0){ <# Hier wird die erste Zahl zu einer bin�ren zahl konvertiert #>    
              $finalResult = "" + $number1%2 + $finalResult <# Hier wird eine 1 oder eine 0 vor das Ergebniss geh�ngt damit eine Bin�re Zahl entsteht #>    
              $number1 = ($number1 -($number1%2))/2
              if($finalResult.replace(' ','').Length%4 -eq 0 -and $number1 -ne 0) <# Hier werden alle 4 einsen und nullen ein Lehrzeichen eingef�gt #>    
              {
                  $finalResult = " " + $finalResult
              }
            }
            for ($i = 0; $i -lt $finalResult.replace(' ','').Length%4; $i++) <# Zum Schluss wird der bin�ren Zahl mit nullen am anfang aufgef�llt damit es immer 4er Bl�cke gibt #>    
            { 
                $finalResult = "" + 0 +$finalResult
            }
        }                        
        Default {echo "Berechnung Fehlgeschlagen"}                <# Falls die Berechnugn aus nicht erkl�rlichen Gr�nden fehlschl�ft wird dies auf der Konsole ausgegeben #>            
    }            
echo $finalResult 
echo "`n"
$exit = Read-Host "Wenn du noch eine Berechnung durchf�hren m�chtest dr�cke ENTER ansonsten gib 'x' ein" 
echo "`n"
cls
}
while ( $exit -ne "x" )