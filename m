Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AtEV2Rv0;
	dkim=pass (2048-bit key, unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=nozlw3HW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h1GgFLRUx1cvdoTY87mzPoZ97TjD4mTSFEnrv/1R5jU=; b=AtEV2Rv0n6rxR3Iy2eZroQHjgg
	hxcBLenO80gnxc7fGiehSfG5pkSMQRXi93ZuKwu8EotZyhTDpp4NSw4EriPUbqw1cixOn+jEw89m7
	GtOrHRrs3ePfNjVUUxaH7Hh7OPoKZT9NB/n5a7Q/XuPlgB9/6FJzdjOWvtbwhf33YY4XOCX8MyrJB
	cckb1g1siGZxfHfwvkhQImYGqRWWe1r5WUpK+rSByvK6bzBmJGZBN9oHTBh2mrv/VmffoaAdl8uuG
	1ZehTywk090ak7djqBT/cQRB+nSsBG/fn0wGbR1d/YqxRd3sOBH0uGtl6nbNw5Si1b9LJcbyiPfg7
	1qfTFhIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbQL-00000008EvK-0dCw;
	Wed, 18 Nov 2026 08:53:49 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbQI-00000008EuP-04r1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTW0GXFch5bxMYMCtfI/zEFTUEUH67CoeB1TXdVkr0o1A+y9xkb0dl3TtiSO5VoXbG05sJ9pAjMuLgOxVMk7TGhGqT396DkUSvf0yYqzZNcZ5JjAierzirl0qVHWo+EI9WC5RnDEasfWMn/3lq7pKiXHdlQAVBDY8ulvh95MV3UrQvNqKCGcJ15BMQwX/2kAVDrIvWsZgeDRfyNY50Djr+tuAU8K1EXcGvCeDwtg/nta315xvgVoniR1IIPzpzA/yhE4+1LW6TZzM5MiZ5NpOdSl1KwUzq9dMkotBKrePznNJ/ex/yUVxGH/BnFWRiA+U/IgKnOH7xDwQ/pAPhNdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1GgFLRUx1cvdoTY87mzPoZ97TjD4mTSFEnrv/1R5jU=;
 b=XRmCu7qtF3mbIzuYyWtRATFD3smzLrdP26IM6BOGIhLgcCej9jG3Yu8TyuK4f1dcoB2zbRzXWC8uNXDXApR6A2jZsZVv45DWyFijFy17RIp5Ge8WqzEOvYTGMK87oR27ApUIY3vs1JpHoCR2pJiDtLI5J7rCGUNdFl3tqEiDf0E7gMFdG3SSb5WZWmn9AqALfe8qPKXk2d4HEAV93bbSpktzyrhA0vGx9EN9RkUeHTaJW2catBItNj6xSVO+GXbT+yhvKVvUO+Pi7RkUu74+j3hzHQ24ge9BkYOhmhD2C8LGT2a8kd72+EgkgRPuJfSRrEtWz+eQ0O5WpbwsKmQ8cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1GgFLRUx1cvdoTY87mzPoZ97TjD4mTSFEnrv/1R5jU=;
 b=nozlw3HWXFcIR9MyF0aXukCbqQSRtEIoVVyqBLn0qTOg6m6dblYBdAqx3wuFJFfxDzv0G7V+cEJc4gGx3fLYx4v2MZQUQiGx8DQmbXef+meEeSXQ3PmMtEFTOlDseYIVjtMh3zgi07GdOlFy9WbLoiySEH12Md4pDG6eNam/KrfRlyik5NhHt36cbUCPog0k5Apy6qKWS5cuAxV9pnIrbRtz9CIjn39bJr3Wkdq0cJpR3dhI89KHBcBbTjeIdw/aY9FMT4Frhqh2DOowlg08pp4S/C9z6aSv6fgw3jw9BtCvvFqhz2BshPgr9haSeqhqjdelmFR+G+G1LHugsaS8ew==
Received: from TYZPR06MB7920.apcprd06.prod.outlook.com (2603:1096:405:24::8)
 by SE3PR06MB9162.apcprd06.prod.outlook.com with HTTP via P2P; Wed, 18 Nov
 2026 08:53:36 +0000
Received: from TYZPR06MB7920.apcprd06.prod.outlook.com
 ([fe80::f787:b04e:6ef9:c0d9]) by TYZPR06MB7920.apcprd06.prod.outlook.com
 ([fe80::f787:b04e:6ef9:c0d9%5]) with mapi id 15.21.0639.006; Wed, 18 Nov 2026
 08:53:36 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v33 0/5] Add ASPEED AST2600 I2C controller driver
