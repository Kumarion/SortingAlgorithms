local Sort = require(game:GetService("ReplicatedStorage").Sort);

local function compareFn(a, b)
    return a < b;
end

local function BubbleSortTest()
    local Start = os.clock();
    print("Bubble Sort");
    local bubbleTable = { 5, 2, 4, 6, 1, 3 };
    Sort.bubbleSort(bubbleTable, 1, #bubbleTable, compareFn);
    print(bubbleTable);
    print("Time taken Bubble Sort: " .. os.clock() - Start);
end

local function InsertionSortTest()
    local Start = os.clock();
    print("Insertion Sort");
    local insertionTable = { 5, 2, 4, 6, 1, 3 };
    Sort.insertionSort(insertionTable, 1, #insertionTable, compareFn);
    print(insertionTable);
    print("Time taken Insertion Sort: " .. os.clock() - Start);
end

local function SelectionSortTest()
    local Start = os.clock();
    print("Selection Sort");
    local selectionTable = { 5, 2, 4, 6, 1, 3 };
    Sort.selectionSort(selectionTable, 1, #selectionTable, compareFn);
    print(selectionTable);
    print("Time taken Selection Sort: " .. os.clock() - Start);
end

local function QuickSortTest()
    local Start = os.clock();
    print("Quick Sort");
    local quickTable = { 5, 2, 4, 6, 1, 3 };
    Sort.quickSort(quickTable, 1, #quickTable, compareFn);
    print(quickTable);
    print("Time taken Quick Sort: " .. os.clock() - Start);
end

local function RegularSort()
    local Start = os.clock();
    print("Regular Sort");
    local regularTable = { 5, 2, 4, 6, 1, 3 };
    table.sort(regularTable, compareFn);
    print(regularTable);
    print("Time taken Regular Sort: " .. os.clock() - Start);
end

-- Start the tests in parallel
task.spawn(BubbleSortTest);
task.spawn(InsertionSortTest);
task.spawn(SelectionSortTest);
task.spawn(QuickSortTest);
task.spawn(RegularSort);

-- Output:
-- Bubble Sort (1, 2, 3, 4, 5, 6)
-- Insertion Sort (1, 2, 3, 4, 5, 6)
-- Selection Sort (1, 2, 3, 4, 5, 6)
-- Quick Sort (1, 2, 3, 4, 5, 6)
-- Regular Sort (1, 2, 3, 4, 5, 6)