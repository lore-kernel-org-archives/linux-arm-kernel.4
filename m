Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B799C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 01:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IgLQCvkA;
	dkim=pass (2048-bit key, unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=gC5Y+Oej
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yUm3iCUHvuHYPVQirOTlS/5Lzm2uvJvZpcyxB9jW8n4=; b=IgLQCvkAcTtMXJ9bqlgK8tUUvN
	FffuOvzwXP8jZivRr9yqJj5FH9WZKfNWKfU7Cbt/4Mxqkh6bpzm9K27H1XgnOCp8Y1D9IhKy6juZk
	iAPbZqcL1b4oO2TTOy1gcFc651sVy3HqrcvULYZHErF5bixzTktsAp5X0iF4zyZLnmyBXlp9KJaOO
	WDCO9pPieHl7oY7sz6zSPm+KGqz1Hpe26Tyi43zqL+npZk/0YBIGHGRfD7lDCcdnbhGFXXCntj14U
	SNNxPM9162ywcjZ+Je2XzWFDzUP0SO/UpdfFpbxpLh6ceByHtOLQQPN7xkH6bNE2oR2TkzTYxPvEJ
	2dYe1Ctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW277-00000008DAj-09Fq;
	Wed, 25 Nov 2026 01:48:01 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW272-00000008DAH-2K4P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 01:47:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqPXVuLdW+1QO+mcA1yQ2iV6kDNpWnAq6lBoojxFWL5gsNT/TcuDffiUdGN5p1BdI3XYobGd5Nd7A4oYIqFebcYRfVjZUXmO1pXM39H9aAWeejMKdgqwWSDmjo6Hajxd4m2RzYON/RRYr78CPYojsairipfY+QkQ6/HJoYP2THRytYQ8+GYQT15L+CnkDA8bRFHSpmolsmfXYbdt03POQBWVWLLCHRNHBDG7TgT5/g64MbddyO4nCBHnXl7tjrQhiYy8KaL636IoDM0vtiCFCQhLEauTSF+b6PGf7yMWcx5cYzpUEFPRXh8VybutGP6CdIGungO8uV5JTdCyBzIAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUm3iCUHvuHYPVQirOTlS/5Lzm2uvJvZpcyxB9jW8n4=;
 b=iAVrzVH3cMhYgxNHzT9Obq4k+B9mKWk06ki8uwfdaIgfLw5gOMvCeTS7370qMgl4hwdfNVjeFDYEGO5LNdlal4uJjGNsx4PnqnXslv6+y16lfTX6xEz44vCdHssggKdOwzn43+1ABcXkxO00ynFBwpZyMUsAGosSKDe51NoDLQxOuJQiZITckFL+xngO6CW2dR7cdTHkYqhwnaTExNbPliltzLBctQvrpw7lseRVPNauYaPcJHMq6ZahF3KIiJg9l1FLzCD9q3x2o+bwBoODwRex2evk+4NvWOvIEvSZgeZoHCaV/avQ65zMzPk1HQ2795dIruwqsYW0Nxlc8t6iTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUm3iCUHvuHYPVQirOTlS/5Lzm2uvJvZpcyxB9jW8n4=;
 b=gC5Y+OejQXTDxmRAjXqvSoaTpWP1wPXX5qelTnjYA9e5w5AiDCUw+wocis5mgzYHOL1GJ2VMZe55JNoox/PESP8us6IXyua3DjKaBT5T7N+0h4BK7U9dREsPKsbiffqThtWDfqpLeffWqpiL3mKlVN38FPoiynmG1OTjdtHMUcp6W6VHkIAH/HGFhY6d7vv/86m/HOpKxdY9/jhZkbualoNQrUXrErqlpreQLdNPKvFikYta0zJROvzjqJMVgRNkodEbr8sw848t58pAtGwtM4TdYiSlDyuiCCFmw/vnDlkJNmju85KMoYZ9GJLRygQisv8FtdYLTQA3NuCfUicikQ==
Received: from TYZPR06MB7920.apcprd06.prod.outlook.com (2603:1096:405:24::8)
 by KL1PR06MB6396.apcprd06.prod.outlook.com with HTTP via P2P; Wed, 25 Nov
 2026 01:47:49 +0000
Received: from TYZPR06MB7920.apcprd06.prod.outlook.com
 ([fe80::f787:b04e:6ef9:c0d9]) by TYZPR06MB7920.apcprd06.prod.outlook.com
 ([fe80::f787:b04e:6ef9:c0d9%5]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 01:47:49 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Borislav Petkov <bp@alien8.de>
CC: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>
Subject: RE: [PATCH v6 0/4] Add Aspeed AST2700 SDRAM EDAC support
Thread-Topic: [PATCH v6 0/4] Add Aspeed AST2700 SDRAM EDAC support
Thread-Index: AQHddnXCMaGJLrlnu062fO6xvvexGbc8aUgAgAGnSVA=
Date: Wed, 25 Nov 2026 01:47:49 +0000
Message-ID: <TYZPR06MB7920C82E0B3F23587EB5B1EFF2432@TYZPR06MB7920.apcprd06.prod.outlook.com>
References: <20261117-edac-v6-0-a2a747b95c3f@aspeedtech.com>
 <20261124003110.GHawTazmnfEiwzjh-0@fat_crate.local>
In-Reply-To: <20261124003110.GHawTazmnfEiwzjh-0@fat_crate.local>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-traffictypediagnostic: TYZPR06MB7920:EE_|KL1PR06MB6396:EE_
x-ms-publictraffictype: Email
client-request-id: b11058b3-d38d-4096-980f-56468e26b40c
request-id: 4795674d-0070-493e-49e9-08df4a961c71
x-ms-office365-filtering-correlation-id: 4795674d-0070-493e-49e9-08df4a961c71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|18002099003|6133799003|22082099003|3023799007|56012099006|261026140227099003|4143699003|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261026121527099003|38070700021|261028144727099003|10067099003;
x-microsoft-antispam-message-info: VUrRzIbkEZjwuFJ23MffU5LH+uCrth98H4E9wSc5HbH7RKW8rIUiNoOfqmieeINYpH/rcGttp2Unru8htXE+kSzQpfUexv7MN0Z9MQUjKI7Jv7KmENYmvP84p58vsPCwoIbXPjY2NmrDRrhqL35MV0j1coGWb0qeSHJSgg382QR2YRQGCk6GnzkouGPIreUySga84O45j1EDCnB55oK9Vb53E+wNRpPC1d1Qq7lHZH5y4P7ZdhQIVWrYOfveiPKRXBqGvTceIfRTPeb20eUqLWSZY7OLzvVCTQOKIPoBG/9rNEFZCHmYGsy5gpXWxWV/pqUmkUnqFhmGutnRGds0n3BsLfibZsrorfHIf2Styou5DOCIjHW6KPmFCLTa2bPvZ07x8invZNQZNmkBMN9NXoKPe4oa4ow3voM6UoRwHBFj/PLLQjlJHcmBMRButxDfG37j3+OX2IdYNdom/csM4gqGhRYBLuyKx7Ul3VOx+WYrupWkZRS8eOAE/xwwkFw7xlo+iR8eJ8NuPS5tGfGfnEM6KsILD+YuQQa32m3e3hdpcYgLNcxHP8gXrpzlqluvxwjhtO73hJ7EELak4XMLoL+F1NxXirQiaurD2Erjwtmww+u5GpwSOShjEjzPz4YsnXHvdeIVPOOmIDM0JwnhFrSrPr5hsZ6/s+RcSCjzKaU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(18002099003)(6133799003)(22082099003)(3023799007)(56012099006)(261026140227099003)(4143699003)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261026121527099003)(38070700021)(261028144727099003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THVCZjZFWmZuOWdvcERFK08yNkQ4RXZnQyttOC9YazloZjVlcm9vKzdSMVQ0?=
 =?utf-8?B?RHF1dDhjTms4emVLaldMSGNzZ0Fjcm9sVjY2dzNHd3pRZ0JFeDdCZk5iOFQ5?=
 =?utf-8?B?Z0hCNjdnM3YzWS8yMnVaRXRZdEtxZjcvNTJrOGtxR09JUy9pWGY4VVlCaEdV?=
 =?utf-8?B?Y21NeDQzSTN3aFA1eTFwYVY2bmJlK2xjb3dWblVtUE04cmRzdndOc09GdW9w?=
 =?utf-8?B?Q0RPcitDTUlrTHBDZWVXT0Q0MUpoWHNpRmRYKzN4eFdNRGUzdW1FaFBmd2tu?=
 =?utf-8?B?Q0dubmF6dHVoT3AzOGxzN2tLNHI2UytGdjBBSWY5TmhEclduU1U1bzRCQWgw?=
 =?utf-8?B?WmNpNUY5SEpoRWtxa1k1RzFaMGFENHY5bEFTRER5N3NOZzJ0NnV1NUF6WXhE?=
 =?utf-8?B?MnRIU2VZM2lPTHlPR1BhM0pWYk8xTXRJeVY5Qm9zWUx2aWp3OXpaeGhHWkNv?=
 =?utf-8?B?M1pNbXgwM0tLb2phRWlTTE83TkdyZ3NzbWJjaVN2V1VzUlhYUlVWekFtYW1G?=
 =?utf-8?B?Y2hmTmVYeUpYbXg1WThpRkxmakxzRGhQRGhZNldoNXJJa3BQRUVvZTRUMEZC?=
 =?utf-8?B?TGpjREVVeXNCRmhYT2dVSVVyREFnWlFpTUhuK28xbHE1a3ZwaTVXdUxWQVhu?=
 =?utf-8?B?czd5M1NON01lUmZ2TE9wbyt4NW4yYUY1TGdrV1BhYXBzT0tlWUlWT3gydUxa?=
 =?utf-8?B?NnBIL2wwdmhheWRHWG9kZ09TTVphbEQyNEJyMW95UEdKRjYwNXgvY0VYai83?=
 =?utf-8?B?MUhhUHRCTHgvYVR4UXpDNEhaSlNKR281SENTd1lwZFN0OXRMb3ppUDhmd1lV?=
 =?utf-8?B?Q2FkWWNUN3pIUFppZ1p4T3k3eHJoRjg2L1hBOFd4K0JrVnpob29PTTRtWkRZ?=
 =?utf-8?B?d3hzYTU3MU1XZkpUSzI4WFBveEJNclhDOG56bG1yT1NRb0QwaEdSenVVNG85?=
 =?utf-8?B?R3p3dVptWW9ZVGNrN3ErS0d0OTBLdkJ0Mmtzb0lPWUNKU3VKVHpTZXZqckJC?=
 =?utf-8?B?dG56RmVscVByWFl2TDZFbHFwM2RBTzd4L25FUDdvc3JIRE5XTGZmL2R5NlRX?=
 =?utf-8?B?R2wrMWZWRjdUYzBIYncrWVpFMlhGeXp1OC82UDdsREUxN0daZTd3cjVqbmFL?=
 =?utf-8?B?Q3ovNitPTFIyQlpyZHdseTIzWVM3WHpzUWpsRXpwbS94N1FSaFJrZzJsbHl1?=
 =?utf-8?B?RUZmMzFIcWpYZDF2V1cxeEJmNnk3K25BdktxNGo5d0JFdGJIUi92S3pKUWgx?=
 =?utf-8?B?cEV5bWZqUzJNYis3ZnAwSjB0ay96blV3R28rTENnTXlUNTdlZEdDZ2hFNy9L?=
 =?utf-8?B?dC9ndHZXSTk1SXk5dEx4NTZhTDNjMDl3cEpGOExUQVZlL0lUZ2tadWxvc3dP?=
 =?utf-8?B?NXR0ZGRUZk0wUVNLRTVOTzVGMHBjYWxLS0t2U2JjUWdaT2d6YW5OVHhzM3Zm?=
 =?utf-8?B?SVBSMk1aYW1odUc5Rmk1dXRmWXF0c3N3L0FZdjhqWWxsT1ZvQS9hV3lON1Ix?=
 =?utf-8?B?QktMVUVvUGJEZHhvbmNRMXkyZDlMYk1JeWx0WWxFeXMvRDlzeGU2MWdSb0Va?=
 =?utf-8?B?Q29MNjQzWEtlYkNwT2tvOEpyQzlPc1VBM29ncW5PTDhuOWdEMWl4WUNOTWNC?=
 =?utf-8?B?cXBpOG5Jc29tTzlla1orNEI4VFZReFl4Q1NxajNsQkMrbmQxWmRURk4vOE5j?=
 =?utf-8?B?VTZzam9FNHk5c0QyQzltbWhQVkdKUmc0SWsyQUxtNXVwUEFSTUl5SUVLNmdl?=
 =?utf-8?B?eFo4a2s2cGc1TjVqRWZidWMvMXNrN3FPY0ZRM3UzaFVZTVlXSUhPbm1CbUEr?=
 =?utf-8?B?bjlqTlJtaU1VemdUTmlpbTNMS2s1bGJ5TTBrYlJFb0xRZ1ZQc2dwK1NBRE94?=
 =?utf-8?B?bTFpWWsxcHBsSW5ZL2hLeWpjdWtpU0pzOW41QnBPOTlqdWJBSHgvZ1lzYzlV?=
 =?utf-8?B?dFFPK2laRUVjSDQ2V2IxbXdLbE5ZeXprTXQ4VWErb3dMVnJ6QzZ1SW5LTlpv?=
 =?utf-8?B?OVBuM0dyUjc2bExUMDVBVlo1Umd4WDhMc0psN3NJOG1rMzY3L0xJTmlJTGhh?=
 =?utf-8?B?eWcvRUlXWGJmOUpaeU5udVkwVVlNQk1Ha2xuMkxubVZBUDdRTFpzdDlTS084?=
 =?utf-8?B?MlFiRXltZ3JoeDFaL29wUzUxeDUxK1h5K25zajlUV2pWL3hpcWtOUGc5eElp?=
 =?utf-8?B?WUVqU2pHTndMTG9lL2VkejNiTGIyZ1RHSG9oRWMrdXhpWXdHY3JXczZ6V0lP?=
 =?utf-8?B?L3ExM3Y5YTNoV2puRWFXRFVXbFRmbzBsUW9rdi9CbVRJVnlvNWs4UER6TGE5?=
 =?utf-8?B?RUFxZ3Zqd1FhdXN3MktrMmFWZWcwNkdJYkJ2N2RCRjNqcE91S1VBUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7920.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4795674d-0070-493e-49e9-08df4a961c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 01:47:49.1797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YDu1Ht4ntyMxD5T4nU6BLv6GIpH6EfWA/n+6NlC6zxW4xdfCOameqCbR4/NnoEtwx49gxCbKwpeD44c+nml3pLNyZkNhlDdW9yEFAZ14OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6396
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_174757_348832_BF0F097C 
X-CRM114-Status: GOOD (  22.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAvNF0gQWRkIEFzcGVlZCBBU1QyNzAwIFNEUkFNIEVE
QUMgc3VwcG9ydA0KPiANCj4gT24gVHVlLCBOb3YgMTcsIDIwMjYgYXQgMDU6MjY6MzdQTSArMDgw
MCwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+IEFkZCBFQ0MgZXJyb3IgcmVwb3J0aW5nIGZvciB0aGUg
QXNwZWVkIEFTVDI3MDAgU29DIHRvIHRoZSBleGlzdGluZw0KPiA+IGFzcGVlZF9lZGFjIGRyaXZl
ci4NCj4gDQo+IE9rLCBJIHRob3VnaHQgSSBjYW4gZml4IHVwIHNtYWxsIHRoaW5ncyB3aGlsZSBh
cHBseWluZyBidXQgdGhlcmUgYXJlIHdhYWF5IHRvbw0KPiBtYW55IGlzc3Vlcy4NCj4gDQo+IDEu
IFNwbGl0IHRoZSBiaWdnaXNoIHBhdGNoZXMgLSBhIHBhdGNoIHNob3VsZCBkbyBvbmUgbG9naWNh
bCBjaGFuZ2UgYnV0IHlvdXJzDQo+ICAgIGFyZSBkb2luZyBtb3JlLiBEbyBub3QgZG8gYW55IGRy
aXZlLWJ5IGNoYW5nZXMgd2hpbGUgYWRkaW5nIGRyaXZlcg0KPiBzdXBwb3J0DQo+ICAgIGZvciBz
b21lIG5ldyBjaGlwLiBUaGV5IG5lZWQgdG8gYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaC4gSWYgbm90
IHN1cmUsIHJlZmVyDQo+ICAgIHRvIHRoZSBkb2N1bWVudGF0aW9uIEkgcG9pbnRlZCB5b3UgdG8u
DQo+IA0KPiAyLiBXcml0ZSB5b3VyIGNvbW1pdCBtZXNzYWdlcyBpbiBFbmdsaXNoIGRvIG5vdCB1
c2UgbWFkZSB1cCB0ZXJtcyBsaWtlDQo+ICJEUkFNQyINCj4gICAgYW5kICJpc3IoKSIgYW5kIHNv
IG9uLiBUaG9zZSBzaG91bGQgYmUgcmVhZGFibGUgYnkgaHVtYW5zLg0KPiANCj4gMy4gRG8gbm90
IGV4cGxhaW4gdGhlIGNvZGUgaW4geW91ciBjb21taXQgbWVzc2FnZXMgLSBvbmx5IHRoZSBub24t
b2J2aW91cw0KPiAgICBzdHVmZi4NCj4gDQo+IDQuIERvIG5vdCBwdXQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIGhvdyBhIHBhdGNoIGhhcyBiZWVuIHRlc3RlZCAtIHRoYXQgZ29lcw0KPiAgICBiZWxv
dyB0aGUgIi0tLSIgbGluZS4gSSB0aGluayBJIG1lbnRpb25lZCB0aGF0IHRvIHlvdSBhbHJlYWR5
Lg0KPiANCj4gNS4gRHJvcCB0aGUgImFzcGVlZF8iIHByZWZpeCBmcm9tIGFsbCBzdGF0aWMgZnVu
Y3Rpb25zIC0gdGhleSBkb24ndCBuZWVkIGl0Lg0KPiAgICBUaGF0IGNhbiBiZSBhIGZpbmFsIHBh
dGNoIG9udG9wIGlmIGl0IGlzIGVhc2llci4gT25lIGxvZ2ljYWwgdGhpbmcgcGVyDQo+ICAgIHBh
dGNoLg0KPiANCj4gSW4gYW55IGNhc2UsIHRlbGwgeW91ciBDbGF1ZGUgdG8gZG8gdGhvc2UgdGhp
bmdzIGJlY2F1c2UgdGhlcmUncyBhIGh1bWFuIG9uIHRoZQ0KPiBvdGhlciBlbmQgcmVhZGluZyBh
bmQgaHVtYW4gZG9lcyBub3QgbGlrZSBpdCB3aGVuIENsYXVkZSBkb2VzIGEgc3RpbmtpbmcgcGls
ZS4NCj4gDQo+IDopDQo+IA0KPiBUaHguDQo+IA0KPiAtLQ0KPiBSZWdhcmRzL0dydXNzLA0KPiAg
ICAgQm9yaXMuDQo+IA0KPiBodHRwczovL3Blb3BsZS5rZXJuZWwub3JnL3RnbHgvbm90ZXMtYWJv
dXQtbmV0aXF1ZXR0ZQ0KDQoNClRoYW5rcyB5b3VyIGluc3RydWN0aW9uLg0KSSdsbCByZWZpbmUg
d2l0aCBhbGwgZml2ZSBwb2ludHMgZm9yIHY3Lg0KDQpBbHNvLCBUaGUgdGVzdCBub3RlcyB3aWxs
IG1vdmUgYmVsb3cgdGhlICItLS0iIGxpbmUsIA0KYW5kIEknbGwgcmV3cml0ZSB0aGUgY29tbWl0
IG1lc3NhZ2UuDQoNClJ5YW4NCg==

