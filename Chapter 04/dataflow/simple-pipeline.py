import apache_beam as beam

def main():
    p = beam.Pipeline()
    (p | 'Read from text file' >> beam.io.ReadFromText('input.txt')
     | 'Convert to uppercase' >> beam.Map(lambda x: x.upper())
     | 'Write to text file' >> beam.io.WriteToText('output.txt'))
    p.run()

if __name__ == '__main__':
    main()
