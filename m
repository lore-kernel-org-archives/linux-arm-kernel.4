Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5D2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gJgIPeEB;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=sBkeVFJ1;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=sBkeVFJ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WC6odsbv88linR8kETVekz0LF7qUlb1FWF+N1ERNnEk=; b=gJgIPeEBSOLiVCzOiSwzQwQIvo
	aYuNDdq2fjoVuxZqjW+sBGCTXUR2omvM5Jtxk473UcNtVAleeq1lqpW1OZLdv60gPZtj9CGNB2DQl
	aCNMzeJcZ1zpP/zTBnaRVwlT1pp2p3wAyt5ZjKrNDKwBS9ndzCTqX6XrBi8w/n2mi9iH1vNZJ3kq0
	gD3JWZEDSLeJ8I0usEXghBc7ayRlT8zDBCWHDRdWYIH/7chnIhJj6rVW+p4YWR3zeNkRHj4rkBn7G
	RDmpzhCbsc49/jF/LelL1kdD4KTQXeP0VbFeuQ+h+R1wxArMSLLr6/VMbjbbCw/kvoH2jM+4FVpsL
	RwlPJc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvRP-00000002IN1-2VQ6;
	Mon, 16 Nov 2026 12:04:07 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvRL-00000002ILQ-2Vim
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:04:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fyUB/WL9zYK+6uQeMrtrbyRRM5oCwBo4gNE8UfId8H+iMSZ7yxaAuzMY+02Hz5QzqLOnS+20knX1lBcHElpXaz5xgUv8qMrSoPnGbMRftjsNSbswYTX6j7plnG2wED9DVcNYzzRAYzv4EWBxgrWKPcyB6FWShF+95KKkVdORMtf6XOC2/Me9MF1REPA6zuzZzt1yjqBAVayTpzroiWnh9Oe2QBnJoL8xyWqp91QNc6QabMsTpC0zbzykkbF6ualDLNqouEO6bgasjAg24iOljQxtNfduXjWHs8Mlsm3SBsKmJ3t78fNQ+UZrrPLNQ5aEaMZxqR6hihY4//cHKk9pvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC6odsbv88linR8kETVekz0LF7qUlb1FWF+N1ERNnEk=;
 b=fvng6m3mdHl+uYG9sC7MDXlJyVjAA/g2yQDXvLnnHN3pclMgerVIv6twoTXn5jw33Ic2NElcr8efEEyNwB9U/Du9hLYHNOm0Nd+EQslgVq5tnEIEG6DTMovOBcDTLQ2nEZvOBA/5hqvioLM+LozcrOgCmr/LDjPx5AHTA58z3BvuvtyuM+i2thzefp0wI6pDYJmpilG4YabN1jiO0B26MeDalC2LWmTCs4N/F9it09vA51F2+uYIGlEXcpSD30YArP1GQ8qiLGuVfw+xlSLygoFukKlwOG/HjCnB+s1pYF5sxJyqmj/O5eJcyGLGl1Zr2Ml1lcKqSM1N64E/cyEumQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WC6odsbv88linR8kETVekz0LF7qUlb1FWF+N1ERNnEk=;
 b=sBkeVFJ12DfrXI7BieClKLbwQinKD7DmmRZ+aw0t/ZfsIEPqLNxScj78wTOqcp1N3omWZJSytsJqLmXJoxEIv8xv1+JPLLhVGQ3Jj11n+pFNE3WexsiHzJrWG2ptQyBEMeJTroHTQuWgEmryGdUXFGPRI04Kyw6h/tPue3uNPW4=
