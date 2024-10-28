const router = require('express').Router();
const data = new Map();
data.set('Temp', '10')
data.set('Hum', '10')
data.set('Light', '10')
router.post("/putData", async function (req, res) {
    const temp = req.body.temp;
    const hum = req.body.hum;
    const light = req.body.light;

    data.set('Temp', temp)
    data.set('Hum', hum)
    data.set('Light', light)
    res.json({ success: true });

});

router.post("/getData", async function (req, res) {
    const id = req.body.Name;
    res.json({ 'Light': data.get('Light'), 'Hum': data.get('Hum'), 'Temp': data.get('Temp'), })
});



module.exports = router;