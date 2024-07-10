//
//  main.swift
//  cgcertmgr
//
//  Created by Alfred Eisenberg on 7/9/24.
//

import Foundation
import Security
import OpenSSL

// Example usage
let pemCertificate = """
 -----BEGIN CERTIFICATE-----
 MIIEJjCCAw6gAwIBAgIQZwBinnGe0eANbPsdiAW1WDANBgkqhkiG9w0BAQsFADBM
 MQswCQYDVQQGEwJVUzEMMAoGA1UECgwDUFlBMS8wLQYDVQQDDCZCbHVlQXJtb3It
 UG9ydGFibGUgU3ViIENBIHY0LjAgZm9yIFRBQzAeFw0yNDA2MjcxNDE2NTRaFw0y
 NTA2MjcxNDE2NTRaMGUxCzAJBgNVBAYTAlVTMQswCQYDVQQIDAJOSDESMBAGA1UE
 CgwJSW52aXNpbmV0MQwwCgYDVQQLDANlcGMxJzAlBgNVBAMMHnRlc3RkZWxldGVq
 dW5lMjcuaW52aXNpbmV0LmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
 ggEBANHiYbDqNFSAgkUD4EIZ15HS24wFV9n7EZ5qYczOd/pKO5CqWbnlab0i8/KK
 FU8j4DxD1rKrkymFLB3uUMO2qIRAodSdSZlwOq9oRjCiqBsHfHz88dEouArh5pAz
 qBFzkBIcTESVd5Vi+j1vc2XU4CraANhQ7XamjsLjlcju6lGexxASBdyGMhe3ob7b
 cWYVtQmrp9OO2Y08hbCcxLzV2SMj6OT3J6pSN7phPhzAjF/bgJ9HHYvvDiYTl6SR
 QmOaueR0npl45RvPPo2C+W2MBRr0bIoznXqXNxMdwzgfQjXBDN0jq4qNX5TWLVMj
 tQIdg6jRdewJXx2Vqhec8eolfI0CAwEAAaOB6jCB5zAJBgNVHRMEAjAAMAsGA1Ud
 DwQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwbgYDVR0RBGcw
 ZYIedGVzdGRlbGV0ZWp1bmUyNy5pbnZpc2luZXQuY29thkNibHVlYXJtb3I6Ly90
 ZXN0ZGVsZXRlanVuZTI3LmludmlzaW5ldC5jb20vQWdlbnQvaWRlbnRpdHlBY3Rp
 dmF0aW9uMB0GA1UdDgQWBBQP1+OCUAgsPoK5+jBIrOpyVGPzRzAfBgNVHSMEGDAW
 gBSJWYXB8Kj3AXsnSvieggSaDrdyOzANBgkqhkiG9w0BAQsFAAOCAQEAuJql/GlA
 RK+nAHPJqgRc4aaMeVEL/kn4taOpSL5UyagTrDWawgXnRVAt+s0i/evbjqUK3n/T
 XbW5xS1W6IN67xwm5BARNEPOow8GhvniWZLDvHIkA/Mth51RH+uGLB2PAvP3pKP8
 f81Pp1rc093xAvqx4lnwIoT15FjN6o+sLGhKdEUJr75UGvQxo2FLSq2XEnWMaK64
 u/HD6OwVCQZkY0i+8t1Zy7RsPpsXWXFNyjdVSgdM7+/RSwNtdNEiB61o2XsqmNSu
 kQLwXMrgilZ/5VFnvXkbTG0DFQyOpsMA6eByKNBLOgWhN8ZtOreqORe7FsE0GAsu
 A76X5eeqmTS4Pw==
 -----END CERTIFICATE-----
 """
	
