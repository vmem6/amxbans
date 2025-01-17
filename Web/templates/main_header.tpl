<!doctype html>
{assign var="lang" value=$true|getlanguage}
{assign var="select_lang" value=$true|selectlang:"session"}
{assign var="default_lang" value=$true|selectlang:"config"}
{assign var="title2" value=""}
{assign var=flag_map value=[
  "english" => "gb",
  "german" => "de",
  "dutch" => "nl",
  "swedish" => "se",
  "romanian" => "ro",
  "polish" => "pl",
  "russian" => "ru",
  "norwegian" => "no",
  "czech" => "cz",
  "slovak" => "sk",
  "mongolian" => "mn",
  "bulgarian" => "bg",
  "ukrainian" => "ua",
  "brazilian portuguese" => "br",
  "portuguese" => "pt",
  "finnish" => "fi",
  "french" => "fr",
  "lithuanian" => "lt",
  "danish" => "dk",
  "spanish" => "es",
  "chinese" => "cn",
  "latvian" => "lv",
  "estonian" => "ee",
  "vietnamese" => "vn"
]}
<html dir="ltr">
  <head>
    <meta charset="utf-8" />

    <title>AMXBans {$version_web} - {$title|lang}{if $title2} | {$title2|lang}{/if}</title>
    <meta name="description" content="A ban system for the HL1 engine to manage multiple server bans." />

    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="cache-control" content="no-cache" />

    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />

    <script type="text/javascript" src="include/layer.js"></script>

    <!-- Design -->

    <link rel="stylesheet" type="text/css" href="templates/{$design}/_css/main.css" />
    <link rel="stylesheet" type="text/css" href="templates/{$design}/_css/responsive.css" />
    <link rel="stylesheet" type="text/css" href="templates/{$design}/_css/accessibility.css" />

    <script type="text/javascript" src="templates/{$design}/_js/amxbans.js.php"></script>
    <script type="text/javascript" src="templates/{$design}/_js/jquery.js"></script>
    <script type="text/javascript" src="templates/{$design}/_js/navbar.js"></script>
    <script type="text/javascript" src="templates/{$design}/_js/modal.js"></script>
    <script type="text/javascript" src="templates/{$design}/_js/tooltip.js"></script>
    <script type="text/javascript" src="templates/{$design}/_js/snow.js"></script>
  </head>

  <body {if $smarty.session.loginfailed}onLoad="javascript: countdown({$smarty.session.loginfailed});"{/if}>
    <div class="navbar">
      <div class="navbar__content">
        <div class="navbar__header">
          <div class="navbar__header__heading"><a href="/banai">AMXBans</a></div>
          <div class="navbar__header__burger"><i class="bx bx-menu"></i></div>
        </div>
        <div class="navbar__body">
          <nav class="navbar__body__item navbar__menu">
            {foreach from=$menu item=menuitem}
              {if $smarty.session.loggedin == "true"}
                {if $menuitem.lang_key2}
                  <div class="navbar__menu__item">
                    <a href="{$menuitem.url2}">{$menuitem.lang_key2|lang}</a>
                  </div>
                {/if}
              {else}
                {if $menuitem.lang_key}
                  <div class="navbar__menu__item">
                    <a href="{$menuitem.url}">{$menuitem.lang_key|lang}</a>
                  </div>
                {/if}
              {/if}
            {/foreach}
          </nav>
          {if $smarty.session.loggedin == "true"}
            <div class="navbar__body__item navbar__body__login user-menu">
              <a class="block-white" href="#"><i class="bx bx-user-circle"></i> {$smarty.session.uname}</a>
              <div class="user-submenu">
                <div class="user-submenu__item"><a href="admin.php">{"_ADMINAREA"|lang}</a></div>
                <div class="user-submenu__item"><a href="logout.php">{"_LOGOUT"|lang}</a></div>
              </div>
            </div>
          {else}
            <div class="navbar__body__item navbar__body__login">
              <a class="block-white block-white--hoverable" href="login.php"><i class="bx bx-user-circle"></i> {"_LOGIN"|lang}</a>
            </div>
          {/if}
        </div>
      </div>
    </div>

    <div class="lang-selector"><i class="bx bx-globe"></i></div>
    <dialog class="modal lang-modal">
      <div class="modal__content">
        <button class="modal__close"><i class="bx bx-x"></i></button>
        <h1>Pasirinkite kalbą</h1>
        <div class="lang-modal__body">
          <form id="lang-form" method="post" action=""></form>
          {foreach from=$lang item="langname"}
            <button {if $select_lang == $langname}class="selected"{/if} form="lang-form" name="newlang" value="{$langname|escape}"><img src="images/flags/{$flag_map[$langname]}.gif" /> {$langname|escape}</button>
          {/foreach}
        </div>
      </div>
    </dialog>
    <script>
      document.querySelector(".lang-selector").onclick = () => {
        document.querySelector(".lang-modal").showModal();
      }
    </script>

    <div id="site">
      <div class="center-wrapper">
        {if $banner <> ""}
          <div id="header">
            <div id="site-title" style="text-align: center;">
              <a href="{$banner_url}" target="_blank"><img src="images/banner/{$banner}" alt="{$banner_url}" title="{$banner_url}" /></a>
            </div>
          </div>
        {else}
          <div class="spacer">&nbsp;</div>
        {/if}
