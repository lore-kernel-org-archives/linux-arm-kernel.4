Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65653606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=02V4wu7W;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=qdXGLuoI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SjqapPBwFT/1PtSGzIsVg1oHluOjliOBNoeg+vJzPNw=; b=02V4wu7WcHF+6NtC1FWUriebec
	iaiyOfKECri69rkCoN9FkwmaoHYUsRHm9d8sr3cF27BjV8mqlszrKXLYBK2SGCtKWqLynxGVuPluY
	OOpaJdC3wMUjCUA3oMYptiZdlIA2Uz/4DtG6CHDI6Q5UGidwM5yLBP3Qx5yXli4N9pBIPM3jB845Q
	GLzsqE1iJ1L1imq44M5jYSpHazBC2HAVKi/GbZW7qhaLPojkVUnyqlfNudh4ovzHYeRvFNMBFu1is
	pMmyzxkxXWYfTG6n4ZprxVZPYTuwWEa5nXz8aZXQ1e6Nbm9OTWP8iltEYqiRvOZXpO8yymerUeX08
	/ns52d6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9la-0000000DU5l-1cym;
	Thu, 19 Nov 2026 21:34:02 +0000
Received: from mail-norwayeastazon11013004.outbound.protection.outlook.com ([40.107.159.4] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9lY-0000000DU5N-3D15
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 21:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQcn461VuhQKiQC/C7951Wa2GMNGwHw6R1YGLW4S0dmsdnQaFPavumHCXgBe+y85O+kwGR4rYeyPRLcZ6zyNxYjwZNDXPRBiLaJRDYJDvILNlOaB9sCpBzFDNlVuc32E37zsPXrJcwI9LcAvu4L7X9x0/gBGxGR4nDkbcBvL53iO6LKngytGqlLojF9QhgSfDn5Np355cCX0uNkJk3pxiCdpOGx8QamPKc7WDmUp4fIsfOsfNUUz+sElLn0ZCkDL5RYsiq29euUcZ3/cgsCn85tAms8wQDbdNbpX+3v6TGzw2Xvw1xGpBcGaucMfGEOA+129iNyq83CTjJ+fsFZW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjqapPBwFT/1PtSGzIsVg1oHluOjliOBNoeg+vJzPNw=;
 b=xgKz0BRR6icBkYxypC5qpo/+UJFMFZUTQd1S/GYrzdGhZSaQPjHrXOMhm7xUphe7HybG5+Yp4Fpr2++rvdmwkRATHz2GJNo1OEbhiz68zWpcKo/Jbdu6xWHm+qXOC+ZhJ9MY1O/bK5lNAETA+xdhJnPfqR/DBcbOLrqJCgx/3Dc8/XSU7nCK6C1r+dEVk761nq0ugeLuoTa8SIeM91GJ0UikAjlyC0nn/7qWnUGtZuYnIO8UMnz1GVpuBUBA/7+68wd4J80rKmBMVIXri1B6O6v8Zwu/NXCrR3+VguZSfq8OkjXXzF5bYBvSDUteszeGZtMXkKe0wndHQX3pqFvt5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjqapPBwFT/1PtSGzIsVg1oHluOjliOBNoeg+vJzPNw=;
 b=qdXGLuoI/xhlKzthFUs04FT/4yw/Bd+ZeEAGG6WKfkrRbtjTCDiMPVr6c73k8gG/r6U+jwT5C8OBSNZGm/DQkUDZhtNTXav2EZmkweJ/LsJjdyghu+gpCb2c7FdUBe32PjNhLPtmw98Lq7w4TZeCSEWKgVzN519HqnqpE38wdrpXMVlX1ZvFYEHyvaYXtUmOTe9K2PTy5/OSNHvWIdUu0HH/xo1ASxmqI1wvEtrReIkGHhs+XUZ2QFI6QG3teHRY30QU4dnnS9vGCRNqtZ/UM6NrjjDTpDzTUoX0/j0D/eCZrOPLqsx0qb1Vutx7xnJcUaCBo0PLenwEd7Z2z3lGHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA6PR04MB911310.eurprd04.prod.outlook.com (2603:10a6:250:4f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 21:33:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 21:33:55 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx6ul-tqma6ulx-common: add vref-supply for ADC
Date: Thu, 19 Nov 2026 16:33:46 -0500
Message-ID: <179512400921.1891108.7546490186818009020.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111101934.1216887-1-alexander.stein@ew.tq-group.com>
References: <20261111101934.1216887-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA6PR04MB911310:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a2b8de-a033-49c2-eb82-08df4684d00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: GhKS2tAWr52jnMfhk3/RG4iHMF1MNwuFvcxomggfRGiJU0iLvCP7AR1jYdeRe+jbKrKWnv1/lAW/gkjw2TkL3mGeimctwl1pTCDvAXIRm/zXpXuHFm64fDRe3C/zm8sEh7Lv8bNPXTkJQQo5yI5SzhFxK/H0owBh1vq9oUZIm2dew/hhIUKbjTGu7ZSSd4IGU0Q9E2fhq0V591/aGASk3W2xP3mc3f4+Etr5pmVy126UfyCRJ54w4grmK8Ytu0H5CUyJrvWaS6G2iLm+o7TZuyXP50DxmugfnrtziudDySkDZCPbVgt2kFWHNFmCT7BH0iNd6xx8eoBnF8lKuGWe7rGMf4w0GspailsA1CPUlVNXXD15bbLfmATOsvzA0QnTXQYmRWVXx8J/UC76AmLrMSOLwYSnaIPUNFTm1AJGtqTElI+VUB50P9cFq++YSguqDlYeqAuZ19w0BTK/64FsYA4m2zkOP0zGpj1ZeSGABX4ri4Eu3UNyRPdQPhQEF1vjba9ESRoFaW/TAdy9eBYFykMTFh0a3lWQDexDwdrSulC53K6AFdIh0UbwTn4AJaQKwkm3eLDEoPPhp102p1scVQ+qsiOODhJyMiDrolilzCvEhmG8z4W5BwuQMBZMMUGeRjKug6x3KfHTlPWA+x+9b0eiL1jlfbDRmHvyUc/RtKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHc3TVhWcElDQUxNdUJVWTY4V0VIMjBhczhsQkVzZHpsYjJ5ZG5XZGNzZnpK?=
 =?utf-8?B?bzE0cFVoM0JiY2R2WkVwR09XYWdBKzl6VHkvcmtSRW1vTjE3cmRlSXVNMTVC?=
 =?utf-8?B?QmZYSWwxbENjd2pEcUtCVWlhcUZGSXZGQlhiRDRDV2I2aVZTOVZrajNoc2sz?=
 =?utf-8?B?T1g1Q0tEVkVST056dVBvd3Rhd2N4OFhZWU5OaGpBNDhxTVNxZUh2b01sWWd6?=
 =?utf-8?B?ajZXcUszRWo3WVBhRDNQTC90NStJZFdUL2lhSmtBNWxHNlZOVDdqOW9MQS84?=
 =?utf-8?B?cWJlRkRsSGtnTCtCUGp3VXFPZE9hZitpTHNzSHdZNjBrRkYxY3NMUmZGNWJ1?=
 =?utf-8?B?OTMra1RKUXVhS3hQRjNZTElKTlBtek80dldIZkpISytjUmM1Uk03ZmlXK0VU?=
 =?utf-8?B?MnU3cVRvL0p3OFkrMTFVMllUUXFYYityeXlDSWRkNWx6NWxTQmtjUloxNGVG?=
 =?utf-8?B?UmpZMWFHMGxOdStMUDRranAwSXVyYU9SV0Z0NysvV29LTC9iZFRwaHRYc1BB?=
 =?utf-8?B?V0xsNkNyQ1NTaFBNSkFldnFrOEhzV3d0K01qZnBoRjZuSytsUitPS0l4bjFK?=
 =?utf-8?B?Rm8zUmVZaTE4YUI1VEhLTmx1RHhoSDFtR0x5Q0lJVTdsalpWQ2NmSkpsaWdL?=
 =?utf-8?B?a0d0TWxiTmNNN0FMMkFEWmNNNXlWYzdKaTg4UlhXemZ3RjVmZjZHSTdwemxQ?=
 =?utf-8?B?T0FiZ3hFMEJuT0FVdTlRWkNBTlRYaFBJTkIwRHdzL2dORk5ncVFVTmpZOFda?=
 =?utf-8?B?MENWUlNZT2tTWmhmWDJiRjFPTTM2WmVHd2NybmdjbU1oWTQwdjRhMVZldzlC?=
 =?utf-8?B?bHlzVTRhQUxjdG83QnIzdmRkTGMyOGNYMDkzTTFxdlFxQnc5U2ZiY3d4dmk0?=
 =?utf-8?B?OWtNU29lYzRCeGlSVmtEVTFyMU44aGNhQUdUTFF1aEFjSGlZS3h5WFB2N1RX?=
 =?utf-8?B?UHRua0U5ZzhUcmNtTjJLM1VGWDZyU1oyZ0t2eGtMVlpvTFVGODBCK2VKZ0M3?=
 =?utf-8?B?Qkl5OTRJYkdBaFhST1pPbldud1ZTdXNSaXNJV2gzdmFjbTY4WmNtRG1mSEtW?=
 =?utf-8?B?cm55R2hyQ1ZsUVBDTS9kUi9ETE0vME8vVUNkMVQyZlZiS2Rlc3RYMDFIQTdO?=
 =?utf-8?B?bG9SQzJweU4zU3JwdXBRRHZGZVdvN0t0U3Z3ZDhJM05rWDdLQkhva1VlWEFr?=
 =?utf-8?B?cUtSVFoxM01qQzBHdStiVUZPKzRrRzM5ZEl0MkFTL01ubk1FQURvaitUNHNX?=
 =?utf-8?B?Y2U3eHp0K3NUcG54cFZLcjdWaVhMdXFieG1IRFpFNVRLMmJ6YnBuSS9idkZo?=
 =?utf-8?B?Ly84SlI3ckVKejlMR0V0YUZ0aG5zOTFlN25rN2ZYZmpBdmlkcHI5eGcyajg1?=
 =?utf-8?B?eUdncFRYZjJaZmtQS25rVWtGOEV6VjI2b0twaTVmZnFQSjhESVpEa2RIRjdI?=
 =?utf-8?B?TlJEWmVFSVUwemVqaHU5MFpTQjlvOXg0dWFUOWFoT0lLYk9TZ2xTT2VqcHhK?=
 =?utf-8?B?Vy84WXd3UDBjQ3dPU0l6QnRnVkowQ3R2bmszK0RjcVJQMWkzZ1VVVHRsS3JH?=
 =?utf-8?B?S3FZWTh5Nld3cC9aY3lKOTRvdUF4ZmZmbDlYWU42L0dmZ2UrR2dtTWszK05T?=
 =?utf-8?B?TmFhOHRJRElpek5rOTZKSDV5OWRTU3gvckRrTUlUWEFvN1VEQk1FN0E4QkFk?=
 =?utf-8?B?Y1p3elU4ZVpuWmIwZU1jZDlNY2QwV0FqWlZvRHYrWGdKN0V6WVVNVCtpYXEr?=
 =?utf-8?B?dmRnd1RuMHRERmJjdlRaNVdhcGZwSzU0Z3RFanhsV0dBMmNOdnlVd2I4bjY3?=
 =?utf-8?B?ZlZyM0VqbW5vKzdQQWJQRFIyR1JlRVZaVVBQY0lYZzRJMFRvMlNmMC83WVQ1?=
 =?utf-8?B?UWh5WVdRNXRrWmpuYVV6d3czQWR4K1Y3eEFyZ1JhTDlOSVI3Nk9qZmVsTldK?=
 =?utf-8?B?a0h3R3IxbmpzWmYwTlhrd2kvdlk0WFVTZFgxVFNqNU42dnArRUdrMmVGSll2?=
 =?utf-8?B?WFMzVUFKL2tRc3Z3R1owSHRLL0ZoS0dOcjVQa05WcHZVNDJQWDU5TjhVY3Jp?=
 =?utf-8?B?a1V4K05RTXMwWnl3Mm5EbjFPWlhLV3ErS01FU3FPWE82MU5FcGZJME5aQ2Qr?=
 =?utf-8?B?NytYOE5hYlNIRFo1MGpKRzJTUk1EbDNqR2VqNWtyRGlTQk9XVnNlelFZdVhu?=
 =?utf-8?B?aFpVUXk0aXdENVZhVDZWdkY5ZVZhVThWWkdNdXE1MzU5cUNlOE1CQmZtTHgy?=
 =?utf-8?B?Ti9kdUhPWVFNRFd6N0o3V3RvT3pWZVIzY2VzMHdTdFNsK0F3d0JsSlMzd2lv?=
 =?utf-8?B?ekxEVExGY2M4dUZVZlo5ZVQxUExTWEtYZndxL1ZubVJrcERwdVVvY1h1US9S?=
 =?utf-8?Q?9GOUJRhGbb9fyHFwvLlaqRE51LLAu2tBBcKms?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a2b8de-a033-49c2-eb82-08df4684d00e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:33:55.1377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pqQZ4jRHFNcLqUGngyDqj0xAOemAKXWt85EOLE4F+SumgCszXADgO8zmGOEwrU4qkVzOYhqrzlecZ2flLJP2K9M2VNARMRFGmLDM8LlVJPZsTuhPQvZn7zsrfLFenGk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB911310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_133400_808350_24DFCF79 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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


On Wed, 11 Nov 2026 11:19:23 +0100, Alexander Stein wrote:
> On MBa6ULx no ADC channel is available as the pads are muxed to different
> functions. Provide the correct reference voltage in case ADC is used on
> a different mainboard.

Applied, thanks!

[1/2] ARM: dts: imx6ul-tqma6ulx-common: add vref-supply for ADC
      commit: 420b865a34d4909a41b9cdf3c4d51e0855a2013f
[2/2] ARM: dts: imx6ul-tqma6ulxl-common: add vref-supply for ADC
      commit: ded75e1a2288b19c54d8eca93f54a166698fba72

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

