<?php
session_start();


function generateRandomString($length = 7) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}


$captcha = generateRandomString();
$_SESSION["captcha"] = $captcha;  

$image = imagecreatetruecolor(200, 50);

$bg = imagecolorallocate($image, 22, 86, 165);
  

$fg = imagecolorallocate($image, 255, 255, 255);


imageantialias($image, true);
 
imagefill($image, 0, 0, $bg);
 
for($i = 0; $i < 5; $i++) {
  imagesetthickness($image, 2);

  $rect_color = imagecolorallocate($image, 200, 200, 200);
}



$font = './arial.ttf';

imagettftext($image, 20, rand(-5, 5), rand(30, 40), rand(30, 40), $fg, $font, $captcha);

header('Content-type: image/png');
imagepng($image);
imagedestroy($image);



?>