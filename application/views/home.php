<?php 
    defined('BASEPATH') OR exit('No direct script access allowed'); 
    $this->load->view("templates/header");
    $products = $products->get();
?>
<div class="listing">
    <h3>Product Listings</h3>
    <table>
        <thead>
            <tr>
                <th>Manufacturer</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Date Added</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
<?php       foreach($products as $product): ?>
            <tr>
                <td><?= $product->manufacturer ?></td>
                <td><?= $product-> product_name ?></td>
                <td>$<?= $product->price ?></td>
                <td><?= date("F j, Y",strtotime($product->created_at))?></td>
                <td>
                    <a href="/listings/show_product/<?=$product->id?>">Show</a>
                    <a href="/listings/delete/<?=$product->id?>">Delete</a>
                </td>
            </tr>
<?php       endforeach ?>
        </tbody>
    </table>
</div>
<div class="add">
    <h3>Add a product</h3>
    <form action="/listings/add" method="post">
        <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>" value="<?=$this->security->get_csrf_hash();?>" />
        <div>
            <label for="Manufacturer">Manufacturer</label>
            <select name="manufacturer" id="manufacturer">
                <option value="Jansport">Jansport</option>
                <option value="Nike">Nike</option>
                <option value="Adidas">Adidas</option>
                <option value="Casio">Casio</option>
                <option value="Oakley">Oakley</option>
            </select>
            <span class="error"><?= form_error("manufacturer")?></span>
        </div>
        <div>
            <label for="name">Product Name</label>
            <input type="text" name="name" value="<?= set_value("name")?>">
            <span class="error"><?= form_error("name")?></span>
        </div>
        <div>
            <label for="name">Price ($)</label>
            <input type="number" name="price" value="<?= set_value("price")?>">
            <span class="error"><?= form_error("price")?></span>
        </div>
        <div>
            <label for="description">Description</label>
            <textarea name="description"><?= set_value("description")?></textarea>
            <span class="error"><?= form_error("description")?></span>
        </div>
        <input type="submit" value="Add">
    </form>
</div>


<?php $this->load->view("templates/footer")?>
