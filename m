Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B66260A260D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LHEbTUZa;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Wt0uEjJo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VKYRBdXb/GbE15X2GdmuZ6dvn5CC/xJ1Uon1SW9ll8o=; b=LHEbTUZahMWGl1VkOyzydkc7KM
	RJsG7y2E45KhOldcDaXkwJHi+YjjaA7E2mdnSFjYjFfnv19XFf7OyXu3OTmXn0WfRRvHKzZI1FTFs
	yBYC6sNCv2ms+9ltJuCa0l6uIAL4874LGY31J8HesHbkSwuU9sAuqilLVS/8mV9G93WqSobLEVYa3
	YxIaz3snUXAFb9S5+fch4jXmmktFYB7s2iReOO9bMaaz4QFWkB2nOXiQEkhbz+OrW0Ea/dZFxjCb6
	dhVnK6d3Rp/fMSR6f6s2bWO2kU9A21wKAWKfnE0NMy7jeFWRW130kjtn40P2FNIDKLxRH4UUekl5D
	P3NaA3Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURVP-0000000FYwY-3htI;
	Fri, 20 Nov 2026 16:30:32 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURVH-0000000FYuz-3DTp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:30:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2ekVOgY/YjGxJnmIPieSkseycJ3of6v296yUEJIVFYE/C+gpv0K632yqctHIcswLIyrTKG7ptoxvhmA2wq6zloZ6PE4vqt7m/mvNKOt2FFBFszwYFJbb2kY+Wl5N1mqIigVqYCYynPCNknRT3D5Lc0xH1shUWzfpTsAQd4EfpwT63oT2b7oIO16c6T4UzqrSlntRcVF6+kIV7V6mJwhxvRTomVEGfNyh1blw8nviGbaYUzjql1tT6vYeXTr/s2YosDuiPWl/LmWEBeurc6GYglWcSeOZoE2VXB328uucEJkP2qx+Nd6PH1W0odd+M3ZhQrfYiqfOAf48rMS2bX3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKYRBdXb/GbE15X2GdmuZ6dvn5CC/xJ1Uon1SW9ll8o=;
 b=hjrg2U8SdV0irEnOQGRnVmxelNgxRi4ACy64I5VYbtcL9fqHsJrGjxIUlmSQgbNUlFBNl63k4w+3ojzvl3ppodnNQ5eN6FmZn0b9qKxRD+cesEnUBJbmS/SUue61/DBGRikjzp3YYRQ1pOz0n1JvivGQKk9vJmgKl8LpOseixhKpqVz/tvJEEeKn4jklCDIXLWmWe4MK3fuSAGW38QpUDlrnqd1UdefxxI2jM8kzuyYaNdTvWIu/xv2CG5/UHRpOIOVrQuTsCKVPLwzLnrl6sXnQdDq61osxpi6uCR+NYXXuMuJxRT0B1+waPGyrD5N7qLGPcCz4ehvrBWAS5xiZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKYRBdXb/GbE15X2GdmuZ6dvn5CC/xJ1Uon1SW9ll8o=;
 b=Wt0uEjJouOcMtP2RbEXmPIMXcVdIyfbSEqqxLd7mTPQ2tjiTS0YRxpAfs1oVCFZiKOy7oPa/1/um18kpmuUZib7eQHYudjeGVxol407bGVbaehh3AdgaJCkFL/a6gAZt3F74grZn+sh8FAgGErMHwIMckH16tYoddaX0cEE6oOb/tUcynyLnWj2AcX0sqXB5Ow4Gvv3ywC/3xf4sb9TmOOZlnqY9OQVZxzO0juOpRFal3y3IjZTkhQXSEivN7dcq1glnrJuW3t5CHp/4hE+iy0HzPD5iz4i7cakJmZ1IfF80UstRv/iZSTdL5IveGxtE9ReLf5T6vAithYV61ENQMw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:30:16 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 16:30:16 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-bsp@toradex.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] arm64: dts: freescale: Correct white-space style