Received: from DU2P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::6) by
 GV2PR08MB547301.eurprd08.prod.outlook.com (2603:10a6:150:3b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:03:56 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::3a) by DU2P250CA0001.outlook.office365.com
 (2603:10a6:10:231::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 12:03:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 12:03:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpQotlYp7jMaAESnIEfgzJWBkOz+hHY0kGee8Na4XU/p7MasPxlhGk5Wk3yV6vpbeCRxUktqdcWuat8Ni7fl1Y5CgcJzG8PRHx6dQXM1/UwTlZFhgSTBlDu6znmbjb4tqccaJCivHv0KxCppLrYSNlnyAx5L3Z9R2/vIFWtu29wPj5XwGkATX+zsjlJsfXho8q16WBi3W4PNVeKQjOYjso9DkTU7vdwCo13xLfNHglPM8TRiY47nz2WWznHPqDt0IaNkp386lS7F+vFb62igTFxg+b1Xeto+66cPdmXZapNbiHbz85RhQTXD3zKBLGmiC2xVS/URqsyQwGYbiri9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC6odsbv88linR8kETVekz0LF7qUlb1FWF+N1ERNnEk=;
 b=tejcmCvvhku39nOFjQAolmKmUWSpj9a6fRPUVBn+CPQbWjghm7CtyIus9XmB0Qc+XTR9UNlTJK2VC4we3/M7i38RgyJWYF6rs4keibAotB4A1flIj/65T3VmRTNsqrXzTyuj+4Gjpmkj1n1AnleS15xYHu9wKp4uA25CdHDVhO8Lot4xSZ+l97z2Gwy93Y919eQ9WZZUB6Ojv3BgElawqDT6KD3YwgeNXAw+31r3HPL450CSmWmYgqRKsXfPTqHyQ0F+CmoRqGTlU8bKb1tAClalYQukgDDY+1orZrmp3VhxIa+cOcsHjv97JMX+D/JQXpff7IQo2oobI7ET/nmvnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WC6odsbv88linR8kETVekz0LF7qUlb1FWF+N1ERNnEk=;
 b=sBkeVFJ12DfrXI7BieClKLbwQinKD7DmmRZ+aw0t/ZfsIEPqLNxScj78wTOqcp1N3omWZJSytsJqLmXJoxEIv8xv1+JPLLhVGQ3Jj11n+pFNE3WexsiHzJrWG2ptQyBEMeJTroHTQuWgEmryGdUXFGPRI04Kyw6h/tPue3uNPW4=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB8959.eurprd08.prod.outlook.com (2603:10a6:102:33f::15)
 by WA4PR08MB496630.eurprd08.prod.outlook.com (2603:10a6:1d0:34::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:03:20 +0000
Received: from PAWPR08MB8959.eurprd08.prod.outlook.com
 ([fe80::71d3:7b21:3594:e33f]) by PAWPR08MB8959.eurprd08.prod.outlook.com
 ([fe80::71d3:7b21:3594:e33f%7]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 12:03:20 +0000
Message-ID: <a25bc3c5-080f-4e24-afdd-971f313a9442@arm.com>
Date: Mon, 16 Nov 2026 12:03:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/12] iommu/arm-smmu-v3-kexec: Implement
 is_attach_deferred()
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, jgg@nvidia.com
Cc: robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 kevin.tian@intel.com, smostafa@google.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
 Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
 xueshuai@linux.alibaba.com
References: <cover.1793593923.git.nicolinc@nvidia.com>
 <8de1e1f52a03059f2e1123d259467eac23e9740e.1793593923.git.nicolinc@nvidia.com>
Content-Language: en-US
From: John Garry <john.garry@arm.com>
In-Reply-To: <8de1e1f52a03059f2e1123d259467eac23e9740e.1793593923.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To PAWPR08MB8959.eurprd08.prod.outlook.com
 (2603:10a6:102:33f::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB8959:EE_|WA4PR08MB496630:EE_|DB1PEPF000509FE:EE_|GV2PR08MB547301:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b23d3aa-a73a-4a46-bdb8-08df43d9b09b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|11063799006|56012099006|4143699003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261021121427099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original: D5+vQPe7V9fO7hRGB1560UmrtoCSbCNNQZ1GK9jjpeMBi0uP+aywRzBPO3yoCEBTLZNuUluzXdPAJEfY0xCqnuQiCRdyufGfy6ZAw/ITHRyuqev9wQgkfOfcw89Kv8Xxy/NiAojxwqKAxtir/Ro+r6hujIzYpRvk2RBkVdzlbGfboFO8KoETdr9r2Q6AD17BgZx7YepA4wB2CTyNbLr65xaPl8al5CnHF5tG+XZRaSRVkxc/If3Z171/+2TpZ9d0rc7BbGsQEQUpXkujlSumXrXgrs6FV/xHRFIe5mxSm4wuiwU2VlPuQRovfER3JE/wUkn1B85kDZ9+4nUmNtnt8xqDtX1MoMTG91DjkMCVkBD2pi/DXhfcQPEQNK/DGuBk7j9tft7c601wNa8lc5yzj8l5XvrBr2wtIdvsTrBVflkVEZl0GE9dFiQvuOtiU9v4vIFqGAfwYb5SDb83IWi5jv0EfhBkWgWEFg7KlX9iCX1g3VtcxMivCR4Mo2XyFc8DS/zyi3mWpGnIy4z7lgwOSM23p324/rjTNdcDANvUD+HbmJgP6XgMfJU8MD1s1hPSy02mdm6yPWZXV4QzNZKvfNKkgJrWOff7A5oVRWP653qbcQJRJaSQlDYvXyCUokW1kOYCwzeDqyOj0HtUiJnf60R/R6mBEsLnLKPGq71+1vg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB8959.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(4143699003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: Kwk0RrPA9w1lEHnt5U0RtprtYwtiVJpg3jpEJf+SUPPNSaV5+o0AVt6Ot704O/1bizXXuHbBDOXOemXO7Dipj9NKxC4l1GbVvxzRGYKgM2sZgSnzvpc8axXtP2RFDvaaOEQpsyfybOvjVsTAyJnswt5P1ENsC/ILBBO6zqlTDgu5+vXxKYSKFPQ+awUxHFC3wlaQogh6cqC0cQRwyDoime8vb7aw2VmbCT+orpXtvknf74FimX3zCc/QVhQwfZOh6uWYYUnwaYvqsYZbDLkvqp9V5x4lXBRNuA2yObsjJpw+0kY2i0dLzZBAChrUh8VbfY792cVYOLAD/TcQr7cbZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR08MB496630
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b38b1321-7dc9-4123-8f57-08df43d99b3d
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|23010399003|14060799003|1800799024|82310400026|376014|7416014|36860700016|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8RxsGAXOo7AqxYUnmzvgwXVwvbydgQBixzytCVkwxUmHeQCbviI3zwdOrc/yELmAr8xUlWCAglUJw5nY0E/SdwW9VbXbb/Z6J8fNht5+mQAC2yz5yDSHWUB9zWdLzFiiMj8FyQU3mH1PHMKts8zCXPjwjTC4GiPrXd82l/s+BqXvr8Fy5b55EpAxcYUcY7zmmnhlSf5TSkUbP+Fsz+6p2q8zXrgokP6n8EJdiG9L4InYMeM/VZEC1XWmHevDKaZG1giElOQgscWBR4qVK+qA3LVZjLZ7mSbZKp9cboVUohVCeOCdp7S5H/kB7qD3Qem3a6x/zaRV/ioDUshKUR6tldCk0FZBSPtrJf0zAef/jnprWGX3c44Ztt8eegkxQRQ+4FqWjY2ULrVquA/UKAkMbyea3UjUctbW9AabAYeUB/bgLkugq4ReEEDG16R3084PL9+4iQ7Tsz70qv7J3fksAnaHwFkzkcjJHGy2KiIne/twJ0GC/CEpFXOozz9VYIfumkBK8RF5fU/JFDtnWivOEi6wRmokINb/saH1y8UShDAhMb4pHZtVlPyY/KqEzI4X0Gex6FSf1X9kOAZysfUlhn7XGmaY6OLa3PJ6v04SLVUvLlbkaYmwQqf0RhFtst7sLVTHbhqvYWd7/dgKYjyZegKE02BXnkuV2vq4aA8hHVs5d8HG+oHFMWpGJJs4C6dCY4VSrBvh6Vc9QkYf2+zR5w==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(14060799003)(1800799024)(82310400026)(376014)(7416014)(36860700016)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1RdKd/gDS/6C9tcYsw3BTv9vEffPfZ5Fv6i182X8OH3ZVNT4t5y6Tw4WVtRcwE+LX3VKnG+5GTA2rdbv92l7XLLuCrT/Ivy9VGLB+MfrGQ18hfraGILgL9rUREO8zRqdkDRQyyIemKxhtykUJSUMeMAlGQ14ORNnOPMl7UwbccIo8qLGzHyIHihVII0rKKvH5GTYSZ90y3WxA3hpX/0FJaVUO6hFB8TnR7RKu/pLDoZ633yYH9oATpf31GuYWfBFZa74FiVlga3pEG67JIQOVHwYABSUjiLOkAcOOxmHXHlSEKQ2bdK6sP/lzDprWXZ4DJfYuB660xXixlSXCOw05PCQShvXRl1uqbwo6cfvQ66S0uDtYpqKl8oyfjYBM0Jz0SQMbORGEYud9nn3766eIN42BZHUObh/ncr2Jk2umGAEHsCuv5h3197o3yCPhtRQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:03:55.8877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b23d3aa-a73a-4a46-bdb8-08df43d9b09b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB547301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_040403_692270_C6F3C0FD 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 05:19, Nicolin Chen wrote:
> Though the kdump kernel adopts the crashed kernel's stream table, the iommu
> core will still try to attach each probed device to a default domain, which
> overwrites the adopted STE and breaks in-flight DMA from that device.
> 
> Implement an is_attach_deferred() callback to prevent this. For each device
> that has STE.V=1 and STE.Cfg!=Abort in the adopted table, defer the default
> domain attachment, until the device driver explicitly requests it.
> 
> Also, move arm_smmu_get_step_for_sid() to the header for the kdump function
> to use.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

FWIW:

Reviewed-by: John Garry <john.garry@arm.com>


