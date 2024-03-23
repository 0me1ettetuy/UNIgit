#include "set.h"




void deallocatenodes(treenode* node){
    if (node != nullptr) {
			if (node->left != nullptr) {
				deallocatenodes(node->left);
			}
			if (node->right != nullptr) {
				deallocatenodes(node->right);
			}
            delete node;
		}
}

treenode* copynodes(treenode* original){
    treenode* rt;
        if (original != nullptr) {
            rt = new treenode(original->value);
			if (original->left != nullptr) {
				rt->left = copynodes(original->left);
			}
			if (original->right != nullptr) {
				rt->right = copynodes(original->right);
			}
		}else{
            return nullptr;
        }
        return rt;
}

bool set::contains(int i) const {
    if (root == nullptr) {
        return false;
    }

    treenode* buf = root;

    while (buf != nullptr) {
        if (buf->value == i) {
            return true;
        }
        if (i < buf->value) {
            buf = buf->left;
        } else {
            buf = buf->right;
        }
    }

    return false;
}

bool set::insert(int i){
    if(contains(i)){
        return false;
    }
    if(root == nullptr){
        root = new treenode(i);
        set_size++;
        return true;
    }
    treenode* buf = root;
    while(true){
        if(i < buf->value){
            if (buf->left == nullptr){
                break;
            }
            buf = buf->left;
        }
        if(i > buf->value){
            if (buf->right == nullptr){
                break;
            }
            buf = buf->right;
        }
    }
    treenode* rt = new treenode(i);
    if(i < buf->value){
        buf->left = rt;
    }else{
        buf->right = rt;
    }
    set_size++;
    return true;
}

void set::clear(){
    deallocatenodes(root);
    set_size = 0;
    root = nullptr;
}

size_t set::size() const{
    return set_size;
}

bool set::empty() const{
    return set_size == 0;
}