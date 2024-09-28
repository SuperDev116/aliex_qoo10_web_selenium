const axios = require('axios');
const { users, settings, amazonProducts, qooProducts } = require( "../models" );


class ExhibitQoo
{
    constructor( userId, product, apikey, category, multiplier )
	{
        this.userId = userId;
		this.apikey = apikey;
		this.product = product;
		this.category = category;
		this.multiplier = multiplier;
	}

    async main()
    {
        const exhiData = {
            // SecondSubCat: this.category,
            SecondSubCat: '320001958',
            ItemTitle: this.product.title.slice(0, 99),
            SellerCode: `SKU-${this.product.asin}`,
            ProductionPlace: this.product.origin,
            ProductionPlaceType: this.product.origin.includes('日本') ? '1' : '2',
            Weight: this.product.weight,
            Material: this.product.material,
            StandardImage: this.product.img_url_main,
            ItemDescription: this.product.description,
            ItemPrice: Math.floor(this.product.price * this.multiplier),
            ItemQty: this.product.quantity,
            AvailableDateType: '0',
            AvailableDateValue: '1',
            image_other_url: JSON.parse(this.product.img_url_thumb).join('$$')
        };

        const baseUrl = 'https://api.qoo10.jp/GMKT.INC.Front.QAPIService/Giosis.qapi';

        const queryParams = new URLSearchParams({
            key: this.apikey,
            returnType: 'json',
            method: 'ItemsBasic.SetNewGoods',
            SecondSubCat: exhiData.SecondSubCat,
            OuterSecondSubCat: '',
            Drugtypet: '',
            BrandNo: '',
            ItemTitle: exhiData.ItemTitle,
            PromotionName: '',
            SellerCode: exhiData.SellerCode,
            IndustrialCodeType: '',
            IndustrialCode: '',
            ModelNM: '',
            ManufactureDate: '',
            ProductionPlaceType: exhiData.ProductionPlaceType,
            ProductionPlace: exhiData.ProductionPlace,
            Weight: exhiData.Weight,
            Material: exhiData.Material,
            AdultYN: '',
            ContactInfo: '',
            StandardImage: exhiData.StandardImage,
            image_other_url: exhiData.image_other_url,
            VideoURL: '',
            ItemDescription: exhiData.ItemDescription,
            AdditionalOption: '',
            ItemType: '',
            RetailPrice: '',
            ItemPrice: exhiData.ItemPrice,
            ItemQty: exhiData.ItemQty,
            ExpireDate: '',
            ShippingNo: '',
            AvailableDateType: exhiData.AvailableDateType,
            AvailableDateValue: exhiData.AvailableDateValue,
            Keyword: ''
        });
    
        let exhibitionUrl = '';
    
        try {
            exhibitionUrl = `${baseUrl}?${queryParams.toString()}`;
            const response = await axios.get(exhibitionUrl);

            if (response.data.ResultMsg === 'SUCCESS')
            {
                const query = {
                    user_id: this.userId,
                    gd_no: response.data.ResultObject.GdNo,
                    title: exhiData.ItemTitle,
                    url: this.product.url,
                    img_url_main: exhiData.StandardImage,
                    img_url_thumb: exhiData.image_other_url,
                    category: exhiData.SecondSubCat,
                    price: exhiData.ItemPrice,
                    quantity: exhiData.ItemQty,
                    shipping: this.product.shipping,
                    description: exhiData.ItemDescription,
                    color: this.product.color,
                    size: this.product.size,
                    weight: exhiData.Weight,
                    material: exhiData.Material,
                    origin: exhiData.ProductionPlace,
                    seller_code: exhiData.SellerCode
                };

                qooProducts.create(query)
                .then( res => console.log('Successfully stored in DB!', res) )
                .catch( err => console.log('Whoops! Error creating product!', err) );
            }
            else
            {
                console.log('出品失敗 _____ _____ _____ 1', response.text);
            }
        }
        catch (error)
        {
            console.log('出品失敗 _____ _____ _____ 2', error);
        }
    }    
}

const exhibit = async ( req, res ) => {
    try {
		const userId = JSON.parse(req.body.userId);
		
		const user_info = await users.findOne( { where: { id: userId } } );
		const setting_info = await settings.findOne({ where: { user_id: userId } });
        let apikey = '';

		const { qsm_email, qsm_password, qsm_apikey, ng_words, qoo_smallcategory, multiplier } = setting_info;

		const apiKeyUrl = `https://api.qoo10.jp/GMKT.INC.Front.QAPIService/ebayjapan.qapi?key=${qsm_apikey}&v=1.0&returnType=json&method=CertificationAPI.CreateCertificationKey&user_id=${qsm_email}&pwd=${qsm_password}`

        const response = await axios.get(apiKeyUrl);
        const jsonResponse = response.data;

        if (jsonResponse.ResultMsg === "成功") {
            apikey = jsonResponse.ResultObject;
            
            res.send({
                msg: "Qoo10に商品を出品しています。",
                user: user_info,
                setting: setting_info
            });

            const amazonProLi = await amazonProducts.findAll({ where: { user_id: userId } });
            let len = amazonProLi.length;

            let index = 0;

            const exhiInterval = setInterval( () =>
            {
                let product = amazonProLi[index];

                if (!product.is_prime || !product.quantity)
                {
                    index++;
                    return;
                }

                let skipItem = false;
                for (const ngw of ng_words.split('\r\n')) {
                    if (ngw && product.title.includes(ngw)) {
                        console.log(`NGWords _____ _____ _____ ${ngw} _____ _____ _____ ${product.title}`);
                        skipItem = true;
                        break;
                    }
                }
                
                if (!skipItem)
                {
                    if ( index < len ) {
                        const exhibitProduct = new ExhibitQoo( userId, product, apikey, qoo_smallcategory, multiplier );
                        exhibitProduct.main();
                    } else {
                        clearInterval( exhiInterval );
                    }
                }

                index++;

            }, 1000 * 5 );
        }
        else
        {
            console.warn('失敗: 認証情報が正しくありません。');
            res.status(500).send({ msg: "Qoo10認証APIキーが正しくありません。" });
        }
	}
    catch (error)
    {
		console.error('Error exhibiting information:', error);
        res.status(500).send({ msg: "エラーが発生しました。" });
	}
};

module.exports = {
    exhibit
};