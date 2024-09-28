module.exports = (sequelize, Sequelize) => {
  const settingList = sequelize.define("settings", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true, // Automatically increment the ID
    },
    user_id: {
      type: Sequelize.INTEGER,
      allowNull: false, // Ensure user_id is not null
    },
    amazon_email: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    amazon_password: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    qsm_email: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    qsm_password: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    qsm_apikey: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    multiplier: {
      type: Sequelize.DECIMAL,
      allowNull: true, // Allow null if not provided
    },
    qoo_maincategory: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    qoo_subcategory: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    qoo_smallcategory: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    exhi_asins: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    ng_asins: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    ng_words: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
    alert_email: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
  },
  {
    timestamps: true, // Enable timestamps for createdAt and updatedAt
    createdAt: 'created_at', // Optional: Customize createdAt field name
    updatedAt: 'updated_at', // Optional: Customize updatedAt field name
  });

  return settingList;
};
