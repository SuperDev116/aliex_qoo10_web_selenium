const express = require( "express" );
const router = express.Router();
const qoo = require( "../controllers/qoo.controller.js" );

router.post( '/exhibit', qoo.exhibit );

module.exports = router;