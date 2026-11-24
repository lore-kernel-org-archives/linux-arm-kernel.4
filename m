Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5854D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g94OU4YA;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YTmyoB5b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bs6uvsLN2XwUduWY2kWfy9tdDswxMnJjfR9jquvAwas=; b=g94OU4YAM480Yf0SfbxFPEspLk
	7psL6KrGYPIChlafNNexGSF1r33KUKMNfiHGxG+d5N8TnRVd24Tez0OYwPju06c7LnDeRO03xB7XQ
	vyAhuCDM0AyQ+OkU+qvMk/QTtqxT+vQrms7vpM7L86R7KS4Z6aXXJFsAmOsHB9itAq3mkMTUAhA4O
	cAhktwv8VDSCDEHx19oyv7TBVyDdN9HoFn2m4B/DfWHbIZlsiIWJzvr8B04HzshLnxCEX41HcjaRI
	airzaYfSr1jJOVAQTnQJngqhb3kBT5V6Efzw/L4sWYvkhTt3MqjoA12LD5XUwq1MXq30Fy6x2hzg8
	hCWyOzBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuIO-00000007Loc-2ch3;
	Tue, 24 Nov 2026 17:27:08 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuHh-00000007LfT-0X5W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:26:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NO2OB8PgJ/fBLBa+PT9pV8mtKsPtLFe7gE+2YLbqmFHy5IQBMLrYc+eVtgUx+YYzrH+lB2LeoW1wYul9irU/jNTRaSKf62If599PxWWqrGSPx7qoQ6GuaZaHte7A4lNev/gH3wzL1MgjzQSg+8gHBwWGTbg9teYouB3bLGd7v6g15sWTToVvP+s+FOjYiS5Idn8zNndhxuGzVAfbSJQde3w1ALRzLXofFF58uH25XuJ7bYvh0UvGVm1e9QbMSnGekOxEyVBYFFZbat6l9vR8DgTVXMkgwGDClymyJYMDVBZudLNa663MJvMa20e9vrm2n7sFdL073jAwpdPZpi1Y/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bs6uvsLN2XwUduWY2kWfy9tdDswxMnJjfR9jquvAwas=;
 b=yd34Ov/VfNmOWbWNZhwCNzjImPHT/1Fc+kuCdJc856SqkeJFQ/PPRJv54wEdtEG1SOZnVI5rWekx+7mb7LlxyJlUvqIQfPqvMYLGHD/6sxoPQ78rCg4Bmg28lbd8WA4omx2Hl9BzlCQnJHkfQ5f4Oac0/Ml8l0RIyFGkHQalWrGuE5sbIXSy5CZlNuxSZ4U9DL7jPgUZJ1jk9Rc7Ul3Xj7U/hnSeSB8m8de5S9bv+tKzsuotnwEiuEUnVScqvm8t7waxO4g5a3vdzIczLQHrCmYmirWzI44REk2wa32Uy5IBagYsGzQYGtkVmWtAfhOAItCROYPX1bNzNXJVO4BeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs6uvsLN2XwUduWY2kWfy9tdDswxMnJjfR9jquvAwas=;
 b=YTmyoB5b27MnXQ398JgewDdZo9j/NCF9HAN9CH8l424kc5BCfVjshRRZwppsmV0uKWKTtMqUKihwWoA+EJMydYd6th/CymN5D/mWAOosyouhTjVcr7258ClTzW5P7GH6RhvNO4NzmspOhBoM1h2WuL1FmZr9jmpJHjimXyexHx4yNhC1QNlagWVJWsw9wrQ3+JfEdiVCdpdu9w6+jiYG0qCHZJ4QFUFrOz6Am67ejogY3saOFLinGuSRaFwHVt9LPn+2CfPQ06P84MFPtwgdZKfv/6siqg/PmrGIZYYERFfb9TqjnOtmxueZqIubi+aIaswBuniVlMuUgxnOqaaBiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by AM7PR04MB6790.eurprd04.prod.outlook.com
 (2603:10a6:20b:dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:26:20 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:26:20 +0000
From: Frank.Li@oss.nxp.com
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: imx6ull-colibri: Add RTC aliases
Date: Tue, 24 Nov 2026 12:26:14 -0500
Message-ID: <179554117070.731722.10812400746824709943.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117154450.461570-1-francesco@dolcini.it>
References: <20261117154450.461570-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPCP307CA0007.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::7)
 To AMBPR04MB12445.eurprd04.prod.outlook.com (2603:10a6:20b:75e::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|AM7PR04MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: f8fac847-5736-4618-9ff8-08df4a500e23
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|23010399003|366016|22082099003|18002099003|11063799006|261026121527099003|56012099006|261022075727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: JpFHhqV0lLyCeJTZGFahnoS7Ns8uaekwPtNW0m+q/hax2VKezrsHdcNDwq/hikGJh86OsUxLGqAsdJtKmwvGKGUn2PGDpqHKaSNxQk4P/wmQcvZjjp0NsZaqbWdIrkJfAlgT+KRr2CD8/yWGtWUzMAn4zxGDi4oFpoDII0l5j1XikTLYJD3H3NWQMu4XrREalaIEEL0UgkrYU8OSQz92Qa0ZDedEoDe/K8Hn93fDbcMGIs7iAOsycuIkxGRaDAWY2NBR/FYdyV0ib9ROK6dTFw4gPbuQlMi5LZTajevG0gxgTU8xI2ELrLMltVsIt/RB7zDlzLWEaVYPffuTfbMhEIJ6U8jp6FWcerXwSLm8rulOZ8xLQ2WEqEAcmsh2J233hWQekVSuahp1gKC+dcsYXOOgIK7J56q4vvqPB7pzjMcI9SI7FgVOooxbdFnjuRUTRReXvDMP4Px3AoWeZm8w0/Kp5fEAGvwQufJKDPIs8twHdIeLBSD+Cn1XJBihGlMLtRpAWYVth9ACAC9bVKB1DdYKGr7Widltc12sqr40/1iuksx4So71dJAFs56ZeJVVAdnqyafzpd1ItQGru/zBZfvFrXsase5tucKbxIrUF4mdgo+KQlbgqcEnoCa+aUswSEoW3753vf2qjCJiHod19A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(261026121527099003)(56012099006)(261022075727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmkyVTBPYkZ5LzI5bUZSZGNMUWtKTFBjb3JBRnF3MkdyUzVvdlREbkViTmNB?=
 =?utf-8?B?VGhqWlJaZjBWT002UElKaUgvemNTRHBNNURKYnRjMitUdUtpeUN6OHcrRmdZ?=
 =?utf-8?B?bTV6WDB6ZDVmYlAyc2Qwb0IwR2RJV05QK0wraFNFVkZGWERUM2F4ZmNFRXhX?=
 =?utf-8?B?K2U3TTdVaXFuN1lvZDhSWFFIalVnbXNPM0VhOXFUS2ZiZ2xla3Y2SmM3YXVs?=
 =?utf-8?B?SGg1ZnltOUpNU1cxdzU2UUtUb1F2QzVRek5hTFdXRzliOEpTY1BDUTFEeGZs?=
 =?utf-8?B?akhLV0RPOUdKL012TExNN0tjUGMzY0RJNUQ3cmwzeFVWbkJzMHF4ZmlVNHJh?=
 =?utf-8?B?WUY2MW00L2hRb25JVnNuVXdISUUvZFlsb2dVbWFhTHh6QjBTZmMwdDRtZ2d3?=
 =?utf-8?B?dGE2UjZ3K2o0V0NFSWkyWEtObUZPcGNIMVZRdm9NY1c0M3g1dW1wZnE3Zml3?=
 =?utf-8?B?cXU1NHZDV1BlQ01aQWRFV014T3NQYkFSVkFFQVY3RWFtZlc4QkVxZ240Uk5a?=
 =?utf-8?B?Mk1qd1NXNUVtRkZFWlg0WVFOOXRIQUlEVnFaM3liMFIxM1duK1RDYWFlYUFn?=
 =?utf-8?B?bXF3TWhHb2RoK21QM1FRcCs5SnlXdjV0cXRHa0Zaa202ZkF3SUZSalVwVkJ5?=
 =?utf-8?B?UU8rSkd5QXhSWEtxOENMQnc0d2UyQ3FNb0NqL2xlTmo3c3puUlg4U3M0OGph?=
 =?utf-8?B?S2FRWnMyOEV0dVhGQkV0WnhhWExCd2xsdGRncTYwVFcvQ1pBTzNubHZYMTlX?=
 =?utf-8?B?STRJemYyc3pjczZ2VDhSenIxSko4OW1lWlhKZHNna2o2ZkNMRzU3aklPZ0w4?=
 =?utf-8?B?b2NWeERPeENzdVVXVU94eHh4Y1NrV3owT0FES1JrQ29zUXQxOVF0M1doWGlG?=
 =?utf-8?B?QXpMalQwR3h0MnhaTmpFK202RlRSMmluck9CNWl5d2VCMlVuZjF0YTJJWlZ1?=
 =?utf-8?B?QVJub0UrM2hGcm13R1craU11aUtWOGR0eHdzV1plalJVY3UvMlVrbG5FUmJF?=
 =?utf-8?B?YkZrZzh6UGpDWUhFMHBocENVRzRJcTEzVUpKdGJlWGd5VUVrU09KZldqQldW?=
 =?utf-8?B?K0xjamFyblBnY0IvV0lSWmZGSVVUdHJlb2dMaWh3b3lEMklHNithMVEydlRW?=
 =?utf-8?B?aStVTTlrYVNlRndvV2VCYm5FTTByMVg2ZDZiUnhsZnR3eXV5RHhKRnhGelBL?=
 =?utf-8?B?bk9VNXJ6UDdVa0d0NFlkM0JnSjA4eE9NbVNCOGV2eXFWc2M1VzNkQ2p0eWJt?=
 =?utf-8?B?dXEzQ0FlUFpNSnBOR1RETHVrRFk1UUVMT2N5WlhyRUppNmxQa0ZFdFFYNnlQ?=
 =?utf-8?B?ZmUzdUp6RG1xWDQ1YmZ2Um5VRVZGQ2F6MjZSUTNYaTQzRDd2M1ZIOWRmSE0y?=
 =?utf-8?B?eFl6WENDUVJMMUZXVmc4eldHcUJjSEhOTElRY2ZaazF0aWorSXlBb1NkaGFE?=
 =?utf-8?B?d1F1MkFmekJ0T0RJaytmMmZkbXR2RzcvNXNZUDlEZ1NPa1BTQXlGOFJUSHJG?=
 =?utf-8?B?Rm0zMXMyWUlOSTVUQ1VyY080L1Q1VHlNVGJrcmRWRTZNbWt2VFo1WmV5TWhM?=
 =?utf-8?B?YjU0UFlkQklPS0xtYU5DajBIWVJ4SnphWjl4cU82bGhQZUdGamxpR1E1eHpL?=
 =?utf-8?B?MlJ3QTBtbWZiNEJtbzd6RC9zNWw4L3dWNE5YdEZBNWpJVG00L3FKbjB4L2Nt?=
 =?utf-8?B?YVR3K3hUSDQvQjdxbmExOSs1ckNOWmxoYU9xRFpkWUZJU0lzVVQyVWRxZS9R?=
 =?utf-8?B?UjFkbXdpZ3RoUUkwV0NseUJGSlZVQkkySXdRRjlmb0l1K0pmbDlKa2VQZ1p5?=
 =?utf-8?B?T0NLRUFiWTQ2NEJLU0ZkOUxyTmVPQWVqQ2YvekZZRUhRcHowODJBcnRTWnY4?=
 =?utf-8?B?MFRVME5pdnhhMTFTSDg1S0ErN283d1hsTHZkY2JIQUNhQjVsU0ZuZ3Q5WGNX?=
 =?utf-8?B?aS9CdVhzQys2NzA1SUVCWU1xclZ4U2ZPMU81WC82bmxUMC9wa1lvd3RsSWdL?=
 =?utf-8?B?bXpmdHFsSUFZRnFHTW1JNlJ6TVJrTGpmbjA1L01GOWt6Y3FPTUVKcHRQdDRz?=
 =?utf-8?B?bVJFSGY5dTEvOWQ0RU82bUR2UzI3V043OGFMSXB2N2VoOGVma0xLTnZUbWMv?=
 =?utf-8?B?c1Z6elV4ckpKczdlSzVXaWc0VllJYVAxU0RybjhpWE9wNzduR2p6REYzUGxY?=
 =?utf-8?B?dUlBK0xmSDJLaUs1Z1VhYlhIdEh0emFud05tZ25PK2RTNVhacGwwcy9yN1I5?=
 =?utf-8?B?eEUrcmoyYjB0aXR4bEpXbVI1WWFrWmJKTm4rTmoxdy9NZVZvS1pTRXhzUVhY?=
 =?utf-8?B?dHExczlMR1VlT1FuM0VkN3pqTzlpYnd1cVJ6K2FETXFVWGF5S0RSaUdINFVQ?=
 =?utf-8?Q?8T9oRfbCRJOYYb/vk01j+X9dhRzmJpaCg/HU8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8fac847-5736-4618-9ff8-08df4a500e23
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:26:20.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7clzDeWDXrQ+IH3CNsCxNaFRcBCQMyJPSZQC2kUmi1/FlHPaoXth7GfHMB/QhxVqfrJPAto/1K5qAGZymA8Z5CvG3o+ppDcLh9SRx7f4dPHKwXK7hfcuzC1wplUn6L5r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_092625_182436_B7D736C3 
X-CRM114-Status: UNSURE (   9.26  )
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


On Tue, 17 Nov 2026 16:44:48 +0100, Francesco Dolcini wrote:
> The Colibri Evaluation Board and the Iris carrier board have an M41T0
> RTC backed by the carrier coin cell, besides the SNVS RTC of the SoC.
> Without aliases their numbering depends on probe order, alias the
> carrier RTC as rtc0 and the SNVS RTC as rtc1 as on the other Colibri
> modules.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: imx6ull-colibri: Add RTC aliases
      commit: d868355562901bd5043b52ab903811bd95a7d65a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

