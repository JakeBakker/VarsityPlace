<?php
include './config.php';       // sets up $connection
// if needed, instantiate $query here
// $query = new Query($connection);

include './includes/header.php'; // header now has access to $query
?>

if (isset($_GET['query'])) {
    $search = $query->escapeString($_GET['query']); // sanitize input
    $results = $query->executeQuery("
        SELECT * FROM products 
        WHERE product_name LIKE '%$search%' 
           OR description LIKE '%$search%'
    ");
}
?>

<section class="product spad">
    <div class="container">
        <h2>Search Results for "<?php echo htmlspecialchars($search); ?>"</h2>
        <div class="row">
            <?php if (!empty($results) && $results->num_rows > 0): ?>
                <?php while ($row = $results->fetch_assoc()): ?>
                    <div class="col-lg-4 col-md-6">
                        <div class="product__item">
                            <h5><?php echo $row['product_name']; ?></h5>
                            <p>R<?php echo $row['price_current']; ?></p>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <p>No products found.</p>
            <?php endif; ?>
        </div>
    </div>
</section>