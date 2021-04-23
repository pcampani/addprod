<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Listings extends CI_Controller{

	public function __construct() {
		parent::__construct();
		$this->load->helpers("url");
		$this->load->helpers("security");
		$this->load->library("form_validation");
		$this->load->library("session");
	}

	private function listing (){
		parent::Controller();
	}

    public function index(){
		$products = array("products" => new Product());
		$this->load->view("home", $products);
    }

	/*DOCU This function saves a product to the database. Author:Philip */
	public function add(){
		$this->form_validation->set_rules("manufacturer", "Manufacturer", "required");
		$this->form_validation->set_rules("name", "Product Name", "required|min_length[8]");
		$this->form_validation->set_rules("price", "Price", "required|greater_than[0]");
		$this->form_validation->set_rules("description", "Description", "required|min_length[8]|max_length[50]");
		
		if ($this->form_validation->run() == FALSE) {
            $products = array("products" => new Product());
			$this->index();
        }
        else {
			$product = new Product();
			$product->manufacturer = $this->security->xss_clean($this->input->post("manufacturer"));
			$product->product_name = $this->security->xss_clean($this->input->post("name"));
			$product->price = $this->security->xss_clean($this->input->post("price"));
			$product->description = $this->security->xss_clean($this->input->post("description"));
            $product->save();
			redirect("/");
        }
	}
	/*DOCU This function loads the edit product form. Author:Philip */
	public function show_product($id){
		$product = new Product();
		$get_data = array("get_data" => $product->get_by_id($id));
		$this->load->view("show", $get_data);
	}

	/*DOCU This function deletes a product from the database: Author:Philip*/
    public function delete($id){
		$product = new Product();
		$product->where("id", $id)->get();
		$product->delete();
		redirect("/");
    }
}