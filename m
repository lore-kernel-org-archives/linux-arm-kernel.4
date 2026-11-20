Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A79606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tBHhds6S;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=VpmjWfC4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/y0QZO8MyR1diBGXjDszG5cla/cZgwbbiOFGkiPqMMU=; b=tBHhds6Sm14Eq9XbJFAvzAuvjB
	+3UXHZOJo+Dss9MsH2FXzDiV48tJnOqOLDvat4HbBgWXcmIuhdTLGvoiB/3VVfpP/w+53/R/8GR3k
	Z7gMgn2d6ptmx0InZQoP2JmGia0XlNNuiSUDxHcnFgTamtTNrsN0Kq3Xh9omA2VFsDAee0isxGE8b
	Z5JnGmwxvL040YbN61ZHD4DMYI+MuTyFrLT+kaSB1Hw9FUEmKV77ImVM0bRKm2NiBtqZqHC9xn3vX
	9X9ANwR3sENVoCM/aX9pO/kp7STDKYtww2rh5CO5eJGvk6ZGHnhGx/edstVz6qGZD5gG3VhxqixaU
	qwCeaPqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSBF-0000000FdpS-0yyK;
	Fri, 20 Nov 2026 17:13:45 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSBB-0000000FdoD-39hy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:13:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRmv8oqWc+42b+oTfi09si/kp2RDesV5fYFxz4VoUSOVf7LEAPNFxjIz6fvDCiUNFlGrSVfzxxg6WxWCrS5GTxuucb9kPja1DF7HGlb6KSv01q8Vq+H5P/491WO7a0aiWwmASZYAFSi9VpsT6DC3W9JLM2z1JB2zZzfd8NPq3bOZ2phXs+zl0fdjMg+Ym17R0ACdZAh1ECwMPKRXigPH77LWc1LKj4LHjvUyAtmmvlRjr1GyHGb6wOJ0XACzGlR1NMlA4IFUq8dG6vV7de5zvECXRWB1TrDHzE8VzUN743tlQgF8KYcVBWGHJ7z980Bx5Ofbcy87jKdwWTVTnDg0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/y0QZO8MyR1diBGXjDszG5cla/cZgwbbiOFGkiPqMMU=;
 b=lOCJ70vfiSDv8+Su70zw9ruJgCLg7U/XqRa81HSPu8CMKcmYU8ddanSUAjDIosNiuMVfN3tSwsPrgwv/Gvp1kKgCqDxaxmZ4APUKRKjw/n2hHylcyex0F8hdAxTJLQrULEtEDtuTPblhxoNZY/7E2AtYcK3Yoy6xOrhLsiVk6mBUWRAwePDjkq5OeYtb8QhCayeGAye7y5oylyuqFp7hRx0Vnb7q2ybELeRvw+J90wfH/dsLMMt9u1+6dLDahFIv9hwLInHwvrw/yJa9N0yIbqv2F1KOY7cRK9pOvNcEepHv5j6ujlKo357RB8M49UGiz812IMmh25Y1sei/jeW8/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/y0QZO8MyR1diBGXjDszG5cla/cZgwbbiOFGkiPqMMU=;
 b=VpmjWfC4e3Tr0+OdpaniTiVMrbUGNKY12Vuw0+vRjBYR2eYQqg3jtpHhLComd3Y4nWd/G0jM1m1h0eMXIfTNh0B4xWH156W6PTbnnOabAMnweoqUlQ5+MKwsSxOOlRjoTrAYakSGcbsiGePCOHkAPf1NKPuomJSIW+651A7TWtfj15r48sh/r1v7qvwuXjQ+BCjm5EGAgNynk6UYVwj+rY1WFFbGxMBMEKiEBdJrnGnYkXC56grlGDgK4UYFBM9Dn1A5I8w+TGSbFtdYathvdCA6Cp9u6EdRSvF2IpGyb+Q38UTBAEoyiRVn/SBeDzwkj5VsBff3YVD1g12mvo4JUg==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 17:13:34 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 17:13:34 +0000
