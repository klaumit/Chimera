using System;
using System.IO;

namespace ComPatcher
{
	internal static class Program
	{
		private static void Main(string[] args)
		{
			string root = Environment.CurrentDirectory;
			if (args.Length == 1) {
				root = args[0];
			}
			Console.WriteLine("Root = " + root);
			
			string appDir=Path.GetDirectoryName(typeof(Program).Assembly.Location);
			Console.WriteLine("From = " + appDir);
			
			string[] binFiles = Directory.GetFiles(root, "*.bin");
			foreach (string file in binFiles) 
			{
				Console.WriteLine(" * "+file);
				string binNewFile = file.Replace(".bin", ".com");
								
				byte[] bytes = File.ReadAllBytes(file);
				using (Stream fStream = File.Create(binNewFile))
				{
					fStream.Write(bytes, 0, bytes.Length-1);
					string patchFile = Path.Combine(appDir, "x86suffix.dat");
					byte[] patch = File.ReadAllBytes(patchFile);
					fStream.Write(patch, 0, patch.Length);
					fStream.Write(bytes, bytes.Length-1, 1);
					fStream.Flush();
				}		
				Console.WriteLine("    --> "+binNewFile);
			}
			
			string[] txtFiles = Directory.GetFiles(root, "*.txt");
			foreach (string file in txtFiles)
			{
				Console.WriteLine(" * "+file);
				string txtNewFile = file.Replace(".txt", ".com");
				
				string[] lines = File.ReadAllLines(file);
				using (Stream fStream = File.Create(txtNewFile))
				{
					foreach (string line in lines) 
					{						
						if (!line.StartsWith("    0"))
							continue;
						string text = line.Trim();
						string[] parts = text.Split(' ');
						if (parts.Length < 3)
							continue;
						string first = parts[0];
						string second = parts[1];
						if (first.Length == 8 && second.Length == 4)
						{
							string bt1 = second.Substring(0,2);
							string bt2 = second.Substring(2,2);
							if (!(bt1.Length == 2 && bt2.Length == 2))
								continue;
							byte bb1 = Convert.ToByte(bt1, 16);
							byte bb2 = Convert.ToByte(bt2, 16);
							byte[] bbs = new byte[] { bb1, bb2 };
							fStream.Write(bbs, 0, bbs.Length);
							continue;
						}
						if (first.Length == 8 && second.Length == 10)
						{
							second = second.Trim('<','>');
							string bt1 = second.Substring(0,2);
							string bt2 = second.Substring(2,2);
							string bt3 = second.Substring(4,2);
							string bt4 = second.Substring(6,2);
							byte bb1 = Convert.ToByte(bt1, 16);
							byte bb2 = Convert.ToByte(bt2, 16);
							byte bb3 = Convert.ToByte(bt1, 16);
							byte bb4 = Convert.ToByte(bt2, 16);
							byte[] bbs = new byte[] { bb1, bb2, bb3, bb4 };
							fStream.Write(bbs, 0, bbs.Length);
							continue;
						}
					}
					fStream.Flush();
				}				
				Console.WriteLine("    --> "+txtNewFile);
			}
			
			Console.Write("Done.");
			Console.ReadKey(true);
		}
	}
}
