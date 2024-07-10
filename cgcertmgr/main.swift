import Foundation
import Security

import Foundation
import Security

let certPEM = """
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

let keyPEM = """
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

// Helper function to convert PEM to SecCertificate
func convertPEMToSecCertificate(pemString: String) -> SecCertificate? {
	let base64String = pemString.replacingOccurrences(of: "-----BEGIN CERTIFICATE-----", with: "")
								.replacingOccurrences(of: "-----END CERTIFICATE-----", with: "")
								.replacingOccurrences(of: "\n", with: "")
	guard let certData = Data(base64Encoded: base64String) else {
		print("Failed to base64 decode certificate data")
		return nil
	}
	guard let certificate = SecCertificateCreateWithData(nil, certData as CFData) else {
		print("Failed to create SecCertificate from data")
		return nil
	}
	return certificate
}

// Helper function to convert PEM to SecKey
func convertPEMToSecKey(pemString: String) -> SecKey? {
	// Remove headers and footers, and any newlines
	let base64String = pemString
		.replacingOccurrences(of: "-----BEGIN PRIVATE KEY-----", with: "")
		.replacingOccurrences(of: "-----END PRIVATE KEY-----", with: "")
		.replacingOccurrences(of: "\n", with: "")
	
	// Decode base64 string into Data
	guard let keyData = Data(base64Encoded: base64String) else {
		print("Failed to base64 decode private key data")
		return nil
	}
	
	// Create attributes dictionary
	let keyDict: [CFString: Any] = [
		kSecAttrKeyType: kSecAttrKeyTypeRSA,
		kSecAttrKeyClass: kSecAttrKeyClassPrivate,
		kSecAttrKeySizeInBits: 2048 as CFNumber
	]
	
	// Attempt to create SecKey from data
	var error: Unmanaged<CFError>?
	guard let secKey = SecKeyCreateWithData(keyData as CFData, keyDict as CFDictionary, &error) else {
		if let error = error?.takeRetainedValue() {
			print("Failed to create SecKey from data: \(error)")
		} else {
			print("Failed to create SecKey from data")
		}
		return nil
	}
	
	return secKey
}

func addCertificateToKeychain(cert: SecCertificate) -> OSStatus {
	let addQuery: [String: Any] = [kSecClass as String: kSecClassCertificate,
								   kSecValueRef as String: cert,
								   kSecAttrLabel as String: "MyIdentityCertificate"]
	
	let status = SecItemAdd(addQuery as CFDictionary, nil)
	if status != errSecSuccess {
		print("Failed to add certificate to keychain: \(status)")
	}
	return status
}

func addKeyToKeychain(key: SecKey) -> OSStatus {
	let addQuery: [String: Any] = [kSecClass as String: kSecClassKey,
								   kSecAttrApplicationTag as String: "MyIdentityKey",
								   kSecValueRef as String: key]
	
	let status = SecItemAdd(addQuery as CFDictionary, nil)
	if status != errSecSuccess {
		print("Failed to add key to keychain: \(status)")
	}
	return status
}

func findIdentityInKeychain() -> (SecCertificate?, SecKey?) {
	let certQuery: [String: Any] = [kSecClass as String: kSecClassCertificate,
									kSecAttrLabel as String: "MyIdentityCertificate",
									kSecReturnRef as String: kCFBooleanTrue!,
									kSecMatchLimit as String: kSecMatchLimitOne]
	
	var certItem: CFTypeRef?
	let certStatus = SecItemCopyMatching(certQuery as CFDictionary, &certItem)
	if certStatus != errSecSuccess {
		print("Failed to find certificate in keychain: \(certStatus)")
	}
	
	let keyQuery: [String: Any] = [kSecClass as String: kSecClassKey,
								   kSecAttrApplicationTag as String: "MyIdentityKey",
								   kSecReturnRef as String: kCFBooleanTrue!,
								   kSecMatchLimit as String: kSecMatchLimitOne]
	
	var keyItem: CFTypeRef?
	let keyStatus = SecItemCopyMatching(keyQuery as CFDictionary, &keyItem)
	if keyStatus != errSecSuccess {
		print("Failed to find key in keychain: \(keyStatus)")
	}
	
	guard certStatus == errSecSuccess, let certificate = certItem as! SecCertificate?,
		  keyStatus == errSecSuccess, let privateKey = keyItem as! SecKey? else {
		return (nil, nil)
	}
	
	return (certificate, privateKey)
}

func deleteIdentityFromKeychain() -> (OSStatus, OSStatus) {
	let certQuery: [String: Any] = [kSecClass as String: kSecClassCertificate,
									kSecAttrLabel as String: "MyIdentityCertificate"]
	
	let certStatus = SecItemDelete(certQuery as CFDictionary)
	if certStatus != errSecSuccess {
		print("Failed to delete certificate from keychain: \(certStatus)")
	}
	
	let keyQuery: [String: Any] = [kSecClass as String: kSecClassKey,
								   kSecAttrApplicationTag as String: "MyIdentityKey"]
	
	let keyStatus = SecItemDelete(keyQuery as CFDictionary)
	if keyStatus != errSecSuccess {
		print("Failed to delete key from keychain: \(keyStatus)")
	}
	
	return (certStatus, keyStatus)
}


// Add key
if let privateKey = convertPEMToSecKey(pemString: keyPEM) {
	print("Private key successfully converted to SecKey")
	// Optionally, you can print the SecKey for debugging
	print("Private Key: \(privateKey)")
	let keyAddStatus = addKeyToKeychain(key: privateKey)

	if keyAddStatus == errSecSuccess {
		print("Private key successfully added to keychain")
	} else {
		print("Failed to add private key to keychain")
	}
} else {
	print("Failed to convert private key to SecKey")
}

// Add cert
if let certificate = convertPEMToSecCertificate(pemString: certPEM) {
	print("Certificate successfully converted to SekCertificate")
	// Optionally, you can print the SecKey for debugging
	print("Certificate: \(certificate)")
	
	let certAddStatus = addCertificateToKeychain(cert: certificate)

	if certAddStatus == errSecSuccess {
		print("Certificate successfully added to keychain")
	} else {
		print("Failed to add Certificate to keychain")
	}
} else {
	print("Failed to convert private key to SecKey")
}
	

// Finding the certificate and key in the keychain
let (foundCertificate, foundKey) = findIdentityInKeychain()
if let cert = foundCertificate, let key = foundKey {
	print("Certificate and Key found in keychain")
} else {
	print("Certificate or Key not found in keychain")
}

// Deleting the certificate and key from the keychain
let (certDeleteStatus, keyDeleteStatus) = deleteIdentityFromKeychain()
if certDeleteStatus == errSecSuccess, keyDeleteStatus == errSecSuccess {
	print("Certificate and Key successfully deleted from keychain")
} else {
	print("Failed to delete Certificate or Key from keychain")
}
