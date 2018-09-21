<?php
// UDT to deisplay GPS tracks
header('Content-Type: Text/Plain');
$folder = 'uploads/Documenten/GPS-Tracks/';
$file_name = '*.html';
$files = glob($folder.$file_name);
$current_year = date('y');
$to_be_replaced = array("_", "-", ".html");
// $files = str_replace(array('-','_'), ' ', $files); // Vervang - en _ door spatie.
$overig = TRUE;
$li_year = true;
if (
    usort($files, function($a, $b) {
        $yearA = (int) substr($a, -7); // extension + . + last two characters
        $yearB = (int) substr($b, -7);
        return $yearB - $yearA; // descending, for ascending swap $yearA and $yearB
    })
) {
    echo "<div class=\"gps-track floatbox\">";
        echo "<ul>";
        // $files is now sorted, do your stuff here
        foreach ((array) $files as $file) {
            if (preg_match('/\\d/',$file)) { 		// $file has numbers
                if (substr(basename($file, '.html'), -2)!= $current_year) {
                    $current_year = substr(basename($file, '.html'), -2);
                    if (is_numeric(substr(basename($file, '.html'), -2))) {
                        $li_year = TRUE;
                    }
                }
                if (($li_year) and substr(basename($file, '.html'), -2) == $current_year) {
                    if (is_numeric(substr(basename($file, '.html'), -2))) {
                        echo "<br />";
                        echo '<h3>GPS Tracks uit 20'.substr(basename($file, '.html'), -2).'</h3>';
                    } else {
                        echo '<h3>GPS Tracks overig</h3>';
                        $li_year = FALSE;
                    }
                    $tmp_file = basename($file, '.html');
                    $tmp_file = str_replace($to_be_replaced, ' ', $tmp_file);
                    // echo '<li><iframe src='.$file.'width=\"700\" height=\"500\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" frameborder=\"0\"></iframe></li>';
    
    
                    echo '<li><a class="floatbox" href='.$file.'>'.$tmp_file.'</a></li>';
                    $li_year = FALSE;
                    // $current_year = $current_year - 1;
                } elseif (substr(basename($file, '.html'), -2) == $current_year) {
                    if ($overig and (!is_numeric(substr(basename($file, '.html'), -2)))) {
                        echo '<h3>GPS Tracks overig</h3>';
                        $overig = FALSE;
                    }
                    $tmp_file = basename($file, '.html');
                    $tmp_file = str_replace($to_be_replaced, ' ', $tmp_file);
                    //echo '<li><iframe src='.$file.'width=\"700\" height=\"500\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" frameborder=\"0\"></iframe></li>';
                    echo '<li><a href='.$file.'>'.$tmp_file.'</a></li>';
                    $li_year = FALSE;
                } else {
                    echo '<h3>GPS Tracks uit '.substr(basename($file, '.html'), -4).'</h3>';
                    $tmp_file = basename($file, '.html');
                    $tmp_file = str_replace($to_be_replaced, ' ', $tmp_file);
                    //echo '<li><iframe src='.$file.'width=\"700\" height=\"500\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" frameborder=\"0\"></iframe></li>';
                    echo '<li><a href='.$file.'>'.$tmp_file.'</a></li>';
                    $current_year = $current_year - 1;
                    $li_year = FALSE;
                }
            } else { 
                $tmp_file = basename($file, '.html');
                $tmp_file = str_replace($to_be_replaced, ' ', $tmp_file);
                //echo '<li><iframe src='.$file.'width=\"700\" height=\"500\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" frameborder=\"0\"></iframe></li>';
                echo '<li><a href='.$file.'>'.$tmp_file.'</a></li>';
                $li_year = FALSE;
                $photo=str_replace(' ','%20',$photo);
            }
        }
        // print_r($sorted);
        echo "</ul>";
    echo "</div>";
} else {
    // sorting failed, show error message, exception, etc.
    echo "Files not sorted";
}
?>