module.exports = (sequelize, Sequelize) => {
  const amazonProductList = sequelize.define("amazon_products", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true, // Automatically increment the ID
    },
    user_id: {
      type: Sequelize.INTEGER,
      allowNull: false, // Ensure user_id is not null
    },
    asin: {
      type: Sequelize.STRING,
      allowNull: false, // Ensure ASIN is not null
      unique: true, // Ensure ASIN is unique
    },
    is_prime: {
      type: Sequelize.BOOLEAN, // Use BOOLEAN for true/false values
      allowNull: false, // Ensure is_prime is not null
    },
    title: {
      type: Sequelize.STRING,
      allowNull: false, // Ensure title is not null
    },
    url: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    shipping: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    quantity: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    img_url_main: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    img_url_thumb: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    r_price: {
      type: Sequelize.INTEGER, // Use INTEGER for prices
      allowNull: false, // Ensure price is not null
    },
    price: {
      type: Sequelize.INTEGER, // Use INTEGER for prices
      allowNull: false, // Ensure price is not null
    },
    category: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    description: {
      type: Sequelize.TEXT, // Use TEXT for longer descriptions
      allowNull: true, // Allow null if not provided
    },
    color: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    size: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    weight: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    material: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    origin: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    exhibit: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    reason: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
  },
  {
    timestamps: true, // Enable timestamps for createdAt and updatedAt
    createdAt: 'created_at', // Optional: Customize createdAt field name
    updatedAt: 'updated_at', // Optional: Customize updatedAt field name
  });

  return amazonProductList;
};
