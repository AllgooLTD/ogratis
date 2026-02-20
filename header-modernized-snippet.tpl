<section id="side_panel" class="hide" aria-hidden="true">
    <div class="full-dialog-overlay" data-close-full-dialog="true" role="presentation"></div>
    <div class="full-dialog-container full-dialog-side-control" id="full-dialog-container-js" role="dialog" aria-modal="true" aria-labelledby="full-dialog-title">
        <button type="button" class="full-dialog-close" data-close-full-dialog="true" aria-label="{_close}"></button>
        <h2 id="full-dialog-title" class="sr-only">{_details}</h2>
        <div class="full-dialog-body">
            <iframe
                id="full-dialog-widget"
                name="full-dialog-widget"
                width="100%"
                height="100%"
                frameborder="0"
                title="{_details}"
                loading="lazy"
                referrerpolicy="strict-origin-when-cross-origin"
            ></iframe>
        </div>
    </div>
</section>

<script>
(function () {
    'use strict';

    function closeDialog() {
        if (typeof close_full_dialog === 'function') {
            close_full_dialog();
        }
    }

    document.addEventListener('click', function (event) {
        if (event.target && event.target.closest('[data-close-full-dialog="true"]')) {
            closeDialog();
        }
    });

    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
            closeDialog();
        }
    });
})();
</script>

{apihook[headerbit_start]}

<if condition="isset($ilance->show['slimheader']) AND $ilance->show['slimheader']">
<section id="top-head-container" class="header-container-slim">
<header class="header-slim">
    <div class="top-bar-slim">
        <div class="m-0-10-0-10">
            <span class="<if condition="$ilance->config['template_textdirection'] == 'ltr'">left m-2-10-0-0<else />right m-2-0-0-10</if>">
                <a href="{http_server}" title="{site_name}">
                    <img src="{imguploadscdn}meta/logo.png" alt="{site_name}" decoding="async" fetchpriority="high" />
                </a>
            </span>
            <div class="top-bar-info <if condition="$ilance->config['template_textdirection'] == 'ltr'">right<else />left</if>">{login_include}</div>
        </div>
    </div>
</header>
</section>
<else />
<section id="top-head-container" class="header-container">
<header class="header">
    <div class="box-fluid">
        <div class="header-top">
            <div class="top-nav-left">
                <div id="logo">
                    <div class="logo onlydesktop">
                        <a href="{https_server}" title="{site_name}">
                            <img src="{imguploadscdn}meta/logo.png" alt="logo desktop" decoding="async" fetchpriority="high" />
                        </a>
                    </div>
                    <div class="logo onlymobile">
                        <a href="{https_server}" title="{site_name}">
                            <img src="{imguploadscdn}meta/logo-mobile.png" alt="logo mobile" decoding="async" />
                        </a>
                    </div>
                </div>
            </div>

            <div class="top-nav-right" id="billboard-3" aria-label="Promo"></div>
            <script>
            if (typeof ilance_widget === 'function') {
                ilance_widget('block', {
                    mode: 'hpa',
                    id: 3,
                    cid: '{cid}',
                    width: 400,
                    height: 39,
                    divider: false,
                    mime: '.gif',
                    container: 'billboard-3'
                });
            }
            </script>
        </div>
    </div>
</header>
</section>
</if>
