Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908AB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oRIYb5rG;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TrNTLFse
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7jdTeohicPdFTUyY9OZnO6aVoPE2t6HsE/JmWiU2P6c=; b=oRIYb5rG4IGUFTlBDQ3iSqLGnB
	5AIs4de7juRt4zehaDnkiSPdYps7EZdQkK/uC8R5Wdits5chAi7SktzycGzbs4QO2QrlOOhPlwP7D
	bfY597hDYbeuEWY3SvO4gSu50qewCEUkaCqIgVKdTnzDYsSXtv5CJgmVwBOA9ea+r8zQFOYxF9UQi
	5ywYoXVyS9DVwYnxU92QDZmZuIPJXtgqX19cP5pCdM/VUgV28ichDL7t42bxHo5sa9mhwU0WWJl/G
	s4qoOV3aOQh0QG72FsG3KRVg7DaElRxLtd1lVEwLEEQ4PBsHE/XGJr0O90fISCMYZu1ftLjSzHWLg
	td0bHd3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNS1-0000000DB5z-1Jeg;
	Fri, 06 Nov 2026 17:10:05 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNRy-0000000DB4I-1KeQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:10:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSjtiygVYPTY3wAlcFLjcNHIM1l30uNjFuFUTp6srXtZ1cNS/IZXEN4jgtKbVnJPo5vb7h6w+y6T5hXTzMn5WlCD181IHVacSo7RriZncZU1VYl7Sx+5CER6T8zUZZgsLE6kbnG5JDcZpUAxihO06ABrl3a/5k+n4aTPAEIXTkhMaR8GWkvKTsySSb89F1xiAfL6NqDM+8dFLxJ2lNHt4F8Bc0FlEnmVlJE1ozF7Mnkm1SFKJo41BhER+NgkpsNW0rJunk1VhySNJwrxoqW/FdKL6e5NMUdq82lIuup0B/thVidu8GsWtXUxweu5AiV97M+Pl7KdtNKhk2u29FliWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jdTeohicPdFTUyY9OZnO6aVoPE2t6HsE/JmWiU2P6c=;
 b=CYtuitLRbvGEUnzIh7QMmBT8bT05uLneZXiZ7ERMSQiOgyiL+t3uPjRtkdk2HK5BiqLw4ns05lPMcr9mTZV2rnOh91aGqydeQ4PiEVmQGH4L75+CzoH7oR0GnEzmLDsYl2Pctd2bD5Hmo/6ANE2y6Gz+Sx9+nt3liYObb2t+2Dblk5M8nE8gCSnXqAXFLqacbb9y4jBFFrFi4q6MyHHxbSVTma/NGN1T+DZytTPTGcZD1sao9vAubTWLuCWa0j04DTldysJy8f/nrY/GoESNHZWYpFHJmp8KE2SHDOWRNbbUCxXke0norSI0FQMI2nwV6VrwC+Ws0QkaRn3pLb5BBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jdTeohicPdFTUyY9OZnO6aVoPE2t6HsE/JmWiU2P6c=;
 b=TrNTLFseGNAzMFgIe4z/9Aj97VEKjK5foUQloSLWmHvL3BE028Y9DgvkzxOhN+JivC9TgEQrPPv5XeMSHDnRTjrDmo+k28eL7fdJrLI7glN3WYvfUOana3o53ypPxSZf1/kRQ5mxsr3aIJs2sXR0JN2YFfGFEqCB5UYRaamSu3RYtVVWkwl221lFtqdKlm/Qm7/5dJNok8GdISSlxsyvTm2qRn++M/2RwuzpE+vb8KujBZjhym1NdllhfD4NjNC4bnNgT5ayRMX/8ZiXA1n0GH6IUHoVdkFGOBzE+CXXqjhB5lnEq/VBqiOS1YdO+LB0I9IxRmSTOD9VA60GYLvt1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DS6PR12MB967764.namprd12.prod.outlook.com
 (2603:10b6:8:4fc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 17:09:56 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 17:09:56 +0000
Date: Fri, 6 Nov 2026 13:09:55 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 4/5] efi/arm64: Expose struct efi_image_info via the
 image header
Message-ID: <20261106170955.GE770409@nvidia.com>
References: <20261106141936.2744481-7-ardb+git@google.com>
 <20261106141936.2744481-11-ardb+git@google.com>
 <20261106143418.GC770409@nvidia.com>
 <ee4d4788-3d59-48c9-b5d3-ab7d166f4267@app.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee4d4788-3d59-48c9-b5d3-ab7d166f4267@app.fastmail.com>
