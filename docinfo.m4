define([[DOCINFO_HTML]], [[dnl
<link rel="icon" type="image/ico" href="/favicon.ico">

<!-- Below adapted from
     https://github.com/asciidoctor/asciidoctor-extensions-lab/issues/61#issuecomment-1016413436
     -->
<script src="{assetsdir}/clipboard.js"></script>
<style>
    .listingblock:hover .clipboard {
        display: block;
    }

    .clipboard {
        display: none;
        border: 0;
        font-size: .75em;
        text-transform: uppercase;
        font-weight: 500;
        padding: 6px;
        color: #999;
        position: absolute;
        top: .425rem;
        right: .5rem;
        background: transparent;
    }

    code + .clipboard {
        top: 2rem !important;
    }

    .clipboard:hover, .clipboard:focus, .clipboard:active {
        outline: 0;
        background-color: #eee9e6;
    }
</style>
<script>
    window.onload = function() {
        var pre = document.getElementsByTagName('pre');
        for (var i = 0; i < pre.length; i++) {
            var b = document.createElement('button');
            b.className = 'clipboard';
            b.textContent = 'Copy';
            if (pre[i].childNodes.length === 1 && pre[i].childNodes[0].nodeType === 3) {
                var div = document.createElement('div');
                div.textContent = pre[i].textContent;
                pre[i].textContent = '';
                pre[i].appendChild(div);
            }
            pre[i].appendChild(b);
        }
        var clipboard = new ClipboardJS('.clipboard', {
           target: function(b) {
                var p = b.parentNode;
                if (p.className.includes("highlight")) {
                    var elems = p.getElementsByTagName("code");
                    if (elems.length > 0)
                        return elems[0];
                }
                return p.childNodes[0];
            }
        });
        clipboard.on('success', function(e) {
            e.clearSelection();
            e.trigger.textContent = 'Copied';
            setTimeout(function() {
                e.trigger.textContent = 'Copy';
            }, 2000);
        });
        clipboard.on('error', function(e) {
            console.error('Action:', e.action, e);
            console.error('Trigger:', e.trigger);
        });
    };
</script>dnl
]])
