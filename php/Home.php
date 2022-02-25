<?php

// if(!isset($_SERVER['HTTP_REFERER'])){
//     // redirect them to your desired location
//     header('location:../error/forbidden.html');
//     exit;
// }

header("Content-type: application/json");
header('Access-Control-Alow-Origin: *');
header("Access-Control-Allow-Methods: GET");
header('Access-Control-Allow-Headers: Content-type,Access-Control-Alow-Origin,Access-Control-Allow-Methods');


// Check if search value is set in url
if (isset($_GET['condition']) && $_GET['condition'] != '') {
    $condition = $_GET['condition'];

    switch ($condition) {
        case 'InitialFetch':
            $query = "SELECT food_items.item_ID,food_items.image,food_items.item_Name,food_items.item_Info,additional_info.price FROM food_items LEFT JOIN additional_info ON food_items.item_ID = additional_info.item_ID WHERE additional_info.size = ?";
            $constraint = array('Regular');
            db_fetch($query,$constraint);
            break;

        case 'getIndividualDetails':
            $query = "SELECT food_items.item_ID, food_items.image, food_items.item_Name, food_items.item_Info, food_items.total_Stars, food_items.total_Reviews,
            food_items.time_Required,food_items.description,
            additional_info.unique_ID,additional_info.price, additional_info.size, additional_info.calorie FROM food_items LEFT JOIN additional_info 
            ON food_items.item_ID = additional_info.item_ID WHERE food_items.item_ID = ?";
            $constraint = array($_GET['item_ID']);
            db_fetch($query,$constraint);
            break;

        default:
            # code...
            $query = "SELECT food_items.item_ID,food_items.image,food_items.item_Name,food_items.item_Info,additional_info.price FROM food_items LEFT JOIN additional_info ON food_items.item_ID = additional_info.item_ID WHERE additional_info.size = ? AND food_items.c_ID = ? ";
            $constraint = array('Regular', $condition);
            db_fetch($query,$constraint);
            break;
    }
} else {
    echo json_encode(array("message" => "Bad Request", "code" => "404"));
}

function db_fetch($query,$constraint)
{
    try {
        //Establish Connection to Server
        $db_name = "mysql:host=localhost;dbname=pizzaBook";
        $username = "root";
        $password = "";
        $conn = new PDO($db_name, $username, $password);

        $sql = $conn->prepare($query);
        $sql->execute($constraint);

        $result = $sql->fetchAll(PDO::FETCH_ASSOC);

        if ($sql) {
            echo json_encode($result);
        }
    } catch (PDOException $error) {
        echo json_encode($error->getMessage());
    }
}
