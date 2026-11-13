Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C75606A88D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UigPXwhy;
	dkim=pass (1024-bit key, unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256 header.s=selector1 header.b=m62JWWAW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BBCsAMme/c5sAudlkImxgXr5AmyEqPD/7/B4A0I5vL8=; b=UigPXwhyyfNWTZb18El6wTJW8D
	wyx10rjlM5R1KptD+hxIMAe8B/Im1GhKk1zWnfWeB+PZWYx/DveMbi+IDoKItGNayazP+pXaSQCWq
	+69XrOFpv+shr8eiiHHbhzhlk4N/fof8OyN0HlEy3yXXcMLAOv5SYkUqrVE1cw64UB7oMgNZV9YCi
	WSJvSaZvjrHQxn4NyFRuvWGrQJRhul062ZJkpuWFkZCIWEXVk0jteKB1Kbn1VH1pX2cU45ZN8EBi/
	LII8ie3UvdPspQKNOM4ArgknR4yPWmiHhoiKAU/Kg2E1TlBY0SUf14tHg6O8u4nTao08dCvyUFnGu
	smRMgn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpAH-0000000CU46-0xJo;
	Fri, 13 Nov 2026 11:09:53 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpAE-0000000CU2J-3tB7;
	Fri, 13 Nov 2026 11:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru1cplXhnMN8hfk43U8nHWqKDgpq4H72F7xRo3u85YiEowayytJ+Dbon8AiFNh7yFt2hAdgpm6ZwZZbjtqs3dPyFv5RI8gAVdScr2IXwC7TZdXiRHcU/dbnL/ttaIOt1nKS/ebiWmkl9YcUOuCPVUOZPHpwWzlE4vdd/4Ps3te5J92Y36FDwD32FN/VnQ2qZWxKmISTHSKBkXjapWTHZriOvtvHjX7AMnUb25Uy5RtHmYHqxav/XIKLVnNGjHGkR/xJ3nIwnLNIthMcP88K4zCkI03vSX0FpWw/swnLB27WAtO02bePeA5nCvXWiUPKzFnGl2KA5XvD8A+M2Of/zUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBCsAMme/c5sAudlkImxgXr5AmyEqPD/7/B4A0I5vL8=;
 b=PBk8hZv2ZGpMcqFmk3PphIkVHYrdAEGeqX1+wvgwNopi9tXfTX+G61rxGUmW6+1Ni+BwQqkfbcoeiKsGFr+QlyA0AeyHEAAxX+pUPgfwU7rWWZJVargLSJAHZm0zdqkersuKxO8qnKBWjwYKdd6Je+qyiRjfd9gPgsKPbsSwpM94yEzhoCWksGBlEd3QEJEOquwWNIsQjQ/SCwK7lgVfNZfsLQ4WnOUODG5e3bjrYMnraHnG12YDrXsMudDhLN9MNx5ry8YzTrycXn2WPYqfsNwx0e5Xkngr6nW5HjtCiO9+/asXKIPos6uFtsdsVz5vchZ4Vral52OkLbvHIeyb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBCsAMme/c5sAudlkImxgXr5AmyEqPD/7/B4A0I5vL8=;
 b=m62JWWAWdzCKCBt9ioTsMu0Y+LYUQi1sOWMYW0fKGuaxtyExtQau9kdZM9irBDYGOmRDZ9LQFtSFJNJ7Buv/zJOs/se38BEDwxHWoyOnSotJGzncnD9fcnuZg1FZjBz4B6gQfTeGmx+ZXXKUGGHvOp4ZpnM5ssTDVPewLUW4/EA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU4PR04MB12028.eurprd04.prod.outlook.com (2603:10a6:10:63d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 11:08:17 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 11:08:17 +0000
Message-ID: <840285d6-a8a6-4777-8d38-6758ccbc7723@cherry.de>
Date: Fri, 13 Nov 2026 12:08:01 +0100
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/9] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY
 receiver
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sashiko <sashiko-bot@kernel.org>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
Content-Language: en-US
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0111.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::15) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU4PR04MB12028:EE_
X-MS-Office365-Filtering-Correlation-Id: 1294f6c8-0fe7-4da8-821f-08df41766b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|22082099003|18002099003|921020|11063799006|261026140227099003|261021123027099003|261028144727099003|261026121527099003|261021121427099003|56012099006|261022105027099003|261102123227099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: OO0owUbTdmmnDESu2j1HxjEIyoMmmWXVa20a0QSZoNjOQbiyxporKhRi/M9JVCq9GhcDS1z32xxdRFLrZ48uR38S9O9uc1rr8xPlN7buMKWnyjZweEFHltWRsmKGqGVgJH+vTH3ZvydAQ0X9lZmOa39EbuBhBT8wq1P0WTWPBKWOi4Yoyy5TXBY2H1myOy/hY87aPPYzzSGn0f7OJzuVpkPBjU+5v85YGgv7fVKmIy8JYqx7aiZ6rvq1sRHhpiGBWlZ5+L7pZE8QF5d01pJakaQZVk9GKcYHeczOU5t8Icb3WS/CAERgWWSlU0CfxoDoezfBf/6LxH76GICABjuEQh0QjjGJM7ZTNgnaJdl5K4TLl0P4/762WFL3WqmePoRoEjkMqNfhdn5KVDJp5Q/Mi3XoJGwCiMm4VSvmS8Tz7pqno8BWU0bdHXMJAud0ZBbg97IbftbORbCJJB7382RAxtgN24ASoYKjRRtfhW1WR2Lk3nkKFdD+xJyvtqREGdL8KsiUyCZ99QIbW47vF4NM03xh43S/ulKBXfHlTEw/pzd8ng2ncYW9pFOni1pLGsDaYLkbQ0aLcrTftxjA5kmdL75wq7uC4IDO8OAyWLCoEELYmHbnjK+4irtVTgspFxRVzKYFuNACcY1UdNVwY/fsDhJwAtfPO/ueYEtSVExTgRzdMbNXY+dfPq0Jwx+yII88nZN34qoBcDehn7zIKgMPAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(22082099003)(18002099003)(921020)(11063799006)(261026140227099003)(261021123027099003)(261028144727099003)(261026121527099003)(261021121427099003)(56012099006)(261022105027099003)(261102123227099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWxZbEtNbGh2UGJlSTBvRXkrcGhrb3BseFVjVTQ4TE5nR2pJMm9pMUF5ZXpj?=
 =?utf-8?B?WEpOSi9SRitSaExMMFl3ZThrM0svREorZHZMbWxCS3c5SjVTWXdCcFN4cTM2?=
 =?utf-8?B?eXlNWnhheXFXMXJkb1RSNzhST0QvNWYwV3ZoMnVTbUozc0lBNkJMZkpjeGVI?=
 =?utf-8?B?M0NjQTREMGpVS0luaEswVWkrU2dva2U0VDhJUllyU2c4TlUyZThEWG1tYmRi?=
 =?utf-8?B?dlNDNFh2MFEvVWJsc2Z5ZVl1VmFxdFlaQzdrNDVJZUVaNFg1d01jYzVZYjN0?=
 =?utf-8?B?OXNoR1BLVnEzbThwSUFzRzN6WGxZVlF0Q1NwM29KM3pKSFNoNlQzcTJjRUpt?=
 =?utf-8?B?VXBvWXBTSnhwalZJOGE5ZTZsY0tiMkhTVXBXc2FSbnlEWjlBRU9Tc2lCLzda?=
 =?utf-8?B?aUFmN1hsbHZkdTRtM1lTZ2ZmangxRm54V0xFOURJYmszOGlJeWFRcVBGMFU5?=
 =?utf-8?B?UkEwcUwxQTlNVCtuZHZYSUhET3NHVWppOWlBa28yaTNqY0JQZjh1N3ZRd1FB?=
 =?utf-8?B?dlBPb1dVTUZFRExSNm1qS29GaHVLZGxlcTNaTjNYdUhaWDNrc0NqdVpYb3d2?=
 =?utf-8?B?ZzVXMjFKVFA1Nk5UUjA5WVg0dk9kNlJwT1NlcnVDVVNpdGpHRUR1MWNyYzI2?=
 =?utf-8?B?aHFZcXRIUFhubGUyc3grWG1SR0lnQkFLTEtUdVU3dkdmM2t6R1pJRlJIY1d4?=
 =?utf-8?B?bmVNWjhxMENWOG5LWDRjam5vZUdlWnZwM2lhS2lEOHZhWHY0RERsR3BpcWF2?=
 =?utf-8?B?eEhZQjJFWUpjV2ovcStVbW5nVy9FMkRWUnN6bnY1eFVSd2pQK2pnNjFNMGpU?=
 =?utf-8?B?ZkVnbnFtZTA0a0FkM2E5SWhVOGxUNGFmUmJTYnN6NmhRejZlWGJKakUxSHA3?=
 =?utf-8?B?bFoybTQzT3VBSmpiL1c4dGxySTNKQVk0aFhDdFRySW8vQ050akZ4MHZKK0oy?=
 =?utf-8?B?aTN2cWRYK2JlOTFsaFhVbUdKYkFQOHhHRndOemtiZFFLNkhIcWRSR2J6M1pF?=
 =?utf-8?B?QS9abGFMTHovLzlJTlJEUVp4cEd2djRmODFrcjNkaU9KTUtwN0tsbU9rZUtC?=
 =?utf-8?B?OXhRNVkwYndkQUxhdTMyOS9hZ2tOVWlYc2xWZXgxU0c3VDR4S3BJcnJFc3Zl?=
 =?utf-8?B?cUpBL2Q5cElmdUhLWGRRNVdpUFNSRGhCS2piVENUL1gwMjMwZXJvc1p3b0NB?=
 =?utf-8?B?Y0IyOE5CZEpXNG42UGk2dEVCd3FmN0xCZXd0Z3pYcm1yNVBnTWo3RU9qR2s1?=
 =?utf-8?B?eXk0K3RhTmpwNWpHdDA5amE3Zk01OVBvay92NFYzcW43RjZsY3dJeXJzSys3?=
 =?utf-8?B?ZHBlRGVjYkk4WmVYM3kyaUUyUitIU0V6NGJhTGVrYlZOQkRyTVNnVnVMcVFZ?=
 =?utf-8?B?aDVrNll5ZlI0Njdpc0c3OGhQSDJVTnRNME53MGp5ZC9xaEdmWWZwNnkvcGRr?=
 =?utf-8?B?T1FHQnI4NXRIQjFGdmlzREtKcnBwRWtCVXRrSW5tSDBaNEhBZ3BNRC90RjQ5?=
 =?utf-8?B?Rm1ZMXpTRXkxTEhaTjUvbktBeHl5MnB5aU9aNDNNWmtKU29rMDlKTm5MUFZr?=
 =?utf-8?B?K3VXWkpUenNzS0l6ZXMyYUE4cmJEN01MM21Bc3JlVXZtU0ZtUjhINkx1dWha?=
 =?utf-8?B?QzFtdzNIK21CaUNCaHBRL1g3SWdFVHlJQ3g4N0JlUjFZR3RjUUk5YmU4cENO?=
 =?utf-8?B?NDdKYkNvTkJFMGxiRFdBYXN3OVRiQWptQmxmUjVSS2xFWmo2Nm5lUGtpNzFj?=
 =?utf-8?B?T256ZGF1T0w4bWljTlZublNNWlRJT2w1VmFINlp2Umw4dU9xT3pRc245NzEv?=
 =?utf-8?B?R3BFL2ZzWGlrN29zSFNnQkRVNnJ0K0tqM2tBZ3JiblpCcmx2NmZlck42UjU1?=
 =?utf-8?B?SUpWTWg4SGRjQTVNaWR3WFZpMGpVTXNLTG5VbzhuVldZYzByKzVuQm4wczFz?=
 =?utf-8?B?ZkEwdjByb3ovdld0WS83aHMwZ0F3UHlZTHNBdXZkU29KWWlMQndwVWltS2I3?=
 =?utf-8?B?bjJzQVJpNmoxeXJlUVlzd0JacjBVZDVsY2xsOGwzWmFaMmh6Tzd1ZnRQWVFr?=
 =?utf-8?B?VTRMeXFzdWRhQVl3aWlBYkFubXV5LzZLeUQ4WG9mbXRnSEUzQTJrN2pOeTc2?=
 =?utf-8?B?ZlpScUpjL1VTTFZpenl0Vm5kMy9lQ0hEWGFzMFFSQ1VkOGRrNE1MZHlZSHJx?=
 =?utf-8?B?RDUzRWdOU0ZKMDJNb0huNTVVbzl0eFdMR09ROVdyOStLZGoxM3VQdE1FRWE3?=
 =?utf-8?B?cVQxZWFxakZ3OFA2NGhPSm8vS0xhWlRPSFZ5LzlVWkovcWVnR0FhWHVTWFlS?=
 =?utf-8?B?NnBRTWJLbkRVZ0JZN0NnRVZwZ045ZEM4dmY4c0Z3UWhWcDFkYUh2Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1294f6c8-0fe7-4da8-821f-08df41766b59
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 11:08:17.6074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tZOJeYgVsvAKLznyN8GBCIgUOc8GPca3e5zklrxnpUCAhCUDq5bruzGgKfBeAKrvneXqN/Y/1YpCgiN1qhjFOfIg+YYkgrJrx1FM7u3gCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030951_129491_24E1AEEE 
X-CRM114-Status: GOOD (  30.58  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

On 11/10/26 9:18 AM, Jason Yang wrote:
> The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
> for DSI and a receiver for CSI-2. Both can be used at the same time.
> 
> Mainline only supports the transmitter and models the block as a single
> struct phy. The PHY core refcounts power_on() per struct phy, so the
> receiver cannot be powered independently of it, and the single
> devicetree cell selects the mode, so the provider cannot tell which of
> the two a consumer refers to.
> 
> This series registers a struct phy for the PHY transmitter and one for
> the PHY receiver, and implements the D-PHY receiver. As suggested in
> the v5 review, the single cell of the binding now selects the PHY
> transmitter or the PHY receiver. The cell values are the new generic
> PHY_DIRECTION_TX and PHY_DIRECTION_RX constants. The PHY transmitter
> and the PHY receiver cannot run in different modes. A phy-type property
> of the PHY node therefore sets the mode of the whole block, D-PHY by
> default.
> 
>    1/9  adds PHY_DIRECTION_TX and PHY_DIRECTION_RX to the generic header
>    2/9  changes the single cell of the rockchip,rk3588-mipi-dcphy binding
>         to select PHY_DIRECTION_TX or PHY_DIRECTION_RX, adds phy-type for
>         the mode of the whole block, and keeps PHY_TYPE_DPHY and
>         PHY_TYPE_CPHY as deprecated values
>    3/9  unwinds the PHY transmitter power-on when the PLL fails to lock
>    4/9  always writes the rate-dependent registers of the PHY transmitter
>    5/9  moves the block-level setup (APB reset, BIAS) to runtime resume
>    6/9  names the transmitter helpers and ops (no functional change)
>    7/9  takes the PHY mode from phy-type and the PHY from the cell, and
>         keeps the deprecated cell values on the PHY transmitter
>    8/9  registers the receiver's struct phy, takes PHY_DIRECTION_RX in
>         of_xlate() and implements the D-PHY receiver bring-up
>    9/9  adds the MIPI CSI-2 receiver nodes on RK3588 and connects them
>         to VICAP
> 
> 9/9 has to wait for 1/9 to 8/9. It uses PHY_DIRECTION_RX from 1/9,
> and the csi nodes need a PHY driver with receiver support.
> 
> Compatibility
> =============
> 
> In 2/9 and 7/9, the old cell values PHY_TYPE_DPHY and PHY_TYPE_CPHY
> remain valid as deprecated values. They select the PHY transmitter, so
> existing DTs keep working on a newer kernel.
> 
> New DTs following 1/9 and 2/9 are an ABI break on an older kernel. The
> older kernel ignores phy-type and takes any cell value as the mode of
> the block. A DSI node with PHY_DIRECTION_TX therefore gets no display,
> and a CSI-2 node with PHY_DIRECTION_RX gets no camera.
> 
> In 9/9, the dsi nodes keep PHY_TYPE_DPHY, which older and newer kernels
> both accept. With the csi nodes disabled, the display therefore keeps
> working on either kernel.
> 
> The csi nodes in 9/9 have no older value to keep and have to use
> PHY_DIRECTION_RX. Enabling csi0 or csi1 therefore needs a PHY driver
> with receiver support. Since v7.0, a CSI-2 host driver probes the csi
> nodes. An older PHY driver then gives the CSI-2 host the PHY transmitter
> that drives the display. The camera gets no frames, and the display can
> stop working as well.
> 
> Testing
> =======
> 
> Tested on an RK3588 board, with a DSI panel and an IMX219 camera on
> DCPHY0, and an LVDS panel behind a DSI-to-LVDS bridge on DCPHY1.
> 
>    - The PHY transmitter and the PHY receiver run at the same time: with
>      8/9 and 9/9, both panels light from boot, and the camera stream is
>      shown live on the DCPHY0 panel.
>    - The two can be powered independently: the DCPHY0 panel is turned
>      off and back on during a 1200-frame capture, and the capture
>      completes.
>    - The PHY receiver does not need the PHY transmitter: with dsi0
>      disabled, the camera alone brings the block up and streams, which
>      relies on 5/9 moving the block-level setup to runtime resume.
>    - Existing device trees keep working: with a single PHY_TYPE_DPHY
>      cell in dsi0 as before this series, the DCPHY0 panel lights.
>    - The DT of 9/9 keeps the display working on an older kernel: with
>      the csi nodes disabled and without this series, both panels light.
>    - The new cell works for the PHY transmitter: with PHY_DIRECTION_TX
>      in dsi0, with and without phy-type = <PHY_TYPE_DPHY>, the DCPHY0
>      panel lights.
> 
> No WARNING, underflow, "Internal error" or Oops in dmesg in any of
> these.
> 
> Not covered: the receiver of DCPHY1, the 3- and 4-lane receiver paths,
> and RK3576. 3/9 and 4/9 fix states found by reading the code. Those
> states were not reproduced on hardware.
> 

I can capture a frame on an RPi Camera module v2 with an IMX219 sensor 
configured in 2-lane mode, routed to the CSI part of the DCPHY1 PHY. I 
can capture a frame on an OV5675 camera sensor configured in 2-lane 
mode, routed to the CSI part of the DCPHY0, while I endlessly run "cat 
/dev/urandom > /dev/fb0" on the DSI part of DCPHY0. The noise on the 
display still "moves" while I'm capturing, as expected. Thus:

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 
2-lane IMX219, CSI0 2-lane OV5675+DSI

> The DSI panels only light with the U-Boot SPLL fix [1] applied:

As far as I remember, this is only applicable from 2026.01-rc2 
(included) to 2027.01-rc2 (excluded). My 2025.07 downstream seems to be 
working just fine wrt to that issue.

Cheers,
Quentin

