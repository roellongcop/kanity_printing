
<?php

if (($request_data = $model->request_data) != null) {
	if (isset($request_data['_csrf'])) {
		unset($request_data['_csrf']);
	}
}
?>


<pre><?php print_r($request_data) ?></pre>