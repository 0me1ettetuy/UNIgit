#include "set.h"

size_t hash(const std::string& s){
    size_t hash = 0;

    for ( auto i : s){
        hash = std::tolower(i) + (hash * 31);
    }
    return hash;
}

bool equal(const std::string& s1, const std::string& s2){
    if (s1.length() == s2.length()){
        for (size_t i = 0; i < s1.length(); i++){
            if (tolower(s1[i]) != tolower(s2[i])){
                return false;
            }
        }
        return true;
    }
    return false;
}

bool set::insert(std::string val){
    size_t id = hash(val) % bucket_array_size;

    for(auto i : bucket_array[id]){
        if (equal(val, i)){
            return false;
        }
    }

    bucket_array[id].push_back(val);
    set_size++;

    if(loadfactor() > max_load_factor || standarddev() > 1.5){
        std::list<std::string>* oldbuck = bucket_array;
        size_t newbucksize = bucket_array_size * 2;
        std::list<std::string>* newbuck = new std::list<std::string>[newbucksize];
        for (size_t j = 0; j < bucket_array_size; j++){
            for(auto k : bucket_array[j]){
                newbuck[hash(k) % newbucksize].push_back(k);
            }
            bucket_array[j].clear();
        }
        delete[] oldbuck;
        bucket_array = newbuck;
        bucket_array_size = newbucksize;
    }

    return true;

}

set::set(const set& s) :
		bucket_array(new std::list<std::string>[s.bucketcount()]),
		bucket_array_size(s.bucketcount()),
		set_size(0){
        for (size_t i = 0; i < s.bucketcount(); i++){
            for (auto j : s.bucket_array[i]){
                insert(j);
            }
        }
}

set::set(std::initializer_list<std::string> ilist):
		bucket_array(new std::list<std::string>[4]),
		bucket_array_size(4),
		set_size(0){
        for (auto i : ilist){
            insert(i);
        }
}

set& set::operator=(const set& s){
    if (this == &s) {
        return *this;
    }
    clear();
    bucket_array_size = s.bucketcount();
    bucket_array = new std::list<std::string>[bucket_array_size];
    for (size_t i = 0; i < bucket_array_size; i++){
        for (auto j : s.bucket_array[i]){
            insert(j);
        }
    }
    return *this;
}

void set::clear(){
    for (size_t i = 0; i < bucket_array_size; i++){
        bucket_array[i].clear();
    }
    delete[] bucket_array;
    bucket_array = new std::list<std::string>[4];
    bucket_array_size = 4;
    set_size = 0;
}

bool set::contains(std::string val) const{
    size_t id = hash(val) % bucket_array_size;
    for(auto i : bucket_array[id]){
        if(equal(val, i)){
            return true;
        }
    }
    return false;
}

bool set::remove(std::string val){
    size_t id = hash(val) % bucket_array_size;
    for(auto i : bucket_array[id]){
        if(equal(val, i)){
            bucket_array[id].remove(i);
            set_size--;
            return true;
        }
    }
    return false;
}

size_t set::size() const{
    return set_size;
}

bool set::empty() const{
    return set_size == 0;
}

set::~set(){
    clear();
}