let pemKey = """
-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDR4mGw6jRUgIJF
A+BCGdeR0tuMBVfZ+xGeamHMznf6SjuQqlm55Wm9IvPyihVPI+A8Q9ayq5MphSwd
7lDDtqiEQKHUnUmZcDqvaEYwoqgbB3x8/PHRKLgK4eaQM6gRc5ASHExElXeVYvo9
b3Nl1OAq2gDYUO12po7C45XI7upRnscQEgXchjIXt6G+23FmFbUJq6fTjtmNPIWw
nMS81dkjI+jk9yeqUje6YT4cwIxf24CfRx2L7w4mE5ekkUJjmrnkdJ6ZeOUbzz6N
gvltjAUa9GyKM516lzcTHcM4H0I1wQzdI6uKjV+U1i1TI7UCHYOo0XXsCV8dlaoX
nPHqJXyNAgMBAAECggEAASQSJGBNiwUM0Du6aRmTXKlRBLSVuutct+f7op2ftNZY
9wsaBELtPXg2a8PY5E59Xk5/GQcKPIBLElmUik/QoDFqv8lgGEuuIfx23zZPJCB5
CoPke57VS0fZlUCWogunBZYuSvQmC4OXeSSFM9FBq7H2LbbY55t1rLUIgCheUTXB
eSmAr4DndIDqGrZxwCbAX8vei6x+kj3if7a5Fn6+0lMK431hAz+LOSuK+M++AgCq
UM8QfUekmDtIkc3k3bu6Z75MOpdjDea0QyKd3RInXdEX5QlG9Zjg2hZiec2/1nvS
104jA6dVNsg8hostwFIIa+kyhf4dNm4+ttANEcTc0QKBgQDwr/VFR1sQ3GkHLG5t
oO+bRzJ31LlWoPPM1J9jcKQw2I7o9EHndGM5PwmYKcGuJo9tqXtg5U67lBYJvwEI
dJYvsCIKOSxxyzqjjI+Rs/W+DX4/EF/GNeAp+wgInsEjw7SoUuxZcL/qmpDdGmlD
0W0ik3RZKWfSHz8F9C49wEg1nQKBgQDfPL0b1wkGtb3ooMNFz+0iKzamtmgb0HhV
+0TX45QOpCUa3UsTkPmdI018YBGAc2ELQPmxQ+dfxlsdX5JCdx+/OKr8pv9GvAEs
/oXR8UQLEilQxg4M5OYn4usbS2rzs4EcaHU/7VwDiU6dFvyzTTqJAYRSsrkd8C03
xL8XdYunsQKBgB9sGW1N/4mX/O4+0rvlQuLWzLPwRbIVmT6ok5Z74jOuUhn/qYr6
GuoiXLJM4UhHKHp8oerohPrgPnBPS2c7MVBQgmErTa4dhi5L74JqKC8Du/Onw5kw
928DouzdLQHqTu+aw9h5a9TJERiMlimQcdsNvSbWzQMVqTixxEezjrnRAoGACFsI
pQMedl7VFeD2jiVjNdUyPXk0Wl4qMuWtxPrirs2cCe5gggH6JdSNcOtTnGA1MKuk
7OqivWX6QRYzrkMxMAIZ/Ezv3yDoVlvMfHgwWM28OCbBnd/vcWy/6gyfmzGL0pli
Uhs7R3KbO6wBl2B7oWcqIcJIxYMY3i6CDIm8yXECgYA77h4+nvmVesgYTNcEs279
X/KXKjrPttWJXpGs8SjoTO7I3pQe8mMlm8eCBWCxwNrUSrk0GWhz8UZWBpjlnE9/
SNkWF/BPI6rvT/EuNw+czeIBzGE+3fyvF2wIsXJ82KSpZ9LAKzzSO8hze2JbfNXs
S8PypMwjZDMS7p+uemTpfg==
-----END PRIVATE KEY-----
"""

enum MyError: Error {
	case invalidPEM(String) // Example case with associated value
	case pemConversion(String)
}

