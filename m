Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657C7606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kkCw5FiY;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=XEo0Q+Rh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AF0bWb9jav2RleGGBmJMqnsL/EYfHcUe8tIfTHZyoBQ=; b=kkCw5FiYKerue+CZWqEXMjL7tn
	cL1nYDS9MGVk6hvmQbh+u+d8O1ojHepoZnszVVHszkiBSJpJi7QBLZU6lllRbdTjkJNfReaOI9KcV
	p7+TdKLKOz5bbkeHATECF/ATgP8+N1Dn85maGmofdTY+qIOyzgv1jFT7GiNWgqEpBhb4NAfSS/tLd
	f2PWBN09NsBtfJt7lDQwiOSVlmsvC8gCBv+OnfGxf9x4cS0L/eOOn3Wh8LPR4UqyGZ8poZCLNoVLf
	boqU44VubDfDmkAvAFYdwwO/K/GiWP2OFmAoDkrpQKTFEv4zE0ftGqJzRcIUsZOo2nFAbU25sMZ7x
	Jq8zxrhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPoj-0000000FHsa-00aX;
	Fri, 20 Nov 2026 14:42:21 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPof-0000000FHp4-0pNj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:42:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMYlWAo+xRh2bmYhE7Z7Q+fn9rhKzK4CiechDYrg4lFCdKq1GhOBxnR7QO6XRRp9z7zkyxiihjY4+GIinZTYqSurXQoKS9ol9SL22zk0Qx50xtGQFl+TPnl8h2HAaFP44XGIFXubmReUGlcKEHlgvGqVoYsIALPsNDH4AQvNswpxbNjeK+53wLFxpVvTTFOP0Kjd1kdQBnsM0/Ux1WJNfGhjCDlhzKbFO7B+Dwyju6v/zA+7JcO+qGEm0V9H0H4yfTFOmG/2t7ULcNNtOEt/oKXQnIgp3j3lgK5A1jRnsML+/u+zJKUsQhVnGFSZ6VaNyTT8hMQGtIm72+UgvPirSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF0bWb9jav2RleGGBmJMqnsL/EYfHcUe8tIfTHZyoBQ=;
 b=ASAE8WOxsTqh9gvUiSALwOcmTlU85fLe9vnZXxCwh0kQlJ+DRumaHIoRrwkwgCjal/0j7699KYdHpFIMEOSTACXYcisga1J5deygrbG6M8TCl56SlmXn8hzkw7Xx8pta33veIKPiYv2oUyQnkLo6VDk5lo7HdEV6xuzrrgBj/4/kGAZE9VhLDAAg3VYtHaKpruiFRt+Qkph9CjyC+6W54P14hi7PAXgluYlILoviNwNsVI75AAs1Jf4JR10CUfM/3g5GJLuYYx/AlY/dgNUZHXfBY9sG0q5/1FmyB5lAk3GJ1TsjO8IP+hPgWFBSpowp6uKKWs19C9FP1jjLOYJZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF0bWb9jav2RleGGBmJMqnsL/EYfHcUe8tIfTHZyoBQ=;
 b=XEo0Q+RhHw3MmdIReEtFXBqmDXPzGMM7R1FPDCr4YXkOb50CqmLWviKm878g6UnWcjKP1ToQ8r7LZzVc/nTbvMHK3hsuPywmi0hOWj/iqvwX6dvYXZT5baLeHGpHllfwIn1KT45QlLPakM2LCdzexnzK0/mHUSH7HCU3Ph5IvLIX1iz946FhXhnpwQ9q6pZ0mrfoul+McOlCOPrdHeJXh4fqJoIiR/KEMkKSf01DTgmdX/d3fJaTQHwcoOwVB/hBjQYOXZyJ9MujqfcFoPOr6IWn2uRAy4iObIIZH1ZeR1popumQLvCcHRQjiSURHw5mWXkAwntwB489VLxj1wGmhg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by AMCP195MB976615.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:783::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 14:42:08 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 14:42:08 +0000
