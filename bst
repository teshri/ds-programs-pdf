/**Write a program to implement Binary Search Tree which supports the following
operations:
(i) Insert an element x
(ii) Delete an element x
(iii) Search for an element x in the BST and change its value to y and then place the
node with value y at its appropriate position in the BST
(iv) Display the elements of the BST in preorder, inorder, and postorder traversal
(v) Display the elements of the BST in level-by-level traversal
(vi) Display the height of the BST

*/



#include <iostream>
using namespace std;
struct node
{
    int data;
    node *right;
    node *left;
};

class binarysearchtree
{
    node *root = NULL;

public:
    int insertion(int data)
    {
        node *temp = new node();
        node *parent = root;
        temp->data = data;
        temp->left = NULL;
        if (root == NULL)
        {
            temp->right = NULL;
            root = temp;
        }
        else
        {
            while (temp != NULL)
            {
                if (data < parent->data) 
                {
                    if (parent->left == NULL) 
                      
                        {
                            temp->right = NULL;
                            parent->left = temp;
                            break;
                        }
                    parent = parent->left;
                }
                else if (data > parent->data)
                {
                    if (parent->right == NULL)
                    {
                        temp->right = NULL;
                        parent->right = temp;
                        break;
                    }
                    parent = parent->right;
                }
                else
                {
                    cout << "copy elemt found\n";
                    return 0;
                }
            }
        }
        return 0;
    }
    node *rinsertiion(node *parent, node *temp)
    {
        if (parent == NULL)
        {
            temp->right = NULL;
            root = temp;
            return 0;
        }
        else if (temp->data < parent->data) 
            {
                if (parent->left == NULL) 
                   // temp
                    {
                        temp->right = NULL;
                        parent->left = temp;
                        return 0;
                    }
                parent = parent->left;
            }
        else if (temp->data > parent->data)
        {
            if (parent->right == NULL)
            {
                temp->right = NULL;
                parent->right = temp;
                return 0;
            }
            parent = parent->right;
        }
        else
        {
            cout << "copy elemt found\n";
            return 0;
        }
        return rinsertiion(parent, temp);
    }
    node *search(int data)
    {
        node *parent = root;
        if (parent == NULL)
        {
            cout << "NO\n";
            return NULL;
        }
        while (parent != NULL)
        {
            if (data < parent->data) 
            {
                if (parent->left == NULL) 
                    
                    {
                        cout << "NO\n";
                        return NULL;
                    }
                parent = parent->left;
            }
            else if (data > parent->data)
            {
                if (parent->right == NULL)
                {
                    cout << "NO\n";
                    return NULL;
                }
                parent = parent->right;
            }
            else
            {
                cout << "copy elemt found\n";
                break;
            }
        }
        return parent;
    }
    int remove(int data)
    {
        node *parent = search(data);
        node *actualdelete = parent;
        int min = 0;
        if (parent == NULL)
        {
            cout << "NOt exist\n";
        }
        else
        {
            if (parent->left == NULL && parent->right == NULL)
            {
                delete parent;
            }
            else if (parent->left != NULL)
            {
                parent = parent->left;
                int i = 0, min = 0;
                node *parentback;
                do
                {
                    if (i != 0)
                    {
                        parentback = parent;
                    }
                    min = parent->data;
                    i++;
                } while (parent->right != NULL && (parent = parent->right));
                if (parent->left != NULL)
                {
                    parentback->right = parent->left;
                }
                delete parent;
                actualdelete->data = min;
            }
            else if (parent->left == NULL && parent->right != NULL)
            {
                parent = parent->right;
                do
                {
                    min = parent->data;
                } while (parent->left != NULL && (parent = parent->left));
                delete parent;
                actualdelete->data = min;
            }
        }
        return 0;
    }
    void displayheight()
    {
        cout << height(root) << endl;
    }
    int height(node *temp)
    {
        if (temp == NULL)
        {
            return -1;
        }
        else
        {
            int ldepth = height(temp->left);
            int rdepth = height(temp->right);

            if (ldepth > rdepth)
                return (ldepth + 1);
            else
                return (rdepth + 1);
        }
        return 0;
    }
    void displaylevelbylevel()
    {
        node *temp = root;
        int h = height(temp);
        for (int i = 1; i < h; i++)
        {
            printcurrentlevel(temp, i);
        }
    }
    void printcurrentlevel(node *temp, int h)
    {
        if (root == NULL)
        {
            return;
        }
        if (h == 1)
        {
            cout << root->data << " ";
        }
        else if (h > 1)
        {
            printcurrentlevel(temp->left, h - 1);
            printcurrentlevel(temp->right, h - 1);
        }
    }
    void displayinorder()
    {
        printinorder(root);
    }
    void printinorder(node *temp)
    {
        if (temp == NULL)
        {
            return;
        }
        printinorder(temp->left);
        cout << temp->data << " ";
        printinorder(temp->right);
    }
    void displaypreorder()
    {
        printpreorder(root);
    }
    void printpreorder(node *temp)
    {
        if (temp == NULL)
        {
            return;
        }
        cout << temp->data << " ";
        printpreorder(temp->left);
        printpreorder(temp->right);
    }
    void displaypostorder()
    {
        printpostorder(root);
    }
    void printpostorder(node *temp)
    {
        if (temp == NULL)
        {
            return;
        }
        printpostorder(temp->left);
        printpostorder(temp->right);
        cout << temp->data << " ";
    }
};
int main()
{
    binarysearchtree *obj = new binarysearchtree();
    int n, i = 1;
    int num, posi;
    while (i > 0)
    {
        cout << "enter case number\n 1.insertion 2.search 3.remove 4.height 5.dispaly\n";
        cin >> n;
        switch (n)
        {
        case 1:
            cout << "enter elemt\n";
            cin >> num;
            obj->insertion(num);
            break;
        case 2:
            cout << "enter search element\n";
            cin >> num;
            obj->search(num);
            break;
        case 3:
            cout << "enter remove elemnt\n";
            cin >> num;
            obj->remove(num);
            break;
        case 4:
            cout << "height of tree";
            obj->displayheight();
            break;
        case 5:
            cout << "output\n";
            obj->displaylevelbylevel();
            break;
        case 6:
            cout << "inorder\n";
            obj->displayinorder();
            cout << "preorder\n";
            obj->displaypreorder();
            cout << "postorder\n";
            obj->displaypostorder();
        }
    }
}
