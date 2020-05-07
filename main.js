const MEMORY_PAGES = 2355;
const MEMORY_SIZE = 1024 * 64 * MEMORY_PAGES;

let mem = new WebAssembly.Memory({
    initial: MEMORY_PAGES,
    maximum: MEMORY_PAGES,
    shared: true
});

function worker_fn(code) {
    onmessage = async function(e) {
        let code = e.data.code;
        let mem = e.data.mem;
        let imports = {
            wbg: {
                memory: mem,
                myimport: console.warn
            },
        };
        let wasm = await WebAssembly.instantiate(code, imports);
        console.log(wasm.instance);
        console.log(wasm.module);
        wasm.instance.exports.startme();
    }
}

(async function() {
    let code = await fetch('wasm.wasm');
    let worker = new Worker('data:text/javascript,(' + worker_fn + ')();');
    worker.postMessage({mem: mem, code: await code.arrayBuffer()});
})();
