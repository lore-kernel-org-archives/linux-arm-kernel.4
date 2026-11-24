Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637F260A2633
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V/ac1712;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ml7AUK+/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KOtRvGoFhqMskab/I4cGWILlzM89r2mP6Q+IIN6RX0s=; b=V/ac1712LdQU81kO0p8sDzYpdw
	3/eOx5Lq80vKrT9jRJOhI1XSFG6lQ0bBDdCcwa2H/gZ4yrAbxxlDYMSsvbr+rHoctkUJ0o3/aHfQ5
	ggHyEWHHLMeeM1LtmpIMIOZ/WZhY7U4nYTi1r19dZ1l06kxMBTNJe5e3bT5dq1mNiIt/CLoESwi3D
	zIxWIrmgfYDgvHlr/CsOU2LSe4Ze7LpRainTwQYxO++D1Sslg537znMo+9/Exjnvfhnd9AC+7DB3M
	T8VKPJVcP8A/MzUphNNlle0HWKEXuKyUKvBKVWjCtvRIuOHsVmRf+Kh6PFFbEfQGan0AJUGYNvCSp
	ch5kCIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeaO-00000005H6w-2ixG;
	Tue, 24 Nov 2026 00:40:40 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVeaL-00000005H6F-0wCz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1LIdFQYLr+wVAlQXIC8LHiJLsHKV3dwcnWLKafoCao8CnSIeJ98maGt9wJM+E4g0VcNA4/QbnUfPA5rlKK6nCQUcthERu3gSkMYn/tuheQp7L/IUH573AOLCfuoNOhFUAQkoUTzEWVrRJCgLyGJXHwlpZI2j9nvf9SqiZyAQviAhgEDnzF8GuXTM80Vtwh0Ah4XMmEhh1kySuFMcYDcFN2Pomm7VpU4Q65abzqgk4/BpZJ5RopN1TBtyfFGCbrF/5mOt2P7blB42pLxomU5s0UXUDyoEAhoMlXt251+abvCY2AmI7zXNc1r79p0BtOohIgIIgPxAgpoUeJdnt+3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOtRvGoFhqMskab/I4cGWILlzM89r2mP6Q+IIN6RX0s=;
 b=fI/JrMSrhAc3JvSaQYh5o6LtKMqTUVH0qdPOwPZD7R4IROZ6yeWXKEFATQzQAiZHkVHYF8vymDl/C20uCDSyCNqHUm4o3GnuJYUeor3ViADLiDVLyqoSzYGgphLzkIk3jwPwLH4QeBcQgUO/FI/dnTwHoj2L0fqCBnsKT5oSjfI4uA4mKDOTow7czfQzgaCWDL/78yoDNmRnlAkLOlfn6zsrcHfOGS0TZFAKR/4DOKglc7w6tY73lTxtMaV8WiaDXRLqb8XvEZAfXCwufcointStWOrkJo11Axa1sJ86oj8J+ihy8JAMZwknzDtQc1Si7AobEqGlteofyC/qcVc4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOtRvGoFhqMskab/I4cGWILlzM89r2mP6Q+IIN6RX0s=;
 b=Ml7AUK+/76hAxEdO8Hd2ZifzRQHSTlS9XcJRPX9mtKMpcgLTbcK0DjqcJgGokulGfyZyZHnIGOYALIzWyLmbWLjLR3pSRh9m0+4V4RwGkQ+7eSom10E+1K/cuhbbCS5IFndOC4/scqqLQnmAtxo/PCo+mRvN/UvhmzNaSsQTCQPBnp5S7r+TOY0gMH0yAeSZlRkZR9X3eApmBMfEWx5tVwKyLOG0dRamzwI8rJTs0UIHADHyqEmt25mBV5o2mCVxkHszPOtPtYYW31Sq0rOpoKqtIvX5t2n//jCJg10d6O/4ZXgity8pNhMNomTZxMOG7cjgPv4IZFNAzEum0WDUhw==