Date: Fri, 20 Nov 2026 11:30:08 -0500
Message-ID: <179519219422.3710319.8948835867917075030.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113185329.183113-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185329.183113-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebe59d8-568c-4cde-2916-08df47238f15
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|23010399003|18002099003|22082099003|921020|11063799006|56012099006|261026121527099003|261009223027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: 1TBLZBxmKy7xrgEFw/ogHK4IA9EAe1lgcCtRGNRJFS0S76BSzAMHE1R7hhweoWlA+TXAvf5mvcuBifXyAFDL8uB3IXmlV71PFyRU55pPvRzYjGqKg6p8w8VX/BD3NFfxZanXIcsUSsvF5txv3xrCHB9+q9mGGlxOpLmpQhfWhhezOzruA/mGNkXN8oJcPaKyPYzZ00qEmrqS8DjTdTYZUnCcd69ekw/o4o0/qiNzj95xUMRG6vbqj8b3yo+PgMUXnNChpAwOo3hTobR+mQiSx1mkSm4P1KsHh+fewrgT+utpn5gK6CLMGSoPrACbF/D/Id9Nhdnv+sEmPqgpdOG/fYYulnCNsee69fPn0tLWrfnV2IH/dnoEyqgDuurrSGh31Dtz7pwbNjo3qgF5h+Rksr5uBQ/m3CFDUWuRzwo1oiK89iDpjX+YhZuSAY4quvsn7Uem5IT3Y/iuHVuKhbYo5SglNz8GegrnChSuPuSdHsSVCQrP9//4oWE7luVwDZNmHL2i/tgElYU8z4hDY1W3SI1NByjAmKJ+H3xVz2y8xp34pg/xcNygByxET10oZ5OSTFXXPMY06jl/tIHn43J7Vb0zee3q2feThlViTx313H7gXI2UvA0sIJXVbJagAkVna/1vD+fFk7tk+Ws3TqhVHSNP110Fm8I+7cyA006GlveI+KEYZCEDQMfivNmRA9bX0IrEnILKtp0PcBjTWhV6HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(921020)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVRhdmNDZHZPZkQxSzdpb0RIekdaZTJDMXcvcElRQ1hHQVpPMmFCZjJ0UmY4?=
 =?utf-8?B?M1pGOXdEc3JjKzBCODRuaUZNL2QwazlFSkQvMWo1SnNZRVJoMVVYVmx4V2Uw?=
 =?utf-8?B?NXJ5T2c1SjNXSTBHSDFDeC9CbkgvRldadnFTNndHSGRQRk9vMFFsNG5HZnVw?=
 =?utf-8?B?MXNUY090T3FueFZzV0hYNndZcmpBenJ1eFZYQmdNTlRmSU5CUko3VUVTRlRN?=
 =?utf-8?B?NnJSWFM4bi9Tdm5BelhSalNia0xzY2xUSXBPT1pDcVQxd3BXSElPcE5Ob0x6?=
 =?utf-8?B?bDFUYmJzdHN1MzlmOHp4RlBFOC9SZTBkdHVmWnVoRmhUMWRCQTZ3TnFPejB1?=
 =?utf-8?B?Z3U5STdTM0lmWWNBR2hxMEpYamJBbS84VXRQWGVERDk4Nk9YVEgzclJUQWV6?=
 =?utf-8?B?UlpxbGw3QytMNThqVE4wNmVMcDdWRjljNW5ieExBaGJndURFTTg5alUyQ05X?=
 =?utf-8?B?SVJZVEtHVU8rU29UTUlwSG4zZGYrdHZZY21yUER1MzloMkF2ZmRiTGRQVzlW?=
 =?utf-8?B?ZUhuMmgvZElxNDdaMEIwaEQ4YkcvWHRCZTBlaGFBVHQ5MkxHblJNVnd2a0Uz?=
 =?utf-8?B?MVo1cTVXOStISkFHa2JPZjJsNzFaYWJmODBBcXhoRkR6QWlSRlNsVjVYMWh2?=
 =?utf-8?B?dFlkZGhiQThwK2Q2bEhnc3FFY0V2NUdETVBXQ01pZVEzMWRLOEVMaU8zQ0xo?=
 =?utf-8?B?ZmVRQUNWT2F2OSt6NU5UYXIzYzFmODU5QTkzd0lpVjJjSTBEZUlBbW41NnFj?=
 =?utf-8?B?bzArN3lOVi80dDFzV0ZwQytybXlFakwyb2x0TWc0Zjl2VUk2UWpIS0FNa0lj?=
 =?utf-8?B?eEtJMTJ4Z2ZEVFVBSDl5M0tCRkJLbWEzVWVjdmRQNzlJUUk5K1pDOUtudVln?=
 =?utf-8?B?bHlNdHo2eERYRmxiMXpqcXhKSGxYTUxPdlNJQmJCTVNidi9FaEgwTHk0OEV4?=
 =?utf-8?B?SmJXR1dMblBMQnd4VUxvbkdIaTZPSHdxMmE5Wm5kTVI0K0tjQ2M1bHAwaWJJ?=
 =?utf-8?B?Q0YreHdvWUJMdHVudHJ4TzZ3ZmRBQ0RWWkdHc0I5cDNnQlQ3Zkp5Z3pwL0Jv?=
 =?utf-8?B?ZzlUeHRJdWtqcVJpUUxiK1FIbmFjNHpFZUtQREJTTFp2QTc3WTRSbUNMT3E5?=
 =?utf-8?B?ZFBJR3VBTW83ZGVHUE1zdm50eDFJRW9JSEV6dEphSEdFTko4aFcwN08wWnlm?=
 =?utf-8?B?bjFmdzU1bjhRQmg1dFlPcWhPNHBCaFRRSjMzT2hpT09HQWpPMEFqYjN0YW1T?=
 =?utf-8?B?UDZIN2MrRjJyczIwRDU5WEIrT0ZLazJ4SVk1Qm9oeFJWQlNmTFMxSDZKblpO?=
 =?utf-8?B?NnhROVdZT0pkdENlM25wMFMybDZmaHIrUDhSTXVJUjZnNDN6ZmJxbEMxZzkx?=
 =?utf-8?B?aWxZVWpMRkVOemNPQUdNYUhzSHRQSUVLcXp1RTFRcUlnQmNpVkRXOFlIOXVD?=
 =?utf-8?B?R1A4bXF6MURncmZqdTVLVHlIZ3FvOVNNUTR4Ny9VU1ZXZUNqZHlDNzlNY3dR?=
 =?utf-8?B?bUQzY2h6Rm92a2N2MEJ0Z0I2U0g4WktZT1B3eWU2MG1IT0JtSlQwZXVDTkpo?=
 =?utf-8?B?b2FDbEg0b09PN2VScG9RY0dmMGFrQU1yNWZlY3N2WFJIV1p0WG5QWDA1cXps?=
 =?utf-8?B?MHVseFpLWGlzZXowUkk1UVZRYjY3S252OTNnYnBtbklmL0w1TzRTSzN5ckYr?=
 =?utf-8?B?SWNoU2N1emI5YjBFVU5ZbnBUREdCb0RjVk9kSTArMG1oRzZ5WThwVFZVL3Bx?=
 =?utf-8?B?TEtLOWUrNmVNNnFZcTAyYStWOEU0Si9mYjA3dkZWTUw3eXVON3hJb0FISEw4?=
 =?utf-8?B?NDQxeTFSOWs2VzRDdVFqWVV0c3VsTHFqRUlUaFVhYlVEdFR5WXJUVDRPRHpH?=
 =?utf-8?B?djg5aHdtelJuNGt0eHZ1d2VXdGZBTDN3VjNpdlduYjF0NkIvU0xVV1pTdUll?=
 =?utf-8?B?WEJ3UGNGdW55SWQwTEdHT0R3WC9EK0FYbE4xbGtCdlgzYnR6VTB5NnZrejZK?=
 =?utf-8?B?WEN5bmpIOWFpWXNDKzRQQlZPTE83VTRLUEJYdk5pU2pZbjFEYUhGQXlFNWIw?=
 =?utf-8?B?TVJYQUdYYVdHeklDbGhmNUNGSlgzT1hlbElQZzJZUzl0K3R5MXR3NlYvbnpq?=
 =?utf-8?B?NFVSWDU0bHhRNWlwaVJGQStWMDB4RmVRSGZFV09KbDlzMHVJYlM0M3EzSjdS?=
 =?utf-8?B?eTBPYlVSSk9QdEhKWklpalpRcktLZGZIYjQySVJUc3VCR240amJ2cmhXU2hI?=
 =?utf-8?B?K1dnSEh1NDM3bHZJbVN2TzRyT2FXSnZzc0wxL3YzZEhWd1pSQ1cwbjh4akJY?=
 =?utf-8?B?WmlOTnFvdXpWWU9qVjJnTW5sdGgxamdyMm95enUyaythK1R2NkNlb0UycHRz?=
 =?utf-8?Q?3yrhRoA4p+N2GLovv+uazQlgOADAizlgSuxIx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebe59d8-568c-4cde-2916-08df47238f15
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:30:16.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsOIaQ2GnIL2TO0aq2bp8NJVQLuj4e2BvEoJn7K7GTZXpo8hVaxI9KXEsWpvEQEEFx0H9GXN7p7yVnxhffvns/NzrD2UMZItO2w1PDVyyFOcQ9zlIuicWEoBbHlVw0Qa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_083023_817543_9DC15652 
X-CRM114-Status: UNSURE (   6.80  )
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


On Fri, 13 Nov 2026 19:53:30 +0100, Krzysztof Kozlowski wrote:
> Correct minor style issues around white-spaces (e.g. double space before
> '=', missing space before bracket or colon) to fix dt-style-check
> warnings like:
> 
>   imx91-toradex-osm.dtsi:75: [redundant-whitespace] extra whitespace after :
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: Correct white-space style
      commit: e32bda9845c5239c3b7605c465d61f3e2d350599

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