From: Muhammad Nazim Amirul Nazle Asmade
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Nicolai Buchwitz <nb@tipi-net.de>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Ovidiu Panait
	<ovidiu.panait.rb@renesas.com>, Joseph Steel <recv.jo@gmail.com>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	=?utf-8?B?QWxleGlzIExvdGhvcsOp?= <alexis.lothore@bootlin.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
Thread-Topic: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
Thread-Index: AQHdd3jzruA82D+SI0etxKPm7rShMbc0QowAgALzc4A=
Date: Fri, 20 Nov 2026 17:13:33 +0000
Message-ID: <c0d25aee-77af-4d99-9e94-06a72a705e90@altera.com>
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
 <a2518e0794b8b9c79a97cb6c768dded6@tipi-net.de>
In-Reply-To: <a2518e0794b8b9c79a97cb6c768dded6@tipi-net.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|BN9PR03MB5977:EE_
x-ms-office365-filtering-correlation-id: abb2f69e-1bb5-4385-3817-08df47299b84
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|10067099003|261028144727099003|261026121527099003|261026140227099003|11063799006|4143699003|261021135927099003|261021121427099003|261022105027099003|56012099006|261102123227099003|55112099003|22082099003|261009223027099003|18002099003;
x-microsoft-antispam-message-info: EhMONPdJFJQ7llKmOOPrgUKGYRIImQuDB+AtUKRocv/+QzNjkgGtP6+Sc6EleVBU9KoeHLwpwKJMsroqyRGvgKfYZ8DEyedE5Oi+RnNIAVavHxHb82J4uyAgdAjMMIf4liIyQFW4InkFb9hZkFxCQ2R3a14VQ4lM8+YcyWocc0EDW+y6toBS6x7DAd8+pqaNVG1mgWbHN04M4Y3rXGrPRi8ezyWqptHi4MG0ZtWXK0yoCD4yVPP01VwZnPizsRmFjRdiv1YvWgkMaRUPH8wIYUFe+BnxjkppJhu9MrA1Y7kRWQgw6zqHy8VKWn6aZYcWmJ1qILApq9LZzyXiii/qMre+3zMcgZbeOXOMWw29owlb/6yJ5IonoFicx4tsMy7TE/As9K8S/wB5MrYiL8Y8UlU9Og5BsxS+mviYyQui4j2zQp1yX/qE3x5zVCGYuhDAWA57RKOu0BRSb0n1BPwDaarYu6E5nnisJnZHqFf4p9EYez0r0uvS4JKQqJGI9fot1evIeqCFZTEsAs2BCTRplfl+bcbW4v6Jr7WdWkPSFaLQIXdeWK4N+6dhQbOb6fygjsfq9z5H9X4C7L7qBVS4Vm2FaUW9TqeAfPdAzr3Z9DA8OmDtTOrwBz7E+6/0UnpMtYyDkeVvDm8dGFoAPJ57ZkoSIcOUhTF/SKjg1XKrG0CEA80IaWCCF/DnffMov2ZbU6wq5t2OP6gke5E3yPQPyhmlyl7WFmmh3sIVEgQbAts=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003)(11063799006)(4143699003)(261021135927099003)(261021121427099003)(261022105027099003)(56012099006)(261102123227099003)(55112099003)(22082099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0o4QkFoZVF1RUdZUDBvbGFhWEdJVHdPUHV1SDM4WHFwUllxNmdlNktFUDAx?=
 =?utf-8?B?dzZXY01LNUtrUUZqSmo1SVZaRnFBc2YrUzNEeTIvNVloLzJNNnNBV3JWRFNX?=
 =?utf-8?B?d1pMamF0b2NsUFB5Zis0QlhLQ3QxaUd3ZlRodUtEMnRoWkF1K0daOEZoNzd5?=
 =?utf-8?B?ejJqUVlETTN0Zm1IRFZUenltd3JjU0VTbG9CUWowSy9HK3NDaVVmNmVuZGNE?=
 =?utf-8?B?QUdrNUlzTi9IVHBwdkFzRGZNOWxqUmVwb0FOREZDODAvU3ZOdUpTVUJ5NmdF?=
 =?utf-8?B?Y2p5T1NoZmR0VmNHR2x1Y21WQU5Rd2pNTGdPQy9nR1g1V0R3N1FYUjl4UHFK?=
 =?utf-8?B?N1NWcm1xNWpyM0VxVTlwSVpXQldoa2lSN3FVSmdxTHJGVDNIZHBrWmowL3NZ?=
 =?utf-8?B?TkptV2kzZHJWMWtpM1hIZWxXNXBaY1c5TTlmNjYvWWkrcHJHd2JRMEx6bTRL?=
 =?utf-8?B?eWNud0hZNzUwSXVpM2pXZEphclVuMm11bHlTRWhUZE1IQkVXb3RCZlEwWUFJ?=
 =?utf-8?B?SXZsMzFpUmNobkcxaExTTUlUMlQ0S0tVWmIzc0VRZGNBVlJ4K3QvbmlpVHcr?=
 =?utf-8?B?NVJNRFJoL3JkWklMQ3pWcnFucmZTQmlpdjhDZnBZRWZ5VktDRjRtSzhzWVdU?=
 =?utf-8?B?dXJJUDMvdW9rUmJ5dnlQT0NhRTZtekd4bGN2Tkl0QWdMRFFLeWtMa0RZZi9x?=
 =?utf-8?B?azFDOTE4QVQ2c1hqYXQ1c3JDQ1lBallHSWJFRTlFRisycE5vSGlyZVlQT1NJ?=
 =?utf-8?B?MlNEQndjMnFsdjRSZk5lVTVpS2Y3djZGajczVFk0MmY5Ky9yVTdLSU5XeW8w?=
 =?utf-8?B?Y2RPdnZpNktCTTdWUWxod0ZmT3gxVk9PbE5MNXZzMi9idjBuQXE0RGUyRlNQ?=
 =?utf-8?B?Q1RieGdvelcxZ2YzOGdDKzVWV1U0dW1WazNocDYrMFFVMWxBNjQ4UEY2ZFE5?=
 =?utf-8?B?bjlmY2M5d3pZcG1LaVZaWlZ5RWZNa1N6YlJpNVVyQWFJMitqL1BuU0FBV1Mx?=
 =?utf-8?B?TkcwaGlTYXkrZnk0bmNuejlXM3pHYkNJaVMzQkZyNUI0TG5KQ3BJLzNOWWty?=
 =?utf-8?B?NUpsalN5N2J2YldnMnVXRURXRUtkdkk2MnJjWEhCdFhGOXhqZDhrU2ZWL1pK?=
 =?utf-8?B?WlpnZnZoNHRPYU5NMXc1RmdsMWlQd0lzVTg2VnlYa1VQM0JiZkdReHNvYlBu?=
 =?utf-8?B?MkpkSVNYTlA5amVBbkJRTVREVHkwODlsRzR2Zi9adkd6WEk2TEdXMkw4WG0w?=
 =?utf-8?B?L2F2SCtDVVFCcmh5UFJsblU0K1V2TC81UFU3VTJnYVlqSy9Ma1VNaHI1ZnZX?=
 =?utf-8?B?eDlMQTRPeDZCLzJPMHo5YnZwOHVCQlYxdVRwQmxjclh4Z0J1aG5XWm43VkFw?=
 =?utf-8?B?dFlsaS9DaFd1MjhFTWNFdmgzb2laS1duOEtrYVhka3g5UFpWdDdJNmgrZXV0?=
 =?utf-8?B?YnphVDBUU05BaTVJaG5lc3g3U3RjZVNHZkJtQm04eDQxeFBvQzFJdTF4cFBp?=
 =?utf-8?B?aGZUcVE1ZzZFajNDRGk5ZE1yMjNEbFF4RDFFLysvM2NWaGhwR1pxZXBudGFJ?=
 =?utf-8?B?TVcwUzUreVFGaFZTb0JpRFYrZGs4aTd2dyt4aVJSMTU4bVJ2K001UjRaRXlR?=
 =?utf-8?B?ZHpDR2xwV3ZGWnBVWU9CZnJFT0pHTm40Z2xYWVRVMFNscUVXYUlGYVJZaXdO?=
 =?utf-8?B?K29lOUZ4UjR4cTF1ZHBBK0syakxzYVZmV1hOdzJrODA2WkVLRGl1SXQydmkr?=
 =?utf-8?B?bHZrelR1WnVpUzFCYWZRU0k4RnUyVWJ6NWEyandkazhCY0U2d3ZId21SdGZM?=
 =?utf-8?B?OHREN2l2cS9INVpseWRTSlc0RDdnbDlLamx4dnhDRnlscjh5MzRXeGtGS1pa?=
 =?utf-8?B?REoxVHA2OGQ4VHpZb3lYK0x5UWJpcHRlcWJGUEYveGJkU3hJTWlsYVZMRkVI?=
 =?utf-8?B?YTdhYmE1cFQyUVVESnpRdkN5bzdKaG1uWFNmWWMwSmNUUzFrUFVJbUJLS1p0?=
 =?utf-8?B?VExGVlczZGtBMHEwWlA1alZhQzlRd3JaZjVTOVp0T056U1FVUUQ5eWFiblBr?=
 =?utf-8?B?amRPTlVMZXJsSjR5MnlwZjduT3FvMUJkMnRncGJWUDBHMEJNbHFwNnFHVUNj?=
 =?utf-8?B?aUNuUWVYblptQldkdnVDMnlIZ2x2MndXU21yQWUrWFJwRnhIS2R5Y2NuVGhW?=
 =?utf-8?B?WnZtelRZWHNrV3RkbWs1KzhBSm9rVlVOQS8yeVUzd3c1Q2lseUtwcEp1TmxV?=
 =?utf-8?B?R1hqdThYOHRUNDNTaTFKeU1YNFR3eUEyMWVqblp3VUdkTzRUU29BZVJRd0Ru?=
 =?utf-8?B?cW9HV1ppbXh0TW1VN0VvdGxMcUZGM2pVSmFkWUthWVY2NmlORVZBb3lYL3VD?=
 =?utf-8?Q?QL77yDgW7aplT8KthCENh/SEwChWiPt4pl/zG4eKQbRn6?=
x-ms-exchange-antispam-messagedata-1: 7Dwvv6J/EvU11w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A779C9CCBDA5884187C8D9DF17D4CC0B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb2f69e-1bb5-4385-3817-08df47299b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 17:13:33.7950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2EZZy0pWViZAtjAfx6FohymYe08aDo+9GWhJxKk9zRjnMpYJ54MWMtaMuwruVQUAzvZkpXKqvBDM0UHvP4YNivKWxnSWAGw29KTQrKTwl6qVjX0eDwqQlUBy2v9Bf3DjBfg712vGWhhz9DKdygItA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5977
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_091342_072782_782252AD 
X-CRM114-Status: GOOD (  18.50  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTkvMTEvMjAyNiA0OjA5IGFtLCBOaWNvbGFpIEJ1Y2h3aXR6IHdyb3RlOg0KPiBbWW91IGRv
bid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIG5iQHRpcGktbmV0LmRlLiBMZWFybiB3aHkgdGhpcyBp
cyANCj4gaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbiBdDQo+IA0KPiBIaSBNYXhpbWUNCj4gDQo+IE9uIDE4LjExLjIwMjYgMTc6MjEsIE1h
eGltZSBDaGV2YWxsaWVyIHdyb3RlOg0KPj4gU3RtbWFjJ3MgZG91YmxlIFZMQU4gaGFuZGxpbmcg
aGFzbid0IGJlZW4gd29ya2luZyBncmVhdCBmb3IgYSB3aGlsZSwNCj4+IGl0J3MgYmVlbiByZWNl
bnRseSByZXdvcmtlZCBmb3IgZHdtYWM0IGJ5IE92aWRpdSBQYW5haXQuIEluIHRoYXQgd29yaywN
Cj4+IGl0IHdhcyBmb3VuZCB0aGF0IHRoZSB0YWcgc3RyaXBwaW5nIGhhcmRjb2RlcyB0aGUgODAy
MVEgdGFnIHR5cGUgZm9yDQo+PiBYR01BQyB3aGlsZSBzdHJpcHBpbmcgdGhlIHRhZywgd2hpbGUg
dGhlIElQIGFjdHVhbGx5IHJlcG9ydHMgdGhlIG91dGVyDQo+PiB0YWcgdHlwZSBpbiB0aGUgZGVz
Y3JpcHRvci4NCj4+DQo+PiBUaGUgdGFnIHR5cGUgY2FuIGJlIG9uZSBvZiA2IGRpZmZlcmVudCB2
YWx1ZXMgKG5vdGUgaW5uZXIvb3V0ZXIgaXMNCj4+IHJldmVyc2VkIGluIHRoZSBtYWNybyBuYW1l
cyk6DQo+Pg0KPj4gwqAtIFhHTUFDX0VUX0xUX1ZMQU5fU1RBR8KgwqDCoMKgwqDCoCBzaW5nbGUg
Uy10YWcNCj4+IMKgLSBYR01BQ19FVF9MVF9WTEFOX0NUQUfCoMKgwqDCoMKgwqAgc2luZ2xlIEMt
dGFnDQo+PiDCoC0gWEdNQUNfRVRfTFRfRFZMQU5fQ1RBR19DVEFHIG91dGVyIEMtdGFnLCBpbm5l
ciBDLXRhZw0KPj4gwqAtIFhHTUFDX0VUX0xUX0RWTEFOX1NUQUdfU1RBRyBvdXRlciBTLXRhZywg
aW5uZXIgUy10YWcNCj4+IMKgLSBYR01BQ19FVF9MVF9EVkxBTl9DVEFHX1NUQUcgb3V0ZXIgUy10
YWcsIGlubmVyIEMtdGFnDQo+PiDCoC0gWEdNQUNfRVRfTFRfRFZMQU5fU1RBR19DVEFHIG91dGVy
IEMtdGFnLCBpbm5lciBTLXRhZw0KPj4NCj4+IFJlcG9ydCB0aGF0IHRhZyB0eXBlIHRocm91Z2gg
YSBkZWRpY2F0ZWQgZGVzYyBvcHMgYW5kIHJlcG9ydCBpdCB0byB0aGUNCj4+IHN0YWNrLg0KPj4N
Cj4+IFdlIGtlZXAgdGhlIDgwMjFRIGZhbGxiYWNrIHdoZW4gd2UgZG9uJ3QgaGF2ZSB0aGUgb3Bz
LCBhcyB3ZSBkb24ndA0KPj4gc2V0IE5FVElGX0ZfSFdfVkxBTl9TVEFHX0ZJTFRFUiBvbiB0aGUg
Y29yZXMgdGhhdCBkb24ndCBzdXBwb3J0IHRoYXQuDQo+Pg0KPj4gVGhpcyBoYXMgYmVlbiB0ZXN0
ZWQgb24gQWdpbGVYNSB3aXRoIHRoZSB2bGFuLnB5IHNlbGZ0ZXN0Lg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IE1heGltZSBDaGV2YWxsaWVyIDxtYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbT4N
Cj4gDQo+IElzbid0IHRoaXMgYSBmaXggdG9vPyBJIG1lYW4geGdtYWMgYWR2ZXJ0aXNlcyBTVEFH
X1JYIGJ1dCBzdGlsbA0KPiByZXBvcnRzIFMtdGFncyBhcyA4MDIuMVEuIFRoZW4gYWdhaW4gbm9i
b2R5IHNlZW1zIHRvIGhhdmUgaGl0IGl0DQo+IHNvIGZhciwgc28gbmV0LW5leHQgaXMgcHJvYmFi
bHkgZmluZS4NCj4gDQo+IEFueXdheToNCj4gDQo+IFJldmlld2VkLWJ5OiBOaWNvbGFpIEJ1Y2h3
aXR6IDxuYkB0aXBpLW5ldC5kZT4NCj4gDQo+IFRoYW5rcywNCj4gTmljb2xhaQ0KVGVzdGVkIGFu
ZCB3b3JraW5nIGZpbmUgb24gbXkgZW5kIHdpdGggQWdpbGV4NQ0KDQpUZXN0ZWQtYnk6IE5hemlt
IEFtaXJ1bCA8bXVoYW1tYWQubmF6aW0uYW1pcnVsLm5hemxlLmFzbWFkZUBhbHRlcmEuY29tPg0K

