var file_system = require('fs');
var archiver = require('archiver');

var output = file_system.createWriteStream(process.argv[2]);
var archive = archiver('zip');

output.on('close', function () {
    console.log(archive.pointer() + ' total bytes');
    console.log('archiver has been finalized and the output file descriptor has closed.');
});

archive.on('error', function(err){
    throw err;
});

archive.pipe(output);
archive.bulk([
    { expand: true, cwd: process.argv[3], src: ['**'], dest: process.argv[3]}
]);
archive.finalize();
