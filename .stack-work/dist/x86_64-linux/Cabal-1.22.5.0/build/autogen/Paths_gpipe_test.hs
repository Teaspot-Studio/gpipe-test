module Paths_gpipe_test (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/lemarwin/code/gpipe-test/.stack-work/install/x86_64-linux/lts-4.0/7.10.3/bin"
libdir     = "/home/lemarwin/code/gpipe-test/.stack-work/install/x86_64-linux/lts-4.0/7.10.3/lib/x86_64-linux-ghc-7.10.3/gpipe-test-0.1.0.0-2GJvtNww2LhCvfszxtf0TF"
datadir    = "/home/lemarwin/code/gpipe-test/.stack-work/install/x86_64-linux/lts-4.0/7.10.3/share/x86_64-linux-ghc-7.10.3/gpipe-test-0.1.0.0"
libexecdir = "/home/lemarwin/code/gpipe-test/.stack-work/install/x86_64-linux/lts-4.0/7.10.3/libexec"
sysconfdir = "/home/lemarwin/code/gpipe-test/.stack-work/install/x86_64-linux/lts-4.0/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "gpipe_test_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gpipe_test_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "gpipe_test_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gpipe_test_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "gpipe_test_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
