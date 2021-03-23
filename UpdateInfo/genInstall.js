// Node.js

const fs = require("fs")
const path = require("path")
const dataDir = "..\\Data\\"

var installArray = []

function traverseDir(dir) {
    fs.readdirSync(dir).forEach(file => {
        let fullPath = path.join(dir, file);
        if (fs.lstatSync(fullPath).isDirectory()) {
            console.log(fullPath);
            installArray[installArray.length] = [2,fullPath.replace(dataDir,"")]
            traverseDir(fullPath);
        } else {
            installArray[installArray.length] = [1,fullPath.replace(dataDir,"")]
            console.log(fullPath);
        }  
    });
}
traverseDir(dataDir)

console.log(installArray)

fs.writeFileSync("Install.json",JSON.stringify(installArray))