const amazonPaapi = require( 'amazon-paapi' );
const { users, settings, amazonProducts } = require( "../models" );


class GetProductInfo
{
	constructor( userId, asins, accessKey, secretKey, partnerTag )
	{
		this.userId = userId;
		this.accessKey = accessKey;
		this.secretKey = secretKey;
		this.partnerTag = partnerTag;
		this.asins = asins;
	}

	async main()
	{
		const commonParameters = {
			AccessKey: this.accessKey,
			SecretKey: this.secretKey,
			PartnerTag: this.partnerTag,
			PartnerType: 'Associates',
			Marketplace: 'www.amazon.co.jp',
		};

		let requestParameters = {
			ItemIds: this.asins,
			ItemIdType: 'ASIN',
			// Condition: 'New',
			Resources: [
				"Offers.Listings.DeliveryInfo.IsPrimeEligible",
				"ItemInfo.Title",
				'Offers.Listings.Availability.Message',
				"Offers.Summaries.LowestPrice",
			],
		};

		await amazonPaapi.GetItems( commonParameters, requestParameters )
			.then( ( amazonData ) =>
			{
				var items = amazonData.ItemsResult.Items;
				for ( const item of items ) {
					try {
						let condition = {
							user_id: this.userId,
							ASIN: item.ASIN,
						};

						let query = {};

						if ( item.Offers.Summaries[0].Condition.Value == 'New' ) {
							query.price = item.Offers.Summaries[0].LowestPrice.Amount;
							query.r_price = item.Offers.Summaries[0].LowestPrice.Amount;
						} else if ( item.Offers.Summaries.length > 1 && item.Offers.Summaries[1].Condition.Value == 'New' ) {
							query.price = item.Offers.Summaries[1].LowestPrice.Amount;
							query.r_price = item.Offers.Summaries[1].LowestPrice.Amount;
						}
						if ( item.Offers !== undefined ) {
							if ( item.Offers.Listings[0].Availability !== undefined ) {
								if ( item.Offers.Listings[0].Availability.Message != '在庫あり。' ) {
									query.inventory = 0;
								}
								else {
									query.inventory = 1;
								}
							}
						}
						amazonProducts.update( query, { where: condition } );
					} catch ( err ) {
						console.log( 'forof item error', err.status );
					}
				}
			} ).catch( err =>
			{
				console.log( 'amazonPaapi.GetItems error', err.status );
			} );
	}

	async updatePriceStock()
	{
		const commonParameters = {
			AccessKey: this.accessKey,
			SecretKey: this.secretKey,
			PartnerTag: this.partnerTag,
			PartnerType: 'Associates',
			Marketplace: 'www.amazon.co.jp',
		};

		let requestParameters = {
			ItemIds: this.asins,
			ItemIdType: 'ASIN',
			// Condition: 'New',
			Resources: [
				'Offers.Listings.Availability.Message',
				"Offers.Summaries.LowestPrice",
			],
		};

		await amazonPaapi.GetItems( commonParameters, requestParameters )
			.then( async ( amazonData ) =>
			{
				var items = amazonData.ItemsResult.Items;
				for ( const item of items )
				{
					try {
						let condition = {
							ASIN: item.ASIN,
						};

						let query = {
							quantity: 1
						};
						
						if ( item.Offers !== undefined )
						{
							if ( item.Offers.Listings[0].Availability !== undefined )
							{
								if ( item.Offers.Listings[0].Availability.Message != '在庫あり。' )
								{
									query.quantity = 0;
								}
							}
						}

						query.price = item.Offers.Summaries[0].LowestPrice.Amount;

						asinProducts = await amazonProducts.findAll({
							where: condition
						});

						for (const product of asinProducts)
						{
							if (product.r_price != query.price || query.quantity == 0)
							{
								const setting = settings.findOne({ where: { id: product.user_id } });
								let alertUrl = "https://xs998400.xsrv.jp/api/v1/alert_mail";
								let alertEmail = setting.alert_email;

								const payload = {
									to: alertEmail,
									product: JSON.stringify(product),
									price: query.price,
									quantity: query.quantity,
								};

								const headers = {
									'Content-Type': 'application/x-www-form-urlencoded'
								};

								try {
									const response = await axios.post(alertUrl, new URLSearchParams(payload), { headers });
									console.log(response.data);
								} catch (error) {
									console.error("Error sending alert:", error);
								}
							}

							if (product.r_price > query.price || query.quantity == 0)
							{
								console.log('reexhibit');
							}
						}

						amazonProducts.update( query, { where: condition } );
					} catch ( err ) {
						console.log( 'forof item error', err.status );
					}
				}
			} ).catch( err =>
			{
				console.log( 'amazonPaapi.GetItems error', err.status );
			} );
	}
}

const getInfo = async ( req, res ) =>
{
	try {
		const userId = JSON.parse(req.body.userId);
		
		const user_info = await users.findOne( { where: { 'id': userId } } );
		const setting_info = await settings.findOne({ where: { 'user_id': userId } });
		const { amazon_accesskey, amazon_secretkey, amazon_partnertag } = setting_info
		
		res.send({
			msg: "アマゾン商品の情報を取得しています。",
			user: user_info,
			setting: setting_info
		});

		const exhi_asins = setting_info.exhi_asins.split('\r\n');
		const ng_asins = setting_info.ng_asins.split('\r\n');
		const asins = exhi_asins.filter(item => !ng_asins.includes(item));
		const len = asins.length;
		
		let index = 0;
		
		const inputInterval = setInterval( () =>
		{
			if ( index < len ) {
				let getProductInfo = new GetProductInfo( userId, asins.slice( index, ( index + 10 ) ), amazon_accesskey, amazon_secretkey, amazon_partnertag );
				getProductInfo.main();
				index += 10;
			} else {
				clearInterval( inputInterval );
			}
		}, 1000 * 10 );

	} catch (error) {
		console.error('Error fetching information:', error);
        res.status(500).send({ msg: "エラーが発生しました。" }); 
	}
};

const tracking = async () =>
{
	try {
		const userId = 1;
		const setting_info = await settings.findOne({ where: { 'user_id': userId } });
		const { amazon_accesskey, amazon_secretkey, amazon_partnertag } = setting_info
		
		const asinRows = await amazonProducts.findAll({
			attributes: ['asin'],
			where: {}
		});
		const asins = asinRows.map(product => product.asin);
		const len = asins.length;
		
		let index = 0;
		
		const inputInterval = setInterval( () =>
		{
			if ( index < len ) {
				let getProductInfo = new GetProductInfo( userId, asins.slice( index, ( index + 10 ) ), amazon_accesskey, amazon_secretkey, amazon_partnertag );
				getProductInfo.updatePriceStock();
				index += 10;
			} else {
				// clearInterval( inputInterval );
				index = 0;
			}
		}, 1000 * 20 );

	} catch (error) {
		console.error('Error fetching information:', error);
	}
};

module.exports = {
	getInfo,
	tracking
};
