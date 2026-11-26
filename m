Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43340606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AjLRAKFT;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=Wy57bffH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hgb3CzsavLuTIWjGYHWrpq0VwKgNKC7QTXhAr8Dc55s=; b=AjLRAKFTqPHtpQzUn/5Use1C6X
	T5NANNyJUQlBJTuONW4Qh2QptN+dU3Ev+Vg0ijZmFk2I8UmU5FdForQVPgs2Jb/UZtEbnU6zeeJ7u
	f0uqu3WQel8kiMYVHK3X04ftuzZ9+S7MSOfR6bjslKATILRQcBUQjIDSjh0/4BwwgmuXmz+IQ1tSk
	3OO4P67ccfaR1cwn84qixMWyaRs/xrR0q8iHoIrIlnp4c04L2zjKuwPXfQFiu6VU8IkllvtUSRt7D
	JDT19Mtex2ljVd8/B4F9mxizNj7baQZ1lNwlWBb2rLWx/lIcW7hqzSdRwed1j3hgJsRgc9GfRENyw
	lAqxOnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW4F-0000000CbUq-0Bj2;
	Thu, 26 Nov 2026 09:47:03 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW4C-0000000CbU0-05ky;
	Thu, 26 Nov 2026 09:47:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWbu8hQaeT8xr2TNJv5iEy6aTK6DA3TUMLgPVPBIe6GJ7NEV6HdjMwFCuhcGR2ktT8s6Km7BKSo8zItoRy/eQSre4xoR0Et1/5hFtSYm2XuqQQEwXLGPrNa35mqHRgKSS4ZOOKykKFaxLsdjW2G8zuwM6Jh238PVe74I/HJs8QmEptmxz+lJ97N93PgjozbGUPUEB5CPBc/VqVsjgpUtObgjdiNIlWelrK2rfyoo1272UeYalocXFd6It4SWlbbyBVVPznLGM/tQCpFmzzYIbP+XhHXmdlyrbAWqDcOkLygLeQXhFdhXi4hWkQTbs2hK8VfQ6GLJuogIZIYH/lVhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgb3CzsavLuTIWjGYHWrpq0VwKgNKC7QTXhAr8Dc55s=;
 b=xmmQ1IjPlISwWdC8UDX+7HQiyHPDGp20mOU1mLlAHlY0JvrJ8wDaWI6An5k1Zk8ejrF+jEU761xk7iEpqtD3sYHb4ekpDTZSc/5gyk9ow4PkJeWEJcqJsmO0TihPSWituwDQuMvKO2w4sDRHYFL/v8Ps6+8x+bkUq8fqw6JXwU1aUK1KYmGoSegpVBACxtore47z2/osRCZeQcUDsXLr3LmRvyURgovCtJjjlHnrdZ0d1JX+fBHPAi73rJncfjFrCN+gNzKWfMwpGEGcs9j3o4JR5vva89jPPtQ/SlYzAnDX7QMQGEgma47+NJGEMCzZk1nDGBALSQAGmwaNezixSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgb3CzsavLuTIWjGYHWrpq0VwKgNKC7QTXhAr8Dc55s=;
 b=Wy57bffHU8sqMjxU8CnkuKPKssHPhX6lnT4uG6klSgEai7MNLEjtpA/cVnf15iRD4Mphm4wELAI2/z2gxeO+n8X4Dncnr27I+t0x6GirXBp0+goAaAnHm4BiJSdKLckaafct0pKyNoXdSDD2QIq/j7hGZDVFvG+7kRYLxfCISW2OqBnw5vXYNMrt7bPPiYOjuZw2FltPodXqTYIPAaeA7D8kzn9+KUnc3SlfFab6Kl9XHA7sqL4tZPInb1rPNiH5KSIa4S9ahpCMDcX/4szhWm9UYkElFQPY5fjYS99hs6X2hprB82FjcLZUzuVXjuNMKGzN4XBp+ZAlhf9F21iitw==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SG2PR03MB6610.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 09:46:52 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:46:51 +0000
Message-ID: <ad026f93-bcea-4dc7-8aac-fd4846d40f43@amlogic.com>
Date: Thu, 26 Nov 2026 17:46:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/3] arm64: dts: amlogic: a9: Add reset
 controller support
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
 <20261126-a9-reset-v2-3-e3d850e68725@amlogic.com>
 <3b661596c0c46390825c78d74843acf624c1494f.camel@pengutronix.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <3b661596c0c46390825c78d74843acf624c1494f.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SG2PR03MB6610:EE_
