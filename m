Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE6606A887
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SmvJfVS/;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=pNy/HNR2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cAohnXRlhmTtbn5EarDJT/yhoqvFcXPLxV4lwVGoOWo=; b=SmvJfVS/KHXp4eeNMR8NfXbXdP
	zFUn+8twukvDh5vfNAN2zbZ/TqZycC/w8f7dfEwYO2nA/lRToYllYKvIA5D7bXWsXoaH6tuw4GlCg
	BDrl+ti94JNvL9S9WQBjNJqDoVTG3wz+q4PEP13Y+yLX6reDAlvGB1UxrbKeNzbItuS0jcD+nZ+ef
	NHC4mpQz6GNkAfo/PG4oWET5cIpARkxhLA9g9zpmG8kpUXgzXV8huvab6UruyBwh2tew/w6i/9vzM
	2dkplXYkzD1+Ao6leQQEMIm8TOaUHHBrCqQNYL2bW3oLQksOcbh3n9iaRTVJ7gNIWVAfljFTbpKR0
	pxFRLPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFYL-000000055tc-3gId;
	Tue, 17 Nov 2026 09:32:37 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFYI-000000055qY-1BI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR1XVuH7ly1B+EkyVU0Jm8DgsRpRZkzxVtGCSL2KydRIS5kgY79fbl56sgIgibmw16Kh4QqHdO1WJf7vvRQWVxMT7QcSEt+C8QfVsZnXrBvMxujEIqWeTCC8fFTeLbQZibO0binl3b5oUNw5XMScqG5vggDG6DMDRxkzwaVaUuV1fWbCW6q+i9jYgQzSsFFKYvxTbuCQ5UMw86uBEsTDY1rsT9j+jPgqx3p8r278htuZ3ot3DDXsT3hN4AwCVcCAlV+6BHvZ6eUNtIxaVxKDCJCMj/1adSKS+ggRjvZLNF+M8ZZo0DydbDrJJkt9DRfM7/8DkMmVDkT2wyILy9rRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAohnXRlhmTtbn5EarDJT/yhoqvFcXPLxV4lwVGoOWo=;
 b=y1YYozH+eQYK3aqIU9pd4mEASru09Uc/eQMlR4Z5SSvBhz9K5RboYXEhssHX0C0ZGDLp/INsZLwdBJgOsKQU5THXi5Izkp/dHgHac9ZhT7IQlMj4q5yCjiVRPEjjVJ/g259XWq4+bwXu9tMZqCkgagfP91SEjZW5XK444XDgdowQxxa2spnWtIxuz2jiVz/O7R16VAn1+N7fkpoTyu2ceKdhZxQj72k5it0kLg8eCDjoFCZRo3yCYJpedAOHbNPYzIXRnVqo+WsZNHRaVOOFzRO6SCDviSph5vNd/H3AgTZ6bafslnT09cbXt5pslcI/Y9sWlsrsFqFytvD8ZZ8HQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAohnXRlhmTtbn5EarDJT/yhoqvFcXPLxV4lwVGoOWo=;
 b=pNy/HNR2PHjjO6zElTwGzrsbasrxv/2vqh6Zl0Ffqhm4edWSHHZMQ78CI6kSf6qIhNbKPO8uSjEiHoo+ndULj1xKWsTGztit2cFiezVhgdQ+rWRgZnxY8XK5Xqou9diPICrrwjlw9Ob4cslWjcGjEd74XSQPAl3qnHrhxHjWUgdPYunh9uRbtli2NN3vHj///wZnWgWuEZQRYDyRTJf4g/OxOS9NUbZcIhCFtMGNNvPsmHTygLjl3u9dj9dapr1sJsW3s0SJ+ZJ3KjHTZpYDpTq/rEoFhL2JhlV++JtVayNUCmE35JT2Qa31EjDRtpFyzBm8/hNOBHBM0D8ccS7xxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:159::10)
 by VI0P195MB2840.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 09:32:27 +0000
