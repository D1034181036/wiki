# Display_Folder_List

```php
<?php

foreach (scandir('./', 1) as $key => $value){
	if(!in_array($value, [".", ".."]) && is_dir($value)){
		$folderList[$key] = $value;
	}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Basic Meta -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ImSoHappySC</title>

	<!-- Bootstrap css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<style> .links{ text-decoration: none; } </style>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<tr>
				<td>#</td>
				<td>URL</td>
			</tr>
			<?php foreach($folderList as $key => $value): ?>
			<tr>
				<td><?= $key+1 ?></td>
				<td><a class="links" href="<?= $value ?>"><?= $value ?></a></td>
			</tr>
			<?php endforeach ?>
		</table>
	</div>
</body>
</html>
```