Received: from CH0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:610:cd::32)
 by IA1PR12MB8518.namprd12.prod.outlook.com (2603:10b6:208:447::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 00:40:28 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::1) by CH0PR03CA0117.outlook.office365.com
 (2603:10b6:610:cd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 00:40:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 24 Nov 2026 00:40:28 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 16:40:14 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 16:40:14 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 16:40:13 -0800
Date: Mon, 23 Nov 2026 16:40:09 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "John
 Garry" <john.garry@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	<patches@lists.linux.dev>, Pranjal Shrivastava <praan@google.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v3 03/13] iommupt: Remove the sanity check for
 pt_num_items_lg2() at the top level
Message-ID: <awTc6cYscydSw6Wr@nvidia.com>
References: <0-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
 <3-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|IA1PR12MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6adfd9-4a93-4121-8afb-08df49c3897f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|7416014|22082099003|18002099003|11063799006|56012099006|4143699003|261026121527099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: mzd5U2nVtHAnpQ6vJoMaOUflZv3RSVliv0hg+q1y/rrIjnxnQ1LG36HOwjAOfHdWVj2NDtIc1lDdhksVIheYmICOJBQnOlE/P7Id+dgrPZPdJkvC1vO3oT3TsE/F1LqFZY3lxRG7V1c3T0yZ7YXsLtcaNIdKVuZN6s+klblXwSlI0y2teckL5HoZrE6wSH7H8vgSq4Jn0TQKI6op7d4G9np5BgTs+uepYifdMmrjgOBe4TVScibHJ1jlIJmlJA0bEZPjtXJTWd1bKZsSPcGNRpLY21KzqtGDCqumZS4N3VsEq2DGbjukHUD+yo7QgI2EBhumE1yW7kvetHb+unP1uiWnqzsEoIFPHLorbID83dcBE/cZqs9iMT+XzQVHWAHImZN4vVp3dRifs30fJyK/D9zwZMsf8HV9AF/VNoFQnUXg2xdISJeLRJ6toD1Kr8gnQx5aKsrLUC72PFdOApIdqDqhcC+u1eH9kpnOvowY28HvipnbhH86N42SKWGBWD6qvDVwShTTuKFGFJ4xAQSFBruy2HlqP4KJKWpO9WhvMxxLn4Ff727NgWVi5lGwoHwiDZ/68SjECqbGwOC7d5kDwypw+pieKxBM/BauG9TAVKIYK1MASvtFuGJUOYg1g56bAGFSwKM7bK9HM/ooQKdlfG6ZLX3dHfQrUg0f3NaTcECvu+4huGarW22Uz5RGXd/1QEgdk4QPWCI7Lc/W3WpcCg==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(7416014)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W2yaMG86dcHtnQ5HmcHVve/puuJ2D8ZqH/kaIUVCyeN2jINdmUdhsF1pBZIIV73oK/SNmeyv9aKORgpJOafyxH70Dt+lCg8SS5D/aQMju9tpsVT3rIDhwR1qR4Vc5JwWxdDeboZCyQKpNdAWJlWYViAFjik5lzT+GP/yhwqj8E+xdD8c/Z4Cg38uqcUf4vEr059Fn5mucy+QrwhbO27GE6HhZWrKke0JkaXCkJX3qTVlCgHUYGqF83M03H4Wj3dlRTRlEYw+5IgiqY12ILQlctaM6UcwPvVcf5t7Hr38SuegQVM9qc8bp475OvkmQsLjenlDOdHSTxDp3nuH1MpstbcZajah0h6BzxRAadAFyOiVZm8aJ77FDxq510dp6Pn6GrxKLuXMGOrPzjJLmYbE5JjDjvBW0NGgzWUb2p2CY5BwiRP69F3a9X6fD25yjzqf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 00:40:28.2799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6adfd9-4a93-4121-8afb-08df49c3897f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8518
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_164037_309541_7BC8CF63 
X-CRM114-Status: GOOD (  11.30  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 07:30:33PM -0400, Jason Gunthorpe wrote:
> This was ill conceived, the existing formats work OK because they
> happen to support pt_num_items_lg2() at the topk  level. However the

"topk level" reads like a typo?

> documentation is clear that is not permitted because ARMv8 has
> concatenated top levels and we do not want to calculate an exact
> pt_num_items_lg2() for the top level special case.
> 
> The logic to compute the number of items of the top level is shown in
> pt_top_memsize_lg2() which is:
> 
> 	num_items_lg2 = common->max_vasz_lg2 - pt_table_item_lg2sz(&pts);
> 
> Which is pointless to try and sanity check.
> 
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

