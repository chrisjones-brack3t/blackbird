<ul>
	<?php if(_ControllerFront::$session->logged === true): ?>
	<li>Logged in as <a href="<?= BASE ?>user/edit"><?= _ControllerFront::$session->displayname ?></a></li>
	<li><a href="<?= BASE ?>user/admin">Admin</a></li><li><a href="<?= BASE ?>user/logout">Logout</a></li>
	<?php else: ?>
	<li><a href="<?= BASE ?>user/login">Login</a></li>
	<?php endif ?>
	<li><a id="about_blackbird" title="About Blackbird" href="#<?= BASE ?>about">Blackbird</a></li>
</ul>