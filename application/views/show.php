<?php 
    defined('BASEPATH') OR exit('No direct script access allowed'); 
    $this->load->view("templates/header");
?>
<div class="edit">
    <h3>Product # <?= $get_data->id ?></h3>
    <form action="/listings/edit/<?=$get_data->id?>" method="post">
        <input type="hidden" name="<?=$this->security->get_csrf_token_name();?>" value="<?=$this->security->get_csrf_hash();?>" />
        <input type="hidden" name="id" value="<?=$get_data->id?>">
        <div>
            <label for="Manufacturer">Manufacturer</label>
            <select name="manufacturer" id="manufacturer">
                <option value="Jansport" <?= $get_data->manufacturer == "Jansport" ? "selected": ""?>>Jansport</option>
                <option value="Nike" <?= $get_data->manufacturer == "Nike" ? "selected": ""?>>Nike</option>
                <option value="Adidas" <?= $get_data->manufacturer == "Adidas" ? "selected": ""?>>Adidas</option>
                <option value="Casio" <?= $get_data->manufacturer == "Casio" ? "selected": ""?>>Casio</option>
                <option value="Oakley" <?= $get_data->manufacturer == "Oakley" ? "selected": ""?>>Oakley</option>
            </select>
            <span class="error"><?= form_error("manufacturer")?></span>
        </div>
        <div>
            <label for="name">Product Name</label>
            <input type="text" name="name" value="<?= $get_data->product_name?>">
            <span class="error"><?= form_error("name")?></span>
        </div>
        <div>
            <label for="name">Price ($)</label>
            <input type="number" name="price" value="<?= $get_data->price?>">
            <span class="error"><?= form_error("price")?></span>
        </div>
        <div>
            <label for="description">Description</label>
            <textarea name="description"><?= $get_data->description?></textarea>
            <span class="error"><?= form_error("description")?></span>
        </div>
        <a href="/"<?=$get_data->id?>">Go Back</a>
    </form>
</div>


<?php $this->load->view("templates/footer")?>
