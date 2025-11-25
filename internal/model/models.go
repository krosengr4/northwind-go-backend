package model

import "time"

// Category model for the categories of products
type Category struct {
	CategoryId  int    `json:"category_id" db:"category_id"`
	Name        string `json:"category_name" db:"category_name"`
	Description string `json:"description" db:"description"`
}

type Customer struct {
	CustomerId  string `json:"customer_id" db:"customer_id"`
	CompanyName string `json:"company_name" db:"customer_name"`
	ContactName string `json:"contact_name" db:"contact_name"`
	Address     string `json:"address" db:"address"`
	City        string `json:"city" db:"city"`
	Region      string `json:"region" db:"region"`
	PostalCode  string `json:"postal_code" db:"postal_code"`
	Country     string `json:"country" db:"country"`
	Phone       string `json:"phone" db:"phone"`
}

type Employees struct {
	EmployeeId int     `json:"employee_id" db:"employee_id"`
	LastName   string  `json:"last_name" db:"last_name"`
	FirstName  string  `json:"first_name" db:"first_name"`
	Title      string  `json:"title" db:"title"`
	BirthDate  string  `json:"birth_date" db:"birth_date"`
	HireDate   string  `json:"hire_date" db:"hire_date"`
	Address    string  `json:"address" db:"address"`
	State      string  `json:"state" db:"state"`
	City       string  `json:"city" db:"city"`
	PostalCode string  `json:"postal_code" db:"postal_code"`
	Country    string  `json:"country" db:"country"`
	ReportsTo  int     `json:"reports_to" db:"reports_to"`
	Salary     float64 `json:"salary" db:"salary"`
}

type OrderDetails struct {
	OrderId   int     `json:"order_id" db:"order_id"`
	ProductId int     `json:"product_id" db:"product_id"`
	UnitPrice float64 `json:"unit_price" db:"unit_price"`
	Quantity  int     `json:"quantity" db:"quantity"`
}

type Orders struct {
	OrderId        int       `json:"order_id" db:"order_id"`
	CustomerId     string    `json:"customer_id" db:"customer_id"`
	EmployeeId     int       `json:"employee_id" db:"employee_id"`
	OrderDate      time.Time `json:"order_date" db:"order_date"`
	RequiredDate   time.Time `json:"required_date" db:"required_date"`
	ShippedDate    time.Time `json:"shipped_date" db:"shipped_date"`
	ShipVia        int       `json:"ship_via" db:"ship_via"`
	Freight        int       `json:"freight" db:"freight"`
	ShipName       string    `json:"ship_name" db:"ship_name"`
	ShipAddress    string    `json:"ship_address" db:"ship_address"`
	Region         string    `json:"region" db:"region"`
	ShipCity       string    `json:"ship_city" db:"ship_city"`
	ShipPostalCode string    `json:"ship_postal_code" db:"ship_postal_code"`
	ShipCountry    string    `json:"ship_country" db:"ship_country"`
}

type Products struct {
	ProductId       int     `json:"product_id" db:"product_id"`
	ProductName     string  `json:"product_name" db:"product_name"`
	SupplierId      int     `json:"supplier_id" db:"supplier_id"`
	CategoryId      int     `json:"category_id" db:"category_id"`
	QuantityPerUnit string  `json:"quantity_per_unit" db:"quantity_per_unit"`
	UnitPrice       float64 `json:"unit_price" db:"unit_price"`
	UnitsInStock    int     `json:"units_in_stock" db:"units_in_stock"`
	UnitsOnOrder    int     `json:"units_on_order" db:"units_on_order"`
	ReorderLevel    int     `json:"reorder_level" db:"reorder_level"`
	Discontinued    bool    `json:"discontinued" db:"discontinued"`
}

type Shippers struct {
	ShipperId   int    `json:"shipper_id" db:"shipper_id"`
	CompanyName string `json:"company_name" db:"company_name"`
	Phone       string `json:"phone" db:"phone"`
}

type Suppliers struct {
	SupplierId   int    `json:"supplier_id" db:"supplier_id"`
	CompanyName  string `json:"company_name" db:"company_name"`
	ContactName  string `json:"contact_name" db:"contact_name"`
	ContactTitle string `json:"contact_title" db:"contact_title"`
	Address      string `json:"address" db:"address"`
	City         string `json:"city" db:"city"`
	Region       string `json:"region" db:"region"`
	PostalCode   string `json:"postal_code" db:"postal_code"`
	Country      string `json:"country" db:"country"`
	Phone        string `json:"phone" db:"phone"`
	Fax          string `json:"fax" db:"fax"`
}
