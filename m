Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ECA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wis9jypH;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IrIp5JEl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qeQp1wisiQ5PIuUYsIhyV3xmd5MuP/0N0dRhOhb/F8k=; b=wis9jypHWQUXgrHe4r30mFS3Fc
	Vu+urEpnkdKW+J2Q4Eh8Et8HxvEdd1XHYTFD5MNLatHUgF3w80yajGu++l0Zo76Oun1ObnuoMUSZ6
	jmUJR28Hra9S2R8+eY/lfAuclXgye1m0MA0ZSsFo0KHX+o4ZzqUs84ojR0Yu9IYMUmoKERjGqHMEt
	A3IKTsshSakvr0ULK2nIiJHVn9iIpIKQlaNTzJ55SxtE8zpw8VvjeZMlCCL9wFIjiOw7FdFmNhW+z
	0j0Q4htkH9LzqGUoe31ECoxN1AZyN2pkRHPrMLD27TiBriBTDo11na6YMwxlDPWEZGy8JjipFQwVP
	NsejEVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT8M-00000003MAf-3duZ;
	Mon, 23 Nov 2026 12:26:58 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT8J-00000003M9t-0uG3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:26:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIljABagW/ihX8GavO5eGVx2cFPbGWi7169Q4bXcRN/QGnmiO+/Yn0Lr+tQRhcKklMULdpR1zeIUzAtjVirJa1ODifD3eqoGOxe9v8Wwt/t8ByzuRLLuh0kdJ1UK90VSKlwIfoUIRePJ7AbB6Houey5QV6k8hHoWVcdm7suDKqYcr/31aE05t0ftGQk5XkTStI2QIkYZGABF9bkw92Ah1YQGUyqEGWRM0m5/nLcW6cZl+yOFCVKUl3wiozkpqReNaWgiI5gpx/dKiR/Y8zLm5sfxEl+XcJQwPEAWOgS7ak7HlrqNjLAbYMRgk+6PwkuCu0gD7kCZWUuJJs5MIPm6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeQp1wisiQ5PIuUYsIhyV3xmd5MuP/0N0dRhOhb/F8k=;
 b=cKpN1GIfqpJNFMNen+0VWAtWRyxbDwyH8YBY39IdSeqf340WkcrEk27oMdaCqS9Xs/lal+qwUAVRQvnhcb6IbopCEnNmqKILBaG8Tw1rkt8wkSi/EY6piVQkeIb/JKF+DK1efgxZAWJCYGoOKeZVgW55nXlfaAtt41yUokjQHtFbeMnBUzMzAXT1tT/QJm7hTdT0k6l8xHnRcaKmYOU+Q3opNw5yFtAs2J8AvS6u/6pqg1uTdEhsYuyNelHK6i7NWIBYofcCn+weNAvXFm6y3Mx2P2Hja0tf2kXHheDM6HBeP0/E4xAtxieNEeJfsSSwEnNHQeCvj3FYfKYRvUYD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeQp1wisiQ5PIuUYsIhyV3xmd5MuP/0N0dRhOhb/F8k=;
 b=IrIp5JElD1mo89WiCt/rhULN8bPVPfdhZvRFj8dDn7/dsn9vV6hx/NPMOdWu0XBV3r/Rr09lZxrpP3PQLac902A1o8CKfeZy8RAc6wb6G66OgzK7ij1ZkNiNxOFVZMQddVBtd/6C5XDTP2991U/Q4sbBye40xqs3VkrDQdZcI5L2e6q0Mb1cgjsYgOhwNsntDExQbKLRpL99WCJCQXXc3weTV69GebltZR5VCG2S5fmx9RVSWzsSZHQFn8Ll1w6tAk8Xmv4TJFfI7LufHQ3NTsgkxtW6oj+mGanyPMs2FrGxhoYhMZwIw3CmX818YUs5OesWLq0hF2IvHPb9rMmO9w==
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:b10:105::21) by DB8P195MB0710.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:155::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:26:42 +0000
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893]) by BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:26:42 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Benjamin
 Hahn <B.Hahn@phytec.de>, Christian Hemp <C.Hemp@phytec.de>, Jan Remmet
	<J.Remmet@phytec.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus FPSC
Thread-Topic: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus
 FPSC
Thread-Index: AQHddbkBN6rr+J+coEe4H0CDnunHyrc3DkAAgASSF4A=
Date: Mon, 23 Nov 2026 12:26:41 +0000
Message-ID: <ecec2b828550453f08e3b4900ad6149cecf5dae3.camel@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
	 <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
	 <20261120-successful-amiable-porcupine-cef7ae@quoll>
