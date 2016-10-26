#include <iostream>
#include <string.h>
#include <assert.h>

using namespace std;
template <class T>
using mapFn = T(*)(const T&);
template <class T>
struct node {
	T data;
	node<T> *left;
	node<T> *right;
	node() :left(NULL), right(NULL) {}
	node(const T d, node<T> *l, node<T> *r) :data(d), left(l), right(r) {}
};

template <class T>
class bt {
private:
	node<T> *root;
	bool addPrivate(const T& newData, const char* trace, node<T>* &subTreeRoot)//? &
	{
		if (subTreeRoot == NULL)
		{
			if (strlen(trace) == 0)//The assert computer statement is analogous to the statement make sure
			{
				subTreeRoot = new node<T>(newData, NULL, NULL);//zashto T go postavqme tam ???
				return true;//subTreeRoot sochi kum tozi new node

							/*node<T>*n = new node;
							subTreeRoot = n;
							n->data = newData;
							n->left = NULL;
							n->right = NULL;*/
			}
		}
		if (strlen(trace) > 0)
		{
		if (trace[0] == 'L')
		{
		return addPrivate(newData, trace + 1, subTreeRoot->left);
		}
		if (trace[0] == 'R')
		{
		return addPrivate(newData, trace + 1, subTreeRoot->right);
		}

		}
	}

	void printPrivate(node<T> * subTreeRoot)const
	{
		if (subTreeRoot == NULL)
		{
			return;// kakvo pravi??
		}
		if (subTreeRoot != NULL)
		{
			cout << subTreeRoot->data << " ";
			printPrivate(subTreeRoot->left);
			printPrivate(subTreeRoot->right);
		}
	}
	bool memberPrivate(const T& searchedData, node<T>*subTreeRoot)const
	{
		if (subTreeRoot == NULL)
		{
			return false;//ako stigne do kraq i nqma takuv node shte sochi kum null -> nqma takuv node
			//ili v sluchai che durvoto e prazno
		}
		else {
			if (subTreeRoot->data == searchedData)
			{
				return true;
			}
			else
			{
				return memberPrivate(searchedData, subTreeRoot->left)||memberPrivate(searchedData, subTreeRoot->right);
				// ako sa memberPrivate(searchedData, subTreeRoot->left);
				//memberPrivate(searchedData, subTreeRoot->right);ne stava
				
			}
			/*return subTreeRoot->data == searchedData || memberPrivate(searchedData, subTreeRoot->left) ||
				memberPrivate(searchedData, subTreeRoot->right);*/
		}
	}
	void deleteAll(node<T>* subTreeRoot)
	{
		if (subTreeRoot == NULL)
		{
			return;//The return statement stops execution and returns to the calling function. 
//When a return statement is executed, the function is terminated immediately at that point, regardless of whether 
			//it's in the middle of a loop, etc.
		}
		else
		{
			deleteAll(subTreeRoot->left);
			deleteAll(subTreeRoot->right);
			cout << "deleting the node containing the data " << subTreeRoot->data << endl;
			delete subTreeRoot;
		}
	}
	void mapPrivate(mapFn<T> f,node<T>*subTreeRoot)
	{
		if (subTreeRoot == NULL)
		{
			return;
		}
		else
		{
			subTreeRoot->data = f(subTreeRoot->data);
			mapPrivate(f, subTreeRoot->left);
			mapPrivate(f, subTreeRoot->right);
		}
	}
	int countPrivate(node<T>* subTreeRoot)
	{
		
		/*int count = 0;
		if (subTreeRoot != NULL)
		{
			
			count=count+ countPrivate(subTreeRoot->left);
			count=count+ countPrivate(subTreeRoot->right);//ne raboti zashtoto vseki put count-a stava raven na 0
		}
		return count;*/
		if (subTreeRoot == NULL)
		{
			return 0;
		}
		else {
			if (subTreeRoot->left == NULL&& subTreeRoot->right == NULL)
			{
				return 1;
			}
			else
			{
				return (1 + (countPrivate(subTreeRoot->left) + countPrivate(subTreeRoot->right)));
			}
		}
	}
	int countEvensPrivate(node<T>* subTreeRoot)
	{
		if (subTreeRoot == NULL)
		{
			return 0;
		}
		else
		{
			if (subTreeRoot->left == NULL&&subTreeRoot->right == NULL && (subTreeRoot->data % 2 == 0))
			{
				return 1;
			}
			else
			{
				if (subTreeRoot->data % 2 == 0)
				{
					return (1 + (countEvensPrivate(subTreeRoot->left) + countEvensPrivate(subTreeRoot->right)));
				}
				else
				{
					return  (countEvensPrivate(subTreeRoot->left) + countEvensPrivate(subTreeRoot->right));
				}
			}
		}
	}
	int countOdds(bool(*pred)(const T&),node<T>*subTreeRoot)
	{
		if (subTreeRoot == NULL)
		{
			return 0;
		}
		else
		{
			if (subTreeRoot->left == NULL&&subTreeRoot->right == NULL&& pred(subTreeRoot->data))
			{
				return 1;
			}
			else
			{
				if (pred(subTreeRoot->data))
				{
					return (1 + (countOdds(pred,subTreeRoot->left) + countOdds(pred,subTreeRoot->right)));
				}
				else
				{
					return (countOdds(pred,subTreeRoot->left) + countOdds(pred,subTreeRoot->right));
				}
			}
		}
	}
	int max(int a, int b)
	{
		if (a > b)
		{
			return a;
		}
		else
		{
			return b;
		}
	}
	int min(int a, int b)
	{
		if (a < b)
		{
			return a;
		}
		else
		{
			return b;
		}
	}
	int findHeightPrivate(node<T>*subTreeRoot)//height=max depth
	{
		if (subTreeRoot == NULL)
		{
			return 0;
		}
		else
		{
			return max(findHeightPrivate(subTreeRoot->left), findHeightPrivate(subTreeRoot->right)) + 1;
		}
	}
	int findShortestHeightPrivate(node<T>*subTreeRoot)//height=max depth
	{
		if (subTreeRoot == NULL)
		{
			return 0;
		}
		else
		{
			return min(findShortestHeightPrivate(subTreeRoot->left), findShortestHeightPrivate(subTreeRoot->right)) + 1;
		}
	}

