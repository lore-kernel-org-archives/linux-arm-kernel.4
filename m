Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FB6606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ECxqQVlr;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mGbbdJDI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dfz06uyEH0WMW48I0eiFiHa5o/v99I/A9YzZqqFlVAg=; b=ECxqQVlrKXzPZekJXY3C4fEWrf
	aAwqSt0EMK2CaWbNin37/FcqmjCFGSM9+rjY+rbqIJx8iub8qXGyBnDZEa/p3AVolnr6I8H/OEsbY
	ubSRQSjMbjS0uIFQyHaUPpEla+b6XghEDWT5oa1VfmzOiMcOOrtHt9g1n0g7OvyvZrdfWlMsAMbbU
	5upwevnTht9YxXC+tNsDkxQYt1hDHzPdsqHfwdBgb6Kmn5c8JXlyEaQncY3V6pdBV6voFUWCJpQne
	P2cS6bkXxnQdiwJBWFajVkAE/3V+VSyBRWOnAv3A+kf7p+B45V4MDViVavNQJX+nv892nEo/Vmyk+
	t6anxm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPJ7-0000000DV2N-1mCL;
	Fri, 06 Nov 2026 19:09:01 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPJ4-0000000DV1S-3uvH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 19:09:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qicz+A0lsFUujQmktGTPH+o6pnp4VxQfrOOGu3L5ttfr9otMlmn1djeXGYuUU8OsQsVHVJRV47XXpn3BKlDiXbZIdkI8fJJcSxhOrxHKs/Pw2mwoJ5kQ2EHfZtj0ZJuUU8drvYDUMxYIImtnIpcKRnQqKfxqYjq524bDr+Ni/McIvq5DifLY8vIZ6vJIgaxnpl6/1tp34ZYwzDKSLGgYLTYavO6UZSM9MWv4dbvh8aS2czxEPGDJXqdurJ0aAPkS3R+9ZSPWeBcOFSSONrxYpxkJIpMhIW9WuVIakxuXmVot7mGPppVvgzFEo61Y4dLchm6HbhG9fYC7e7sY/pCuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dfz06uyEH0WMW48I0eiFiHa5o/v99I/A9YzZqqFlVAg=;
 b=dLGcYQO25xarGp8U69sC7tdtNzJOCP8SyX0hl5ArJmGvRc/GBwN4UHdgow/DLr5FiCLnGnpe8+OAvZ4pRKHMNyrB81D9a+du5JeNyn9SSQPL0ifSqg5BRrvmTSl1akoB6CM8R9yFYX7J5XVH2xRzNW69YqMfk0NkCPSB+2QkCGVejBWJZ4SiIWYj9wqm0UpUjpwEb4Mu1tPopePiI9YD8qX2VU13n/Xb5VS5k64iS6+7Lhv+ePJ6wg+dC3cgMOlRXbe42lr0rp1S/JrbAE627HikT7vkKgYpUENam9B5fQeQgpF+So93wBurd086GGFOX6nNkjkD9QRbO2gRQ6vDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dfz06uyEH0WMW48I0eiFiHa5o/v99I/A9YzZqqFlVAg=;
 b=mGbbdJDI0DsICsR5cqbqcn1R2WPeae/INCa5MhrDULPJXb55ORoGvIZEQYuaFmSadCvo+mnUsQMm6VQ1/U42heT61/PCqjNGc06j3omiOGUH4R1DnRHtjjNbavmtpypGsBXqAGL+oWZdVezwcY3J5tlOLoAEhM86PN1+EfcK3FA8ULiNqzyoxDmIEu4RjWPy0kS9hpJHS0R2IX1/aMcquSskkrN0r87Uvb/ZrKh6t8vDEbXyfnnoJ05LmNwU/zb3YhWdpATPKjKrTIg/P0uB6FBo6R8tymeLmLhjaTVMwrVxuCroHtvoUOY+0ql9TkFjYEhCILXJWJPimDiibdLsjA==
Received: from SJ0PR13CA0126.namprd13.prod.outlook.com (2603:10b6:a03:2c6::11)
 by CH1PPF5EBD457EF.namprd12.prod.outlook.com (2603:10b6:61f:fc00::610) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 19:08:50 +0000
