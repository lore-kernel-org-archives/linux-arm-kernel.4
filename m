Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB40606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OQbQaj5J;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=uiHDc7gP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E8EiU2ZSqpH4F9FIinSzE2iYqZDLtXYF/oJcAVxNpDY=; b=OQbQaj5J77suUSnRQT5HVvv6xY
	AyM835jyeGJBVyI8jKB6q0AurFhMsjJzLovOI0Y6/GpZjyP3wjZLEkNZEXLjpemAu+VnZpXYYpC+Z
	Qm2VDJ61bDhbSPOOl9yQcZJjCJPXzTvGjGLDqcFH/bIaX8jf+yJt71yeupNDFW6XCtpq2LfuRMzbq
	tYu7tneGJw4q5lK11mHKAicnQ4ujf6N8VhMZOAA4WQ/i23KLU2eevPX7c9844MtLvzRaEfA8T+zfZ
	Ayis5wZKGzLW+RKhXzPiBJauiLGVrHmyaq7wTVj3wg+4QU4XZ0b/QvBVlUrcluHysPz6Dz1hKFfWg
	CDZd3lxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLAa-000000009P0-36fi;
	Mon, 09 Nov 2026 08:56:04 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLAY-000000009OK-1MPA;
	Mon, 09 Nov 2026 08:56:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOdU28saKBolXG/XMSTMYzuq2koXqNBL+NI+FEPEf6DRWwaNBI9RgHvrZbpVGtsv7Jbj6RzDBhFrmD7A58AzSGo2aEV2LHCYPtmBycvV8EFEKdRrXZF8ZaZS0hpQ6xlFdogwNRdfVHQaCwbUV8xvRM6HZn1808KOzzbcM86PXOwyA3HalKuKrkYRJmP2NJFto71/ew3IDsuEBqa7t+NfjmqRDDEOEmA4FvBwEta8LknNLXZw2ciwNQYA3lv8jSLOfh/ufpSHwlqolzcS0JPrzkI7PjGorkDYbHgnh76G/hAPUq+wywsv/x9rMVANMn1r3qMqtHeybDE393oWImB89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8EiU2ZSqpH4F9FIinSzE2iYqZDLtXYF/oJcAVxNpDY=;
 b=ANcMwi8mTteB1H2vomguMIcxarRJhGvByTf2mP96yf+p57qhz39h62VJRcxxC8rgvW9ih1p40d8okdKzbAjzKotTMKd4taQhqq9S64pKEzoMglonXiVjWJZpnBg9ylRihJxnnZoF4VDiFfmYXQ4pgLoObQfuVghbyU9LNjlTXkUl4xiHcHl9/LuNpupmS04cALdgaU2IH/V5GOwqdCAMMrCoLkoV2oVu+hWhe2Nq47/TRDigiv8/qcxM7ffnNtfuvCe7OqeHHC6hUsz7Rw6w8BSkoeXJCl5S3fseLowCArzhojhwiSXBiVrjLmWDnuQmGNw5ta5KPsFgP1HZuEnVrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8EiU2ZSqpH4F9FIinSzE2iYqZDLtXYF/oJcAVxNpDY=;
 b=uiHDc7gPmWJjBZSGj8TBYz+hJMBIv4l0SrEzwbXyAEFk3jg9J5qGZBhqlYo1xUAcd+OBnZaK4IFFdQ372gFOFXbMSGk16XhSuy7roSOgwFu+ECb06SaN9WmuPzMXNde26ffduSmcHQvQeqMOcoW5ljk7BUv8Wa8bUUhyExjN+h4qCCkfo3H7Kun2sLHpijAI27LwTF6BdX+oLE35lrxWhDbwePf9BYHR5yI/QUWG+91ipKVr0y4241Y2k/ckASy03VIzmyt39ESEAnHclOqeuj0PtQNbgnxEhkxHKs3Hoc4fSk7M9SXIigyw3f79Ur+du677pJest2SpUqSubruJvg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYZPR03MB6648.apcprd03.prod.outlook.com (2603:1096:400:1f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 08:55:49 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 08:55:48 +0000
Message-ID: <59ed0b18-3432-48ec-a923-3105c4d21d1d@amlogic.com>
Date: Mon, 9 Nov 2026 16:55:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT v2 0/3] clk: meson: Refactor PLL pre-divider as a
 divider clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <179390104084.2573818.1569105668888286892.b4-review@b4>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <179390104084.2573818.1569105668888286892.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0128.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::15) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYZPR03MB6648:EE_
