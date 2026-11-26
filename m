Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF3C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AXJLToW0;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OfYtZGKD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GjHytJMXDzoCx6ad0K73SL0T69tcdzeEOAFHdrTOgtY=; b=AXJLToW0hZ+bl6qiQ3bZ3UxTt4
	RjtNfDHgwkRYKgkIfdDMFIZvhk/+zXqvUP7kwl7m6QomfxLA2s1SZU0w+iJ3O7oeRZPEALodgf9sO
	R4vkRWYSlx0uFmeqM1M+gvy4MWCZtkEsEC6n6AoJytNle88hJ6d8P+XJHLICB/wDDPHATxDI1jsdd
	xfULb1K4nAvJrZ7QbT0L5RNV2Zg9ElkZCucjTfPUFLmV2c2TO9z61Gs0SEwH2NmrVICUb2iD+DeCL
	g9rJ7MO1Ys/E3dP5hL6w6E/ehFWlbhNKuKVZmMX+z1VdYWwKiwpD3vDgOIVDZ2NTVCtTdd44LszCm
	INYXp4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRbe-0000000C6Dm-31Zq;
	Thu, 26 Nov 2026 05:01:14 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRbb-0000000C6DC-35xS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 05:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/eC3bgmYZ6f3FFPOczen59v/oRCSBDOZmFDzsQiT6AB8nmkBWZ8zW9/bJW5s8u2uOFzuIsbR5bsRQu1zYSusB7dedlTC4fajG2x0pWpvUkygCQW4CYPajxK511ao7jPwNM7BcLLBdTxn71XIzQ0Ct40qg1vOVhq5x8wmIPeaxr7WYtSGsOuWNzctZHTlxFgYq/CjqjuKQ1jxMmwzmCqyqdjfHIYKkR5s3Ml+7/roOj1Kn7yl8zdD9Kw5M0CpvVQup3LY6I37+Zwr4LGRUkZ3LYj+OdefVz+Ro/f86o7WUPACKS3BIl3DGK9g2se/QnXAeqD2sQ037LVNqXBtZySXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjHytJMXDzoCx6ad0K73SL0T69tcdzeEOAFHdrTOgtY=;
 b=iVLwYRvZ7U7aH3k3anZjTwtEpngYM/KgFGZNzPUOMX7tzvOmjLlr67hqGLprwCvGqU9E3heKYEA9bX6/zs1B5OXOtzd8GO1JOFsv7/sgJhHfl4AaUU2u8TWp9aZFkJAY4T2bkQ+jtDq5/0OUZl/IUdkaRPXlNrQuA0SatMIM4huvfMEUSMPSzZQlJaD+qzh2s6t0/c7ZHoFYnxZLtpCh1QU+fCtFshnJ5Zp7fxDZPipBKcYGMEcx0InciuAaK6TXF/pimtky7frboRrV9dIE+1X7KOKup90SgoHDo0fNJqSPDMYnGkWCXX4P4jUgo5dTzPawrf/eMRaKUpM9L08mZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjHytJMXDzoCx6ad0K73SL0T69tcdzeEOAFHdrTOgtY=;
 b=OfYtZGKD4KOjFlV8RkgyK9AeVYeVCrJiOAW01+WTqyOhHzJVymzGHX+8ktfNkJ2/i41nShm0OQj6pvdMU/6J45j8Rj/ut6gtQKgBae86sECUEJluEcJPdnkZubjlHgjpdq28CxvfuJIuAxuBug+1l/VsXT92WD1iGnSzKaw6YZXX9t4agU8NqDHzcq95wp13DPxiB/TIZkhhnatw9zir5GVnHu4Ld0HIkbFejcC0tS90VYsfqqqEYlOmldNTvnUazgugHQAoIRTq0zJ38zBJu9h/NiNvMLLMh5kIDWjVoko05hHk9EhA1GMHieIRG5tbRf9Ow80Jq2M7n6Vul2Ql6Q==
