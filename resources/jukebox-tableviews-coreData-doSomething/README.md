---
  tags: intermediate, coredata
  languages: objc
---

Jukebox-TableViews-CoreData
=========

Add all of those songs every time is really annoying. Let's just add them once in Core Data!

## Set Up Core Data

  1. Add an `.xcdatamodeld` file
  2. In your `AppDelegate` add two new methods, be sure to replace the name of your `xcdatamodeld`:

  ```
  - (NSURL*)storeURL
  {
      NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];
      return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
  }

  - (NSURL*)modelURL
  {
      return [[NSBundle mainBundle] URLForResource:@"<ENTER THE NAME OF YOUR XCDATAMODELD>" withExtension:@"momd"];
  }
  ```
  3. Create a new class called `FISCoreDataStack` with the following private properties:

  ```
  @property (nonatomic,strong) NSURL* modelURL;
  @property (nonatomic,strong) NSURL* storeURL;
  @property (nonatomic,strong,readwrite) NSManagedObjectContext* managedObjectContext;
  ```

  4. Add a single public property that contains the `NSManagedObjectContext`

  ```
  @property (nonatomic,strong,readonly) NSManagedObjectContext* managedObjectContext;
  ```

  5. Add in the `NSManagedObjectContext` getter method:

  ```
  - (void)setupManagedObjectContext
  {
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSError* error;
    [self.managedObjectContext.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:self.storeURL options:nil error:&error];
    if (error) {
      NSLog(@"error: %@", error);
    }
    self.managedObjectContext.undoManager = [[NSUndoManager alloc] init];
  }

  - (NSManagedObjectModel*)managedObjectModel
  {
      return [[NSManagedObjectModel alloc] initWithContentsOfURL:self.modelURL];
  }
  ```

  6. Create a custom initalizer for our class:

  ```
  - (id)initWithStoreURL:(NSURL*)storeURL modelURL:(NSURL*)modelURL
  {
      self = [super init];
      if (self) {
          _storeURL = storeURL;
          _modelURL = modelURL;
          [self setupManagedObjectContext];
      }
      return self;
  }
  ```

  7. In `didFinishLaunchingWithOptions` grab the `rootViewController` of the `UINavigationController` and pass it your `NSManagedObjectContext`

  ```
  UINavigationController* navigationController = (UINavigationController*) self.window.rootViewController;
  ItemViewController* rootViewController = (ItemViewController*)navigationController.topViewController;
  FISCoreDataStack *coreDataStack = [[FISCoreDataStack alloc] initWithStoreURL:[self storeURL] modelURL:[self modelURL]];
  rootViewController.managedObjectContext = coreDataStack.managedObjectContext;
  ```

## Set Up The Models

  1. With your `xcdatamodeld` go ahead and set up the core data versions of the existing models.
  2. Create the NSManagedObject subclasses
  3. Add a category on your subclasses to add an object creator

## Convert the ViewControllers

  1. Create a `generateTestData` method that adds some test data to CoreData
  2. Fetch from core data on `viewDidLoad`
  3. Modify your code to use the CoreData models...amazingly there shouldn't be much different!
