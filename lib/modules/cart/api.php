<?php
    if($type == "getProduct"){
        $products = $d->rawQuery("select * from #_product", array());
		foreach ($products as $k => $v) {
			$products[$k]['photo'] = ASSET . THUMBS."/540x540x1/" . UPLOAD_PRODUCT_L . $v['photo'];
		} 
		echo json_encode($products, JSON_NUMERIC_CHECK);
		exit();
    };
    
	if($type == "getOneProduct"){
		$id = (!empty($_GET["id"])) ? $_GET["id"] : 0;
		if($id){
			$product = $d->rawQueryOne("select * from #_product where id = ? limit 0,1", array($id));
			$gallery = $d->rawQuery("select photo from table_gallery where id_parent = ?", array($product['id']));
			$product['photo'] = ASSET . THUMBS."/540x540x1/" . UPLOAD_PRODUCT_L . $product['photo'];
			if(!empty($gallery)){
				foreach($gallery as $k => $v){
					$gallery[$k]['photo'] = ASSET . THUMBS."/540x540x1/" . UPLOAD_PRODUCT_L . $v['photo'];
				}
			}
			$product['gallery'] = $gallery;
			echo json_encode($product, JSON_NUMERIC_CHECK);
			exit();
		}else {
			echo json_encode(array());
		}
    };

	if($type == "getList"){
        $lists = $d->rawQuery("select * from #_product_list", array());
		foreach ($lists as $k => $v) {
			$lists[$k]['photo'] = ASSET . THUMBS."/540x540x1/" . UPLOAD_PRODUCT_L . $v['photo'];
		} 
		echo json_encode($lists, JSON_NUMERIC_CHECK);
		exit();
    };

	if($type == "reloadCart"){
		$listID = (!empty($_POST["listID"])) ? $_POST["listID"] : '';
		$listID = substr($listID, 1);
		$listID = substr($listID, 0, strlen($listID) - 1);
		$listID = "(".$listID.")";
        $products = $d->rawQuery("select id as productId ,regular_price as price, name$lang as name, photo from #_product where id IN $listID", array());
		foreach($products as $k => $v){
			$products[$k]['photo'] = ASSET . THUMBS."/540x540x1/" . UPLOAD_PRODUCT_L . $v['photo'];
		}
		echo json_encode($products, JSON_NUMERIC_CHECK);
		exit();
    };
  
	if($type == "saveCart"){
		$data = (!empty($_POST["listProduct"])) ? json_decode($_POST["listProduct"]) : "";
		$address = (!empty($_POST["address"])) ? $_POST["address"] : "";
		$note = (!empty($_POST["note"])) ? $_POST["note"] : "";
		if(!empty($data)){
			$totalPrice = 0;
			$listSP = array();
			foreach($data as $v){
				$temp = json_decode(json_encode($v), true);
				$sp = $cart->getProductInfo($temp['productId']);
				if(empty($sp)){
					continue;
				}
				$sp['qty'] = $temp['qty'];
				array_push($listSP, $sp);
				$totalPrice += $sp['regular_price'] * $temp['qty'];
			}
			// echo json_decode(json_encode($data[0]), true);exit();
			if($listSP){
				$order_date = time();
	
				/* lưu đơn hàng */
				$data_donhang = array();
				$data_donhang['id_user'] = (!empty($_SESSION[$loginMember]['id'])) ? $_SESSION[$loginMember]['id'] : 0;
				$data_donhang['total_price'] = $totalPrice;
				$data_donhang['date_created'] = $order_date;
				$data_donhang['address'] = $address;
				$data_donhang['notes'] = $note;
				$data_donhang['order_status'] = 1;
				$data_donhang['numb'] = 1;
				$id_insert = $d->insert('order', $data_donhang);
	
				/* lưu đơn hàng chi tiết */
				if ($id_insert) {
					foreach ($listSP as $k => $v) {
						if($v['qty'] == 0) continue;
						$data_donhangchitiet = array();
						$data_donhangchitiet['id_product'] = $v['id'];
						$data_donhangchitiet['id_order'] = $id_insert;
						$data_donhangchitiet['photo'] = $v['photo'];
						$data_donhangchitiet['name'] = $v['name' . $lang];
						$data_donhangchitiet['regular_price'] = $v['regular_price'];
						$data_donhangchitiet['sale_price'] = $v['sale_price'];
						$data_donhangchitiet['quantity'] = $v['qty'];
						$d->insert('order_detail', $data_donhangchitiet);
					}
					echo json_encode(true);exit();
				}
				echo json_encode(false);exit();
			}
			echo json_encode(false);exit();
		}
	}
?>