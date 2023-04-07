<script>
    import { onMount } from 'svelte';

    export let language;
    export let csAPI;

    let article =
            {
                title: '',
                summary: '',
                content: ''
            }

    onMount(async() => {
        getData(csAPI + '/homepage/footer.html?language=' + language, null, update)
    });

    export function languageChanged(name) {
        language = name;
        getData(csAPI + '/homepage/footer.html?language=' + language, null, update)
    }

    function update(code, text) {
        if (code === 404) {
            article.content = '<p><i>/homepage/footer.html</i> not found</p>';
            return;
        }
        article = decodeDocument(JSON.parse(text));
    }

</script>
<footer>
    <footer class="text-signo">
        <div class="container">
            <article>
                <!--<header><h1></h1><p></p></header>-->
                <section>
                    {@html article.content}
                </section>
            </article>
        </div>
    </footer>
</footer>