    <?php
    $dbhost  = 'localhost';    // Unlikely to require changing
    $dbname  = 'online_bank';   // Modify these...
    $dbuser  = 'root';   // ...variables according
    $dbpass  = '';   // ...to your installation
    $appname = "Dal Online Bank"; // ...and preference

    $connection = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or 
        die($connection->connect_error);

    echo "Dalhousie Online Bank</br>";
    /*
    $sqlquery = "select * from customer";
    $results = mysqli_query($connection, $sqlquery);

    while ( $row = mysqli_fetch_array($results))
    {
        echo $row['first_name']." ".$row['last_name'];
        echo "</br>";
    }
 */
?>
