var escapeJsHTML = function (str) {
    return str
            .replace(/\\/g, '\\\\')
            .replace(/'/g, "\\'")
            .replace(/"/g, '\\"')
            .replace(/\//g, '\\/')
            .replace(/</g, '\\x3c')
            .replace(/>/g, '\\x3e')
            .replace(/(0x0D)/g, '\r')
            .replace(/(0x0A)/g, '\n')
            .replace(/&/g, '&amp;');
}

console.log(escapeJsHTML('test'))