func getPrivateKeyDerFromPem(pemString: String) -> (Data?, Error?) {
	guard !pemString.isEmpty else {
		return (nil, MyError.invalidPEM("Null PEM") )
	}
	
	// Initialize OpenSSL library
	SSL_library_init()
	SSL_load_error_strings()
	OpenSSL_add_all_algorithms()
	
	// Convert PEM string to a BIO
	guard let bio = BIO_new(BIO_s_mem()) else {
		return (nil, MyError.pemConversion("Memory Allocation failed"))
	}
	// Free the BIO
	defer { BIO_free(bio) }

	guard let pemData = pemString.data(using: .utf8) else {
		return (nil, MyError.pemConversion("Failed to convert PEM string to data"))
	}
	
	let pemBytes = [UInt8](pemData)
	if BIO_write(bio, pemBytes, Int32(pemBytes.count)) <= 0 {
		return (nil, MyError.pemConversion("\(#function): Failure writing data (length: \(pemData.count))"))
	}
	
	// Read private key from BIO
	guard let privateKey = PEM_read_bio_PrivateKey(bio, nil, nil, nil) else {
		return (nil, MyError.pemConversion("Could not read PrivateKey from pem"))
	}
	
	// privateKey is an EVP_PKEY
	
	// Get the key data from EVP_PKEY
	var keyData: UnsafeMutablePointer<UInt8>?
	let keyLength = i2d_PrivateKey(privateKey, &keyData)
	defer { free(keyData) } // Free the key data

	// Check for errors
	guard keyLength > 0 else {
		return (nil, MyError.pemConversion("Invalid Key Length"))
	}
	
	// Create a Data object from the key data
	let data = Data(bytes: keyData!, count: Int(keyLength))
	
	return (data, nil)
}


func convertPEMToSecCertificate(_ pemContent: String) -> SecCertificate? {
	guard let data = extractPEMSection(pemContent: pemContent, section: "CERTIFICATE") else { return nil }
	return SecCertificateCreateWithData(nil, data as CFData)
}

func convertPEMToSecKey(_ pemContent: String) -> SecKey? {
//	guard let data = extractPEMSection(pemContent: pemContent, section: "PRIVATE KEY") else { return nil }
	let (data, err) = getPrivateKeyDerFromPem(pemString: pemContent)
	guard let data = data else { return nil }
	return createPrivateKey(from: data)
}

func extractPEMSection(pemContent: String, section: String) -> Data? {
	let startMarker = "-----BEGIN \(section)-----"
	let endMarker = "-----END \(section)-----"

	guard let startRange = pemContent.range(of: startMarker),
		  let endRange = pemContent.range(of: endMarker) else {
		print("Markers not found")
		return nil
	}

	var base64Content = pemContent[startRange.upperBound..<endRange.lowerBound]
		.trimmingCharacters(in: .whitespacesAndNewlines)
	
	base64Content = base64Content.replacingOccurrences(of: "\n", with: "")
	base64Content = base64Content.replacingOccurrences(of: "\r", with: "")

	print("Extracted base64 content: \(base64Content)")

	guard let data = Data(base64Encoded: base64Content) else {
		print("Failed to decode base64")
		return nil
	}

	return data
}

func createPrivateKey(from data: Data) -> SecKey? {
	let optionsX: [NSString: Any] = [
		kSecAttrKeyType: kSecAttrKeyTypeRSA,
		kSecAttrKeyClass: kSecAttrKeyClassPrivate
	]
	// FROM IAC
	let options: [NSString: Any] = [
		kSecAttrKeyType: kSecAttrKeyTypeRSA,
		kSecAttrKeyClass: kSecAttrKeyClassPrivate,
		kSecAttrKeySizeInBits: 2048,
	]

	return SecKeyCreateWithData(data as CFData, optionsX as CFDictionary, nil)
}

