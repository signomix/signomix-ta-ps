<script>
    import { onMount } from 'svelte';
    import { createEventDispatcher } from 'svelte';
    const dispatch = createEventDispatcher();

    export let language;
    export let uid;
    export let csAPI

    let pageArticle = {published: "2020-06-06T"}

    onMount(async () => {
        getData(csAPI + uid + '?language=' + language, null, updatePage);
    });

    export function languageChanged(name) {
        language = name;
        getData(csAPI + uid + '?language=' + language, null, updatePage);
    }

    function updatePage(code, text) {
        if (code === 404) {
            pageArticle.title = '404';
            pageArticle.content = '<p>' + uid + ' not found</p>';
            return;
        }
        var doc = JSON.parse(text);
        pageArticle = decodeDocument(doc);
    }

    function handleBack() {
        dispatch('goBack', {
            text: event.target.href
        })
    }

</script>

{#if pageArticle.title=='404'}
<div class="container text-center">
    <div class="row">
        <div class="col">
            <h1>404</h1>
            <p>{uid} not found</p>
        </div>
    </div>
</div>
{:else}
<div class="container text-left">
    <div class="row">
        <div class="col">
            {@html pageArticle.content}
        </div>
    </div>
</div>
{/if}