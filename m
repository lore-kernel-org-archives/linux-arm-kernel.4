Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652A8606A8A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C8igtS0U;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qKNfOwxN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3eJCrC3hJloM40RGA84HIxmNU0FYlKKofM/aF1CduMs=; b=C8igtS0US+lkNRKSICVfar6LIm
	tceSP0sZJmop9790pb5zQ1XZCOOBENIefvMQ17MkGuF9fFHX9G+iIOYiajc9xmt7UVfppDXsnoJUG
	8IQnJDUmeKAKmNw1fBEpupJ5vXdziErWXVOFKbchn9SNIZIIFT2Rax5vQYde99+p/HbICiEDAhTml
	66a/5PXpHj41MmaS4x+5ENva/xmbdleEU9IKSAyZngAr6xJLRqJ/NKiVGDS46HaK5kE4P9KnGPTrz
	W+3dKPZ6zjvRSkZYVN0Et65Xa5fQ3OklHTVdrElrGR3/yYotRNrS9H7dx+ZwgGQjJG9duIlXUC/3R
	FB176kIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT2L-00000009jmx-2JHp;
	Thu, 12 Nov 2026 11:32:13 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT2I-00000009jks-3SJR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:32:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5uybTDgK6UCpHIQt2MhvQNd0qNptz/myJsr36u3Y13gyELKKu4W/sIL9ppougvYPelzjgZWe85OOcJfgcIUrDfdt5jmCZTok6alZjLcI8j752A6wrvLz5xJypOqUQ8g+KOZy8pc2HEQtNuP4p+ULinRn0F1UrJZwOrXsHSrHiiKnOf7kYiQ4rRUhdWJ6yO35a0VokGyvSMXC+qMXHNESw24fPnVBxN2apLiQ295SieUN4YiIRwz9TS4Q+5gu2KjEAwI80QDVwbzNG0UxYTKtOtsizvhGI3wEHK8HklAFLY518Q/X7KK8nvEUivlptrf3FdqWwhL02Hf+S2CALjaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eJCrC3hJloM40RGA84HIxmNU0FYlKKofM/aF1CduMs=;
 b=c/oxZvKoiBbqKwGFQMCbIK+ISurVYKMHmmhzB+nUxSsFw/mlK+vjeIwKfwWzGGxIGitvwbWFU8ONp5KgRoVQ6ash/BW8A/EfH+vomRAIjPtoRa1TzAzaoa9MeCn9L/MEQWfdywRS6Zf6MLxJ1P/WP7cUPpmNM3bOZqne/X2ePOmTprHiqdGyw9rl3FoS/FE56O5WdEkTWL92tzmpSYHocRuR7ZB1vvzR9I15ZWr9ijWQ1fwIUoWrFJsN94Og9/CRyoMkDvk2IX6BzJfog+RWplpPadqTQ9M1wo+KBqCmC/S8GiRj38mxoZVWcVo6vYgqCJzniVzTV+1iRUOtsTOrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eJCrC3hJloM40RGA84HIxmNU0FYlKKofM/aF1CduMs=;
 b=qKNfOwxN2ms4FdB4qBCwvlKQAs/XMEpoHMz2PAeVCxD9q1LPLM0qKbApUvhp+W4Yza4T0mIjSiJ96qbxWmtWMXzP9ypnr3P89owBfUvHCKFmvN4LxSRwGfqNIWRo899exXPidEvUOMBl6mZm/d1z5SY979JvTFRRLGVckEu5MPrhhkGek0nD/kb9udJSbfSwU50IgFoPkh8zL6SA74MU8NDPRpUBEHH0WoTMWJ10uTzp8W0ggHfPVSMOqounG1PtdDKprlPG0listDmNc84BJN3OCFKOhiEyUIcukooVMa/kkl1aLz4yac95kw97mOypbSd1GLIM6E8IphBAEMticg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAXPR04MB8125.eurprd04.prod.outlook.com (2603:10a6:102:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 11:32:02 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 11:32:02 +0000
Message-ID: <ae406de9-258e-432a-8cac-e5c6b9417b91@oss.nxp.com>
Date: Thu, 12 Nov 2026 13:35:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: imx8ulp: add HiFi4 DSP node
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
 <20261111031808.570680-5-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261111031808.570680-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PAXPR04MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cd6ded-359d-4539-c2d9-08df40b09203
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|921020|10067099003|4143699003|11063799006|56012099006|261022105027099003|261028144727099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vmfLmkRSZ42p4iPWWJFHKnqJr/gXAaDfBiLCqagOLTTy900U7Sl1sxiFnMKjfKQuG4z+rSipVgrqzaw2PkuIpjcbsOjVkCvNuWBhJhRqZi04s7dnYoA4r8kgeHRpCaf4XoX7pgvAeh2wnfDRfE3ybMIz4ZYFQ76b6HRVWvbwUb6U+SCazM7k2UpoVlO0h2DAsBCSpRcoPgt4uHx/mUdteB6i9JzRJKupl7N62dCEMR+nIM8iD9weZsHLol3mmzc2NpbnYh5nhQHzHXYNu/3rpmJDfIc3z0MMR8z2rK+JYfrbIIzbpKt97npskaWsW4/+DIhT0vEbe005iVJ2Y2a+zdZaJHozUAWWWJzatKxwUkQyE99cJCZhUKnRCdo8KcHWpkUdOjJTqawV+FaePzQy1d35EjnonQHYYhCyrx/5p7NzHL+iVx0fJDamKoQmC95oamK++1FXtKPzZZEihAlhzaAgQSDWDg+7PqRE1tzwFGJzlPrja56AuXdyftncTn0I5aXzBO1/AyvEsIg/gvg2QhWETqBhzuivtbmHUvVPl6FxP4FW95yMzwx3eIfHT4aElOSiq60dPzfn90wCHgx1V38DSkVFI6V1EnypWK/rKahkzMcWsk44OUmfW8HHuEIAc2Iblb3vIaA1ucFwHnebDIt/k/HvZ73GSrltWKybnBWLERMpqV3qnuU3rHcv4UWqxiqUoWG+Me/Dbi2qibjU8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(921020)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW1UUXhKSElxNHdQK0Vyb1Y2TnZhNDR4dHlndUtkc3B1eHdEQXRqb2dHYUd6?=
 =?utf-8?B?R3lUdDZuUnpYb1JTL3lMYysyZGNndHdWLzNuenZtVVorc0pyNUhwOXBaRHhT?=
 =?utf-8?B?MjB2eHh0ZllYcHVOcTQ3cDV2S3ZNb1c2ZWppbWhiTzdueWtNaWFOWEF5b2FE?=
 =?utf-8?B?WG5ZRkRLYjZKcXFFekZDVTFMNytTRi9ZTU9kR1hpN0hoQU9oTTZTZDJDcWtt?=
 =?utf-8?B?VXFpbUJHdEprRGVVMy9NYlJoUzFqcElUTXFoaDIvMzNIUVVoMjV4Vk9QKyt0?=
 =?utf-8?B?ZDU0MmQ0WmFHeWlQSGFjVVQrS1VEcDdlL0JkS080clZ6NDJqVDM0T2h3Z3dC?=
 =?utf-8?B?dzBJQWR2a2VORGFzZ0VnMTk0U2RFNWdJVXFabnBlQitwQkRoNTJxS2p5Q2Q4?=
 =?utf-8?B?WW0ycVNMU0VNSzBnaGhpekxia0VjUTkxLzlxeWsvUXZVQzRWUFl3b3Q5MVRp?=
 =?utf-8?B?cUpTS1dSdmNHcGhZa3R2ZWl6UjF3Z056Zm91VUhKcmJ4eHI1d0luOWtYZ1VZ?=
 =?utf-8?B?alRYZWNRUkszaXNpV2c2azJiUWIrYWlIeFgycjhpaUFXRGxyNzg3aGVNUFVQ?=
 =?utf-8?B?QkxBYWNKQmRpRXkxazhRNk40QVpGTG5kT01RVERhTDhiaytPOXphQzF4cXp3?=
 =?utf-8?B?Qmp6bnQwUmJISmV5Sm9QNzduZkpvTkFzZldhRkRHbTRzbjdGbFR2VmpsSG5l?=
 =?utf-8?B?WVVTUTRSMlAwRDZ4Q1YzV09WcG1BV1lCVTNpMkxJQVkyY3NoazRCL1pwQzhv?=
 =?utf-8?B?K1V3aGZOeEpQVmpJZVRzTDdKbnFUMlQ1Wi9NUWNtRk9jOFNtVUw3aHJpZ0VY?=
 =?utf-8?B?ZXdVaU5wOW44MXhXQzRwc0NxaEU3MWVMeE5NSTVrTjlkL21zdlowWUhNcVNO?=
 =?utf-8?B?QmRPWlA3VEFUczZxcmJGSWduQ0FlZ05odTNmUGhMTlg1clFXTzE2QlhoRjZw?=
 =?utf-8?B?SE5IaGhFL3pVUHpDTkRpWUliUE95RHAvL21nMHp5YUQ4dEdPWTJGczQ3VkZS?=
 =?utf-8?B?cDR4Q3lNdFZhYkFLSkY5UzJjYTUyenErYy8yR0xJeTN6SlFWd2w3ZHc3bGEy?=
 =?utf-8?B?STZ6c1N5YjBRcVBsQmVyb29RWXdmOTNvTW1ZZWRpdHNCWUM2UHQ4VFd6c0JK?=
 =?utf-8?B?ajhZRkRpa3BtRFJoVHkreXhobWVuVWk2M0NjV3doTGFRZjFFeTM0QnQ5SVoz?=
 =?utf-8?B?K2FZMXBuYmdpVGRGZ0UwNzhOMVd2UFVxa3I4V3I0ZGw4MnRTcm5QODhsbHJV?=
 =?utf-8?B?UDBEc0NQVTk3dFVDNVJrUWVoRGZUY1NpeTJTS3RoQmpiamQzbTg1b3ZzMjBz?=
 =?utf-8?B?Vk9FaFBwM29FREMwZkt3d0pzYWNTYmFRNUR4SUVhZytpQVBxejg4SXEvOWZQ?=
 =?utf-8?B?TUduRk5lRGRHUE1WR0l5ekgvQmFpTXltZjFEODZIV1ArL2RLeExrTkxOckha?=
 =?utf-8?B?MGVIWVhrbmVIQURkN2NlMHJSNnRQdFcrTkRHenRnLzBCWlZLcExyd29FanRw?=
 =?utf-8?B?RFVBcktZQWVEWVJXNGRBcmRzOG9rM3dpNGRQZXJ2TDU4Q09kTHpqMzYwTGxO?=
 =?utf-8?B?ckduL2lPbHVPQUk5azhYc3p4ZTVVY3ZMNXVqMzQ0eCtRRml1S0hLUmJ4SHRQ?=
 =?utf-8?B?THZTaGM5R0xoVC9VdmhTT3BGbnByM0lwN1ZHVnJrUG1hQ0U1YjJLOHFVOE9X?=
 =?utf-8?B?SGJMcDVERGVoUG5DV0U4aldLdE1JNkNGV0dkaHJDS2RQSnZNdExSTzdoL3NE?=
 =?utf-8?B?RkVwZ3RCNHN1QzA0ZTVwQk5iR1lWY0tzWlV5N3loWmh5ZlQwN3lQdUJCcnZS?=
 =?utf-8?B?eUVaRUY5ZUFQTlQ2UTMxM0NzajNJRnl1alAyZ3AxY3RORHd0OVEwMUh3VDg1?=
 =?utf-8?B?Rjg3L1ErSmZuMzlBcXhadlJOLzVVU0M1QlJIS1ZqNWVSZEJGTFZTWFNqeDVJ?=
 =?utf-8?B?aEZIUTZzbGg3ZmtBYUFVU2hSZVVNNUo5NE9oQ3FscCs2SWwwUE1CMWQrWWtU?=
 =?utf-8?B?Y2QrVHVXOWd1eGQxdVlzbTBzWk1KKzF6RSsvVVNpK2ViRU02dWdZNEVjNnNn?=
 =?utf-8?B?SGRpemVwakM4QnBiZktUNVF6Q2RkUkYvU3F1VFZJRFZsUm8xaVlOOWhuUVNK?=
 =?utf-8?B?d1FvdmJFNmoxMlI0c0NSS09OR1h3S0JKMTdzczRQak41RTk1RmtWK05oRWor?=
 =?utf-8?B?MHRybzZmL2F4endTV2YzREE1aTNBbUhpZDdCTDlGOXJOLy9jc1JNNmladXpU?=
 =?utf-8?B?OXNzSE9mcFFVZWtINnRRUTlvb3pNQ1RQR0Z2SXZIajVsSDhTZEhNdlFKTGkv?=
 =?utf-8?B?TzZVVmFyNE5pVklCd3V1ODBrNThJVXVCTVVYcFkvOC84UTl6ZFlCdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cd6ded-359d-4539-c2d9-08df40b09203
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:32:01.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/POJxnttnACgN4I7YUcZhoq/sFRKX4nnrIurg7DFjovbGGTjASzQvgoQe4yrJoKf6ByHMpvjyjmpQBcBusMxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_033211_124831_D1504FA9 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 05:18, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add the HiFi4 DSP node with the required registers, clocks, firmware
> reference, and mailbox connections.
> 
> Keep the node disabled by default, allowing boards to enable it when
> HiFi4 DSP support is needed.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


