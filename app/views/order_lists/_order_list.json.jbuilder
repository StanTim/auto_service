json.extract! order_list, :id, :order_id, :category_id, :specialist_id, :created_at, :updated_at
json.url order_list_url(order_list, format: :json)
