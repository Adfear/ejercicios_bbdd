<?php
    $ojos = array("./img/retrato-1-3.jpg", "./img/retrato-2-3.jpg", "./img/retrato-3-3.jpg", "./img/retrato-4-3.jpg", "./img/retrato-5-3.jpg", "./img/retrato-6-3.jpg", "./img/retrato-7-3.jpg", "./img/retrato-8-3.jpg");
    $nariz = array("./img/retrato-1-2.jpg", "./img/retrato-2-2.jpg", "./img/retrato-3-2.jpg", "./img/retrato-4-2.jpg", "./img/retrato-5-2.jpg", "./img/retrato-6-2.jpg", "./img/retrato-7-2.jpg", "./img/retrato-8-2.jpg");
    $bocas = array("./img/retrato-1-1.jpg", "./img/retrato-2-1.jpg", "./img/retrato-3-1.jpg", "./img/retrato-4-1.jpg", "./img/retrato-5-1.jpg", "./img/retrato-6-1.jpg", "./img/retrato-7-1.jpg", "./img/retrato-8-1.jpg");
    $e_ojos = $ojos[array_rand($ojos)];
    $e_nariz = $nariz[array_rand($nariz)];
    $e_bocas = $bocas[array_rand($bocas)];
    
    $famosos =  array(
        "Angelina Jolie" => array("retrato-1-1.jpg","retrato-1-2.jpg","retrato-1-3.jpg"),
        "Bill Murray" => array("retrato-2-1.jpg","retrato-2-2.jpg","retrato-2-3.jpg"),
        "Clint Eastwood" => array("retrato-3-1.jpg","retrato-3-2.jpg","retrato-3-3.jpg"),
        "Christopher Walken" => array("retrato-4-1.jpg","retrato-4-2.jpg","retrato-4-3.jpg"),
        "Denis Hoper" => array("retrato-5-1.jpg","retrato-5-2.jpg","retrato-5-3.jpg"),
        "George Clooney" => array("retrato-6-1.jpg","retrato-6-2.jpg","retrato-6-3.jpg"),
        "Helen Mirren" => array("retrato-7-1.jpg","retrato-7-2.jpg","retrato-7-3.jpg"),
        "Cate Blanchett" => array("retrato-8-1.jpg","retrato-8-2.jpg","retrato-8-3.jpg"),

    )
    ?>
    <?php
    function comprobar() {
        foreach ($famosos as $famoso => $imagenes)
            foreach ($imagenes as $imagen) {
            }
            echo '<br>';
        }
      
    ?>