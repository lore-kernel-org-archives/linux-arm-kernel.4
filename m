Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F3E606A885
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Uc3rvJV;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BFIkAYjp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rwIedolhmVBWAJLaTlhsxuSZ2r+MC+t25ryrT44emfc=; b=4Uc3rvJVOymNYi3HzFljATBi56
	zRHrX+VcyvswzoVvPlFGXUoGRO1HxkZjzvqJG7Vqq0dtp6Pvd40QUTyTf/pyIr8cCkTxxT0cOEEec
	7RMWYAu58L1CcrcR+X7myep2kUFdvJ0G7zmBtF2HbqO1aV44RJK/ye7TkndrIS4FGaYMbBMc7bGKk
	mHEUI+DgquUcMxtkEeCW5kAvX15MomaJD+IUmhcslgLZImZbBK6pbHOxgj3gvRFIlfElKsajLq3CB
	FtjP6as3ww7BGIxmvzsPabf2tqw7VhHBNbcdParqlsGq2B+wt+4bsurVIfQpYmwJZbdSlbhS9LokX
	jDnYYH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzje-0000000EgqY-24YX;
	Fri, 13 Nov 2026 22:27:06 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzjb-0000000Egq4-2mfP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 22:27:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D78Lc5uXR+xUIFWslIjQaHHamRTANt6Z0wUqul+7sgvt3hd9MkotApGuvsiTh4B4OeJTT6r+D2M1e4Osbsky8b6L2i5/debNrws56x50vlbO1DU00npCCj95W/gt2pIXunD+oGOLCUuUurxQOetvDS5siqJLVKE+/gF+lTzcxh1mmT52FgtZg+KmCR1PZvWQd1bc1J4k7choeKf29H3v4MpO+UnRR87l0wlYCJOqxijIj1iAoQxbxGr/KxGuTYLOZ3wWbWEKfhBJOLksbq+INv+8W4CUeUFoBi+VoJ5XuvDnZL8VZH3RbgTQekLD6h9FdSKnRJX8VbihTn0Yg8Pl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwIedolhmVBWAJLaTlhsxuSZ2r+MC+t25ryrT44emfc=;
 b=guoyGolE6M/Sm1lPpzvGk2iCQK1R/WXcnTSK/H8T6neVAL9QQfYjyPxtp3IZMSUn9JJM3wi0rJwr7XcofZG+hya010Zt0E4TwqU3U/t7zalCbGAIQoxmP143an0XMSuj0CaL8dRBPyE2EdSInlUdPF7gAWZkcIk6BE2wNVmhLpYM6pKhhXvbE8uoUw69P/S8NlzzmUlBGYIkzGfiOD7SOfVMSlruClnwgEyMFDSVs8cKn0TE3hHzB9QsrfXqplLjFcVlK6727tuEU/s2qNM9tbp6dRczDgEfFQn/wdM1O4CYG15rtEY3vXG8JAbi5P/QdBNA2eXe6bI8I6StBaUpLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwIedolhmVBWAJLaTlhsxuSZ2r+MC+t25ryrT44emfc=;
 b=BFIkAYjpghwxy8E9MBv3+MVIPuovj7LYmsqnMkC2bg0jvD0sY2JflaZxunATvAH5AdYbCkeF2D1k4NJ4xQRTL00BqCTqYdob6nSj4L+8z6Bv7z6tnhAX8RTIS+r/jKLVyRJ/RaySQvTDH8sUwy+4z83/MKmqtqGjxnQa6/a4fQabKNdk7mxZ30UpnQWnNUOLpi39C3PYzBLgRcTxswtpQrKmb2Wu4nTUsKwBE5VtKunxa7bNxahGEfXH0dgk8MgwmxlcgYgRWZxV6OsajSy/I1cP/oqdnwWm/+YAYdlR+t5fE8rSQmZF9L0A+pj/iVzOTQD7wcJVcnt0LUM1Z4PRFw==
