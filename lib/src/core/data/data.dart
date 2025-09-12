final user = {
  "token": "mocked_jwt_token_123456",
  "user": {"id": "1", "username": "test_user", "name": "Test User"},
};

final patients = [
  {
    "id": "1",
    "name": "John Doe",
    "executive": "Dr. Sharma",
    "payment": "Cash",
    "phone": "9876543210",
    "address": "123, Green Street, Mumbai",
    "total_amount": 5000.0,
    "discount_amount": 500.0,
    "advance_amount": 2000.0,
    "balance_amount": 2500.0,
    "date_nd_time": "01/02/2024-10:24 AM",
    "male": [1, 2],
    "female": [],
    "branch": "1",
    "treatments": [1, 2],
  },
  {
    "id": "2",
    "name": "Jane Smith",
    "executive": "Dr. Kapoor",
    "payment": "Card",
    "phone": "9123456780",
    "address": "45, Rose Avenue, Delhi",
    "total_amount": 4000.0,
    "discount_amount": 400.0,
    "advance_amount": 1000.0,
    "balance_amount": 2600.0,
    "date_nd_time": "02/02/2024-11:15 AM",
    "male": [],
    "female": [3, 4],
    "branch": "2",
    "treatments": [3, 4],
  },
];

final branches = [
  {"id": "1", "name": "Mumbai Branch"},
  {"id": "2", "name": "Delhi Branch"},
  {"id": "3", "name": "Bangalore Branch"},
];

final treatments = [
  {"id": 1, "name": "Massage Therapy", "gender": "male"},
  {"id": 2, "name": "Herbal Treatment", "gender": "male"},
  {"id": 3, "name": "Facial Treatment", "gender": "female"},
  {"id": 4, "name": "Aromatherapy", "gender": "female"},
  {"id": 5, "name": "Yoga Therapy", "gender": "both"},
];
