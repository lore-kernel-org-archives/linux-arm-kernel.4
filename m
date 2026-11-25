Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB17606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c3pt+hQJ;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EKtQQUX4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=izFC9U20qO8V9TKSl0ze+pwRHokeJqrGaaR5RSL0x18=; b=c3pt+hQJBwZGD+T7cVoQtSI0RS
	YjsshlqP/bVXU9svQRZhx6guHmEUDQSNf5iZprPGEOIS1OqEoli+JzkUdMFLWJLpX99s1WVxd9Oq6
	7xbxoMxYaevSB6GeXyJCkU70/YTZbpWmWFLcOodJiThPCcqApRf8JM4+bkv8dPRua6hRqWzU7ZWNh
	ORe76941qQ5s3+qe4Cxhrb0go9JbZzc4bWmZgreC5/YoyAEwL0NSYRX129GypQAZxkY9X43WmvStJ
	P71E5Wx5y683O4fwPqpVX5B5ijHdSj+z+kbvcaLIUlSzPHIsZUMjvnUvAp4nVa5zTFdI+BfMOk3s5
	wekKrEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGzI-0000000Alee-3178;
	Wed, 25 Nov 2026 17:40:56 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGzB-0000000Alcy-1Zkb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:40:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IucPkh+eQV+AV5bpQJolkkZmFSIP2LQuOprioUhS/XtQD6kqXfLZnrR1n0RTuXFDqU+kwZ3etryyEntW8Wpv0cf4/BoywT/gnQQ0WnEogKlKqzPKcSjjUzMdqv/MuqgMLyOc2N0GsjvHvsARgFgRhpNR0NTnfLXy31sty0EQO2mpP8UiXPRdqEJFO7Q/jAeA9cFVvyo5irM6ZmuV424X6zYjLMcaBVKuBLAXn7OBdrH7GbevPGhwJmiBEube/1UghFEJw4N7Ff5jI+bVtstJWu1drdKaFw0t7pH5z+1rDaWH55glBstb/m5UVc7h8jw/q2bImR62sCnihafiIeeEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izFC9U20qO8V9TKSl0ze+pwRHokeJqrGaaR5RSL0x18=;
 b=YHi7aszte53311c585cUiOidVfP/TCJmaU7rwcjNvmuNQiealV3+E8tnKV89iVqLQde9hd3h7omsOHn3ib4FROMDaIGW1CioJPREXO/oUY5+MAVEa0Scv4SraVfZM0Ygf8sIQKpx2Lj97FXouWzJyt3JnjqdyWOUagUdN5HI9tUb/kxUwGFSp0sKyuGhO1nXFozp2tDLDp6aXtsOsSBIdBBtXxLZQRFMNR5ghosuJQo5TGoYN3ndDAIcJRfbf7qNvep71epLIU+XEKbW5BwmKq2AHdf4oT1Im18sJJXv5GamK3kN5GenS98TtkpmN8kIZgB3wSxbgMTsiZH2FZIBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izFC9U20qO8V9TKSl0ze+pwRHokeJqrGaaR5RSL0x18=;
 b=EKtQQUX4STYo+4xGmrBJYZ4aQ7IViWAYEy+3BmZvtniyQdITyv8jMOF9LeWiOcvDmVdWO8ZwzYIsH2xIsSYhSqPdL508OJL+sx+QCYaGpZYqjg9w5rK6TDWxqUKSuo2eOOlwXAT367C4xjpgAX+w1ZbGQC0Hhejpn9ZXI6G53jw3+VFlAn+U1iNk1h1ZJUMMT+jzCpyL/avAZZbwtWlsMDDEJNeOdPO01AGhYmh9wWZlAf05HKAe/yqMMZ34rKHS0u01zGvtfeBwxt8ZHaP/QALqgbsnQESXHrFdvfrJ3uF3W+CgX88Q1ugJk2VYtpXmHW19T6eFbnlNAIyH3HEVMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI3PR04MB354279.eurprd04.prod.outlook.com (2603:10a6:800:378::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 17:40:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:40:44 +0000
From: Frank.Li@oss.nxp.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add boot phase properties
Date: Wed, 25 Nov 2026 12:40:37 -0500
Message-ID: <179562843097.3106533.201263696828395400.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120161159.1944199-1-dario.binacchi@amarulasolutions.com>
References: <20261120161159.1944199-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI3PR04MB354279:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1b4a1d-b21b-4770-ce7c-08df4b1b3bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|19092799006|7416014|376014|1800799024|260925021911599003|260925022911599003|260925021311599003|56012099006|11063799006|10067099003|261022075727099003|261026121527099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cjgaW06E/+vxQfY/IebT7uEjQr59smioMRchxUI7m2kaO9BXdPh9sBfehMyfQgger8VnB7cmF6heFiI0LXc2MSiTihbp4O0baqxBnBexAKYRO8HLoWor/ZPzp+be5+9AaMit6/Qbpy5dtoQafSXAlSsr5+9tByEMTjPpvaIeswDyIZFB2xQ64CJP/HMuRZx0+hCr9VjUZcQs6rvIslgnCae/j/k2KCrjUr11Qno9/S07f90WcXmmtOH1RdP/ZPrHH8bYy4GrQqhVW1bLKl9XNDIiR8L4uGMX8uxOHTlDBAGu56wavcnP2F+YMLN6HPBMJcxJQ0KBZykS6S122iASKuYFR/TfJ08hz1LHUtsR1V3pbDxjfSpFwhTp/7VYNCFeoMEG7nxLFIRX9SqUPH+8YiRZoRLXXknmDpHfERASkkoJhej2GvhEselYGYrLpVjsjP8vFM6BQMrLiXwtWP0JcpiO++DpYEdGgHC6DtEUOPzONg/yVNDbiPv01mNSpRa3uhf06FOgLBm9aQeEphgHJm9OUqHqM+/as/jqxyp8mDW/dVhmcOh9h87DypeqYmhI9l2oDMbjiqeAleJ2LcfgkbTRB+tz/vjutuWjTI7k9731r5o8ObstBOeZrASVuvRPtFfhMlfmgiCgpNBtyy8K2R3X+HVjXp3CCxNjJ1r50Ew=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(7416014)(376014)(1800799024)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(11063799006)(10067099003)(261022075727099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dENQRHhWYnVTWldQYThNRys4ZkU0eXFPc0IwTXBVb2QrRWZxOUxxL1VISFBP?=
 =?utf-8?B?UEJWOUJpRTMyZVVzNW1RNXB0NjYxNVdEMVdYbE03NFlxLy9pQ1VlZ1lZeFY0?=
 =?utf-8?B?MXFxVzVJM0dOOWd2NG9LVVZ4UmJQQkxTSE9aelRUamduTVVMeVJLc09IMDFr?=
 =?utf-8?B?eWNFRUFiLzNYUUZSWFZEWGJZbUdUTEliMmhLVFd6bkVlbFNzdkNFbTFkZFdC?=
 =?utf-8?B?UFVJYkFzZExJaU9wd1FkZkx0ZVNaUXY4U05oRktXR1YzcW81M0x0aU03Qmtj?=
 =?utf-8?B?WWx0UXVuLy95eTZvVDRQcVdWcTg5bnhnUGs3T3J0Z0x1b1hSaGRzaGZMRjRG?=
 =?utf-8?B?bVh0STFkVkNrMm5HaXFhbmR5dzV4bnB1RDR4TVRzRHd4d2hneDgrem5nSjc1?=
 =?utf-8?B?Zkw2anc5WG1WcE1sdmRYV1poV1JvRVBEZGl3T1BIcndIWCsvc0dVS05xMlZ2?=
 =?utf-8?B?OEdWNTJrSlJnTHEwS0Z1d0QxYXhkdGE1ZTJYNElUeGNwR0xYRExEazlTZVdW?=
 =?utf-8?B?bTN5NE9LTWdoOXQ3bnNzY3pSYXI2eUp2NFdvYkNlanpFQmIvYlA3MkpnTThH?=
 =?utf-8?B?KzdZa1hMMlA0YVNTRmNwWmJBL0x6TzY1K29tYWFIYVE0NWZiTk9aRWdsZzlE?=
 =?utf-8?B?RjA4NncwYm8yeG41MWRaUit2ME0rWTR4dDVhL3FWYUtPRVpLZFlYSlUremhS?=
 =?utf-8?B?T3hqT0pDdWU0ZmZ0UWxZUUFYTWZ0V0FMSTdjUi9QUHdBSTMzWDd3QklNbERN?=
 =?utf-8?B?WkNqRHpreFkyMUVib28vdmtrTzFSMnZtVUpBRXd0cVhiVmR6TjBQWGdjeHdk?=
 =?utf-8?B?Zk9uY0RVa1NuTS9jV3ErVmtoRDZmd2F6RE1qWnZnZG9EakZJVGhRMnhxVTVu?=
 =?utf-8?B?WTAvaEkrcVNQL0x2UDdXVWdYWnNVOEY4TlFlaGphUWVFclplNk8wSSs4S2VD?=
 =?utf-8?B?c2paSWk4Y2Myck9QVmtlakFCa3F1QThjWFN0VENBNEhnTkFmMkNqVVIrOERB?=
 =?utf-8?B?RGt1SW9hb2dscHcvN3VlRFB4b0pEUlZKdEJRbndYV2l5dEhqL3JGd0RzSVRl?=
 =?utf-8?B?MTRSR1ZSb3B0ODdQREdhM0VLV21hYVhWVzNpcmQ0UUl3UDA1d3h6MmF4VWJP?=
 =?utf-8?B?bVgvNDk3OGd2U00wYy9hQmd3bDRybnZNWUNaWEliM0tQVk1hb29CeHE5S201?=
 =?utf-8?B?TGdaQVB5VUgyNlg3U3RzUVhxRFVkdmQ2UUZQdzAzU0RqenJrejZlQkxlcWR1?=
 =?utf-8?B?YTlwSysxWEZzRkFqS2tQWGxhODNabE9qUFdhUTNJb3c2dUZtSzJSUDRZUVNh?=
 =?utf-8?B?S1UxQ0pqZW5wTHhHK3BsWUZHZ21kLzdNVUhaZzNYQ0ZMamhsRkFVV215NlYv?=
 =?utf-8?B?L3llRXZrTEswZk8xcWtaeWdPYkJicVJKSVF3UHBWNElvdUFianlUN2poWUM5?=
 =?utf-8?B?N2J0TGZPN2svd1VnSnhCLzNHN1JQcWk0WVE1UmhEVXRLRlRLVnNUZE1PODZR?=
 =?utf-8?B?SUtrYWdxbyt5MTRxVTM3akIrTmtCL0N5SUdpWVpEWjBLMGlUWjF4cmFVbTlX?=
 =?utf-8?B?aysrMDBuZ0gxb1ZjVDh3TTNCNzlaOHJFdy96dmJjU1FIOUJzZ3pKbWV3Rk5k?=
 =?utf-8?B?UWVKdjlyV0dwQkFvRjIydjM3ZHRHREJLTncwU3diYnd6dkUzZzVYemlKTXpY?=
 =?utf-8?B?RVJkYzVyTGNzaGJaMXRDWUZJeDJxK09nOC95aGpyMVdSS3ZhMFFTM1NNYVkv?=
 =?utf-8?B?Vm80L1FYQVBNamtXaXNuVTZ3bWdjaWgya1RWWFdkdnVTLzdwWXV5bkpsMWhp?=
 =?utf-8?B?dk40WlAvSmJyY2hacjZVMlZvNWhhQithUWc4eHZLT2hndHI4aTV0aHdiL2Y2?=
 =?utf-8?B?dHdXZ29yc0RDWmZsRmFVOFN2L3lZVkFGTTdvRUswdkJxU0FxZCt3amV2OTNT?=
 =?utf-8?B?a01tWDhMUkZSejdUdVpOS1BWamg0NGhvN0RSY2wrNlNwRU4rQnJXLzlEYTNs?=
 =?utf-8?B?SnhTampPSjhudXdWd3htVkFMbFlVMXJVU1c3UHBIZXRLeHpwYm50dklNaGVO?=
 =?utf-8?B?Z2JXWW5NQW5ZRGR2TXBxak5MS0lWTjZham9oeFRxQmFSejZsYWROenlNVjdO?=
 =?utf-8?B?Q0Q2U2RNbzNlV25TVnZhZk95M1hWVlNLNmhPaGtHRWN3cVhsUTVlQzByQXl4?=
 =?utf-8?B?SHVTM09pYUttUHJFb2hpUHkxeDI1bFU0eTQ4MnRRaDcwVUFtY2dmLysxOWZ3?=
 =?utf-8?B?c0FTQ3U5S3dtNnBWNDZUTTU2dDY2ZVI5VVVGSzFlR01OVGFDWFRveXJld3Zo?=
 =?utf-8?B?L0crWnJvd240aE8ydXlvUU83d0JJNHliQ0VwRTdnUTZwYlNtOG1EZWhiaStx?=
 =?utf-8?Q?dMpecNsNFV2SdlpSdrSUcQ+GHz4VLL0dHVSs3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1b4a1d-b21b-4770-ce7c-08df4b1b3bc1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:40:44.9409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6PJmf0anYz7vsG8Z1/aKGfvYkpRBa+ljQ+6mbNN1tLUr6wJfFPaPrZ8s9NU+puD6+qPQ6R+awiDICcF92QB23rjV6qqX+jIA0pHzJ1PeeSz2HjLLUKos6EiNNsoq2kG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR04MB354279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_094049_426522_28E02E4E 
X-CRM114-Status: UNSURE (   8.95  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Fri, 20 Nov 2026 17:11:53 +0100, Dario Binacchi wrote:
> Add boot phase properties to the resources needed during the boot
> process.
> 
> The BSH SMM S2 and S2PRO need UART, watchdog, PMIC, GPIO and boot
> device access.
> 
> Tested on BSH SMM S2PRO with U-Boot v2027.01-rc1.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mn-bsh-smm-s2/pro: add boot phase properties
      commit: bd92a5150437411c2d13542b54f0db46a1205f58

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