Received: from CO1PEPF00018862.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::3c) by SJ0PR13CA0126.outlook.office365.com
 (2603:10b6:a03:2c6::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.5 via Frontend Transport; Fri, 6
 Nov 2026 19:08:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF00018862.mail.protection.outlook.com (10.167.249.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 19:08:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 11:08:30 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 6 Nov
 2026 11:08:29 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 6 Nov 2026 11:08:26 -0800
Date: Fri, 6 Nov 2026 11:08:23 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>
Subject: Re: [PATCH v9 16/25] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <au4lp8sAnWm3/Sw5@nvidia.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-17-smostafa@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015200903.2735565-17-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018862:EE_|CH1PPF5EBD457EF:EE_
X-MS-Office365-Filtering-Correlation-Id: b7806c83-bf3d-48d2-9690-08df3c3963eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|23010399003|10067099003|22082099003|18002099003|261102123227099003|3023799007|56012099006|4143699003|261022075727099003|261021121427099003|11063799006|261021135927099003;
X-Microsoft-Antispam-Message-Info: VP9Pfj37HmicBiONQto109CWNu33yKdt17W915Dxh6ZsHQt6f9DonCWTbv+7eqFfdziDKzieLJ6APRcKKsmaJs6WwrjeYTnXDIu73mX/zV35cmK9s/D6okNJHMegSxe87QMqSSwBQ30PTblWsLYy8/A34ZsTGYBGLzHbxgcKEB9ZEZb/fmH/kIS04+Q23RXkpRmjgx4U4h32R/+rSRrH/GnvukaN66VTi3cJBgoDPRn8GwOfwwKIG/DhiACBhsVouFuauAeoNzC8rCsXT/K5lhdblD0tVUPYoi5gMQJYrL0/B9wM1pEGPzzAMr5XrXgYrDP0jhrDls9Wv+nwH7gGlO+WJc1dRivubkEfpgjmMAtPbDVFVXjKjtWcsghKd3qDnc3JaDlhatiUU+rpLNhhF2P0C/QCFWYErRbSmBRttfOKB5FVGm/S6y47oebOHqSJFAZmCgrVbHVxrTrh8+L0tQwEeRK0ahnXQ4poOr+RNS/ZKHB6kO9YUp/GQMCmXdls/HJFdN0Q//g2eq9rYr9Ov1sqWMzERT3udzwzjaJsqyHuGTuIkSjgS/cL4IOYmRWJPyBm30QVjNcbZ6Ud/PpbMDHrXxf2AntxXWlPO6sVxmGAcApRnaAl/mps9AufYNWKbId4N3E2uxHZ862kL37ygg4NtGGMgiVVZGA5qvj3oPm6FE6xGz6xWHYDXCzKqlp4sehFuuYyufHLeNlT4r1Rjg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(261102123227099003)(3023799007)(56012099006)(4143699003)(261022075727099003)(261021121427099003)(11063799006)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K3CC555CfZAZ1lr1l43Xf0v7fmiImH1xAbfqwCVNU66NswQirp7zMMXE1TZ2zREcZt+76MDn1zw4/hCk5licsVk39CI6+pJkp5kGgsaiuDil4SVG1E4KF6o5RfpehFbVUAjyrKnfe1xbqMTFsyN2hsvDjiWuEOmVaBJC/WdjEVD4tmz/DCcDbi2VsI2+3M2TXwyfMfRiHd7q108DUl6Zxipuw5Z7vfvCVIa16l2jsl9f0LJpmYtnspuCHQAUfZ+k2HjK3gfRUQZh4XWtqUM568RJ2g3b21Q+RF5BDCRDmJC2yOQzajrT1UfNOS8NjKIWODbau01yF8JD73zwd0edYmFuebO8ZX4PzTrb/uzlMWMtyJ3gNNStqOpyYgqpt5M0uGioSLrD4xSGwosJLRK0+yFRJJICmw7FqwJKEoeaNIHqyF/shky7BeIEM1WQJueU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 19:08:49.6095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7806c83-bf3d-48d2-9690-08df3c3963eb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018862.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5EBD457EF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_110858_972853_A5DD2655 
X-CRM114-Status: GOOD (  13.56  )
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

On Thu, Oct 15, 2026 at 08:08:47PM +0000, Mostafa Saleh wrote:
> @@ -385,18 +482,51 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_device *smmu,
>  		 */
>  		mask = read_only & ~(IDR0_S2P | IDR0_VMID16 | IDR0_MSI | IDR0_HYP | IDR0_ATS);
>  		break;
> -	/* Passthrough the register access for bisectability, handled later */
>  	case ARM_SMMU_CMDQ_BASE:
> +		/*
> +		 * Although allowed to use smaller size, we rely on the SMMUv3 driver
> +		 * using 64-bit store instruction for simplicity.
> +		 */
> +		if (len != sizeof(u64))
> +			break;
>  		if (is_write) {
>  			/* Not allowed by the architecture */
>  			if (is_cmdq_enabled(smmu))

The spec says the register is RO when CMDQEN=0. So, maybe it should
be allowed by just ignoring the write?

>  	case ARM_SMMU_CMDQ_CONS:
> +		if (len != sizeof(u32))
> +			break;
> +		if (is_write) {
> +			if (WARN_ON(is_cmdq_enabled(smmu)))
> +				break;

Ditto

Nicolin