X-ClientProxiedBy: YT4P288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::15) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DS6PR12MB967764:EE_
X-MS-Office365-Filtering-Correlation-Id: 570dbb02-d339-49cf-3dff-08df3c28c847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|4143699003|56012099006|261022115727099003|261021121427099003|261022105027099003|261022075727099003|261021135927099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 0xp3wFVFkieX1MzAwyhjxH6x1b+Y9Tgo/KnPIxuAIzwlrNsC6S9uunRNZOeAypU+GnbexWSCKkG8Eb/0lCfuO01JFPaPlaFO8NLmSMWwYeIw4NbTOIUNQgKqERN2TZvr99gf5fuN/nvOHgWh/tRha7sn+/sODwPXgGYqUhCMxu8Kfkpd6BzmIWGVH0viymRSiMF42aop/ugwlkdI/h79W9SfYg4Od/W4Q59D9P3LGlJha1oZDe/ECU2BLfH9kNcbg1xJxL21F0xEvfUkluCaaflg/YBs/mjN1zAVM3bVr9gaQQ7y9ZDeJ4+sufSMQFVNxNmZzkEwf+zUbN4i3eytwt9n1jqv8uupwt7YP5lEZP1n/OURlf44JUCw+sIem44yF5iUScbl9zhlNLh85iny2rCydnDzen/AWMdEPtmRKfH08yEficxPWHsWKuLsFtWaX4rBB8JkVyYCR0OzYbfzbhrsaCTJHIXz2/DYJEjyXvO5YPpgKuVwEvBGX1Yu57U7w6mitgNANE1U20DhRVWdbOm5Ary5UyjbAEMUaHaP+p7P12F14SGMVKIbWjWDKBFRlwWX1EC8ZQE9aVYln98QOkq1bQf31BwStR9oSr10upeH7kn3GI97GJRn5Z6otlvrTH77G6sbSQGa6pZYoejrEGYP7uLubxD1Fb/vf1tIYho=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261022115727099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021135927099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qgmk1uA6ABAHblbA6Lfj4xDWrYz/B7WWsWZhGbtEzfa03BJH80iTIOmb4g/1?=
 =?us-ascii?Q?1QwoNHIKrxgwRIDbgMKMWLqGwD1VOcZ/B5G2pn6RE2RebXYlr6dMNatJaZ+v?=
 =?us-ascii?Q?1/ASk6LmPvznddeay86Kx15G557H/+4VssN7MWw2oN/Xe3gP3f6hl8wY9QRb?=
 =?us-ascii?Q?A5Y1k8xunU/44GLNDjSMta99LuDdO3mkuz7nrp24s+Yu11j5exKr83Q1uqrC?=
 =?us-ascii?Q?ZpUul8VpyeJwNY78TAH08OCfr2WqfwUbfnEutJpL0OsVG8LnvshgwYfewN9j?=
 =?us-ascii?Q?CnS5DF8OwpD1Kpo1eTf2+1f6by1pKzo2884CBLO0m6hVD/ZT4ZKC9T0snJOj?=
 =?us-ascii?Q?kMk8G0fTwv6g4gcvgGts8WCrdYAjVIfK4hTXAmWufXnRbyDRodM8zKT0Vi2C?=
 =?us-ascii?Q?kGDd+cm0SxOMrUFKCfDG3JwH8SIBW04BBjeApiSmWLG52W+mKA12j5HLv4Vg?=
 =?us-ascii?Q?wroFyXcecA5fkxBDYiPuBic6a+X7lo6X33b9b48a79duueoEG3cXqmijsaj7?=
 =?us-ascii?Q?0xSm8QPTxbCHQVMqMysSDAvljh8mB9I/R5Wgp03iU4EhFauA7tLd2CLsaFgq?=
 =?us-ascii?Q?E+ASeHj3hNl/V+O6fgDPNUWjeGsHJ+pEzhPoy+s63NJCJD+pPNZlXgda441W?=
 =?us-ascii?Q?PGE8nWf2DFlobM6TiPldoedwObxQab1lHTssXOUfMDHS1Fjp/Sm5l/l9NFwb?=
 =?us-ascii?Q?k/8jwHDf5QbinfXBUhK/cMif/QRE9FzAWU6V8tH8rmZA+0SvFBjQNASTPw1T?=
 =?us-ascii?Q?UJroClGwqrD0AjrLQe3NFW21vqeXXKh8UmRSQdyZ7KodvFDWt3M4iLBRibMU?=
 =?us-ascii?Q?AS72BQAgsNFU/uoJbBEnR+VSbZbLFdFYbHg5TVWzn8k3WQzhSPd/Ka21FB9j?=
 =?us-ascii?Q?Su/LuEeuQAtBu7MQpXdqn3wdCOMa0dhtnp7dhGUJUjUSLXZWyAQEP3p04uEe?=
 =?us-ascii?Q?tjlljqjhdjSC+5F7s0rcMUds6VgT3Nn5HZY00p1kDI0GbsX06A9ExLDKVtCJ?=
 =?us-ascii?Q?sm0Z+uMBjQLlbgt1mtXSK+q2vYWEZ5ZMHeoJK4bRLMiGXIxsOKNSQCZCC/jw?=
 =?us-ascii?Q?31IAL52xArljpFPSSMzH9/5S1WQbvPhnLEZMc+7IvDkDAbI7oCJpDdPJFdwD?=
 =?us-ascii?Q?K5bnSt41pusAeWopEkgV/yqXrRrcjzI7/We+tTXxq1MfIXbcuvQTpa6whvQM?=
 =?us-ascii?Q?zdotDB1vuNaFY/K7zWpjR3WmQA09GNwtCecXBz5EXSpa3hyXV1FND1jEKtGc?=
 =?us-ascii?Q?qCwU2ruX1lRlnM+H7dgCqh0HlXj8gmNfPkOfFLr4U2pUfCvy1mlhoYEnwgwW?=
 =?us-ascii?Q?mos2Dm5oxEAn1aBESI6UVA+noqx/93cSP9gqJBLkrG/5qqM2hCx8BS8djE+U?=
 =?us-ascii?Q?l2up4ojJt39FIHnja69PgxX+Dsq2Fqzexyh4CTN6Q8aUZuv1iijuCxL+E7eS?=
 =?us-ascii?Q?vvb5f0ZXlW/2qBFBxfwggBBkrAaw2qlsxCVzHmyEr6IhY0p486j++DuwBZdC?=
 =?us-ascii?Q?OXAhbDcA2EihIB5ZbuRiF2IKUoiJjarvRt++vJcn+dJsnvK91RK0YMrZoxm+?=
 =?us-ascii?Q?7teUUiCeWZkUZicqgLp+Fn7GdPDFpoRWkinctcbMKPvjELJ53JXgKheKJMWM?=
 =?us-ascii?Q?gxo7pPCEe2QolDwhb/Hm35GD20SO+HF3MFpFebIyEFor3Q+STY098VDRf3Bo?=
 =?us-ascii?Q?j7JlaMv17cgGOKCNM9+QrCaPAyj6nvHFG81pRRV5rs7PTCGE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570dbb02-d339-49cf-3dff-08df3c28c847
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 17:09:56.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sa6VR6Y/8lGCGgqqCUFq+WsiFAQi3ywfqLVtiBcU1xkZiuUGNvgj4jiab02zA0be
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB967764
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_091002_370456_61A6AD63 
X-CRM114-Status: GOOD (  18.47  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 04:51:09PM +0100, Ard Biesheuvel wrote:

> > Also, I wanted it to eventually be cross arch and I don't know if
> > other arches have any spare space like this.
> 
> Yeah so let's bring back the code injection hack but only for the
> offset of image info. 

OK, that great

> What I would still like to avoid (compared to your proposal) are:
> - having the efi_image_info pointer be a global that can be grabbed
> from anywhere, even though in zboot, it only becomes valid after
> the decompression has been performed;

Yeah, I liked what you did here by passing it through the call
chain. That's nice, I wasn't bold enough to try that.

> - putting every shared variable in the linker script.

It took me a bit to understand what this does:

@@ -68,6 +68,8 @@ asm("	.section \".rodata\", \"a\", %progbits;			" \
     "	.align	3;						" \
     "	.globl	efi_image_info;					" \
     "efi_image_info:						" \
+    "	.long	_text - efi_image_info;				" \
+    "	.long	__inittext_end - efi_image_info;		" \
     "	.previous						");
 
Generating a PC relative R_AARCH64_PREL32 relocation is a very clever
trick! I see no issue with it.

The .long should be expanded to 64 bits, I already got a kbuild 0-day
failure from some crazy kconfig that overflowed the 32 bits I had
originally. The linker script version did have assertions to detect
that.

It also still needs every shared variable to be put in the linker
script, these patches don't show it but these are still required:

PROVIDE(__efistub__text			= _text);
PROVIDE(__efistub___inittext_end       	= __inittext_end);

IMHO it would be a bit nicer to put the asm block in a file that
doesn't get the __efistub__ symbol renaming so even these provides are
not required? It is why I put it in the main build and not in the
stub, also I thought it would let it work better for x86 which doesn't
use the built in stub?

Jason