Thread-Topic: [PATCH v33 0/5] Add ASPEED AST2600 I2C controller driver
Thread-Index: AQHdAq3Y4LlkAtnJjUyKcR4sCPhwVLc0NhOggAA3pwCAAADi0A==
Date: Wed, 18 Nov 2026 08:53:36 +0000
Message-ID: <TYZPR06MB7920EE43F93A37A61E139CD4F27A2@TYZPR06MB7920.apcprd06.prod.outlook.com>
References: <20260623-upstream_i2c-v33-0-6d5338fc56ed@aspeedtech.com>
 <TYZPR06MB79202A00572E81CBC29399F4F27A2@TYZPR06MB7920.apcprd06.prod.outlook.com>
 <av1mTEtWCf8zFbjp@ashevche-desk.local>
In-Reply-To: <av1mTEtWCf8zFbjp@ashevche-desk.local>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-traffictypediagnostic: TYZPR06MB7920:EE_|SE3PR06MB9162:EE_
x-ms-publictraffictype: Email
client-request-id: 60367972-d26c-457f-9c43-23115050dc1c
request-id: d20bff39-15fb-4325-6ba0-08df45516ef4
x-ms-office365-filtering-correlation-id: d20bff39-15fb-4325-6ba0-08df45516ef4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261028144727099003|261102123227099003|261021121427099003|261026140227099003|261026121527099003|38070700021|4143699003|261022105027099003|261022075727099003|56012099006|10067099003|18092099006|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: LpLkjXgs1sc6pJGEB2N9kTBgwUvQDNX75xpV8ONUVp/vyZMLdfePz7/gk2I3gF0BM9CyM2mPbeMnQuSwscCjuju2raP2wClrcI3xwrD973g1EFyti/UXWU/uEI3IrMlUeZUv7ISDBFxylwhv6vdkcrUfp1VMFlMMHP7d6Ixx+WKdUgU2W3QdCZiSsVQAT/50Hm5JR1q5EAYbPP4WkKKb8PDgYubbCLCUffTV7HIcHvniVP4aTJIQhdRQ+Z+Vi0S3FuPgA42FOYd7f5K63dMfNiSV43OhZYIJYp+89wbTNQvLdQ7AqztL7GLy7aehBnGCXkmsqapdhBvboVfrFMi0neIeT5LPGm27vlJnHUOGHHnRSvL8rmB6ShN9OYufhITKy4KykWe8MxdKxkA8MfUBQrrWrsQ8gYje4WK3EMuqdLZ5GY0UN9wjbBEB/g45ZqWsApuThNXZ0kENC0SeeZ8CKsCTF9afnQ79tgKtwu/gdO+9AoCgG123pDyS0WHiJrjq8QwR3qPB2ewgn95QTjqWPEtrYTz3jq63XWLujB755eiGUotkqhzupJI0JtBrTkJXNIKJW7pgH54KmCelEwJ8FM2Ss6iVgWaJlBKaBPqXCGV3nQCI3q4qRnaONGWU49P2oIlvsur86jHzOCUNSkqq7ymg6J6uQgwqoSOJ995TS+khyIp8aDWy0odf7v3q5soPcKrw4jn8DwLryqg+55fdOKtxI07Km6J9kXHQFXYpd60=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261028144727099003)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(38070700021)(4143699003)(261022105027099003)(261022075727099003)(56012099006)(10067099003)(18092099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWpjL2p1VmhURWlLTk0xdzBOY3RTSDNnazMrN3FZZStWb1I5a01TWWQvZHZX?=
 =?utf-8?B?U2hPNnJPVVdwZDEvcFBBalloczIwVUJqRHQ2RmUzVzZObFp0NWJYaFVXMDVI?=
 =?utf-8?B?Z05ieDR4YWlXN2ZRMmYvUmNPNVRJbU1Fc2xNOFJDZFo1K1lGZTc0R1dKYm1U?=
 =?utf-8?B?Rk85TUlxb0tINGRaTnZqSldnM1VKQU56Tmh5UUJ6THc2ZlhuOUpvYzJKQVJ2?=
 =?utf-8?B?V2JJUEdJb1lSdk9JVnhKOU5SdUZBL3JVMXF5N1FzT1ZYUzN6NmdJdWJMWmpN?=
 =?utf-8?B?UFBqMlZhVU9EaDRzSXlyRFNpM1M3V216M1J2UGRYYTBrRjl5MjMvMjV0S0pk?=
 =?utf-8?B?N3U0N0c1NDl4RXJHMmU0UExPVUdpVS9UVXVBQi8xUGNaVCtUSnJVY1ZJUkVm?=
 =?utf-8?B?NGFxSFdqUnBPK2FBR1M4Nkpyam1NajQzaXVFNWJ1QmtCN0xsUW04NjYvOXB3?=
 =?utf-8?B?Vm5xOVVnQXZZbkc0Q09FR21OSjRzRUExS0s4ZTMyeFNuT01mY3E0SE1lL1hJ?=
 =?utf-8?B?Mk93U0pFakpKcHBQUG91bmFCSW44bmkyZ2dBMVN1dHk2dzJHYjJEK3I2MHRP?=
 =?utf-8?B?SjNVNGdJaHFpRy9jeUNjVnJBM09ybFFwTGZhbHVuaVlzRmxsTUtDMWtmamxt?=
 =?utf-8?B?Q1FOcnNwcCtWTkpNc1E0ZWsrb1RQTWVQRXV0WGgwWWtuS0tUQ2dQSlBybGxy?=
 =?utf-8?B?MUQySHY1aWg1WFR4ZkowcXBwcVF6UHBOWVpCc3B6M2lsSm1rNkJ4NHFjQmJa?=
 =?utf-8?B?ME1peEw2MUdHSUJlRzBGQzJ0aXh2bGxYS3l6eVUweFZxZmlpeGJuc2NDSUNr?=
 =?utf-8?B?TFdmUndSaWo1bHl1c2FrdFZsK2dQekd1MWQvVWxycFpzWmtFU2JuYU9taE9E?=
 =?utf-8?B?ZXlUeFFZVVBPaHg1aW5WSGRCWWRhVEgzWUhHaDBPY3Bzc2gyWXdyaTJKNlkz?=
 =?utf-8?B?ak01RTRsWStuTS9oM3J1dExjc1hUY21vVnptbjgzWjFuem15a2lwUGNNcDFZ?=
 =?utf-8?B?UC9EcXVmcmp6VUhmM2Z1Y2o2dVI4OWN6Q0NIVXNsUmdzREVNTTdoMm9LbUxG?=
 =?utf-8?B?MWJpNFZrajRJMHY2cXgvcTNraVZLRmt0RkxITEVmRmo2cURnUk9ta09vTnZm?=
 =?utf-8?B?UFZTUWNXdlR1TzhTSjJ6cGQ4V3Y5UG9ROERaQ2Vnc05YVU81akw1anVzWGNC?=
 =?utf-8?B?VytpYUVJdHY3cmM3Q2p1ZHJJbUlVdkxJZm9lWDFDSG5zcUNwcE90TCs0YjQ2?=
 =?utf-8?B?aTNRTHdOMDVDQmVaMVFHdWQ0OEhyVU45YTRXcUFONUZ6blhWSGRtVXZkZTg0?=
 =?utf-8?B?ZlVJVU5pZXVZTUVlOWsvajNGNjNVWE5DUStBMWx1WURaWnNqUTk4ZzhOZVpZ?=
 =?utf-8?B?MEI4K2lVdWd4MURDMzhtekZwR1d0WmFheG5EM21QbkkrVU8ra0x4UWdRTk8x?=
 =?utf-8?B?SzAzdUFjY1dDV1FWTGtHc2M5Vk04WFNsYStiS04wOXBrSTVDQmZTNSszTTF6?=
 =?utf-8?B?U29zNkhIc2J1LzlqT2tGUXBDWWlyeVZRMjI3WGRkQnRDbWZvNUd3aTgvNlFN?=
 =?utf-8?B?Mk9wbncrNmRaYWZaa2JFT0lLd2grb2NTeUNxYWo1Uzk4RDI1K0EvS3p4dXNu?=
 =?utf-8?B?WDRwSVhKWkhzUEZsc1haR1VhVlA1YktnWVF5em45N0pFV0k2cG5MdmNzR25R?=
 =?utf-8?B?cEZQa3IzajloUWV2cnJCdlY4alJwaDdwWjgva1VkL1NhWFhsMnhadTZmYWNE?=
 =?utf-8?B?MDdjZXAyWmlrbTVZa0NhRkYwRHdnYlV4WFlPWWk0ejZIZzVmeXRHRTR4emRl?=
 =?utf-8?B?UjRsSjlKc0g1QzNQdzltRHdPdEdnRDIrSHZyRnJHZVhucHppSlcrTmg4Zklx?=
 =?utf-8?B?ZDBPWEszdzY0MUNJcU40MHlBZWxPaEJiZEVlY0ZOWTQvZElBZXJoaHJIbGh1?=
 =?utf-8?B?QU9QVUxLU0RpME9VdXdNRFNTVHlwTGNPNGswZDNmMlFnNjdIdnJPd2xxMzZY?=
 =?utf-8?B?K0EweUJzMEM0NG5tcHdGNW5pZU9GZWx3ZXdEbUxVRnU1SDl0NU5wZGhobFdC?=
 =?utf-8?B?NjQxeS81dDFGWTNvSEFFR1RwTG9IcHp0YXlPTXFYZm1wakpRUUp6ZXA0d0Yy?=
 =?utf-8?B?ZndNOFI4eDUwTkxTZC9qUFZRSitCYUw0UUp4dWF4a0JwZ2dKdXloVjN5OTll?=
 =?utf-8?B?cXVPR1R0bVV4UDJTTnJVa3BUNk9OcjZHZEpiZThld0N2RUo4SXpVMFlCbHcr?=
 =?utf-8?B?NmIyVG9ZbGpvbk5lSFlnZGNoeFV2dnhZUWZ4QnBZei9EbE9CL3ZlSlFTQTdi?=
 =?utf-8?B?dlNnWCtaTFpQdDRMWU9HbXBzTStWSlZBandnK0V6c1FsTWtOeGM4UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7920.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20bff39-15fb-4325-6ba0-08df45516ef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 08:53:36.5918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0IietHEDRqY+0dej/puJGIN1F89xqW1a5s8yUIOQtbIQGyBLNF7o0wiAbutj8lirIOf/3ACOSkBuMYSczwatCUqYfgDAy+IwJiPY9shTFUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005346_060311_3E5F71E2 
X-CRM114-Status: GOOD (  39.73  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzMyAwLzVdIEFkZCBBU1BFRUQgQVNUMjYwMCBJMkMgY29u
dHJvbGxlciBkcml2ZXINCj4gDQo+IE9uIFdlZCwgTm92IDE4LCAyMDI2IGF0IDA4OjE0OjUxQU0g
KzAwMDAsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBIaSBBbmR5LA0KPiA+DQo+ID4gVGhpcyBwYXRj
aCBzZXJpZXMgaGFzIGJlZW4gc3RhYmxlIGluIG91ciB0ZXN0aW5nIG9uIEFTVDI2MDAgaGFyZHdh
cmUsDQo+ID4gYW5kIHdlIGhhdmUgYWxzbyByZWNlaXZlZCBwb3NpdGl2ZSBmZWVkYmFjayBmcm9t
IGN1c3RvbWVyIHRlc3RpbmcuDQo+ID4gVGhlIGlzc3VlcyBpZGVudGlmaWVkIGJ5IFNhc2hpa28g
aGF2ZSBhbHNvIGJlZW4gYWRkcmVzc2VkLg0KPiA+IEkgcGxhbiB0byByZWJhc2UgdGhlIHNlcmll
cyBvbnRvIHRoZSBsYXRlc3QgdXBzdHJlYW0ga2VybmVsIGFuZCBzdWJtaXQgdjM0Lg0KPiA+IEJl
Zm9yZSBkb2luZyBzbywgSSB3b3VsZCBhcHByZWNpYXRlIHlvdXIgZmVlZGJhY2sgb24gd2hldGhl
ciB0aGVyZSBhcmUNCj4gPiBhbnkgcmVtYWluaW5nIGNvbmNlcm5zIG9yIGJsb2NrZXJzIHRoYXQg
d2Ugc2hvdWxkIGFkZHJlc3MuDQo+ID4NCj4gPiBJZiB0aGVyZSBhcmUgbm8gb3V0c3RhbmRpbmcg
aXNzdWVzLCBJIGhvcGUgdGhlIHNlcmllcyBjYW4gYmUNCj4gPiBjb25zaWRlcmVkIGZvciBtZXJn
aW5nIGFmdGVyIHRoZSBuZXh0IHJldmlldy4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciB0aW1l
IGFuZCBzdXBwb3J0Lg0KPiANCj4gQXJlIHlvdSBhc2tpbmcgbWUgb3IgQW5kaSBTaHl0aT8NCj4g
SWYgaXQgd2FzIHRvIG1lLCBJIGhhdmUgbm8gdGltZSBmb3IgdGhpcyByaWdodCBub3csIHNvcnJ5
Lg0KDQpUaGFua3MgZm9yIHlvdXIgcmVzcG9uc2UuDQpXb3VsZCB5b3UgaGFwcGVuIHRvIGtub3cg
YW55b25lIGVsc2Ugd2hvIG1pZ2h0IGhhdmUgdGltZSB0byByZXZpZXcgaXQ/DQoNCkJlc3QgcmVn
YXJkcywNClJ5YW4NCg0KPiANCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MzMgMC81XSBBZGQgQVNQ
RUVEIEFTVDI2MDAgSTJDIGNvbnRyb2xsZXIgZHJpdmVyDQo+ID4gPg0KPiA+ID4gVGhpcyBzZXJp
ZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgQVNUMjYwMCBJMkMgY29udHJvbGxlciDigJxuZXcgcmVn
aXN0ZXIgc2V04oCdDQo+ID4gPiBpbXBsZW1lbnRhdGlvbi4NCj4gPiA+DQo+ID4gPiBUaGUgQVNU
MjYwMCBJMkMgY29udHJvbGxlciBpbnRyb2R1Y2VzIGEgcmV2aXNlZCByZWdpc3RlciBsYXlvdXQN
Cj4gPiA+IHdoaWNoIHNlcGFyYXRlcyBjb250cm9sbGVyIGFuZCB0YXJnZXQgZnVuY3Rpb25hbGl0
eSBpbnRvIGRpc3RpbmN0DQo+ID4gPiByZWdpc3RlciBibG9ja3MsIGFuZCBleHRlbmRzIGNsb2Nr
IGRpdmlkZXIgY29uZmlndXJhdGlvbiBhbmQNCj4gPiA+IHBhY2tldC1iYXNlZCB0cmFuc2ZlciBz
dXBwb3J0IGNvbXBhcmVkIHRvIHRoZSBsZWdhY3kgbWl4ZWQgcmVnaXN0ZXINCj4gbGF5b3V0IHVz
ZWQgb24gZWFybGllciBBU1BFRUQgU29Dcy4NCj4gPiA+DQo+ID4gPiBUaGUgY3VycmVudCBkcml2
ZXIgaW1wbGVtZW50YXRpb24gZm9yIHRoZSBBU1QyNjAwIEkyQyBwZXJpcGhlcmFsIGlzDQo+ID4g
PiB0aHJvdWdoIHRoZSBoYXJkd2FyZSdzICJjb21wYXRpYmlsaXR5IG1vZGUiLCB3aGljaCBleHBv
c2VzIGENCj4gPiA+IHJlZ2lzdGVyIHNldCB0aGF0IG1hdGNoZXMgdGhlIHByZXZpb3VzIGdlbmVy
YXRpb24gaGFyZHdhcmUgKEFTVDI1MDAgYW5kDQo+IGVhcmxpZXIpLg0KPiA+ID4NCj4gPiA+IElu
c3RlYWQsIGFkZCBhIGRyaXZlciB0aGF0IHdvcmtzIGluIG5ldy1yZWdpc3Rlci1zZXQgbW9kZSwg
dG8gYWxsb3cNCj4gPiA+IHRoZSBuZXcgZmVhdHVyZXMsIGFuZCB3aWxsIHByb3ZpZGUgc3VwcG9y
dCBmb3IgZnV0dXJlIGhhcmR3YXJlIHRoYXQNCj4gPiA+IHdpbGwgbm90IGltcGxlbWVudCBjb21w
YXRpYmlsaXR5IG1vZGUuDQo+ID4gPg0KPiA+ID4gSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGUgbmV3
IG1vZGUsIHdlIG5lZWQgYSBEVCBiaW5kaW5nIGNoYW5nZSB0bw0KPiA+ID4gcmVmbGVjdCB0aGUg
cmVmZXJlbmNlIHRvIHRoZSBnbG9iYWwgcmVnaXN0ZXIgc2V0LiBTaW5jZSB0aGUgYmluZGluZw0K
PiA+ID4gc3RpbGwgcmVwcmVzZW50cyB0aGUgc2FtZQ0KPiA+ID4gKEFTVDI2MDAgU29DKSBwaHlz
aWNhbCBoYXJkd2FyZSwgd2UgY29udGludWUgdG8gdXNlIHRoZSBleGlzdGluZw0KPiA+ID4gY29t
cGF0aWJsZSBzdHJpbmcgb2YgImFzcGVlZCxhc3QyNjAwLWkyYy1idXMiLg0KPiA+ID4NCj4gPiA+
IEhvd2V2ZXI6IHNpbmNlIHdlJ3JlIGNoYW5naW5nIHNlbWFudGljcyBmb3IgYW4gZXhpc3Rpbmcg
YmluZGluZywgd2UNCj4gPiA+IGFsbG93IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IGJ5IHNlbGVj
dGluZyBvbiBwcmVzZW5jZS9hYnNlbmNlIG9mDQo+ID4gPiB0aGUgbmV3bHktYWRkZWQgcHJvcGVy
dGllcywgYW5kIGZhbGwgYmFjayB0byB0aGUgb2xkIGRyaXZlciAoaWUuLCBpbg0KPiA+ID4gY29t
cGF0aWJpbGl0eSBtb2RlKSB3aGVuIHdlIGRldGVjdCBhIERUIHVzaW5nIHRoZSBvbGQgYmluZGlu
ZyBzcGVjLg0KPiA+ID4NCj4gPiA+IFNwZWNpZmljYWxseToNCj4gPiA+DQo+ID4gPiAtIGFzdDI2
MDAtaTJjLWJ1cyBub2RlcyB0aGF0IHByb3ZpZGUgdGhlIGBhc3BlZWQsZ2xvYmFsLXJlZ3NgIHBy
b3BlcnR5DQo+ID4gPiAgIChwcmVzZW50IGluIHRoZSBuZXcgYmluZGluZyBhbmQgYWJzZW50IGlu
IHRoZSBsZWdhY3kgYmluZGluZykgd2lsbCBiZQ0KPiA+ID4gICBzdWNjZXNzZnVsbHkgcHJvYmVk
IGJ5IHRoZSBuZXcgZHJpdmVyDQo+ID4gPg0KPiA+ID4gLSBhc3QyNjAwLWkyYy1idXMgbm9kZXMg
d2l0aG91dCBgYXNwZWVkLGdsb2JhbC1yZWdzYCBjb250aW51ZSB0byB1c2UgdGhlDQo+ID4gPiAg
IGV4aXN0aW5nIGRyaXZlciAoaW4gbGVnYWN5IHJlZ2lzdGVyIG1vZGUpLCBlbnN1cmluZyB0aGF0
IHBsYXRmb3Jtcw0KPiA+ID4gICB3aXRoIHRoZSBjdXJyZW50IERUQnMgcmVtYWluIGZ1bmN0aW9u
YWwNCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCj4g
DQoNCg==