X-MS-Office365-Filtering-Correlation-Id: db217871-e638-40f5-e91c-08df3e3f3fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|6133799003|10067099003|3023799007|4143699003|11063799006|261028144727099003|261102123227099003|261022075727099003|261022105027099003|56012099006|261021123027099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 2dW0rTCoM7nz5RTAHBqskcfSyQ0k4KhgP/Z7J6/ktduQ47PN3Jge9US2NA1EkAf/nbyVW/4y2Bot7U/GvKanmeMFBy74t7NXe1eD1GmT442rno2c+vspPYHKGztXbFFoGbbpYhe2Z8BXoquqtN2WxvpZPvYvwfBPVLY7toX+tKQC3YJMY6GO6f0ht0xpi0CKSNV9OBV8nxVo7KIvdl7ht9eEoC8m6T2aVbKiXB1042wb+/mQ/1og8kd0Mf1J2lIDIjBT7TKjoz1MHwwmihs7eNH+B0x47Vy4UVqwKcDJcSok4KS+QtxBABZZm7zcuaABza59Fjh3LVlC4PDl8XbW0AwLzmz2N0eVOAQeBM9uyXYTXjgrUPdMqS7XGUo9bXsH3Im9mTRCzh+b2NigjS7bnlXmqaWsab9LyXXxRoAjh2e7cRYRw8IwMfx3PbPtV6APSHWr6MN1/jAAn4XjbIS5m+PTH0f7yRtv6B9n9KK4wS8hCIjp3+tJVPPqGp3ptXtrqmWspLTaTj2Wa1Vc79Y/+7cvrUWttfIXW/+3cPTAKC5tyG6yEF/kNgEoByJ23vSfYEaIYYCLkeMVpT0sdjx+H8kelc+qZ4ZtUiotqTjpxkNudTAEdC187R8SQUTuM31mz7yTw+hy4/cugbD7RE4F8VHJ0VyQENebd7lSizc4myg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261022075727099003)(261022105027099003)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzJWRlFZaEN0SStmUmsvL05tTzhBR2VJNDl4QzBxK3ZhK0ZUY0tlQUhYL25t?=
 =?utf-8?B?ek5RTUVtdnBQdEdtZ2Z5R1ZhVG9teEFNcUpkOWNJcFg3a2NleHFjOEVCM3VI?=
 =?utf-8?B?enZXWHFHVXFUeWMyKytBMVBYRGlPa3BCalVoVURFZzNiR0VjU2J5ME5aZzNK?=
 =?utf-8?B?ano4bW00bmhtekZiMVJlN3gzNWl0WGlKQWVOMjM4b0RtVUNZdVV3QmhETGZ1?=
 =?utf-8?B?QURGa3czWnZFZC9GQmxGR0RSa1ZpdVVXM3JwN0pZYld0OVFSMDVudHBpcWdp?=
 =?utf-8?B?SjkzdlJkSExiZ29HV3hTTXNBT3pUb2NZOEthNnIwV0VBbEJoWktabys3SWRT?=
 =?utf-8?B?eEVMcXFKWDdhZ0ljcE1xblVFNEVXaXQ3NnNnM3JEZlYyb2cvNUd6VjdFYlJl?=
 =?utf-8?B?OXB4V1gvUzFVbDZBeEJ3ZC9YcjhLRGNGSWdMdE83dXJITTZqNlZ6aGt2TEgx?=
 =?utf-8?B?UlNHbHFYTE9jdC9DSmFhWUc2T2U4VHlCdnpzbVc3R1diVHVuUEdvdkpqRGlp?=
 =?utf-8?B?U3V3QTlQWHMxbEtMd29ZdXdCN0hVNjZsTnI3SEl2d0ltemRlS0k5NlNCc3Iw?=
 =?utf-8?B?dURnc0ZCWGt5NWFkZ0Z5SjRuZ2tWOFRrTHpReVdmaUkyb1BJMzNwV3hjRUx5?=
 =?utf-8?B?LzB2ODhyNk5hMUZmVVVsWDVMQWJsSVVLSHF3UFN1QWhTZXhaZGR5TWFLVlZ4?=
 =?utf-8?B?QVhFOUNObGZzUjV5bjQyTlZYbU02NC9jMTlIUitNeXhwaGliM3d0VXQwWHN1?=
 =?utf-8?B?R013NGY2MWlHQWZFNHhnbjJhNFVmWEtvQlN1SzE4VGwvYmhTWS8xaVJET0k3?=
 =?utf-8?B?WE82ZUVNd09QQ0RRMUNhOXhIeUNlMDlIWHFkR2R6NW5LMElTblF6Z3IweHY4?=
 =?utf-8?B?TUY2am00RU5uMEFGTzBRUTY4K041aXRjK2c2eXB4Tmd0NU5SbXpURkM1YURo?=
 =?utf-8?B?YjJTbW1XenoxMDB5cVNBU0dGTllZaXVGNnIwc1FPU25JZ2xkNVQ4RndTWVVm?=
 =?utf-8?B?a3RBWjNwdy9FbHh1TmVscUZKVm56aVgwdjZqYkdWdWpPWEhKMEhJQVJDQXMw?=
 =?utf-8?B?SDFGNnM5ODhFT2tQTHF2UGpmbHJIanlKSFY3NjREWVNwa1BTcmc2NnhMbVEv?=
 =?utf-8?B?eFc0MnlMTGlaK1k5YmtPNDIvTjREKzk0aG9VZCsvb2FaY1JCSy9wWjJzTWFT?=
 =?utf-8?B?VGsyNWo2ZGJWZmVBMU5kRVMwWnkvMXpLSFFCWDYxa2toSk95NmZsR3FCaTBM?=
 =?utf-8?B?aFFEYkE1eCtWSzlKSm1oazIwckZRb0FMdktveXB6YUF2Y1NDekhZbjNiUk1S?=
 =?utf-8?B?VFpNOWFvSEI5Vk5YZTcxVUZSRm1pR01mSitRcWU1TjIrckhDWDMzc0RNa1Zs?=
 =?utf-8?B?djNTek01bFYvL0UrcnVJZnNKeUtxWU5kLzVwNDU0VDh2cHo3OGMzMVcycVRh?=
 =?utf-8?B?SUJSa0VLUTladFppb21sUU9tQldSdlhVejJaUjZqRFRyR0xUR3dhWWs5U2FZ?=
 =?utf-8?B?djlEcWQreDVVOEdndXBLdFF6NVlaMS9pbmNYZDZXMndHQWZSWGsrc3NvZGF6?=
 =?utf-8?B?a3huYjhiOGhOOTVGQ1pkK1o4MjdoZ3RvTEFMaWZDTWVRRHdaSWlnV3Z4UlZL?=
 =?utf-8?B?SEV3RzVObmcyZ0xOT094MFlnS0ZvNVhHYlBsanltMGdHVG5IbEdLNG5EL3ht?=
 =?utf-8?B?TDduOExLbEl2SzRVeHNVTnQ2VFRFcVpweXRrR1IwbWo5dGxDZ1dEUzhoOWpD?=
 =?utf-8?B?MGFqOUFodjgyeFYyV0lHQmJhZm5kRVB3OE0zWXQ1SjByajRYd3BsTUhKMDVV?=
 =?utf-8?B?QVU4SW4zcTJ6R2xxeXZ5dDlDVmhDeHdkaXhyT2IzODlsZjhZbnNET1p2NEE1?=
 =?utf-8?B?UnpzUGw3MUs2NXl1TTgxVnFKSjIvTFV0K3pNYkMzdnZFdHhGVXE0SDRZTnlw?=
 =?utf-8?B?OGs0QnNBdkhROFk4RkpMbnUyM2JSNHBPVEtEdWhGR3FIMVRUbWtSQmJjS3Jt?=
 =?utf-8?B?a1FuOEtEUFJkL0ZEcHBjbWJIaHF6dUU5S1V3MS9YN3JqNWJkVHo2Wk4ySVVR?=
 =?utf-8?B?bHFCZTduVjVSck1aYWYwR05HemN6SHdjaFdWU0lkMEQvUzVEc0piQmNHd29a?=
 =?utf-8?B?TU5VVmRjNEhCc24vaUl3NjV2ZXp1MUhUNmpORW5udWhtbjl0bUVOR096SHF3?=
 =?utf-8?B?VWpVY1JQTytmcCsvQnFqMUtMRVVjZ1lBeWIxYTBnZTFmZ2xqeFFQQ2xGWk5D?=
 =?utf-8?B?UWc4eW1RTE02VDc0SVBLQW03YXRoeStWS3JFZU14OVhFUnp1WVNJZXpBNXhM?=
 =?utf-8?B?cmpGdnJ1VGV2VmhqNHpzTDVxYWFWMVZkeUlhamNsSlllTVQ1UWxpdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db217871-e638-40f5-e91c-08df3e3f3fc0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 08:55:48.5322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTyFqwmMV0WzCCH4EGciFnonIMAlqoR3tuFQoi8Xf38AHjYuBq1Y1JnHN7HlP5czdRUMJk1M8pwm1O2Ctfj38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6648
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_005602_388114_9E169247 
X-CRM114-Status: GOOD (  10.95  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,


Thanks for your review.

On 11/6/2026 1:50 AM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
>> This series refactors the Meson PLL framework to remove the dedicated
>> PLL pre-divider (N) parameter from the PLL implementation and model it
>> as a separate divider clock.
>>
>> Currently, the Meson PLL framework models the PLL pre-divider using a
>> dedicated n field in struct meson_clk_pll_data. This makes the
>> pre-divider part of the PLL-specific implementation, although the
>> Common Clock Framework already provides a generic divider clock.
>>
>> The pre-divider is not intended to be dynamically adjusted. Each PLL
>> has a fixed N value as part of its configuration. Most PLLs use N = 1,
>> while a few special cases use N = 3 to satisfy their PLL input frequency
>> constraints. Modeling the pre-divider as a separate divider clock
>> removes PLL-specific handling and simplifies the PLL framework.
> s/framework/driver


Ok, I will rename framework to driver in v3.

>
> --
> Jerome

--

Jian