In-Reply-To: <20261120-successful-amiable-porcupine-cef7ae@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BESP195MB976599:EE_|DB8P195MB0710:EE_
x-ms-office365-filtering-correlation-id: 70e3af5f-945a-4305-27c4-08df495d07ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|38070700021|10067099003|56012099006|11063799006|4143699003|261026121527099003|261022075727099003|261021123027099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: rSQTAUoyOz5vmzaMyV2sDRCg0cbqL5e/vJoRAG+53lP54Qd1jREW4EA+KlKG4aWOZ5oZgr/en+lerE7YhYhS6QFFNKRY3DIbQK7POCpyQ80yBrjsSD3I/OfecWZBGddsXHcGStoCy34GTuP/mazSPRoUQMokt7RpGEJBoLdg2u2NYVoL8UbCCmYaD5nPEHeJl+M1jNTULbwbBEjtwz2jrPYU6avD8kfWPd4lQ/3hMMohfySrydyxnzCJe5j+yIKxvM9Qg8tY7MIM7YIv/wEPbeG06nxUFxHeu90ald8mXNPDdn2AH9IqDOboKtC+vqo88VKL+t+3ZQHUmBnN9ADaYSsDxJgNF1ZbFEDKfGbooL66XQXJ/jyxSTKTLY/g463KphPLvCeHEXM88c7T8weaC2Ev4FCXW46FLs996I1fFZUz28ZN4NmiMiy2a444LbNcAB+Vv+BxN5tNEc54X1ls8B2mh6k+dFz/mAtAT7WY99XC95JRmPLVsUu7ril0gyhbgsh9cojDNYSG+h6Wj1WbCgMxFxdBnjvANm/Wddu87mZOMA9qbO4IYu7FOD4sllUoNP2ZFLVVptTFYKS8IrIaos5baEnF1CFDe2h0HlVSmy89aCj/+qgsR/XcCbtaMUTrevlxKSH6q2BNq+CR8JoLs+tcD7CmlGgysYQtK0JFZG8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP195MB976599.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261022075727099003)(261021123027099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1ZEV040T1NQSUVLeDJ2TkEzejdVYk5aZWdwU24rU2hRNHJkaFlINnNkR2pN?=
 =?utf-8?B?cmdheWtISDFCVDA2YzVGRG95UG01b3hQb1FwWmd3T0J1cTE2aUtReUhDeUww?=
 =?utf-8?B?dlhRTjBUczBYTXZaOWJvRURuNHZXc29QL0JBQ2xmcjE0TTBqNENRdkpLN0R3?=
 =?utf-8?B?UmRtcmdxK3lsYWh5ZGZrbGIveXZWWmw0MXdRRnJqbi9yUHEyY1AzZ1Rmbi9m?=
 =?utf-8?B?a3Mzd29GRFpsQ1lCdTgwdG5DNW01VnlSdk9oODFkaVI3aGpTNWk1anI0bWxx?=
 =?utf-8?B?d3dESGd2UmM4azgzYTFyQjFKRy9OakdPbHkzZ05XekRDd3Q1RUw4WGFiUFN6?=
 =?utf-8?B?Y2lxcUZFeXFTSXhCMzB4bTJQUnZzSlN2d1V3S1NCTndVdjkvaW9WanJ2T0M4?=
 =?utf-8?B?L0xUcm1RMEJoQUtSaWpXQXIxdmt1NktiZ3FIOWdqVG5nbHZZNUR0U3lrcnRI?=
 =?utf-8?B?emVYK2FpT24rMUI5KzE4V2I3bmUyRU1lKzlyNHlwSHd2bEVFZjJlVWx3Ym55?=
 =?utf-8?B?U0xRb1BuSjR5UGFUNEJHWmNYWjZIb3NWVVcvMU1STGFMdGxERDJ3dG41UXRx?=
 =?utf-8?B?b1NBaGpNdnozdG5nUUtqZFVyb1RsZVFQS09LblVKOFVpVm1EL1RiRlJvMll3?=
 =?utf-8?B?Q0JnNXpSb2pjMzJuTnRIUTF5Rmpzblo5aklqS08rNUtPbTBJRlFNN2prODVO?=
 =?utf-8?B?eVQ1R2V1S2Q2ZEthZG9vbHdNQVNSQXlhRkNMZXEzeC8yYXVIY0pVeGx0S3Jn?=
 =?utf-8?B?TGpNSmEyNnlXUXVxYkMvUnBaQnVXUldCUGx1RDlCTHUreCtoVDFJbGRBMEgy?=
 =?utf-8?B?MlhMaDVPeCtCSmlFR0V3TURLK2tPT3UvbFo3NUltTjMyTThTNjcwenFoZmFD?=
 =?utf-8?B?aUtqY2NsNWh0cHhiK1AvRk5EQUZWWmJMUTFaSUIxVEVnbTFPd2lUTEoxT1Bt?=
 =?utf-8?B?ajFkMnZPODUzR0RPWWRtK2JmRkNLc3hNQm41bHVJU0kvZVNPdm5xN0NXYjgy?=
 =?utf-8?B?MjBOWGFQM1U0TXluNVdiN3lGSHFWYWovS3hEMXMrcm9jUlhEdnVWV0crOElQ?=
 =?utf-8?B?VDRqL2Jhdm54QmMyOGFOcmdHVXlCWldSMzQyY1FoOXYxUmVDWVk1dCtMb1N0?=
 =?utf-8?B?RmZmYTBUWUltOUVrM29SbG5senVqOWcvemRpZlZEMWphd296NmlGZnlRSFBR?=
 =?utf-8?B?amZLYmxDek5QaW4veWRPNE12dmtZbFJmazdqb2dCajRDQlFZZU9SZTNSRU9G?=
 =?utf-8?B?Q1JNSjVzdk0xdGNCU0pEODhQOHBUMExkRmdkNHBrS0lKWFVodW8xTVJ0Qm1u?=
 =?utf-8?B?QTJXdXdFOXhYZ1VhaGphVDdkc08ydzdSQnVwcXMvZldxdnQ0Z2F1SC95VHRP?=
 =?utf-8?B?SVJBcmNqdWlHemZreFJMTVE3U1pENlZCZWQ2R3RBZ1Z4bU96RGM2VzZLQlR1?=
 =?utf-8?B?U0FnREQwVEx0NnhXV3ZFMVArdVRIS1h0UUV5TkcyMUlQUG9YRHNmem9CM0xQ?=
 =?utf-8?B?aDVPbStpZCthTWsvWWVSNmIwcUMzZ3I4OFJzUnVJWkJjb3NWWEgyd2xYVzN4?=
 =?utf-8?B?OWNpZHJyWndseDNqdmlpdkV6K1M0U3hpY0prS2tzYTY3NDZJM1F2S1BaLzc1?=
 =?utf-8?B?ODhaaDNYZDIwSDRDSXZFRkV0cm1WOGo3M2NIK0ZUTU9PR281RHJ3VmlHQ0J4?=
 =?utf-8?B?TlVaVlRnYmJ4VVdWRnRJR0FTT3h6ZlZTTmpQYXh3WnhaZk5mTTZUR3l4Rmdo?=
 =?utf-8?B?SFhqWEdCamJVY0FqK3dYSnE3YzVGbGI1UWxCb1pRVUZNajNUMkU5QnVjSHM4?=
 =?utf-8?B?WmZwWERWY1VqRXFETEc3Q3lMZnc5Rlp6eTV6aCtGU1I1Q1dzdHk3NmRUZU4w?=
 =?utf-8?B?T2NsWFpoYlF6MU5UTGtoVlFiV2pzRlliRTN6L3FiODd3N2lVeVBHckFWTnR0?=
 =?utf-8?B?cHp0ZG9tNG42ODhUZ0FKQTQ1TnZWSzJhUThDaXpYT2VwNDJMQWErbk93eUFt?=
 =?utf-8?B?THNCdDdldlZEUW1ycWRpanlXaEptaTl5ZkRleUpmN0pNT2c3RmJISFI4S1lu?=
 =?utf-8?B?cGxSSGcvNjdqZjY5OW5qcnhzUnJlb0hrTDgyd005VDNHZktMd0hQZi9tS3hI?=
 =?utf-8?B?U2pSOTlidTJpMmJNbDVXUUZveWlYSGR1aTYwWjJpRk5mNFRhYklmSVU0QVVB?=
 =?utf-8?B?WXc1Y2dlYUxtaVNMTDZod0ZvaDVqOEVmL3k4OWJ4Qk5xcEtiWmFnK1NqSnpD?=
 =?utf-8?B?Y2doTUU4UTFOdER3dkkzL3YwQzJSUFBSa1B4aU95Z3dRYjQzRlZmRlRYNHpJ?=
 =?utf-8?Q?6BAzh4i2SjkHZr757R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <988C7A47A4E42044B57D28FF134810A7@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BESP195MB976599.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e3af5f-945a-4305-27c4-08df495d07ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 12:26:41.8872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Aw0sQRwRSJbVzsmCfwnqw2go/FDPneYOeG02mN6gr8LgTqYd4t6m9SsgeHH7J8FKvUXtx3CgPObN9QcqrN2/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_042655_270151_21D180B0 
X-CRM114-Status: GOOD (  18.92  )
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

T24gRnJpLCAyMDI2LTExLTIwIGF0IDE1OjM4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDE2LCAyMDI2IGF0IDExOjU0OjQwQU0gKzAxMDAsIFlhbm5pYyBN
b29nIHdyb3RlOgo+ID4gQWRkIGJpbmRpbmdzIGZvciBwaHlGTEVYLWkuTVggOE0gUGx1cyBTeXN0
ZW0tb24tTW9kdWxlIFsxXSBhbG9uZyB3aXRoIGEKPiA+IGNhcnJpZXIgYm9hcmQgKExpYnJhKSB0
aGF0IGpvaW4gdG8gYW4gU0JDLgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly93d3cucGh5dGVjLmV1L2Vu
L3Byb2R1a3RlL3N5c3RlbS1vbi1tb2R1bGVzL3BoeWZsZXgtaW14LThtLXBsdXMtZnBzYy8KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogWWFubmljIE1vb2cgPHkubW9vZ0BwaHl0ZWMuZGU+Cj4gPiAt
LS0KPiA+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbCB8
IDE4ICsrKysrKysrKysrKy0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbAo+ID4gaW5kZXggNjU2ZjI1OTZlMWQ1My4uMmQy
MWExOTQ5ZDk0OSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vZnNsLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vZnNsLnlhbWwKPiA+IEBAIC0xMjI1LDEyICsxMjI1LDE4IEBAIHByb3BlcnRpZXM6
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBrb250cm9uLGlteDhtcC1vc20tc8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBLb250cm9uIGkuTVg4TVAgT1NNLVMgU29NCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBmc2wsaW14OG1wCj4gPiDCoAo+ID4gLcKg
wqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUEhZVEVDIHBoeUNPUkUtaS5NWDhNUCBGUFNDIGJhc2Vk
IGJvYXJkcwo+ID4gLcKgwqDCoMKgwqDCoMKgIGl0ZW1zOgo+ID4gLcKgwqDCoMKgwqDCoMKgwqDC
oCAtIGVudW06Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBwaHl0ZWMsaW14OG1w
LWxpYnJhLXJkay1mcHNjwqAgIyBpLk1YIDhNIFBsdXMgTGlicmEgUkRLCj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgIC0gY29uc3Q6IHBoeXRlYyxpbXg4bXAtcGh5Y29yZS1mcHNjICMgcGh5Q09SRS1p
Lk1YIDhNIFBsdXMgRlBTQwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBmc2wsaW14
OG1wCj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBQSFlURUMgaS5NWDhNUCBGUFNDIGJh
c2VkIGJvYXJkcwo+ID4gK8KgwqDCoMKgwqDCoMKgIG9uZU9mOgo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAtIGl0ZW1zOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHBoeXRlYyxpbXg4bXAtbGlicmEtcmRrLWZw
c2PCoCAjIGkuTVggOE0gUGx1cyBMaWJyYSBSREsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gY29uc3Q6IHBoeXRlYyxpbXg4bXAtcGh5Y29yZS1mcHNjICMgcGh5Q09SRS1pLk1YIDhNIFBs
dXMgRlBTQwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogZnNsLGlteDhtcAo+
IAo+IEV4Y2VwdCBsYWNrIG9mIHRlc3RpbmcsIGRvbid0IG5lc3Qgb25lT2YuCgpCb3RoIGVudHJp
ZXMgcmVmZXIgdG8gdGhlIHNhbWUgYm9hcmQsIHRoYXQgaXMgd2h5IEkgdXNlZCBvbmVPZi4gSXMg
dGhpcyBpbmNvcnJlY3QgdXNhZ2Ugb2YgdGhlCidvbmVPZicgcHJvcGVydHk/IEkgY2FuIHJlbW92
ZSBpdCwgc2luY2UgbGF0ZXIgcGF0Y2ggcmVtb3ZlcyBvbmUgb2YgdGhlIG9wdGlvbnMgYW55d2F5
LiBGb3Jnb3QgdG8KcmVtb3ZlIGl0IGluIHRoZSA1dGggcGF0Y2guCgpZYW5uaWMKCj4gCj4gQmVz
dCByZWdhcmRzLAo+IEtyenlzenRvZgo=

