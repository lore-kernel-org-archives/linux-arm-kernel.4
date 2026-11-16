Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2066606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inX633fh;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=FAOyYsw9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N12Ahb5VyWer9yRcyAA54ehPMbmFIb9EVuiZwVkXYxY=; b=inX633fh8YwB7NFWTz+Qkn4XMU
	co2jJD9PT7cHHCEiYfaXn+pYm2znH+Cz2fSdORI1R93C2qrdladQKD2+POUG9Ifng8bvg6x2Z7AHk
	XaHcp1jNBWbSEefECa4PeFkami2wFHUX3PNgQGS8RXcc1sBWDKdjrSF2qZ5zuKkVCrF5JQrTzXywS
	qt5LvDKFvKeSVDk5/7ro/kK1NHQLq54ilLsgeY9BtWea4niTn/d6DRhNUDF2mEkI1V+rWuCg/iPsh
	RVqzWk8iKTxjv+RxbWK4lTN8iosxiMnD8Kvf5A07GREU9F4wLO34ZS3un6h/2nsSfTAYJtkd7nWge
	QVjW8GnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsFf-00000001dcH-0puQ;
	Mon, 16 Nov 2026 08:39:47 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsFb-00000001daR-2Jx9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 08:39:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Un5KVxUJbpmvkesiSIsCPkHFM8j5KS7y93bz0j/w5jyME/VFP98N/rlLT32G636Gzv8QfY70VMn0r8pmQylOb2qikB/nihh96qS/LNmRIaxkeCW6rP7OCHMOgeHoPRlCpBVKNekSWHW9pq4XouzdTfW5Hcgipv3w9i4KrUKq1kLyYCem9IpUE6w8yJODmx/7/7HOKH8Mxh3a4clyZVXPNzOUBsSZJCY1rmsFjGV+CRSV1bfHot2jd3vqTvML7giIdw2pOqOVIDkjDpiYdw4Neki8W/mBxB9i7qe8T8XL6qCMyf0kLuiR/z+06wJDHS1s6whj8xFGYN960WpZoapJEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N12Ahb5VyWer9yRcyAA54ehPMbmFIb9EVuiZwVkXYxY=;
 b=MvnOFDZuuNZVhOob7PqtXBLIufYs6rpdtSYziUAKl4TyjqqC5IsdQGcoj28EVyslwRlJkcElntcAKVJMoR8g2F4VqUSYIStJOK4c5vAKFlUJnHdF10WvCJ/fxuNnksoTnl+GjsaoKnsoPlxNbw7IyHhP3waiF193bphrayewET9PGlmXyF/IZpR7rvXVSo6k1MUfNQU9H8aJkLmpkL9FkNwHvZcZrNOeruEZzD1r5E34ibLQZZUa9RcmIfw36RJmoj5NT0Equ1eW0op/IXC4I+H9WRVII0SiQGOcIgzLCMwI6N6LbUYUAtjil+2WO5N3PPOy5waXruZA6etWW9esFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N12Ahb5VyWer9yRcyAA54ehPMbmFIb9EVuiZwVkXYxY=;
 b=FAOyYsw9fExs/84STek2/Hio8QvLiX+d7hEswuwTJiThKmmqeTJVlp9PsKXTU7SWPyn66HVH38xW9GRY4dT6XDAz1hFto/J5vcnj9J6ZXEfHD/a3jVpkZ7XpgbGjTVD0ssBo6bWAoIKXaLiB8yph874+cU1wO2aHCnfs3e1FvSo=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TY4PR01MB14913.jpnprd01.prod.outlook.com (2603:1096:405:259::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:39:36 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:39:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, Rob Herring <robh@kernel.org>, Harini T
	<harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <ukleinek@kernel.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject
 devices without match data
Thread-Topic: [PATCH can 4/4] can: rcar_canfd: rcar_canfd_probe(): reject
 devices without match data
Thread-Index: AQHddDe+pqQcO6zuIUW4lgS12hIyWbcwYs1w
Date: Mon, 16 Nov 2026 08:39:36 +0000
Message-ID: <TYYPR01MB660340F5E219C29045BF61F9867C2@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
 <20261114-fix-device_get_match_data-v1-4-2d82025e9646@pengutronix.de>
In-Reply-To: <20261114-fix-device_get_match_data-v1-4-2d82025e9646@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TY4PR01MB14913:EE_
x-ms-office365-filtering-correlation-id: d1e166eb-ef8c-4b23-4db7-08df43bd256c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|22082099003|18002099003|261009223027099003|3023799007|11063799006|260925021911599003|260925021311599003|56012099006|260925022911599003|4143699003|10067099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: 5UrzMvgnpbt9qEJVWU5ARSSiJAt2sQg/NJX4m1NFwrmPNdd3zjXopFDYas8I+6cLG5YPYa9gFH6c/CY3q3DjTZ6ub5wXy1PSvWpcFlSu3KH9W80QM8M8asPgIBqEhVW3SdsJGlprs8I6hlJJ3p0h7Qq7V9iuTS6yGFQzVzLRdEDBjvssWidJTpP3iTu3GoR0QM+bwkz//n073TkFjr6o70GzzapBTPIjmk/lwUk67jF2cAFlK4mWksoZtl2I0gL2plDpMqaw4BtLUwKp1irM8wxEjM8uF4bVzrXPlmbXmmZ6k11CryOfH5awVQJMtp5r0s+Jxxao6AtP16XCHZw594qNdJV2yT0trYnum/PSUnbIKdIp40c6ZyQ/IsgeP3RApSpmKbWHX6zseEbYyANHC+rx7KYXmPCyUm9xNLuGORApFn7YAcpDU/+BgZO78xYz/gqnSyAgm3vPIToal2d40DKdiOd88JwU0P6gp84TGV+QQlokYN8CbRXcg63moE3uLeR21J2BDvx6wYvbpZJeHJoEqbjw1BXVO4NtGsBLasDxlKmt+3D4lTXCwXiSZ3BNS8516jcfePc8PYPMnJCe4dv4Npbxkd+Tj34s9Fo4+nKqEjEW+rOPUGALcbm06h29+Vc8uZsKYL2iFmLwqrWiTzNfXO0kDC4V351V3ok8fao=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(260925021911599003)(260925021311599003)(56012099006)(260925022911599003)(4143699003)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEVqZlVNL2xFRWVWWTkwOEFpVENZZG5rNGdqK1FWSEg5SlloeTZjSExCY2k3?=
 =?utf-8?B?anBtV2pWZ21OenNSRk5iVU4zWUZ2dCtUVlNRWDVPK0hlZ2VZWVE4TDlvWU1y?=
 =?utf-8?B?bEtZOEwvMHMyYllUWktxSnZHMWFKVkIycmV0Ky9OMXpKK05FdHhvMXRNZHZw?=
 =?utf-8?B?Y3FxU3YrSXVTNDVxZEN6THJLTXpMWW5KVHdUSHZ2aG5ERno2UktNWTBTc2tP?=
 =?utf-8?B?cVZXSnhoWHU1czMxOTE0SVcraFRNRDRvS0FPRnBJQ1BjQTZOdU5HZVJmeDNZ?=
 =?utf-8?B?L1lySXY5R0VseVBBajEyNnZHc245UXkwWldtU0JSak5OTzl1a3JJcnhteWor?=
 =?utf-8?B?bjJ1V09rVnoybEwwVUNrTlMrc1JTOEVPRlNPQXFWWllWSGZRdkh6UXFzQ0lL?=
 =?utf-8?B?Rnc1ZlVGZ29RemdqR0t6V0tqRG9Wa1RoZkwwanorc1R3OCtPZkpWNiszd2ZB?=
 =?utf-8?B?aDN4RU1EaWV0L1o0b1lOZlFkYlpJc3RRODhTaWQzL09wQ2lTbjFqaVFIa1lW?=
 =?utf-8?B?QUYreklYTEk0b0E5YnJWeXJNU0Yxc3NpK2tQbm9Ua0FGcE9mdDFTZXZLanI5?=
 =?utf-8?B?cUdkT0ZUdTNMVEFvdXlucXgzdW0xUklBYTVPaytwWVlvUnNjUjd4ZWszTElx?=
 =?utf-8?B?L2tRUGtGcFlRVmw0ME1ZUUpTVVJPSUY2dkgwYkU5RGRsN0duZjlQdkY2KzhV?=
 =?utf-8?B?cVZPOTVuallGN0VKdnorbWQ3am1PdkI3S2lYeWo0cXUrY0orcS9CRjUwQm5w?=
 =?utf-8?B?UTZiM3RBYnRtVllsSmxKNVoza2hORC9wNFBoL04raytHN1dIOHpGcDNnSXFv?=
 =?utf-8?B?a2tNcXJGVElsQVRUS1Z6cjRHTyszTzFJeWtDTnJPQ2RYdFNzOWhzb1d5TXVy?=
 =?utf-8?B?elRmM2p1a3FWc0JqYWppcjBXdmE4eUI5Z2hhUVZBZ1JiVmY3Nk84WVhHTUMz?=
 =?utf-8?B?Q0RoMzQ3SFJYdWd1elJXWXl2T1BKZnJOWWpkeDVMY3VMZTNUMXJ4QjZDSzQy?=
 =?utf-8?B?UzdQU3FxdlRST2s3WXRsU0tpdGhCWjU4YzF2WEcvMENBM1cySnJhdGdiRTNm?=
 =?utf-8?B?VFdvWndhTklKb3BHdy92enFNWnc1VWpHSGdWRkhKZWwxRW5DWjE0ZTdIYkpP?=
 =?utf-8?B?T3hlMFdWY2EzbGpMUk0yVyt2WS9hRU5vSVdBU3U3Vm5JWEdSRmtYbURpNWlH?=
 =?utf-8?B?TnVwRDE1T29PS1lsN3owaHM3N0VVempIYnB0K0RjUGRiM0JnbHFXbzBUeDZH?=
 =?utf-8?B?ZUhuRVlZNnpCN0xLQzhad2pxK2JpZng1aHM2TDlDWkQxdFRacG1ST0RVZi8y?=
 =?utf-8?B?NlZkcmVjMlN2WXdaOGhPVHZuUHJCNXhoTThQcVZLUE9Id3p3Q1k1VjdnRGJ1?=
 =?utf-8?B?Rndld3dHOFNZY3drV2NaTWhUSW9IZVMvZFBPUy83YjQ1MjJ1eGVUWk1lOXQr?=
 =?utf-8?B?SmhjZTBER2VvbFBBVG8zWVRRTFBkaHVUcWYxOThXNHZUZmVGTER0WHpIME9I?=
 =?utf-8?B?NGdNbmZFT0FPZjNGZGpvenJ6UlhmV1RGdjlqeXA3U2VaQTVHRy9oa1RDdFVD?=
 =?utf-8?B?VkVWSE5oZ3JzS3krRjFoeHF1OWZiRlVQRmZtRGpseWRzM1hlZlYyeEVuODdv?=
 =?utf-8?B?bTBQRi9LaGlleG1BYzBPZzBkZzFudzdvOU9nbUh6RzVVY0Zhb243WWxXUzJr?=
 =?utf-8?B?cVgzT2g4dm81bHpHNlkrRWxjcVRBajdhZFJCYU5QY1ZEQThid1JRUXdEWTZz?=
 =?utf-8?B?allhb3NOTWxUN1ZrM3VVaGZBVUtuSmZoWERqTm9VTnZzUURRcFFjZWtUY1Y4?=
 =?utf-8?B?cXNzcmM2SmRsZU9wN3BjbmEzT2hWRjVBT2l2Nm93bDI2ZXhQNVRKMTNrTFJC?=
 =?utf-8?B?V0FIZ0ZkT1ZmY25aWWYwVGtKUC9vOW43ZDZKc0MyVFhQNWNuZnNmK3lwUlhy?=
 =?utf-8?B?T3NLK1JyV0NzaGNCbEh3QzhZR3lDckNJQ2JOT1FKeDJZRWRDbGI1Ym9sU1BJ?=
 =?utf-8?B?UjlqSllUUC95ZzlIUXRGUWVXTVpzTXdtNW5LakYrYXBWSGdzU1VGOTJaK2RN?=
 =?utf-8?B?T2I4Zjg3YW9RVjU5a1NtbVg0aFhLTmV1MDJlRmV2TWFrSXYvNmkzNUlRRVU5?=
 =?utf-8?B?VzRYWWhuaklHdUkyWVlVNXRBeU1QWTMreU1JZWhOUDM2UjZyNDZxUXhma1k5?=
 =?utf-8?B?bWhVKzkxV2VmTnNESmJzek9MZkg2Z1duSlVkWXgvVjVwY1hXVXFHWFNGOG5I?=
 =?utf-8?B?cWdHTnFkTXJsSEw2QllNdzZjU2N4ZGFQNHF3bUNIam8yNVdjUUlOWU03bktn?=
 =?utf-8?B?dXF4N3pDZmFoMDc3NCs5dzRDV3lFLzFESnkrQ0RLaGRNa1JqelF6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e166eb-ef8c-4b23-4db7-08df43bd256c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:39:36.5210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0NXvlxzANPYK2tbBeh/dZYiHuo+47DOJ3IOPPCZOOdn232mhUv9PzG8Jy11Yw5xQTC6YYL0X/YZ7I5OQFlIWEb+XWaBNZphfttjqzrZcC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_003943_612332_07BB2593 
X-CRM114-Status: GOOD (  18.34  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFyYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBsaW51eC1h
cm0ta2VybmVsIDxsaW51eC1hcm0ta2VybmVsLWJvdW5jZXNAbGlzdHMuaW5mcmFkZWFkLm9yZz4g
T24gQmVoYWxmIE9mIE1hcmMgS2xlaW5lLUJ1ZGRlDQo+IFNlbnQ6IDE0IE5vdmVtYmVyIDIwMjYg
MTI6NTYNCj4gU3ViamVjdDogW1BBVENIIGNhbiA0LzRdIGNhbjogcmNhcl9jYW5mZDogcmNhcl9j
YW5mZF9wcm9iZSgpOiByZWplY3QgZGV2aWNlcyB3aXRob3V0IG1hdGNoIGRhdGENCj4gDQo+IEEg
ZGV2aWNlIGJvdW5kIHRocm91Z2ggZHJpdmVyX292ZXJyaWRlIG5lZWQgbm90IG1hdGNoIGFuIGVu
dHJ5IGluIG9mX21hdGNoX3RhYmxlLiBJbiB0aGF0IGNhc2UNCj4gZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCkgcmV0dXJucyBOVUxMLCBidXQNCj4gcmNhcl9jYW5mZF9wcm9iZSgpIGRlcmVmZXJlbmNl
cyB0aGUgcmVzdWx0Lg0KPiANCj4gUmVqZWN0IGRldmljZXMgd2l0aG91dCBtYXRjaCBkYXRhIGJl
Zm9yZSBjb250aW51aW5nIHByb2JlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFyYyBLbGVpbmUt
QnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+ICBkcml2ZXJzL25ldC9jYW4vcmNh
ci9yY2FyX2NhbmZkLmMgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvY2FuL3JjYXIvcmNhcl9jYW5mZC5jIGIv
ZHJpdmVycy9uZXQvY2FuL3JjYXIvcmNhcl9jYW5mZC5jDQo+IGluZGV4IDAwMGE2NDMzZjQ2ZC4u
OWQ0NjNhOWMxNzY2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC9jYW4vcmNhci9yY2FyX2Nh
bmZkLmMNCj4gKysrIGIvZHJpdmVycy9uZXQvY2FuL3JjYXIvcmNhcl9jYW5mZC5jDQo+IEBAIC0y
MTEzLDYgKzIxMTMsOCBAQCBzdGF0aWMgaW50IHJjYXJfY2FuZmRfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIAlpbnQgaTsNCj4gDQo+ICAJaW5mbyA9IG9mX2RldmljZV9n
ZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiArCWlmICghaW5mbykNCj4gKwkJcmV0dXJuIC1FTk9ERVY7
DQoNCg0KVGhlcmUgaXMgYSBwYXRjaCBvbiB0aGUgZmx5IHRvIGRpc2FibGUgZHJpdmVyX292ZXJy
aWRlIGJ5IGRlZmF1bHQgWzFdLg0KSW4gdGhhdCBjYXNlIGlmIHdlIHBsYW4gdG8gdXNlIGRyaXZl
cl9vdmVycmlkZSwgcHJvYmUgd2lsbCByZXR1cm4gZmFpbHVyZS4NCkkgbWF5IGJlIHdyb25nLiBQ
bGVhc2UgY29ycmVjdCBtZSBpZiBJYW0gd3JvbmcNCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8wZjc0NDYzMjRmNmEwYzhmMDE1M2Q2NTMyZDkyYTZlZWVjZDZhMzA4LjE3OTA2MTIy
OTguZ2l0LnUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20vDQoNCkNoZWVycywNCkJpanUNCg0K
PiANCj4gIAlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwgInJlbmVzYXMs
bm8tY2FuLWZkIikpDQo+ICAJCWZkbW9kZSA9IGZhbHNlOwkJCS8qIENsYXNzaWNhbCBDQU4gb25s
eSBtb2RlICovDQo+IA0KPiAtLQ0KPiAyLjUzLjANCj4gDQoNCg==

