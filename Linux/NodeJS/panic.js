const fs = require('fs');
fs.writeFileSync('/proc/sysrq-trigger', 'c');

