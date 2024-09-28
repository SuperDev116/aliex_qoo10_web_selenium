module.exports = (sequelize, Sequelize) => {
  const userList = sequelize.define("users", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true, // Automatically increment the ID
    },
    email: {
      type: Sequelize.STRING,
      allowNull: false,
      unique: true, // Ensure email is unique
    },
    _token: {
      type: Sequelize.STRING,
    },
    email_verified_at: {
      type: Sequelize.DATE,
      allowNull: true, // Allow null if not verified
    },
    password: {
      type: Sequelize.STRING,
      allowNull: false, // Ensure password is not null
    },
    tool_id: {
      type: Sequelize.STRING,
      allowNull: false, // Ensure password is not null
    },
    tool_pass: {
      type: Sequelize.STRING,
      allowNull: false, // Ensure password is not null
    },
    role: {
      type: Sequelize.ENUM('admin', 'user'), // Define enum for roles
      allowNull: false, // Ensure role is not null
    },
    full_name: {
      type: Sequelize.STRING,
      allowNull: true, // Allow null if not provided
    },
  },
  {
    timestamps: true, // Enable timestamps for createdAt and updatedAt
    createdAt: 'created_at', // Optional: Customize createdAt field name
    updatedAt: 'updated_at', // Optional: Customize updatedAt field name
  });

  return userList;
};
