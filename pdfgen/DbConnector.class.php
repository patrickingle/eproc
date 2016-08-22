<?php

function mysqlSafe($record) {
	if (!get_magic_quotes_gpc())
		return mysql_escape_string($record);
	else 
		return $record;
}

require_once 'SystemComponent.class.php';

class DbConnector extends SystemComponent {

    var $theQuery;
    var $linker;

    function DbConnector() {

        $settings = SystemComponent::getSettings();

        $host = $settings['dbhost'];
        $db = $settings['dbname'];
        $user = $settings['dbusername'];
        $pass = $settings['dbpassword'];

        $this->linker = mysql_connect($host, $user, $pass);
        mysql_select_db($db) or die("Can't select DB!");
        register_shutdown_function(array(&$this, 'close'));

    }
	
	function counter($result) {
		return mysql_num_rows($result);
	}

    function query($query, $debug=false) {
        $this->theQuery = $query;
		if ($debug) echo '<pre>' . $query . '</pre>';
        return mysql_query($query, $this->linker);
    }
	
	function select($table, $keys, $where, $debug=false) {
		
		$count = count($keys);
		$keysQ = "";
		
		if (is_array($keys)) {
			$keysQ .= "(";
			for ($i=0; $i<$count; $i++) {
				$keysQ .= $keys[$i];
				if ($i != $count-1)
					$keysQ .= ", ";
			}
			$keysQ .= ")";
		}
		else
			$keysQ = $keys;
		
		$query = mysqlSafe("SELECT $keysQ FROM $table $where");
		$this->theQuery = $query;
		if ($debug) echo '<pre>' . $query . '</pre>';
        return mysql_query($query, $this->linker);
		
	}
	
	function insert($table, $records, $debug=false) {
				
		$keys = array_keys($records);
		$values = array_values($records);
		$count = count($records);
		
		$keysQ = "";
		$valuesQ = "";
		
		for ($i=0; $i<$count; $i++) {
			if ($i == $count-1) {
				$keysQ .= $keys[$i];
				$valuesQ .= "'" . $values[$i] . "'";
			}
			else {
				$keysQ .= $keys[$i] . ", ";
				$valuesQ .= "'" . $values[$i] . "'" . ", ";
			}
		}
		
		$query = mysqlSafe("INSERT INTO $table (" . $keysQ . ") VALUES (" . $valuesQ . ")");
		$this->theQuery = $query;
		if ($debug) echo '<pre>' . $query . '</pre>';
		return mysql_query($query, $this->linker);
	
	}
	
	function update($table, $records, $where, $debug=false) {
		
		$keys = array_keys($records);
		$values = array_values($records);
		$count = count($records);
		
		$pairs = "";
		for ($i=0; $i<$count; $i++) {
			$pairs .= "$keys[$i]='$values[$i]'";
			if ($i != $count-1)
				$pairs .= ", ";
		}
		
		$query = mysqlSafe("UPDATE $table SET " . $pairs . " " . $where);
		if ($debug) echo '<pre>' . $query . '</pre>';
		$this->theQuery = $query;
		return mysql_query($query, $this->linker);
	}
	
	function delete($table, $id, $col, $debug=false) {
		
		$query = mysqlSafe("DELETE FROM $table WHERE $col=$id");
		$this->theQuery = $query;
		if ($debug) echo '<pre>' . $query . '</pre>';
		return mysql_query($query, $this->linker);
		
	}
	
	function mysqlSafe($q) {
	
	}

    function fetchObject($result) {

        return mysql_fetch_object($result);

    }
	
	function fetchArray($result) {
	
		return mysql_fetch_assoc($result);
	
	}
	
	function getInsertID($ln) {
	
		return mysql_insert_id($ln);
	
	}

    function close() {

        @mysql_close($this->linker);

    }


}
?>