	int findLevelPrivate(T searchedData,node<T>* subTreeRoot,int level)
	{
		if (subTreeRoot == NULL)
		{
			return 0;
		}
		else
		{
			if (subTreeRoot->data == searchedData)
			{
				return level;
			}
			else
			{
				int downLevel = findLevelPrivate(searchedData, subTreeRoot->left, level + 1);
				if (downLevel != 0)
				{
					return downLevel;
				}
				else
				{
					downLevel = findLevelPrivate(searchedData, subTreeRoot->right, level + 1);
				}
				return downLevel;
			}
		}
	}

	int countLeavesPrivate(node<T>*subTreeRoot)
	{
		if (subTreeRoot == NULL)
		{
			return 0;
		}
		else
		{
			if (subTreeRoot->left == NULL&&subTreeRoot->right == NULL)
			{
				return 1;
			}
			else
			{
				return (countLeavesPrivate(subTreeRoot->left) + countLeavesPrivate(subTreeRoot->right));
			}
		}
	}
	int maxLeafPrivate(node<T>*subTreeRoot)
	{
		if (subTreeRoot == NULL)
		{
			return -10;//tova ako vleze v max vinagi shte e po-malko ot drugoto s koeto go sravnqvame i nqma da vliqe
			//shte e po-malko t.k durvoto ni ima polojitelni stoinosti
		}
		else
		{
			if (subTreeRoot->left == NULL&&subTreeRoot->right == NULL)
			{
				return subTreeRoot->data;
			}
			else
			{
				return max(maxLeafPrivate(subTreeRoot->left), maxLeafPrivate(subTreeRoot->right));
			}
		}
	}
	T& getElementPrivate(const char*trace,node<T>* subTreeRoot)
	{
		if (strlen(trace) == 0)
		{
			return subTreeRoot->data;
		}
		else if(strlen(trace)>0)
		{
			if (trace[0] == 'L')
			{
				return getElementPrivate(trace + 1, subTreeRoot->left);
			}
			if (trace[0] == 'R')
			{
				return getElementPrivate(trace + 1, subTreeRoot->right);
			}
		}
		else//NE RABOTI
		{
			cout << "there is no node at that position" << endl;
		}
	}
	
public:
	void add(const T& newData, const char* trace)// zashto po psevdonim
	{
		addPrivate(newData, trace, root);
	//	return*this;
	}
	bt()
	{
		root = NULL;
	}
	void print()
	{
		printPrivate(root);
		cout << endl;
	}
	//checks if there is a node with the given data
	bool member(const T& searchedData)
	{
		return memberPrivate(searchedData, root);
	}
	~bt()
	{
		deleteAll(root);
	}
	void map(mapFn<T> f)
	{
		mapPrivate(f, root);
	}
	int count()
	{	
		return countPrivate(root);
	}
	int countEvens()
	{
		return countEvensPrivate(root);
	}
	
	int searchCount(bool(*pred)(const T&))
	{
		return countOdds(pred,root);
	}
	int findHeight()
	{
		return findHeightPrivate(root);
	}
	int shortestHeight()
	{
		return findShortestHeightPrivate(root);
	}
	int findLevel(T searchedData)
	{
		return findLevelPrivate(searchedData, root,1);
	}
	int countLeaves()
	{
		return countLeavesPrivate(root);
	}
	int maxLeaf()
	{
		return maxLeafPrivate(root);
	}
	T& getElement(const char*trace)
	{
		return getElementPrivate(trace, root);
	}
};
bool odd(const int& a)
	{
		if (a % 2 != 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
int plusOne(const int& i)
{
	return i + 1;
}
bool pred(int a)
{
	if (a % 2 == 0)
	{
		return true;
	}
	else
		return false;
}


int main()
{
	bt<int> t;
	t.add(10, "");
	t.add(12, "L");
	t.add(14, "R");
	t.add(15, "LR");
	t.print();
	cout << t.member(14) << endl;
	cout << endl;
	cout << "Number of nodes:"  << t.count() << endl;
	cout <<"Number of even numbers: "<< t.countEvens() << endl;
	cout << "Number of odd numbers: " <<t.searchCount(odd) << endl;
	cout << "Height of the tree: " << t.findHeight()<< endl;
	cout << "Shortest height of the tree: " << t.shortestHeight() << endl;
	cout << "This node is at level: " <<t.findLevel(14) << endl;
	cout << "Number of leaves: " << t.countLeaves() << endl;
	cout << "MaxLeaf: " <<t.maxLeaf() << endl;
	cout << "The data in this position is: " << t.getElement("L") << endl;

	t.map(plusOne);
	cout << "after mapping: ";
	t.print();
	cout << "Number of odd numbers: " << t.searchCount(odd) << endl;
	
	//TEST MEMBER

	/*char*s = "LRL";
	cout << s << endl;
	cout << (s+1)[0] << endl;
	cout << *(s + 1) << endl;
	cout << s[1] << endl;*/
	
	
	return 0;
}
