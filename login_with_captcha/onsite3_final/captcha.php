<?php
session_start();

function getCaptchaCode($length = 7) {
    $allChars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $len = strlen($allChars);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $allChars[rand(0, $len - 1)];
    }
    return $randomString;
}


$captcha = getCaptchaCode();
$_SESSION["captcha"] = $captcha;  

$image = imagecreatetruecolor(200, 50);

$bg = imagecolorallocate($image, 22, 86, 165);
  

$fg = imagecolorallocate($image, 255, 255, 255);
 
imagefill($image, 0, 0, $bg);
 
for($i = 0; $i < 5; $i++) {
  imagesetthickness($image, 2);
}

imagettftext($image, 20, rand(-5, 5), rand(30, 40), rand(30, 40), $fg, './arial.ttf', $captcha);

header('Content-type: image/png');
imagepng($image);
imagedestroy($image);

?>
