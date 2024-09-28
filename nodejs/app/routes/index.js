const express = require( "express" );
const router = express.Router();
const amazonRoute = require( "./amazon.route" );
const qooRoute = require( "./qoo.route" );
const bodyParser = require( "body-parser" );

const initializeRoute = ( app ) =>
{
    router.use( '/amazon', amazonRoute );
    router.use( '/qoo', qooRoute );
    app.use( '/api/v1', router );
    app.use( bodyParser.json( {
        limit: '500mb'
    } ) );
    app.use( bodyParser.urlencoded( {
        limit: '500mb',
        extended: true,
        parameterLimit: 1000000
    } ) );
}

module.exports = initializeRoute;