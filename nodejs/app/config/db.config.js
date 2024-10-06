module.exports = {
	HOST: "localhost",
	USER: "root",
	PASSWORD: "",
	DB: "aliex_qoo10",
	// USER: "xs998400_webq",
	// PASSWORD: "YamaTeru1327",
	// DB: "xs998400_aliq10selenium",
	dialect: "mysql",
	pool: {
		max: 150,
		min: 0,
		acquire: 220000,
		idle: 220000
	}
};