Received: from CH3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::13)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 05:01:01 +0000
Received: from CH2PEPF000166C8.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::36) by CH3P220CA0002.outlook.office365.com
 (2603:10b6:610:1e8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 05:01:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF000166C8.mail.protection.outlook.com (10.167.244.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 05:00:59 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 21:00:30 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 21:00:29 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Wed, 25 Nov 2026 21:00:28 -0800
Date: Wed, 25 Nov 2026 21:00:26 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "John
 Garry" <john.garry@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	<patches@lists.linux.dev>, Pranjal Shrivastava <praan@google.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v3 05/13] iommupt/kunit: Skip test configs without
 supported features
Message-ID: <awe86jdX2ayKruCf@nvidia.com>
References: <0-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
 <5-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
 <awUg0O0WQUBcuUvC@nvidia.com>
 <20261124150843.GC8680@nvidia.com>
 <awXgxBCNDzh/32cm@nvidia.com>
 <20261124200749.GB114472@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261124200749.GB114472@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C8:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: eabd1f20-3fda-49bf-4ef4-08df4b7a437e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|5023799004|10067099003|11063799006|260925021311599003|260925021911599003|260925022911599003|261028144727099003|261022105027099003|261026121527099003|261021123027099003|261021121427099003|261026140227099003|261021135927099003|56012099006|261102123227099003|261009223027099003|4143699003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: Hw55+AOZDQ/LoHGK/CHoUW5J2gF/DunGPFHJS4OpTLojgxQdknp/MuTbmznZ2Vn19A2zjpK8E6Ia2WOVloQgQdiBNfhsq8PbmiQbkUIj4ElYtayXyyUbUZUn2GYO4w73FUjD89mLne/wJ1M2SEE8padJyGF708Ja6vdpc0+m649Vu4EkHFPZvZpZ/Cih1A81z2H/uguWnJnmg4hnXcoK0EWRmKDkAhgROSBVWIBkuc2Kt9DsXDqflWKzAn5SU1zW6ABgFYvMa9iaxWxiXkpQDmSKSg6YTCz3zI9ss3cVf71juzy/vj32NLwK04KJMESTyoqBpD0Wx/YENdJGH0abMBMQY4Jffu1BT+LyRSAIXFlwjE2I5EYS/UREa9Pbceuk6GC0KtzTeVbr5EM+Iyb8+fUC8gpBobazdLfSYB/wDY4JBXEWmGI7xd2QdjKowyLd3X9NGnm82RrLe4rM7n5MP9wPK8D1ZSNND0i5xywXZ4jGvdkn0cKowi0QFfPhh7zEvLU/8N1jKNCURL/lh/e3Ig8NCF4d2+1O0LnMZjW69FJA5MWW3WNarARO4yXJPQY69adLR5yEo4VomUyem5lQN0c03IvARaLgnEIeoYJnXPbveRXTyrBtqm11ZDtEJwE1K2qFAonID7RRrYy+kzIWvyWVcvXYFbhl6w56a7TjNpi8nWe9OPHn7sS50lVStTGVlSdL8mQC6FOvQA1IxQ2+Fg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(5023799004)(10067099003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(261028144727099003)(261022105027099003)(261026121527099003)(261021123027099003)(261021121427099003)(261026140227099003)(261021135927099003)(56012099006)(261102123227099003)(261009223027099003)(4143699003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dsg96sK0E/HCBWbvMcu1F3hhhus57tK5gsEf41Groq9qZMiRKu/2VOnFd521ZEwbAwH+91Ksslt7utUZLvxveclWcL7PFHUtbWYqdlxCrwkPAf++ppa9YtfA/A5IpKU7Gm+0OnnvO8ia+PTEJsT5eb/DCRHP5f+8NseOTOZx5vyLMHvAgzOSxhswMPYuSUJt5JdIb9zr5wRLYl3QopIv083Wt6l8pv2KSJyg5nHtXojLFtyKRIshBpSFrojOxTcoY5gs62TyedOlkrOlWb0JeqNP6FwOWhLp+t/Bd6BH5YOzBl/XI+9FQXdFoywftpLOWJfeY3b0Ary8Mka47cDR6sZeXvPrVaTyq69t5haQF/DS7Ue/YO0kFbQ31DeDiuAXZai8m5vuI4rRQ5eLXXdhyeXQUB0HMjbv12AZt4SToVz6E5t5CEndJJ9v6OSF/gyB
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 05:00:59.8834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eabd1f20-3fda-49bf-4ef4-08df4b7a437e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_210111_784109_5DBD3BAA 
X-CRM114-Status: GOOD (  16.76  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 04:07:49PM -0400, Jason Gunthorpe wrote:
> On Tue, Nov 24, 2026 at 11:08:52AM -0800, Nicolin Chen wrote:
> > On Tue, Nov 24, 2026 at 11:08:43AM -0400, Jason Gunthorpe wrote:
> > > On Mon, Nov 23, 2026 at 09:29:52PM -0800, Nicolin Chen wrote:
> > > 
> > > > The leak check reads NR_SECONDARY_PAGETABLE with global_node_page_state().
> > > > That only returns the global counter. Each CPU also keeps a small delta of
> > > > page updates that is folded into the global counter only after it exceeds
> > > > a threshold. So the value can be off by a few pages without any leak.
> > > 
> > > There is a patch already in my tree to deal with this, this test only
> > > works when you use the kunit runner
> > 
> > 6e8127719449e kunit: tool: catch warnings generated by the kernel
> > 
> > You mean this one? It doesn't fix the leak-check failure though.
> 
> Sorry, not my tree, Joerg picked it up:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git/commit/?id=d2eba9f4fa6319eac08608958d4f3a11d5240002

That one works. Kunit runs fine with it.

Thanks
Nicolin