func addCertificateToKeychain(certificate: SecCertificate, label: String) -> Bool {
	let addQuery: [NSString: Any] = [
		kSecClass: kSecClassCertificate,
		kSecAttrLabel: label,
		kSecAttrApplicationTag: label,
		kSecValueRef: certificate
	]

	let status = SecItemAdd(addQuery as CFDictionary, nil)
	if status != errSecSuccess {
		print(SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error")
	}
	return status == errSecSuccess
}

func addPrivateKeyToKeychain(privateKey: SecKey, label: String) -> Bool {
	let addQuery: [NSString: Any] = [
		kSecClass: kSecClassKey,
		kSecAttrKeyClass: kSecAttrKeyClassPrivate,
		kSecAttrLabel: label,
		kSecAttrApplicationTag: label,
		kSecValueRef: privateKey
	]
	// from IAC
	let keyAttributes: [String: Any] = [
		kSecClass as String: kSecClassKey,
		kSecValueRef as String: privateKey,
		kSecAttrLabel as String: label,
		kSecAttrApplicationTag as String: label.data(using: .utf8)!,
		kSecReturnPersistentRef as String: true
	]
	let status = SecItemAdd(addQuery as CFDictionary, nil)
	if status != errSecSuccess {
		if status == errSecDuplicateItem {
			print("Key already exists: errSecDuplicateItem")
		}
		print(SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error")
	}
	return status == errSecSuccess
}

func findCertificateInKeychain(label: String) -> SecCertificate? {
	let query: [NSString: Any] = [
		kSecClass: kSecClassCertificate,
		kSecAttrLabel: label,
		kSecAttrApplicationTag: label,
		kSecReturnRef: kCFBooleanTrue!,
		kSecMatchLimit: kSecMatchLimitOne
	]

	var item: CFTypeRef?
	let status = SecItemCopyMatching(query as CFDictionary, &item)
	print("findCertificateInKeychain status: \(status)")
	if status != errSecSuccess {
		print(SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error")
	}
	guard status == errSecSuccess, let certificate = item else {
		print("Certificate not found")
		return nil
	}
	return (certificate as! SecCertificate)
}

func findPrivateKeyInKeychain(label: String) -> SecKey? {
	let query: [NSString: Any] = [
		kSecClass: kSecClassKey,
		kSecAttrKeyClass: kSecAttrKeyClassPrivate,
		kSecAttrLabel: label,
		kSecReturnRef: kCFBooleanTrue!,
		kSecMatchLimit: kSecMatchLimitOne
	]

	var item: CFTypeRef?
	let status = SecItemCopyMatching(query as CFDictionary, &item)
	print("findPrivateKeyInKeychain status: \(status)")
	if status != errSecSuccess {
		print(SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error")
	}
	guard status == errSecSuccess, let privateKey = item else {
		print("Private key not found")
		return nil
	}
	return (privateKey as! SecKey)
}

func deleteCertificateFromKeychain(label: String) -> Bool {
	let deleteQuery: [NSString: Any] = [
		kSecClass: kSecClassCertificate,
		kSecAttrLabel: label,
		kSecAttrApplicationTag: label,
	]

	let status = SecItemDelete(deleteQuery as CFDictionary)
	if status != errSecSuccess {
		print(SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error")
	}
	return status == errSecSuccess
}

func deletePrivateKeyFromKeychain(label: String) -> Bool {
	let deleteQuery: [NSString: Any] = [
		kSecClass: kSecClassKey,
		kSecAttrKeyClass: kSecAttrKeyClassPrivate,
		kSecAttrLabel: label
	]

	let status = SecItemDelete(deleteQuery as CFDictionary)
	if status != errSecSuccess {
		print(SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error")
	}
	return status == errSecSuccess
}

func tryCerts(pemCertificate: String) {
	if let certificate = convertPEMToSecCertificate(pemCertificate)  {
		let certificateAdded = addCertificateToKeychain(certificate: certificate, label: "com.example.mycert")
		if certificateAdded {
			print("Certificate added: \(certificateAdded)")
			let foundCertificate = findCertificateInKeychain(label: "com.example.mycert")
			print("Certificate found: \(String(describing: foundCertificate))")
			let certificateDeleted = deleteCertificateFromKeychain(label: "com.example.mycert")
			print("Certificate deleted: \(certificateDeleted)")
		}
	}
}

func tryKeys(pemKey: String) {
	if let privateKey = convertPEMToSecKey(pemKey) {
		let keyAdded = addPrivateKeyToKeychain(privateKey: privateKey, label: "com.example.mykey")
		if keyAdded {
			print("Key added: \(keyAdded)")
			if let foundPrivateKey = findPrivateKeyInKeychain(label: "com.example.mykey") {
				print("Private key found: \(foundPrivateKey)")
				let keyDeleted = deletePrivateKeyFromKeychain(label: "com.example.mykey")
				print("Private key deleted: \(keyDeleted)")
			}
		}
	}
}

	
tryCerts(pemCertificate: pemCertificate)
	
tryKeys(pemKey: pemKey)

