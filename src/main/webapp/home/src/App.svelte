<script>
    import { onMount } from 'svelte';
    import Navbar from "./components/Navbar.svelte";
    import Article from "./components/Article.svelte";
    import Footer from "./components/Footer.svelte";

    export let texts;
    export let languages;
    export let language;
    export let defaultLanguage;
    export let csAPI;
    export let docuid;
    export let devModePort;
    export let devMode = false;
    export let cmsMode;

    // child components which must be binded
    let navbar;
    let article;
    let footer;

    let selected = '';
    let path
    let homePath
    let prefix
    let pageArticle =
            {
                title: '',
                summary: '',
                content: ''
            }

    let articles = []
    let tmpLang = window.localStorage.getItem("language")
    if (languages.length > 1 && null !== tmpLang && "" !== tmpLang && "undefined" !== tmpLang) {
        language = tmpLang
    } else {
        language = defaultLanguage
    }
    prefix = language === defaultLanguage ? '' : language + '_';
    path = window.location.pathname
    homePath = getRoot(path)
    console.log(window.location.search)
    console.log()
    if (window.location.search.startsWith('?doc=')) {
        var langPos = (window.location.search.lastIndexOf('&'));
        let lang = window.location.search.substring(langPos + 10);
        if (lang.endsWith('/')) {
            lang = lang.slice(0, -1);
        }
        if (lang.length === 2) {
            language = lang;
        }
        docuid = window.location.search.substring(5, langPos);
    }

    /**
     * Load default language version of the application texts on mount
     * @return {undefined}
     */
    onMount(async () => {
        devMode = window.origin.endsWith(':' + devModePort);
        getData(homePath + `texts_` + language + '.json', null, updateTexts);
    });

    /*
     * Handle goBack events
     * @param {type} event
     * @return {undefined}
     */
    function handleGoBack(event) {
        if (window.location.search.startsWith('?doc=')) {
            window.location.search = '';
        } else {
            docuid = '/home.html';
        }
    }

    /**
     * Handle setLanguage events
     * @param {type} event
     * @return {undefined}
     */
    function handleSetLanguage(event) {
        language = event.detail.language
        prefix = language === defaultLanguage ? '' : language + '_';
        window.localStorage.setItem("language", language);
        footer.languageChanged(language);
        if (typeof article !== 'undefined') {
            article.languageChanged(language);
        }
        getData(`texts_` + language + '.json', null, updateTexts);
    }

    function updateTexts(code, text) {
        if (code === 404) {
            return;
        }
        texts = JSON.parse(text);
        //document.title = texts.title;
    }

    function getRoot(pathName) {
        let pos;
        if (pathName.startsWith('/')) {
            pos = pathName.indexOf('/', 1);
        } else {
            pos = pathName.indexOf('/', 0);
        }
        if (pos > -1) {
            return pathName.substring(0, pos + 1);
        }
        return '/';
    }
</script>

<main>
    <Navbar path='/blog' homePath={homePath} bind:this={navbar} languages={languages} language={language}
            defaultLanguage={defaultLanguage} on:setLanguage={handleSetLanguage} />
    <Article language={language} texts={texts} on:goBack={handleGoBack} bind:this={article} devmode={devMode} csAPI={csAPI} uid={docuid}/>
    <Footer  language={language} texts={texts} bind:this={footer} devmode={devMode} csAPI={csAPI}/>
</main>