Received: from VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894]) by VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 ([fe80::2f8:67bc:a785:6894%7]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:32:27 +0000
Message-ID: <06904f2c-379b-412a-a842-04d7898c56d4@phytec.de>
Date: Tue, 17 Nov 2026 10:32:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: imx95-phyflex-libra-rdk: Add overlays
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-3-3ef58af5e689@phytec.de>
 <avc7o0T0-tSW_c0H@SMW015318>
Content-Language: en-US
From: Benjamin Hahn <B.Hahn@phytec.de>
In-Reply-To: <avc7o0T0-tSW_c0H@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::17) To VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:159::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P195MB0623:EE_|VI0P195MB2840:EE_
X-MS-Office365-Filtering-Correlation-Id: 298d6687-9b6f-459c-f084-08df448db1bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261021135927099003|261022075727099003|261009221227099003|261009223027099003|261026121527099003|261102123227099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: bRhtk6XDlaNFep9CNu+OO9LzoihvTt6yMEfINmMmEYMEAyUpY8YTdejKat/J4yU/kaHHVsBVLpVKAbcAHqN4wnyYcaH2MooBIrgByFPDclp3O3g34JwcHsaULtpu3m1J6cowrSkj6DK3FJ3XdouEGEC+iE6x/ilhLXpWGuOwKtcSKKwFrRcYApp4o2j7VRRFmpFSNj74nJD9Tj5ovmINtvUAKfEysch9PsJvPWz8/LfbQWBNp2gF/tALZ92tjO9igxZSfc1v83TkUXkNuiV+I4kIwVWZVcnWJkf9O8IQyUfNfMd3p/AZcCO/QxqF1HdZa6l53yHx/5d2ryFANxJ3tlNJfz7GjObVPSDryehMHKiQfsksPTjLZoYjwS/J4AnjWvQbmtaR4QSeTLGlIQnWYZNQcidiDSNcmW0QJf+B5Rcd+N3TZsf8LsBoF+u+BkfeYg1aFQzT6q3ZbLP7rBkV6JCmgwWC42MA3dn2edisrVTcBviczkKe6/jqsO/TyOAodirvvrxrp9WhSFV0yStsWSTp03IC0PFMEZzt9XRW9k/ZyCQYrWHWi2yfhDEfyO/3EgNgsaR2621WRV+TcXkZQCGdjqY4vRyJSytT+8KldL4Jl7lOUzBBQp4Ye3NIHAUe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0623.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261021135927099003)(261022075727099003)(261009221227099003)(261009223027099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnk0ZUdYRFhNWHVMM3c5Y3FWS1gva3lIM3JBd21SVWd5dHlEdEZmajlDcGsw?=
 =?utf-8?B?R2lpU3RoWmtyanlucCt3VCtVN0YvUUc3SmdRZWx4REhmeE5OcUk5NDRRZFB2?=
 =?utf-8?B?NDRid2hmb0w3YzNlM0xaS2w3cVptSzc0ZnV0U0lxa3FtV3I1NmFuL1lsaFpo?=
 =?utf-8?B?QkMyK2RJOFJ6a0VHbUZsWHZhMmRsUUxpRW85UXNWN0F4bGR1Qm8xemlDSWR3?=
 =?utf-8?B?dVM4ZkxoUjQ2ekdrUW1rb29jaFkxUlZNUk9LQUplb0gxM05zdDZzTHNVeWpG?=
 =?utf-8?B?SUF0djN0cVJMRXVTYmpqWjhWYWxDUlVBNnNPS3V2T1VQdFBxQUZFdkFaYWRW?=
 =?utf-8?B?RkJ3aVhRbU1XY2lxU2VhWlUzcUdPcDN5cmdEdWFiL2dLZm43OFJ3TkJIMzlo?=
 =?utf-8?B?a0RlQ2h2ZitORHZzRHBobzIwTnlGTzM5NGF1VDhXNXRwR2RMb2I0b09zaDV6?=
 =?utf-8?B?SGJXOU5oSmVvZ29LemlXM3NVOHBXWkgxUjFTM1BjcHd6bnQ5a3Fyb0J6Yi93?=
 =?utf-8?B?K2h3RDVObXozdjZCbVFHY25UTGgrSVZ4WmlmRjlUaW02SnFPVDM5dHpuYWph?=
 =?utf-8?B?V0NLa09LOXNPWWZYT2JLMTd6bkttVzlmb1BLRDVNcTVVM3RzT05MN3ZWejIz?=
 =?utf-8?B?UFBmRnIwdGZPV09Hd1FQOXlOTU9Vb2JNWXZJN1lweDZncUx1R3JmTlFQRENQ?=
 =?utf-8?B?bW9paGZFQUlDODNCQkRhTDBOZ0RGYXhCMkJzTjdkSlYyRFUwWTNrVXFnNDlt?=
 =?utf-8?B?UVZOSm1jdG1jOGlTaGZIL1hRcFhGcktJdGNJaWF4TTAxTldYSDV3Vk0yVDB3?=
 =?utf-8?B?amMyeWcyZzVpd2gycmJuaUFmTDB0RFZQaEFmNnhVQmNyT2QzUVU3SWlCcnh4?=
 =?utf-8?B?VmdkWHJJYkN6dk1Jdk5rYVV6cm9RVmdOMXFRWGpubVd5VTZBZ2RHblo4Uktz?=
 =?utf-8?B?U2pqbFc2SmlWaWk2QUF0a1E0T1N0dE1UanJWYUgrL3BaVW5jaXdtTXBaUzBp?=
 =?utf-8?B?c3YzNVJXSTRFWHBiVk9EdHFKcTJOdmpoTUk5aWJSSUY2TEVzUGZPVVljWnp3?=
 =?utf-8?B?RGY3eHFwenk3U1lqSFh4M21COFhMeFRjaStoLzFhdUJTeXNnUVpVUzBZNVMy?=
 =?utf-8?B?Wmo3bHBWSjNSdnBmRmxLNjA4akZOWEJjSmM5eG05LzNIQjVIbjJQdi9vTitK?=
 =?utf-8?B?OU1ZRzlqdVhRM2oxWUJydVRSNVM0RUpsMURBWE5LVXhSZ3JIUlpJQVRwbEIr?=
 =?utf-8?B?VER5QjNqQWxUcXBDZ3dOZ3dYWGVmYnBVVEZHbWt3cmpzY3NmV2hwSXgyUHQ2?=
 =?utf-8?B?QkFuWFcxSWpoZkdBZUFDaytrQ0U1cWdqUEk0d01sYTlSYVNzempoNnoxWXox?=
 =?utf-8?B?ait1NWJLendhdmR0RExpb2ZXQWNEV044QUI1dUNMQlhidDNFRVlGV0QrbEpm?=
 =?utf-8?B?cjFYSDZISjUvNDhmbWE2bjFzWEp3OENiZlo0d0tkV1ViUVJDLzBiVkhPOVlB?=
 =?utf-8?B?MHdCcDBsR1dZQ3IvaDNBTjFBYm1HSCtaUnh1UHFuMjBqRmJNR2doVHlXZEtS?=
 =?utf-8?B?emNIVXpManpJN00wSnF6YVJ3Z1dpa0R5NVphTFZjOTZQSjBkdzlqb2ptUUV5?=
 =?utf-8?B?bDFwYmNiODlvYktTMm1LTWdINjdVeTNhdkxnMXR5NURJT2pzbzRhNUZjMTdF?=
 =?utf-8?B?UUY3YW5vQTRJRFByU2F1QXdmc2Y0aFN2bUdZT1JYcXA0YU9qRWFNYWYrZFFq?=
 =?utf-8?B?SUhZM0pWYUN6QjNLemsya2JUd1VvUFgxL2dFS2Mxb2lQbjN6Nk10QVBsSXNj?=
 =?utf-8?B?d25GOGtJaytOdUJEaURNNzNkRWRRVU9RUDVmditwTnA0NFdSVGVwSjhjODFC?=
 =?utf-8?B?aVowZG51OWU2eVU1Z2prUFp4TE1tbnVqeGlLTlZHM3R0b1FPNzFyYVBkWTlp?=
 =?utf-8?B?QmVIQllMRUVYeU9WbWZZQ3p6QU5zN0VTbU9MSCtiT3llOHA2V3Z5dXlIc3Ji?=
 =?utf-8?B?b2NBbzVsVmE5TnV4c29hb3ZjVll2aFhocjNTWGFhazF0T0ZNQ1dSV1BoWTBq?=
 =?utf-8?B?cTY5M0J5NTZ0bUhaelVrN2wrU1hON2Y3b2p3NWIySG1USkw1Wk53c3g2Tlhl?=
 =?utf-8?B?ZEtqTFJ1aUl2dUE1RG9BME1mQVMrQW96N3lTSkwyMnJ3OCtEMG1iRlZIMGNh?=
 =?utf-8?B?R1JlemJkellTOGZlTVkwVWJRWVhZQVpDOTcyQklLV1hwYkljNEFUTzBJTGVM?=
 =?utf-8?B?U0g4U0FNZC9aVFZtbHVqcFMxbWtPS3lYbWUyOElMVFJqNzVacDlNYlFzQ1dt?=
 =?utf-8?Q?zmWcj6iu8zsgLTIBR9?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 298d6687-9b6f-459c-f084-08df448db1bd
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0623.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:32:27.4431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs4/1PPfSfdIE0rVLqofWVHJ7SsyeVA6Pbb3QyvEc9rnlJrmkz1/0ksNRI2GoWzu/1Y0J6+1VpYkGTcD9afgiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013234_347318_83C298AA 
X-CRM114-Status: GOOD (  22.50  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 13.11.26 um 17:32 schrieb Frank Li:
> On Fri, Nov 13, 2026 at 05:00:05PM +0100, Benjamin Hahn wrote:
>
> subject Add overlay for som temperature sensors and ...
>
>> Add overlays for SoM temperature sensors and M.2 Key-E WIFI/BT cards
>> that need the nxp,88w8987-bt compatible in devicetree (tested on
>> IW611/IW612).
>>
>> Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
>> ---
>>   arch/arm64/boot/dts/freescale/Makefile             |  9 ++++++++
>>   .../imx95-phyflex-fpsc-g-som-temperature.dtso      | 23 +++++++++++++++++++++
>>   .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso | 24 ++++++++++++++++++++++
> which is independ, suggest use two patches to do that.
Will do
>
>>   3 files changed, 56 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 4eb7508193e7..17b357f4886a 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -739,7 +739,16 @@ imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
>>   dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
>>   dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
>>
>> +imx95-phyflex-fpsc-g-som-temperature-dtbs := \
>> +			  imx95-phyflex-libra-rdk.dtb \
>> +			  imx95-phyflex-fpsc-g-som-temperature.dtbo
>> +imx95-phyflex-libra-rdk-bluetooth-88w8987-dtbs := \
>> +			  imx95-phyflex-libra-rdk.dtb \
>> +			  imx95-phyflex-libra-rdk-bluetooth-88w8987.dtbo
>> +
>>   dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-fpsc-g-som-temperature.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk-bluetooth-88w8987.dtb
>>
>>   dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
>> new file mode 100644
>> index 000000000000..84afe1ff9f06
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&dram_sense {
>> +	status = "okay";
>> +};
>> +
>> +&emmc_sense {
>> +	status = "okay";
>> +};
>> +
>> +&ethphy_sense {
>> +	status = "okay";
>> +};
>> +
>> +&pmic_sense {
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
>> new file mode 100644
>> index 000000000000..1601e04b3940
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
>> @@ -0,0 +1,24 @@
>> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
>> +/*
>> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
>> + */
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&lpuart8 {
>> +	bluetooth {
> Can you add label for bluetooth at boards file, so this overlay can
> reuse for other 88w8987-bt module.
This would be technically possible, but I don't think it is the cleanest 
solution.
1. adding an empty bluetooth node into the base dts leads to DTBS_CHECK 
errors:

arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dtb: 
serial@426a0000 (fsl,imx95-lpuart): bluetooth: 'compatible' is a 
required property
         from schema $id: 
http://devicetree.org/schemas/serial/fsl-lpuart.yaml
arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dtb: 
serial@426a0000 (fsl,imx95-lpuart): Unevaluated properties are not 
allowed ('bluetooth', 'uart-has-rtscts' were unexpected)
         from schema $id: 
http://devicetree.org/schemas/serial/fsl-lpuart.yaml
arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dtb: 
serial@426a0000 (fsl,imx95-lpuart): bluetooth: 'compatible' is a 
required property
         from schema $id: http://devicetree.org/schemas/serial/serial.yaml

2. I also think this is a bit missleading, as this UART is not used fix 
for bluetooth on M.2 Key-E, but its default is RS232/RS485. It can be 
switched to Key-E by the Multiplexer controlled by UART1_BT_RS_SEL GPIO.

The (default) state of this GPIO also needs to  be switched when 
enabling this overlay. So this leads to the overlay not beeing generic 
anyway.

>
>> +		compatible = "nxp,88w8987-bt";
>> +		fw-init-baudrate = <115200>;
>> +	};
>> +};
>> +
>> +&gpio_expander1 {
>> +	uart1_bt_rs_sel: bt-rs-hog {
>> +		gpios = <14 GPIO_ACTIVE_HIGH>;
>> +		gpio-hog;
> Look like it is pinmux ref gpio-mux
>
> https://lore.kernel.org/imx/20261023-dxl_lcdif-v4-5-4ae8395a4b23@nxp.com/

Looks like a good solution, will do.

Benjamin

>
> Frank
>> +		line-name = "UART1_BT_RS_SEL";
>> +		output-high;
>> +	};
>> +};
>>
>> --
>> 2.53.0
>>
>>