Message-ID: <53d50a7c-4318-4705-ae21-780b04628742@phytec.de>
Date: Fri, 20 Nov 2026 16:42:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: configs: defconfig: Convert TISCI to modules
To: Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, alexander.sverdlin@siemens.com,
 jan.kiszka@siemens.com, ayush@beagleboard.org, robertcnelson@gmail.com,
 upstream@lists.phytec.de, francesco.dolcini@toradex.com,
 leonardo.costa@toradex.com, matthias.schiffer@ew.tq-group.com,
 stefano.r@variscite.com, eblanc@baylibre.com, msp@baylibre.com,
 thomas.richard@bootlin.com, miquel.raynal@bootlin.com, mwalle@kernel.org
References: <20260910134409.1713610-1-nm@ti.com>
From: Wadim Egorov <w.egorov@phytec.de>
Content-Language: en-US
In-Reply-To: <20260910134409.1713610-1-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|AMCP195MB976615:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff9bd51-2f06-4a85-4b9f-08df4714743b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|7416014|366016|261028144727099003|261026140227099003|261021121427099003|261026121527099003|261021123027099003|261022105027099003|261022075727099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: MihGZb4kqtj8J+m5mM6SjLrleZzqy09rLtNH1a544YG13Y3H6D1nWnjvHQvUWX9tf4gpwLW0l8/9EoYIT3oqSQ4qUcVqdINVjcypB68d8JwnIpJ+xsKliR6w7Q3hbDyTtR1ZrzQlQfu9ZIk2FJmr4yQpQFJpkBPuAuB2e8Ccl+Wy2xfDStdYSOAE1nNBc4hy8kewC87F9ERZ6nN81Og7suvT/UZ8/7/JLmma1vZYDB/HVlSnW7WcgCqLc7BYJMPbN0ic+tsN/p1faIp3UopMPt6vFCskj9pssf19xO9+7cmsx1s/X0UZJf5/RSS5pcBUIketk/Ic29SxjRMKnRx7KvNXZm0yuPVOuNhCUnVMhFnDH8ovb21eelyr6QrOEGClEPoD/VhKaHEcBiiVCnRuV5xI4FLSQIwJ8xrRHk6sBLrSw+qKKslchvv5McK5acGPswQ62TllRRiHeZw1YQ1JnhQlWt6w/DOqIsvscqTOYd4L4FmAMVUibvIEsUDxDpq1IoIR16HYQACc6F3hejf4e3YCGh892T5kn9KVFNAQNQ80C/rVY+c6tZVvZuwwm+kpu6k/0qx9XOqArg82Mxc1d0Y3eiNFPDMWr3Hz+pydk2GY4Ka6qOLQe73TUvSL8NIX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(7416014)(366016)(261028144727099003)(261026140227099003)(261021121427099003)(261026121527099003)(261021123027099003)(261022105027099003)(261022075727099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTg1dHNaV2RLYWljMkFiUFlhSjFyQ2FSeitGRks2Q082TThlT0dobkN6YTBj?=
 =?utf-8?B?ZHpXWXNYamp4a0xXV3JRV2dsbFhGalpjcWJzK2Q0elMyVHNXZ1diNHJrWFl3?=
 =?utf-8?B?Y3Q3V2x4bndIQ2dkbVF1UHF1OHJHaFowV3EvZkhuRnlJd21nbkY5R2prUWxS?=
 =?utf-8?B?RTJ2dmJ4SFN0cUNPaitlTVJQc2FFM09xS0g3Y3FUNDFVM2ZQWDZCR1o5ckQw?=
 =?utf-8?B?UVV3QjNPOHk5NXRnbk1wV0tQSW0zY054cFRlMlJyaEFSODdYaVFscU12UnIv?=
 =?utf-8?B?elJGTkpJcU9ObHZncTNtVkN4dGFZaDZ2TEN0ek13QWVIYk1PbmFFRW5JS0N2?=
 =?utf-8?B?WlY1cU5kME80YnJHN1dqTWhlKzh1MkxHZmk4eU4yMXlRcWZLVm82SE52Qzhw?=
 =?utf-8?B?bWJDQ2YvWnRGR2VNYlB4dnJncUdMZWR2VE5GVW45TGJkZTBLY0FWYlBPY0VH?=
 =?utf-8?B?c2JlMUFJM2FPTmZqajk2QnJsRlp2Z2Nsc0xkV2IvTy9YRFg4VGJHWU9DZVVr?=
 =?utf-8?B?dkRkNHFRUzkyNUNvZjFaSG52KzlUQ0hySGFaM2FuM3ptSmF5U3U5eTZYYzVL?=
 =?utf-8?B?V2FSTkJSaDY4aVhrNnhuWHFCTTdpNHQ2cllaM2R4Q3V4dXVHUG9vYWhEMzMr?=
 =?utf-8?B?VzFRN1ZROXNUa0tMT0M0K1RYTzFka1ZHaWNyUzE1WWJrS3hCaEIxYStLaCsz?=
 =?utf-8?B?dVFNNVFnWWdaTjkxejVXK0I0bVJUWk9PazFuMmxCSjJTQTA1ZU1mTDh0SkR4?=
 =?utf-8?B?R1hMRXFWSkthZDhscEU0bDlNcCsyOVc1Y2tMeFYzc1oxZVRKVnVDTjdBWE12?=
 =?utf-8?B?NXhaKy9hTHkwQzdacUkyZWtRbG81M1dITysvejlIbEtMcXA3WlpnNHFjdlRl?=
 =?utf-8?B?bEczZTQ4cnl3RVVzdnZYbTVUb0tIbzF3YlBESERLemhnTnFJdldhd0tCVzFW?=
 =?utf-8?B?K01OM1RZRklpSThzUTRVWUl5SHBscml4VEFWOHh2VWpzRFpKZTVsZ05rc3cv?=
 =?utf-8?B?cjZYYnI3YXQxUXF2a1Jaa2dnekhmS2pqeUZRTTV3dTE4c2lMbDdaaU9qaTRp?=
 =?utf-8?B?UHYxYWRUdi93dDNjemFUeWdLdDRUbVRIQ3ExS3RtZE43alVQZmIyeWpjVWhk?=
 =?utf-8?B?ZUpVOVZVQmZnRWV6MkZYdG9OcDJVdnVaN1h6U1QwNTdVb2tvc2VBMXFaellU?=
 =?utf-8?B?aXEwYjJZUVFxRytSaXRPK2ZlWDFTZXNnU2RlMFpzTUR6bURtMkIwUGZNTlFF?=
 =?utf-8?B?WEQrQ3hOM0h2c3ppQnNXSEN3NXV1MENtaW5MbnhHL3hNMzlTa0VUb0ZFeFN0?=
 =?utf-8?B?c3kwT2dwcTFXRVJvK2ZJUTF2VGtCeTVoVU45S3UyQjlYUzM0RWhyQ2pJQXR0?=
 =?utf-8?B?UzdEQnZrWWR0ckRCd1FjNjQ5TGZvWW96WVhPdDVkYUFEOXBpRUhWdjlmL05L?=
 =?utf-8?B?YlZCVFhJZ21IMEMwRXJVOWl4bVJ0elk5U1JnakkxUVdMR04xeWxNOURDUmVU?=
 =?utf-8?B?Y3JRamtOcWkyYkdhcFNxUk02SGFJaDZNMkpJcTBKUGdSTUkxbGZPZkNkNXd6?=
 =?utf-8?B?bVpvWWt5TXpybGQ2UU9NbGEwN2J5aVdkYnNVVzZDcXkvMC9wOFNNZEcxOXR3?=
 =?utf-8?B?Tms1bnRTYlZaejVjUWJZWGxQMzhKSWt0S1RMeTJUTm1NOWZDcEtibFhXMGxj?=
 =?utf-8?B?ZWFYc2J6TUtnaUUvaXh0RldHK2tUNXhhVy9ENUNXblFiMHFuUTdhNm1YZEM4?=
 =?utf-8?B?V1ByMHU4WE5NQkI4QnIydmRhU2UwVU1kcUpkc2dxZ0VwamtOcjVDTWk3THFl?=
 =?utf-8?B?aERra0dyQ0ZqWlpISTdnbk9SYTFJQ0JFbGc3RUlKRHhTdytueXhWdlh1M28z?=
 =?utf-8?B?R2dLeXFvaDN6UGsybzBUSUgxd3FCRkdDR3p0Z1dGTU9peTlKUFA4engzZjQw?=
 =?utf-8?B?MWxvRjBRU1dzMi95dGRueXpxMmk2LzAvL2lmOGJrY2JjbGYweExpMnBuRGFs?=
 =?utf-8?B?NGlnYTVFSnZQTVJsL05mV0dnc3Q0SnpuWkFPTVdJY1BuMCtVeXlLeWhhcG9O?=
 =?utf-8?B?b0JtU1ZRZEx4a01VMDJuYUdGVDhoZExyWitWSExOVE94ZVc1WWRiKzRoRjcx?=
 =?utf-8?B?SnRQRkQxbzZuNW55OU1KYXlCOVRFKzJhaUtZdmtENHp3RDdGcXlhTm1EaS9u?=
 =?utf-8?B?TnlIVFVEVUtOVk9xQnlLaEZZcVJWdXVLVytrakxQdEpaOVBGSDN0TllKa0hl?=
 =?utf-8?B?NjljaDFaRElsWGExMW0wY2Y4Wm42b1hQeHBDTldMajdxZFFjblBwVTF6aTV4?=
 =?utf-8?B?bzB3RTBhNlQvQThGN1ZpNGl2bXA5SHNJSHR2OWVrWDBDTERLZitVQ2h0NUNt?=
 =?utf-8?Q?7CKhXLb3Es5DKlPxXN9426nARoxVAceroOr4n6zARzLL0?=
X-MS-Exchange-AntiSpam-MessageData-1: ilyqhKlFwPsUFQ==
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff9bd51-2f06-4a85-4b9f-08df4714743b
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 14:42:08.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmszvhwsCm+D3hZ0nOcwO80TyK9ZqjSVUjjVZGS8GnJTq7VW6r6yScYxPxjnbLk8k8OvNVCe2qNeMdbet+WnVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCP195MB976615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064217_286657_E772739B 
X-CRM114-Status: GOOD (  18.84  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 9/10/26 4:44 PM, Nishanth Menon wrote:
> Now that all relevant drivers have are ready, convert the
> TISCI drivers to modules. This impacts all K3 platforms for
> boot, recommendation (based on empirical evidence) is to use
> deferred_probe_timeout=60 in kernel command line to allow for driver
> probes to complete successfully based on the initrd used.
> 
> NET Savings: (Ubuntu Clang 23.0.0)
> ./scripts/bloat-o-meter vmlinux_previous vmlinux
> add/remove: 4/380 grow/shrink: 0/5 up/down: 32/-143248 (-143216)
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> NOTE:
> a) This patch is based off v7.3-rc1 and will create a merge conflict
>   in linux-next (next-20260909), but the resolution is trivial (vs
>   bd94bea7165be450903c6d64bbcb4862e36798f9).
> b) Emperical experiments that Siddharth Vadapalli did,
>   it seems like some driver probes might be taking much
>   longer than the default deferred_probe_timeout of 10
>   seconds that is used when CONFIG_MODULES=y. Testing log[1]
>   a deferred_probe_timeout=60 seems to have worked fine.
> c) Full bloatometer report is available in [1] as well.
> d) related lore discussions[2]
> 
> [1] https://gist.github.com/nmenon/5f1587b373e6ca27170593010188d968
> [2] https://lore.kernel.org/all/20260429-defconfig-v2-5-e4ed4186028b@oss.qualcomm.com/
>     See headsup I gave on #linux-ti irc channel https://libera.catirclogs.org/linux-ti/2026-05-20
>     https://lore.kernel.org/linux-arm-kernel/20240821110054.35u5ubgaogzjv6c4@rover/
>     (original thread that triggered various changes)