X-MS-PublicTrafficType: Email
client-request-id: e7b22258-ab35-428b-a3cb-15c8c8cc7545
request-id: 30aa2b9d-ea09-403c-858a-08df4ba232ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|6133799003|18002099003|261009223027099003|22082099003|11063799006|4143699003|10067099003|56012099006|261102123227099003|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: xEH2LmC1OcZeR1L5066rI/cC+FWfOQOdxZt3zO/hf4/rUbkIyt+qKjyZOzD4umpLuG7+nSJrSEnRgsKFMZueDg4XU+ZSHoC7R7EMB1iIOFpkMc0elcGGgy76q4ha7t6ia42VYlr/SjHiDOck6hhEYnHtv0HOmtqnogaL+GkEEXc1Y95tDocrHpI5fKGySQecF7H4H7zCYQr8i5FDsNqE2OUg1le+EZwmhMfAXlCmZx5VLolwnFI++CigC3djTdZ0GRmBxq+gzON1mPHgZXFNciBgkhT/s9O02WPCANqfk5Il7fs7RxTDI6NvbDXz62cBYgxapcQLSgQ0uuFqi15PlWX3ApXB8dGLGB3fEjf1Boru1wv0V4jJ16ByTHuGbzLBc4WKYAHkSGsg7/DO+qOBHYuU/3KX7fAlG26LpGGRh8L2gK0j3tYpoj9/6TryCN7+bQFKOQPVjM7pk/XFN83WzeMg3575jD9rrnBYsLuZCRJy1xZ9h6raVZn+qYNdPyEbetN+wzkfrptOeVyxD6WznJQGSxEoCOf3kKDAC7etCe7W/Ki7RHe5gg467zNeau9ojiMHiriz+vyo91boBdCp/lR7cuKT6zyNJXP/B5Q8UkTw+MoSpYkLbJc3vr4VMTE7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(6133799003)(18002099003)(261009223027099003)(22082099003)(11063799006)(4143699003)(10067099003)(56012099006)(261102123227099003)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REh2SFdPT0VtaUNZWERlZkVOVEhsQ1JvVVV2K085Q1lXSTRTajZwUXdlRUh4?=
 =?utf-8?B?c1ErRTRmd2MwblhkVGdMUkdDUmZTb29LdUhuNEE4NExuekZicW9vUDlSNURw?=
 =?utf-8?B?NVBpMG8zamgrWElHNGVhbmpNRVp5dGpCeHJjOVI2cjZZR3VKYjI4bVc2ZFRx?=
 =?utf-8?B?a1ZqTUtNaVFYdlNvZjFGWVIwRW5xdXNLbklJbE1uTjV6MzZ5NHF6OGY2S1Yv?=
 =?utf-8?B?ZDlIaXBoeDRxU2xBV0FZZXpzbkNwSFRxcmRTRjdLNUpBdEtUaGNTRXphOVRM?=
 =?utf-8?B?OWZSa3phOVMzODlEZnBGRi9ldlRTanF5TTZDcUpIZzNEZ3EzWmxvOUMvUk9F?=
 =?utf-8?B?R2p0WUR0ZTJoOG15eHNkK0JPZExLQzVvM0l6dmlPK2c2Ym9pelgwQjIyazQr?=
 =?utf-8?B?bzNwUHF6clMxd1NlRUQyUlhhUTNEWE9ISDlwUE1DR1pOL3YzY0p1OFRVaFFp?=
 =?utf-8?B?c0g1YjlleHhSWU40UVlOanlDbjJhV2MwcjZMU3BJa3lyYkUxV0VyNUxvVVh6?=
 =?utf-8?B?eERrUTFzOVhVY01qL0VLYi9Xekt5YjVKcmRBOHI2QVQzRHp3bjdaRmRZNEdP?=
 =?utf-8?B?R0VoM1MwamMva2tHZzZJYjRkQnVCMTBYN011Z1Y2N2Q5eEg3WXhuTi9DNTlm?=
 =?utf-8?B?VkNJR3RmWVpBUVkvQnA3TVVYd1dBQjlqc1JzY1UramxiWjdGMSs5SW1BRUtX?=
 =?utf-8?B?YjlXR3JRRlRVZHRyTXJjdTN0eHJpV3U2ZnRIUmI2SHllL0VSeEJBYXo0bVNv?=
 =?utf-8?B?MTFRWUFUZXE4blJhamdpckZZeGhyVS9RSEo4V2REK2F3OE01T2ZlMXRFSE12?=
 =?utf-8?B?ZlFOVmxxbEJ1T3dBaldNVEd5SVdVa2E0cTdnSUp2QTdPMmt6ZmFKdUwxM0RI?=
 =?utf-8?B?cENaMFdTVnB4d3B0RmVSQitlQnJSSmJSb1J5SGIwVGt6cm1mdVBoTkhqMGR1?=
 =?utf-8?B?cDdBeXhSdXJFSUhlN0xKQ0wvQ0Q4QVdwdGhxRnhRTUdTSkJydUhmOVY2azUv?=
 =?utf-8?B?SDFneTg3aXBNTnFMNjF3eWl0MzB2cXJIYnVOT2lwQUxUQVZLSTlCeWNDZjBw?=
 =?utf-8?B?M3NhOFF2eEtOQ2lNNzdCVmdDS0xCRWM2OWpsbTJWMkV6N1IrWElPWEErbUVn?=
 =?utf-8?B?MzhsUHYxRCt2dzhscEEydFlGOE9hTzgyTk9SOC9rZ1NmRVg4NUhDSHM4NVNQ?=
 =?utf-8?B?L013ajhMMFZoWTJhUnhSOTdvZ0o4SGVSS2ZTdEx5YnJNWTdLOXA3OE0rbDhR?=
 =?utf-8?B?ajZZeGlEOThyaWR6cGNqeFFEd2RacThIdWJUTFJEUldvaXN1QmZQbnl2NGlN?=
 =?utf-8?B?SkhpMEZ0bkwrYXNBdEdZVWZaWVljNTJEME4zYkxjNm0wTnVwL1ZuUFVnZ0Iy?=
 =?utf-8?B?bUVLR25ta280OGEva1ZCVnpYN0pRejZOQUViaDAwMTdwRitkYzFINkQ5N2lW?=
 =?utf-8?B?TURMU3FWUjlxbjZRd0FoN3VXcldoMUthRHArOHRNUlBVYTdrQzZhUGhpNUJ2?=
 =?utf-8?B?Yk1KNE1Qb08wQjdNSEhFRXBmM1ZaQ0RVQVBqeVFjekkra0RGUmxrZUtUSmxx?=
 =?utf-8?B?ZUN4dVlPRWRneVB4THc5aEIvMEtFQUhWRVM3NlZVbGRLQWF1bDMvRjc2ck5t?=
 =?utf-8?B?WVFMbDFDUm9vdFpGQktrc1BzVTNsVDlUcVRld2tRd0lHQnR6TmFxT2lhelY1?=
 =?utf-8?B?Q3VKZFJTZTQ5NHp4UmVCSUFwNFExYVdQY1J2emVGRkpRaVp3WVpLREJpT0pP?=
 =?utf-8?B?KzdUa1F3cytsOHE5WkcrR3Vmak5adG92bjd1YXpjQnJwNTVRdlljNFUvZk00?=
 =?utf-8?B?eFdKdjZMQkY4ODhWaDZpa2NQOXlaSzF1Qko2aHJhcUQxR0NOcmM2WjI2Ylhu?=
 =?utf-8?B?ZVVCQkxBVXpRbGZSM1NNcHAzVk9FWlJkYU5yMVVLQjNlYjNZVGxoMGc0Nyt3?=
 =?utf-8?B?YzVpR1pEUjB5ZkJza3R1Q2s5ZUxoSEJZR0thcHJLZnVvWDNneE9oSnNtVHh4?=
 =?utf-8?B?L3llbXk4V1JtVDJnaEpLZHczTHhYNUpac0hiRUt4NnlpNWpBbVVsZzVuM1hM?=
 =?utf-8?B?c0JyMHQ4aHNMdlVYRGxScUROaXJnMkt6bE9sTGZGQWdXeCsvbjVDb0NUR0tQ?=
 =?utf-8?B?TEordTMvT1Q3eThQbDljS0xRMGdXaXpVWkdOTlcwS2NqZ3BvTytkZ3R0SWN4?=
 =?utf-8?B?QmIyRDRrM2diVkNPOVR5bVZYWHRiV2l0OUlLdzh2OXFpQ2NxUEFtaE9YOHJR?=
 =?utf-8?B?OWkyOG5YbDFya1lFU2VDTWRWN1FJZUN2RU10T3YrWWhYMW9sNnc3UTR5dmg0?=
 =?utf-8?B?Z24rWUtSbnR2RjlTNW9IYkg1NjFKaUFtWFJkV1g3eERUakNXcStEZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30aa2b9d-ea09-403c-858a-08df4ba232ab
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:46:51.8660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: df9baTRyE/238jI9xdK7MlJJ5MMR6WGqYXmFiUyOg/lwRZjiJtzYc1/foU4iR42GyGB5xgKI2IE0bbdRSrAsFDJIE8H3cL1W7gh75P7Y8Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_014700_131947_1D779B8F 
X-CRM114-Status: GOOD (  11.07  )
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

Hi Philipp,
    Thanks for your review.

On 2026/11/26 17:31, Philipp Zabel wrote:
> On Do, 2026-11-26 at 09:24 +0000, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>
>> Add reset controller descriptions for the Amlogic A9 SoC and include the
>> corresponding reset IDs header.
>>
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
> This drops Neil's R-b from [1].
> 
> [1]https://lore.kernel.org/all/5a42cd49-e884-4a2f-8ffb-017828c556d7@linaro.org/
> 

Indeed, I will Add Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h | 247 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi    |  14 ++
>>   2 files changed, 261 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h
>> new file mode 100644
>> index 000000000000..55fcaa54cd56
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h
>> @@ -0,0 +1,247 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/*
>> + * Copyright (c) 2026 Amlogic, Inc. All rights reserved.
>> + * Author: Zelong Dong<zelong.dong@amlogic.com>
>> + *
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A9_RESET_H
>> +#define _DT_BINDINGS_AMLOGIC_MESON_A9_RESET_H
> Maybe rename this to not include DT_BINDINGS anymore?
> 
Will do.
> regards
> Philipp