Received: from SJ0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:a03:2c2::20)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 22:26:55 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::9c) by SJ0PR13CA0045.outlook.office365.com
 (2603:10b6:a03:2c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 13
 Nov 2026 22:26:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 22:26:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 09:44:56 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 13 Nov
 2026 09:29:14 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 13 Nov 2026 09:29:12 -0800
Date: Fri, 13 Nov 2026 09:29:10 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <avdI5olRpBdKeE9C@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
 <avGk0ilyJh3obmKx@google.com>
 <avJidXM9yQOX4VBJ@nvidia.com>
 <avL016l_xASN5paR@google.com>
 <avNhekBYqiiZ9IM2@nvidia.com>
 <avW_9A48mtnK383x@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <avW_9A48mtnK383x@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 0998d419-047f-43ab-d986-08df41d53890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|82310400026|376014|4143699003|11063799006|56012099006|18002099003|22082099003|261009223027099003|261028144727099003|261022075727099003|261026121527099003|261026140227099003|261021135927099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: kRS3y3YnBAK0bGxdf3RkQQldEc6lzbrzJtBep0ik2nzf2TQvH5cxMi+RvzgUtEg49lqs6DtGtPmPZqXHqCgCP4FMtk5k7GhFymQQVdF1Z7E4dCLQbSWkt6vAhUw+S4ZswxoDfTVpqZpl4jLbCSqyg8fEOlvA29J+1Og70C6ofDImx46FFnkAvSrZUAwEiF84lQZEKg5A/viSBe4nJOozzMqM7PSBCz7ot/0lQGfBIzxb12dEAhhahwLM6UBwj5GzRpFl7GKjORHOB+xibwpPnWJeGkTslv0/ACBuHlD02qXKuL8U3nFXGr02eZ2Ywir1rCZj/bHAnpn8Rvm0FU5RIx3nFmDBXAPVaP4d44bL6uRX09Nh5LDO9rZL9g0EZqJ0ET2cXgSh3UobJhh8oRCN/0s1ENi6uWww2DPuRHZQBJlOdtSvyQcs0wRIgPJvmc7rMtcgz8lkwqqVAu0WsRyNIqS11Ua2i6e8lbO7gRC4ne+XCvlC++0nzIO6ser6ie0gKEkQGJlIh5YDSq8GNDIj2Fp8s0kc984Pzo6Ja5mPcYzv9F6jc7hrYm90rYj8pDOlspLT2AOTB7pX+h3UvuXLd5fEH+uaGO4yWCFvXim65sIvIPfvkcQGszFo8WO6CbiSWHc/WtFlq4YROUpihxD+kKNPc9sA+ey1T2V2/bAvfLx5/IBolnqH3ETeJGy58Lnzk+f0fn5wlNnosv59qnHPaw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(82310400026)(376014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(261009223027099003)(261028144727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021135927099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s0i2F2RLk6FN4xSn7aeNLrnkDE6XpwSfKyjAVIEfoVPq3nS+1awJkL/QpHmdkckwNE7FPZszH4G9gwkcXlHJYxSfEi3EO+7ejXxcKwkdE26MKb2GU5ZMDZmMGboKssyx5cVrD8PuySfqfgXfr9hoLbtxbqalDzda2nu2tCiHXVKMmQmAmWRKc2VAKd/HvaqwnX60FOxuKvDaZ8Xqh3me/FfZBIpJuxFP/KrEg4hJgBW7KpZSNyH8WRoKpyCb8ddleOl5GHkiy/uJJQXMTAk4v42hY/jCxxCvm5Ue0coQeV7/jXVjA+z7oYUB5H2pvFN6emhvYJO2UQQthfy3k/gwMDBL/ziDcfJK2f72M8UlHTuQ4u883/Ik/4gIBbOsIadSl0OPDwnyUlKfsWEHe+zcBBo6DwzkxXhqJev1yh5n3gHjy8AMI8gQHLgsrGfLrlWt
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:26:54.2359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0998d419-047f-43ab-d986-08df41d53890
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
X-OriginatorOrg: Nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_142703_712326_D12A6B9D 
X-CRM114-Status: GOOD (  17.93  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 01:32:36PM +0000, Mostafa Saleh wrote:
> On Tue, Nov 10, 2026 at 10:24:58AM -0800, Nicolin Chen wrote:
> > On Tue, Nov 10, 2026 at 10:41:27AM +0000, Mostafa Saleh wrote:
> > > In Android, in that case, pKVM clears the FW (called pvmfw) that loads
> > > the protected VM and authenticate it so any protected VM knows the
> > > system is not trusted. This part is not upstream yet. [1]
> > 
> > You might want to double check a dual-SMMU case, where one gets
> > accepted by pkvm driver and the other fails and so bound to the
> > main driver.
> > 
> > It seems the pkvm driver would still pkvm_iommu_register_driver
> > and carry on with an untrusted SMMU. Would it also clear the FW
> > and mark the system as not trusted?
> > 
> 
> That shouldn't be possible, if one SMMU fail the whole thing will
> and the driver should clean up after as the probe is done through:
> 	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);

Hmm, if I read __platform_driver_probe correctly:
 * __driver_attach() doesn't propagate ret from driver_probe_device()
   via bus_for_each_dev to the caller
 * bus_for_each_dev(..., is_bound_to_driver) at the end also returns
   true, as one SMMU is bound to the driver while the other failed
?

Nicolin

