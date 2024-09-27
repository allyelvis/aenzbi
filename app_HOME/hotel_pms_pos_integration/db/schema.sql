CREATE TABLE Guests (
  GuestID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  PhoneNumber VARCHAR(20)
);

CREATE TABLE Rooms (
  RoomID INT PRIMARY KEY,
  RoomNumber VARCHAR(10),
  RoomType VARCHAR(50),
  RoomStatus VARCHAR(20)
);

CREATE TABLE Reservations (
  ReservationID INT PRIMARY KEY,
  GuestID INT,
  RoomID INT,
  CheckInDate DATE,
  CheckOutDate DATE,
  FOREIGN KEY (GuestID) REFERENCES Guests(GuestID),
  FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

CREATE TABLE Payments (
  PaymentID INT PRIMARY KEY,
  ReservationID INT,
  Amount DECIMAL(10, 2),
  PaymentDate DATE,
  PaymentMethod VARCHAR(20),
  FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
);

CREATE TABLE Staff (
  StaffID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Role VARCHAR(50),
  ContactInfo VARCHAR(100)
);