I can't boot our boards anymore using the default defconfig. Is this forcing us to switch to an initramfs?


> 
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: alexander.sverdlin@siemens.com
> Cc: jan.kiszka@siemens.com
> Cc: ayush@beagleboard.org
> Cc: robertcnelson@gmail.com
> Cc: upstream@lists.phytec.de
> Cc: francesco.dolcini@toradex.com
> Cc: leonardo.costa@toradex.com
> Cc: matthias.schiffer@ew.tq-group.com
> Cc: stefano.r@variscite.com
> Cc: eblanc@baylibre.com
> Cc: msp@baylibre.com
> Cc: thomas.richard@bootlin.com
> Cc: miquel.raynal@bootlin.com
> Cc: mwalle@kernel.org
> 
>  arch/arm64/configs/defconfig | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98..ed5aebf96080 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -267,6 +267,7 @@ CONFIG_RASPBERRYPI_FIRMWARE=y
>  CONFIG_INTEL_STRATIX10_SERVICE=y
>  CONFIG_INTEL_STRATIX10_RSU=m
>  CONFIG_MTK_ADSP_IPC=m
> +CONFIG_TI_SCI_PROTOCOL=m
>  CONFIG_GOOGLE_FIRMWARE=y
>  CONFIG_GOOGLE_CBMEM=m
>  CONFIG_GOOGLE_COREBOOT_TABLE=m
> @@ -1403,8 +1404,8 @@ CONFIG_DW_EDMA=m
>  CONFIG_RCAR_DMAC=y
>  CONFIG_RENESAS_USB_DMAC=m
>  CONFIG_RZ_DMAC=y
> -CONFIG_TI_K3_UDMA=y
> -CONFIG_TI_K3_UDMA_GLUE_LAYER=y
> +CONFIG_TI_K3_UDMA=m
> +CONFIG_TI_K3_UDMA_GLUE_LAYER=m
>  CONFIG_STM32_DMA3=m
>  CONFIG_DMABUF_HEAPS=y
>  CONFIG_DMABUF_HEAPS_SYSTEM=m
> @@ -1456,7 +1457,7 @@ CONFIG_CLK_IMX8QXP=y
>  CONFIG_CLK_IMX8ULP=y
>  CONFIG_CLK_IMX93=y
>  CONFIG_CLK_IMX95_BLK_CTL=y
> -CONFIG_TI_SCI_CLK=y
> +CONFIG_TI_SCI_CLK=m
>  CONFIG_COMMON_CLK_MT8192_AUDSYS=y
>  CONFIG_COMMON_CLK_MT8192_CAMSYS=y
>  CONFIG_COMMON_CLK_MT8192_IMGSYS=y
> @@ -1678,7 +1679,7 @@ CONFIG_QCOM_CPR=y
>  CONFIG_QCOM_RPMHPD=y
>  CONFIG_QCOM_RPMPD=y
>  CONFIG_ROCKCHIP_PM_DOMAINS=y
> -CONFIG_TI_SCI_PM_DOMAINS=y
> +CONFIG_TI_SCI_PM_DOMAINS=m
>  CONFIG_ARM_IMX_BUS_DEVFREQ=y
>  CONFIG_ARM_IMX8M_DDRC_DEVFREQ=m
>  CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=m
> @@ -1745,15 +1746,15 @@ CONFIG_SL28CPLD_INTC=y
>  CONFIG_XILINX_INTC=y
>  CONFIG_QCOM_PDC=y
>  CONFIG_QCOM_MPM=y
> -CONFIG_TI_SCI_INTR_IRQCHIP=y
> -CONFIG_TI_SCI_INTA_IRQCHIP=y
> +CONFIG_TI_SCI_INTR_IRQCHIP=m
> +CONFIG_TI_SCI_INTA_IRQCHIP=m
>  CONFIG_RESET_GPIO=m
>  CONFIG_RESET_IMX7=y
>  CONFIG_RESET_QCOM_AOSS=y
>  CONFIG_RESET_QCOM_PDC=m
>  CONFIG_RESET_RZG2L_USBPHY_CTRL=y
>  CONFIG_RESET_RZV2H_USB2PHY=m
> -CONFIG_RESET_TI_SCI=y
> +CONFIG_RESET_TI_SCI=m
>  CONFIG_PHY_CAN_TRANSCEIVER=m
>  CONFIG_PHY_NXP_PTN3222=m
>  CONFIG_PHY_SNPS_EUSB2=m


