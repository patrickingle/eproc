<?php

class SystemComponent {

    var $settings;

    function getSettings() {

        $settings['dbhost'] = 'localhost';
        $settings['dbname'] = 'erp_eproc';
        $settings['dbusername'] = 'root';
        $settings['dbpassword'] = 'homepc07';

        return $settings;

    }

}

?>
