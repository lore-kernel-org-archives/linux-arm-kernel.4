Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5C1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=giS25ksI;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gzYFh9wJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DJMBmjs9NE/NFUBMmFplzv6ox1ChrxJQr/9OOuF/C/k=; b=giS25ksIFFT6dwSXwRAECl6uYW
	wEemDpv+zXAlIUDJ5+ZQJ1VutCBnpnPEa/s2WQm/qa+G0+1xfCg8lWC+w8wVDxFFIE2GxPwmgGagP
	V3OiXqy1W9YmLCEH1jryA9nhLZDMtJjJLdaLXcNKi05IOoNfpAGhNaDCZ9d3ssugo/+XY5Cu8kE/i
	c35qABM2gImz8qgqoAETAgiFDWLGPoOrZIaNNQ3CLiDfDHiDylbP+m9t1f69mQGwBukpImOyvBQOZ
	QWX6zC42NNR2FC2zSRlP3Wew0XA8aR1OIaHtJabZmHWkyBqJdITZLUSZ7t/XK3dNrXhe2bLvLOd+u
	4iN6uFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEgA-0000000H5fP-3gct;
	Mon, 09 Nov 2026 02:00:14 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEg7-0000000H5ev-45da
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miUow2NLl71muJviOaVGkhFcs9ZwwnaQJVCmDUhB6f1ueDR2UVUJ/fYDPLqw5H+bWi9WJ53UX89n3g/NBIefbzPY4/VVlCXTikH42PIJNkT7rGNW/7RpaptBmDyPYmYAyffYig9lHi/maPsMAEdQ40w7Ej2fWzMK6zzrcu7HImhP9RjUlQvqGBx9NBOOhXQ5hO+AuMLJJ31AtwUSUcOpN8q4MXAPaa7HMN26FCaTCsseUjAa86wDj8nvM5T1/TloQxQRdSfbDq8KRUz6IhisPu7rfrdo0Rt06hYtoZxvrWvKBTrrnQE7opUy2c3Djm2mrOOPLywUteCfqcjm9qLdnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJMBmjs9NE/NFUBMmFplzv6ox1ChrxJQr/9OOuF/C/k=;
 b=IR+Dybm5aAZ0dWzeQVN8Nglfs0JA21FM4M6DmfwLD0Lll+YtsSzoLk2aj0F9HESDXDJTVBqLmLVqBcLDztWLXR2NGWIiDRHg4ZafwPX5IoXztUBCTgquAW3F0WPx97G+j2lxzP0JvEI5sjwAt099YTyTTEiylRszdaebkXq0Hw2QrLIfjkku9tYxTxoGJxqSZCWMQSX4iT4VsQzAS20dEOmhAqhPY380JfiYIk2pbAJiw2KzR6kFGouzeSqaqL80gHiuWuSXzjolACuexvq6lRKnYR56NdA+85UcG3qqNVpL6Y3RDT+HHJMzOF/YtV5Iv6kYMoNJiNMyMgbISAKIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJMBmjs9NE/NFUBMmFplzv6ox1ChrxJQr/9OOuF/C/k=;
 b=gzYFh9wJhCiVKq6ehI9ZGcRvoKZGc2SfGTfEiCrIW9hLXvFy/ut2Fw01B9z4/khMaqM6CT8u+zC04jQ+eiRL0krjsM7QtEtJrTfkbqUxeS7MxdcHHNbsLJj1ZVqoPzD4DxnDfEzNp4IVcFDUWnBZCWewGuHK/Aq/e1XeFDmw613WDZbHd+BWFOlLGQp6yjqdnreK08sDdDmL/FJrkhW+KeKXFH7BxEPNuV54uIEExJwFv4NBk53rA8FiYX7bFKMNiwKjHpqK3ADqdlzmc9SQgvgGGoHUwRhK1T74l1gJOqF9S0VI/rJAnuQwKom1JT2MBYVGRQlEO0sc74fp9N4HMA==
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by PA1PR04MB10913.eurprd04.prod.outlook.com
 (2603:10a6:102:484::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 02:00:00 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 01:59:59 +0000
From: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "Hongxing Zhu (OSS)"
	<hongxing.zhu@oss.nxp.com>
CC: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "jingoohan1@gmail.com"
	<jingoohan1@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Subject: RE: [PATCH v1] PCI: imx6: Enable L1SS support when supports_clkreq is
 true
Thread-Topic: [PATCH v1] PCI: imx6: Enable L1SS support when supports_clkreq
 is true
Thread-Index: AQHdbc1FA6CcrOhCkUaPCNmawxihnrcg9EGAgAQMEXA=
Date: Mon, 9 Nov 2026 01:59:59 +0000
Message-ID: <GV2PR04MB120197A63428B4142714A8F148C732@GV2PR04MB12019.eurprd04.prod.outlook.com>
References: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
 <CAOMZO5CQtcpb04Vp49Rg_+DHoozRpQthW3_YNAYQHqi=VOmpEg@mail.gmail.com>
In-Reply-To: <CAOMZO5CQtcpb04Vp49Rg_+DHoozRpQthW3_YNAYQHqi=VOmpEg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR04MB12019:EE_|PA1PR04MB10913:EE_
x-ms-office365-filtering-correlation-id: a19d8d92-c15f-4e2c-62ca-08df3e052921
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|10067099003|38070700021|56012099006|4143699003|11063799006|261028144727099003|261026121527099003|261102123227099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003;
x-microsoft-antispam-message-info: srUQYDvC7D+mSoKz2i7kK4RFTT9PE81euXiEGI3YxjVnD9smlhfU3KHQWLcgb2Gkxs5m1nlPHJjarmgJNaa8F42XEc9HwRK7DU6wNwkyx2pZfN8qkeeYO/qVU5H+hZ9CneI3UTnkubNKWV9gSIy0+8kIVlvTKXaQ8dmjcfD+4iYKX2shjTDWlbpKko6D6WCSfyPR/F9+2Twlk8EN6WU8Bb9/4hnnMZp6DeSfyJHlDn1msMf8F/i46rnc3LhhFScndur3Ku3K5rK1RJb/nfbe2pwgxXqqlMgEJh6HW8Z1oXGvz+e7CmN71DmmuKP3frZgBySHoGLv1euzbF/uLelAT34QfTNHoBfVkBpfmAWvSRDr5dgePPqIDV/CGKAJ3pVIoGF520s/agMrN7O16zPvfHG4/7/w8ClhK5SflCIg8V8fckESnDyoMAx07kVC8aNuAIHENQkWx6ZG8XMyuIRljf9PJkSEJVSDrbRqrc8TpNORONQu+HXYufFLftcjhn4M7QcDksKtJZgKq8oCtONwBiSoS16mi3kQ6wzCiRmhdpSmPiZMR5HGsvZRkNpOG47X1cF9OoWYNRH7dyqCaZOExXwLVRUBYVTdlk38iS3xLrrEE33q/VpItfxNprBXXUhaOVkR4U3kEE13fIlWtH9HAcM09ynhBzPz5hh0cxxDXd/6naK+0Xo+O9mco1g29pd2aq2Rzu6NUna2hPCjRnDUN2xbaNyEBzDcRduIsnr6OO0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(38070700021)(56012099006)(4143699003)(11063799006)(261028144727099003)(261026121527099003)(261102123227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3J3UlV6YzNBS0s4ZmVyQXpXZ3ZkVnZ6Vy9TM3g3U01WSmZ1MWNOUElLK3U2?=
 =?utf-8?B?SnNpbWM4UHF1MkRlMHNwbjdFRnZvM0VsNTNXbGdXaWVFU29INUFvUlcwOXlK?=
 =?utf-8?B?b2pWcHo3bk9XUTdYMFJHZHdPVGFBUHgwRGpoSStzL1dvRjAwNTVueXZQdUds?=
 =?utf-8?B?Z21vU3lyT2VQb0J2Wm9JL3RlZFlXc1BYb1g4VFVkVkhQeWU4N0Ixb1NZeGhh?=
 =?utf-8?B?SkJvc2VWempheVc0UU9SeU9YMGxTOE5XbUQvWHJwc2NMS2xrQkRsVndYY3Na?=
 =?utf-8?B?RzJzSDUzSnRXVzRuclJ0TjNPNHJXQ2JKc29BaUJZMDRrUHNWSkNMN2owN2s4?=
 =?utf-8?B?dlRNOW8rSFViTFkwbjZ5dzNCU05WYXBlNlJ4VmNSTERwdEJxSTh4dklGUWtU?=
 =?utf-8?B?dkYySm1oYTQ1aCtlM01ya05SQVFiVzY2bDZEZlNSbmlTNTAvRkdlRGdZVDhs?=
 =?utf-8?B?OVJEMGdmdEpCdlRJNEE5bFpRRzl4eDkvTXZqMG5KUTluekZWVGQyM1UyOEgv?=
 =?utf-8?B?RmJjR3AxMFdJYm9hR0xvU2g3amViS2VaakJhOGYzZE8yV2pOaGk5S3JGWEpq?=
 =?utf-8?B?Wjl2ZytoMVNaV3hTNUpPaEVxdkc0NXhZcy95UTRLcXoyVGRoeXMvZXdHdVVE?=
 =?utf-8?B?V0w3b3F0VUtJMmpjRFg1R0NUdXMvazkyeS9JMEpTSnhLMVROb3JyYW1OejFh?=
 =?utf-8?B?NW9DMWFublVjdzhZWGhhYkZKQTlHcEVPK2VFQ0dNS2FhTW5FV2pMS3lFaDRY?=
 =?utf-8?B?UDNIRWF3NFlwWVc1MVJWYzZrS3JIQ1VsYyswOVVQeW8vZEFnUGNZMlFoT1Jq?=
 =?utf-8?B?K1JvdzJKeFhlMHdaREUzWmxlbEFjU3ZCWXJsY09rQWhPc3BtWDFFNFdmdCs1?=
 =?utf-8?B?UVdqa1BoeVNvYlRUdnc2MnFxUmIrL1RWM3NzemJMRlRmS0RLOWhTUWx3eEdz?=
 =?utf-8?B?QXRDL2RjUWI1R1VFM2FIcUViVEpLRGRINTh0NHhKc0NqWDUwNFpwQkxEVUYw?=
 =?utf-8?B?UUdpaGZkc2Y3REZSRjFRM3N4YnNjaE1HZDFrUFdCeW4wRnhvM0xNaU95STB4?=
 =?utf-8?B?aHViL2lqc1RZM2E1RTBGQ294WXVnYmZNTmlzYllWNWRPWllHQTRHbm1ZMFB2?=
 =?utf-8?B?a2tyWVlGZzdiQ3R5bkoybURsSnJ4S3lURXR3L1RESS9jaU0xYnlHRnVtR1RR?=
 =?utf-8?B?ZXNyQkc1Z3RHMm5rWTFzc1ZzWGJQTWdjSWErK2UxcUx2aVV2R2UxTUluRC82?=
 =?utf-8?B?U3RpcG9vTnFJMW9QUnp3S2VIQk9NNlAwaUo0ZU1YOVdMV0Q5Y1gyREJxVkVT?=
 =?utf-8?B?WC8xZEYxWERFRlVEdWZ2UTgwRUtnK3A4cUFHYVFQQnhYSFBseFlQNTVwQ3B3?=
 =?utf-8?B?QnA1ME1KMGJlMlJRY3haSzlTN1VmV2JRcjNuZDBCSmRFZGRLbDl0VHFVTUZh?=
 =?utf-8?B?dG5sVkR3eDFVdmE1YUxNZVZTaXhqN2pjNEVaVDFia2dHSld4N3k3SkdWa08v?=
 =?utf-8?B?Zk8vZWxHZ1QvRzVtYlRIUkVJZFlLTUhINkFhVlJNSHI4TlFOU2p1NG9EN2x1?=
 =?utf-8?B?NVFCRVg1YmZnMzhJTUhHWTA5Q3F0Nktlc2d4TXFURlprRlR1aFpkN09uQ0VR?=
 =?utf-8?B?bG5oamJxay91bGtuMCtDaUtOa3IrbERtVUhPcDNXUGxscUpxNGdEMHF3WTQ0?=
 =?utf-8?B?aitxalJiM25aY2tVWDFINy9TemZyQUY0NjVab05FRjB2aEpNaFJLeUZ2YkV4?=
 =?utf-8?B?c0gxdU90UHFsMktsSUlCTjJwM0hIUzg1MXdjNmhOeXJJTnZ5ZVVqTG9yK2tm?=
 =?utf-8?B?STB1SWZvT0swWEtJcHlFajNJL2NLbDBnNWlKSjNRZHlDdE1oMjNjRFpNRWRy?=
 =?utf-8?B?MDY5a1plbjRoRnlxQjJSTVdxQmVWdkxFenZhdTNRbTNNZ25qY2ZOaEFhYzVt?=
 =?utf-8?B?eG54bXZYeUp2LzJvOG80d09RbFpMS0xCemROenlzZWViSnB1VDBqRzFmMWhm?=
 =?utf-8?B?bjNoQVdHeTcwZkIxZ3FOK1pRZG5qMjNhelU1cjNnTXFyelA1YUxaUDZ6QWZR?=
 =?utf-8?B?ZkxtVUs4WEFhWjNjSTNIRTcwTDBmM0RRcGwybFpGSzh4ckhGN2xwVG9vMStV?=
 =?utf-8?B?UEdJbm9nSXZZbVdmcllJbGIyOFpLZmRSellsNWVpbHFDZ21FN3RaRzZPUHU1?=
 =?utf-8?B?REwveGtSZjBkT1JRM2o5R2hsbUxPTnA5Ym9sMVdNdks1eUl5Ukt4c1BhQjhI?=
 =?utf-8?B?SUhuN0pjNnk4c2FCM28wU25kaHB3RUNoR2hKUEFjR0hCRUN4aWRiclRTeTNF?=
 =?utf-8?B?RURuWmtxOG55Qnh5S3MyZDBPVU4xVnlBS2h2eWQzRTg3SlB3WXV1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19d8d92-c15f-4e2c-62ca-08df3e052921
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 01:59:59.5249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7ErRSCoEh71b5X93rkipcyXCITGyH4xUTplVx5+yDVBhwrkIIWeE0GSK5n58xH7/nI6b25fFkUXwwIx9KxYvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10913
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_180012_060664_EAE847FD 
X-CRM114-Status: GOOD (  18.44  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0
ZXZhbUBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgNiwgMjAyNiA4OjExIFBN
DQo+IFRvOiBIb25neGluZyBaaHUgKE9TUykgPGhvbmd4aW5nLnpodUBvc3MubnhwLmNvbT4NCj4g
Q2M6IEZyYW5rIExpIChPU1MpIDxmcmFuay5saUBvc3MubnhwLmNvbT47IGppbmdvb2hhbjFAZ21h
aWwuY29tOw0KPiBsLnN0YWNoQHBlbmd1dHJvbml4LmRlOyBscGllcmFsaXNpQGtlcm5lbC5vcmc7
IGt3aWxjenluc2tpQGtlcm5lbC5vcmc7DQo+IG1hbmlAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwu
b3JnOyBiaGVsZ2Fhc0Bnb29nbGUuY29tOw0KPiBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBrZXJu
ZWxAcGVuZ3V0cm9uaXguZGU7IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgt
DQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEhvbmd4aW5nIFpodSA8aG9uZ3hpbmcuemh1QG54
cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIFBDSTogaW14NjogRW5hYmxlIEwxU1Mg
c3VwcG9ydCB3aGVuIHN1cHBvcnRzX2Nsa3JlcQ0KPiBpcyB0cnVlDQo+IA0KPiBPbiBGcmksIE5v
diA2LCAyMDI2IGF0IDY6MDDigK9BTSA8aG9uZ3hpbmcuemh1QG9zcy5ueHAuY29tPiB3cm90ZToN
Cj4gPg0KPiA+IEZyb206IFJpY2hhcmQgWmh1IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gPg0K
PiA+IEFkZCBzdXBwb3J0IEwxU1Mgc3VwcG9ydCBmb3IgdGhlIGkuTVg2IFBDSWUgY29udHJvbGxl
ciB3aGVuIHRoZQ0KPiA+IGBzdXBwb3J0c19jbGtyZXFgIGZsYWcgaXMgc2V0Lg0KPiANCj4gUGxl
YXNlIGV4cGxhaW4gd2h5IHRoaXMgaXMgbmVlZGVkLg0KPiANCj4gQWxzbywgZG9lcyBpdCBuZWVk
IGEgRml4ZXMgdGFnPyANCkhpIEZhYmlvOg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KVGhl
IGNoYW5nZSBpcyBpbnRlbmRlZCB0byBlbmFibGUgTDFTUyBmb3IgdGhlIGkuTVg2IFBDSWUgY29u
dHJvbGxlciB3aGVuIHRoZQ0Kc3VwcG9ydHNfY2xrcmVxIGZsYWcgaXMgc2V0Lg0KDQpUaGUgY29t
bWl0IGEwMGJiYTQwNmI1YSAoIlBDSTogZHdjOiBBZHZlcnRpc2UgTDEgUE0gU3Vic3RhdGVzIG9u
bHkgaWYgZHJpdmVyDQpyZXF1ZXN0cyBpdCIpIGludHJvZHVjZWQgYSBtZWNoYW5pc20gdGhhdCBj
bGVhcnMgdGhlIEwxU1MgY2FwYWJpbGl0aWVzIGJ5DQpkZWZhdWx0LiBIb3dldmVyLCB0aGUgaS5N
WCBQQ0llIGNvbnRyb2xsZXIgaW5oZXJlbnRseSBzdXBwb3J0cyBMMVNTLCBhcw0KaW5kaWNhdGVk
IGJ5IHRoZSBzZXR0aW5ncyBpbiB0aGUgTDFTUyBjYXBhYmlsaXRpZXMgcmVnaXN0ZXIuDQoNCkJ5
IHNldHRpbmcgZHdfcGNpZS5sMXNzX3N1cHBvcnQgdG8gdHJ1ZSB3aGVuIHN1cHBvcnRzX2Nsa3Jl
cSBpcyB0cnVlLCB3ZQ0KZW5zdXJlIHRoYXQgdGhlIGkuTVg2IFBDSWUgY29udHJvbGxlciBjYW4g
cHJvcGVybHkgdXRpbGl6ZSBMMVNTLCBhbGxvd2luZyB0aGUNClBDSWUgZW5kcG9pbnQgdG8gZW50
ZXIgbG93LXBvd2VyIHN0YXRlcyBlZmZpY2llbnRseSB3aGVuIHRoZSBsaW5rIGlzIG5vdCBpbg0K
dXNlLiBUaGlzIG9wdGltaXphdGlvbiBpcyBjcnVjaWFsIGZvciBwb3dlciBtYW5hZ2VtZW50IGFu
ZCBlbmVyZ3kgZWZmaWNpZW5jeQ0Kb24gaS5NWDYtYmFzZWQgcGxhdGZvcm1zLg0KDQpBIEZpeGVz
IHRhZyBpcyBub3QgcmVxdWlyZWQgZm9yIHRoaXMgY2hhbmdlIGJlY2F1c2UgaXQgaXMgbm90IGFk
ZHJlc3NpbmcgYQ0Kc3BlY2lmaWMgYnVnIG9yIGlzc3VlIHRyYWNrZWQgaW4gYSBwcmV2aW91cyBj
b21taXQuIEluc3RlYWQsIHRoaXMgY2hhbmdlIGlzDQplbmhhbmNpbmcgdGhlIGV4aXN0aW5nIGZ1
bmN0aW9uYWxpdHkgdG8gYmV0dGVyIGFsaWduIHdpdGggdGhlIGkuTVg2IFBDSWUNCmNvbnRyb2xs
ZXLigJlzIGNhcGFiaWxpdGllcy4NCg0KSG93IGFib3V0IHRvIHVwZGF0ZSB0aGUgY29tbWl0IGFz
IGJlbG93Pw0KRW5hYmxlIEwxU1MgZm9yIHRoZSBpLk1YNiBQQ0llIGNvbnRyb2xsZXIgd2hlbiB0
aGUgYHN1cHBvcnRzX2Nsa3JlcWAgZmxhZyBpcw0Kc2V0LiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUg
UENJZSBlbmRwb2ludCBjYW4gZW50ZXIgbG93LXBvd2VyIHN0YXRlcw0KZWZmaWNpZW50bHkgd2hl
biB0aGUgbGluayBpcyBub3QgaW4gdXNlLg0KDQpUaGUgY29tbWl0IGEwMGJiYTQwNmI1YSAoIlBD
STogZHdjOiBBZHZlcnRpc2UgTDEgUE0gU3Vic3RhdGVzIG9ubHkgaWYNCmRyaXZlciByZXF1ZXN0
cyBpdCIpIGNsZWFycyBMMVNTIGNhcGFiaWxpdGllcyBieSBkZWZhdWx0LiBIb3dldmVyLCB0aGUN
CmkuTVggUENJZSBjb250cm9sbGVyIHN1cHBvcnRzIEwxU1MgYXMgaW5kaWNhdGVkIGJ5IHRoZSBz
ZXR0aW5ncyBpbiB0aGUgTDFTUw0KY2FwYWJpbGl0aWVzIHJlZ2lzdGVyLiBCeSBzZXR0aW5nIGBk
d19wY2llLmwxc3Nfc3VwcG9ydGAgdG8gdHJ1ZSB3aGVuDQpgc3VwcG9ydHNfY2xrcmVxYCBpcyB0
cnVlLCBlbmFibGUgcHJvcGVyIHV0aWxpemF0aW9uIG9mIEwxU1MgZm9yIGkuTVg2IFBDSWUNCmNv
bmZpZ3VyYXRpb25zLg0KDQpCZXN0IFJlZ2FyZHMNClJpY2hhcmQgWmh1DQoNCg==

