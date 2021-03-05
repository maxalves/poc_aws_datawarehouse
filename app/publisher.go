package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/credentials"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/kinesis"

	"github.com/joho/godotenv"
)

var (
	producer AWSKinesis
)

type AWSKinesis struct {
	stream          string
	region          string
	endpoint        string
	accessKeyID     string
	secretAccessKey string
	sessionToken    string
}

func init() {
	e := godotenv.Load()
	if e != nil {
		fmt.Print(e)
	}

	/*
		Para pegar credenciais válidas devemos usar a CLI da AWS ->
		aws sts get-session-token \
			--duration-seconds 900 \
			--serial-number "YourMFADeviceSerialNumber" \
			--token-code 123456

		https://docs.aws.amazon.com/cli/latest/reference/sts/get-session-token.html
	 */
	producer = AWSKinesis{
		stream:          os.Getenv("KINESIS_STREAM_NAME"),
		region:          os.Getenv("KINESIS_REGION"),
		endpoint:        os.Getenv("AWS_ENDPOINT"),
		accessKeyID:     os.Getenv("AWS_ACCESS_KEY_ID"),
		secretAccessKey: os.Getenv("AWS_SECRET_ACCESS_KEY"),
		sessionToken:    os.Getenv("AWS_SESSION_TOKEN"),
	}
}

func main() {
	s := session.New(&aws.Config{
		Region:      aws.String(producer.region),
		Endpoint:    aws.String(producer.endpoint),
		Credentials: credentials.NewStaticCredentials(producer.accessKeyID, producer.secretAccessKey, producer.sessionToken),
	})
	kc := kinesis.New(s)
	streamName := aws.String(producer.stream)
	_, err := kc.DescribeStream(&kinesis.DescribeStreamInput{StreamName: streamName})

	if err != nil {
		log.Panic(err)
	}

	data := loadTestFile()

	// TODO: Entender melhor estratégia de particionamento
	putOutput, err := kc.PutRecord(&kinesis.PutRecordInput{
		Data:         []byte(data),
		StreamName:   streamName,
		PartitionKey: aws.String("key1"),
	})
	if err != nil {
		panic(err)
	}
	fmt.Printf("%v\n", *putOutput)
}

func loadTestFile() string {
	jsonFile, err := os.Open("data.json")
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println("Successfully Opened data.json")
	defer jsonFile.Close()

	byteValue, _ := ioutil.ReadAll(jsonFile)

	return string(byteValue)
}