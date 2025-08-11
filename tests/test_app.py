import unittest
import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app import app

class TestQuizApp(unittest.TestCase):
    
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True
    
    def test_home_redirect(self):
        """Test home page redirects to login"""
        response = self.app.get('/')
        self.assertEqual(response.status_code, 302)
    
    def test_login_page(self):
        """Test login page loads"""
        response = self.app.get('/login')
        self.assertEqual(response.status_code, 200)
    
    def test_register_page(self):
        """Test register page loads"""
        response = self.app.get('/register')
        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()