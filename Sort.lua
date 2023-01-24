-- 4 Sorting Algorithms
-- Quick, Bubble, Insertion, Selection


-- Quick Sort
-- https://en.wikipedia.org/wiki/Quicksort
-- Time Complexity: Best: O(n log(n)) Average: O(n log(n)) Worst: O(n^2)
-- Space Complexity: O(log(n))
function quickSort(t, left, right, compareFn)
    if (left < right) then
        local pivot = partition(t, left, right, compareFn);

        quickSort(t, left, pivot - 1, compareFn);
        quickSort(t, pivot + 1, right, compareFn);
    end;
end

-- Bubble Sort
-- https://en.wikipedia.org/wiki/Bubble_sort
-- Time Complexity: Best: O(n) Average: O(n^2) Worst: O(n^2)
-- Space Complexity: O(1)
function bubbleSort(t, left, right, compareFn)
    for i = left, right - 1 do
        for j = left, right - i do
            if (not compareFn(t[j], t[j + 1])) then
                t[j], t[j + 1] = t[j + 1], t[j];
            end;
        end;
    end;
end

-- Insertion Sort
-- https://en.wikipedia.org/wiki/Insertion_sort
-- Time Complexity: Best: O(n) Average: O(n^2) Worst: O(n^2)
-- Space Complexity: O(1)
function insertionSort(t, left, right, compareFn)
    for i = left + 1, right do
        local key = t[i];
        local j = i - 1;

        while (j >= left and compareFn(key, t[j])) do
            t[j + 1] = t[j];
            j = j - 1;
        end;

        t[j + 1] = key;
    end;
end

-- Selection Sort
-- https://en.wikipedia.org/wiki/Selection_sort
-- Time Complexity: Best: O(n^2) Average: O(n^2) Worst: O(n^2)
-- Space Complexity: O(1)
function selectionSort(t, left, right, compareFn)
    for i = left, right do
        local minIndex = i;

        for j = i + 1, right do
            if (compareFn(t[j], t[minIndex])) then
                minIndex = j;
            end;
        end;

        t[i], t[minIndex] = t[minIndex], t[i];
    end;
end

-- Partition
-- Partition helper function to partition the array into two parts
function partition(t, left, right, compareFn)
    local pivot = t[right];
    local i = left - 1;

    for j = left, right - 1 do
        if (compareFn(t[j], pivot)) then
            i = i + 1;
            t[i], t[j] = t[j], t[i];
        end;
    end;

    t[i + 1], t[right] = t[right], t[i + 1];
    return i + 1;
end

return {
    quickSort = quickSort,
    bubbleSort = bubbleSort,
    selectionSort = selectionSort,
    insertionSort = insertionSort
}