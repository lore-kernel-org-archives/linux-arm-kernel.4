Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555F9606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1G4UBdsY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qfAjNMSDS1I1qGwf30pv5fTM4/8ictpdhB/hEmKFsAY=; b=1G4UBdsYNr6MAnf4bRB+D2Y3/I
	j7P/fDoitfNICgVILQYRmVnl0cWbMKIkYapQpcCEzEUXa23Xo3L1ahwoMI+V4fM8C5GUJq0RK4Sii
	Waf5/lQ2TANeaZYwx5HLBhegsVHlgVYvsaek0xwnvQO80xaw7iVXNQPq9PJsafchLlryfkgeog43A
	7UpKYMMMmfMdMSpJ7kKPukabo7z1g3JDLyjhmmx47PHrUswBhz2XzjwTdnB6lhmdEJ1k0YtIx1ZJq
	repraf1007u/La6bH7mZSAJLnZ9hOnUJ1hBxW+DWaYmF0X2HgsHHxgHS0jWOfPgYk5ws1JnCW9rXe
	yvl/iJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStb1-00000001tYJ-1Xd2;
	Mon, 16 Nov 2026 10:05:55 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStaq-00000001tSg-1wKr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lk59j4hsAxdxKobgbgp+u8OIn1AW2xGbXBaFay+ZFLQkN2z1xGrdfVwm/Xfsc73ayMetk+jbWIXezB14TbtqaQvuOkCkRNKtiUsZ051v1V3DJinVxas4hS088V0LOl2Ec1+re1BGaRpHKwrnrrktwLm4Ww6aWnkDkQgFNABEiPnafKUL7xT8tevyjB4EUHdDvdMvqUdz4U01qqB1Wr+zkxVKSGR4cMgCfG7Cizqn6in3kLqFBD0H7ZfDT3Kmo1pPZFeVt0mmNY7ys0+InRlnOn5dgflSG7tYucY0eqAzG7aFILrEHeE8x4PI8sQX13ZqVZTDLKCTOVqHhnj0w7z0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfAjNMSDS1I1qGwf30pv5fTM4/8ictpdhB/hEmKFsAY=;
 b=qJz0TWq4ywjZCSlYnKmWWICeJRg8/WqnNswza/fLTNRMP5O4VasxE2fl481n2Ruz44bCf6amyMw2WLDUAr7z6QPNia2tU5P+lSRN8H01A+N/AwABXBJLWDRn+IsC8ij2gaZitgVeUOvFgN4RdBZkVB4OalFBWlGrbQk9LbKzfNDVHTjXfnDAAUkwP2Vsi5w0332tSYyGa4e6Wz6rlgEoMUlhis9F2toCA4dt9/DaUtbMVWz9+zEeIIkXN6U0+5gNp9eSBj/ank5V4SMXhRTbVRWzgTSaIgSJKdO0h/IYaI67BOl06DZCKTbWj+xqOi8/OEbBGbTuW5Q80q60tlO3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0011.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:26c::17)
 by KUYPR06MB8818.apcprd06.prod.outlook.com (2603:1096:d10:98::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Mon, 16 Nov
 2026 10:05:37 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:400:26c:cafe::5e) by TYCP286CA0011.outlook.office365.com
 (2603:1096:400:26c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:05:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:05:36 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E1DD2427EFCE;
	Mon, 16 Nov 2026 18:05:34 +0800 (CST)
Date: Mon, 16 Nov 2026 18:05:33 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Message-ID: <avrVbV6FEB8qVstM@ubuntu>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
 <20261106013453.1134239-3-Jelly.Jia@cixtech.com>
 <avYixCLEChNjAvtK@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avYixCLEChNjAvtK@lizhi-Precision-Tower-5810>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|KUYPR06MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 4109fca5-5884-4aac-6ec2-08df43c92941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|18002099003|22082099003|6133799003|3023799007|5023799004|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261026130827099003|261026135527099003|261021121427099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003;
X-Microsoft-Antispam-Message-Info: 09iYpI72NTr1G3qOvcPSpFdv8WOd8+s9k8LMIT3zmqkSPY9QdO4/OtlkUNYMlUNSUx5f2g5qfdLf+fd6rmAqsGMBgGVjEUmpc8XbFQsnC1lQT6qph65EHGileuu7zcFOhZ9OKmiOSx09HJQbr980vs28otT6xdOizwM6Bd7PLl7sN26S/KCObvsv41nSPiVjlQ9bdvq5pAyHzVS3rnjrAbRuWF2Fr2JMzcE5rdRI/f3zVgxARxHL04g3XR0aK99XLdiXDtfR+b7VVFohyRNv7leYFPqV02xLW/U0/5WhWBkdl4siameB6is8axJUxLwzydj5zo7HN0npCr3PtTgNFE8Lq+9eyMdc1gQzCeDPeJOa+Df2g5YSrhc7NVSxLPXSmPaqJlZhlrL5tUoQd3WqTmC6G1C8+bFbw4Mg5PmwMPXWEX9KGYVYAfSId2hc+LpWwox7EQApjI/sZi4lVmovjzz5eYJ5biQ/yoH2TtZXOg3iEycLp124NcYZEU2efz+kDOaGDYWU+9yCbiFzHIZSvWECsGstdmCAjOwmouXynMpBGhujjfurcg3zxfrAjFF6S1agPYceQXaUnZ+F/vesJIdP9DNoXC81x652KMOXJd8jTKEDmgGla4xQWn+veHeOsi6jEShngxoLe6J2Jmxs6+E68hYt4a3uKt42digMWGvASbCM7ILFd6/srfmHIqx9PHFm26v8fnIw/hMCpspVzg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(5023799004)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261026130827099003)(261026135527099003)(261021121427099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qKWdjYRGyE3cEhBixTVURQwnW8AIdIq59MtrbGHSIgAe84y9KdjgptIv+vXV55lvxoXzlOsLGcJrMLLZJ+fiJq/938DQ4XcY48lWABBBBfblfgADdgxEQpHbAihXTh1MG2Q1inpt4uC7+bkvfHE764FyUUeKjckbnRilHE1elcHoW4rr6Xc1Xx/lEnZbYTY9/Hz0XDEFHEFyQBbjY8krrrZNwNlJpXkpFo/XX+RQSLuA531t+GL9/slPXW+AsUBMKHTgQxTAs5FGuRg6XjYEvckLNfFpV/D+/+hV2t+Q/EIs66WBcYqbh2OcBbJCmcW6lUo/cp4MsKthsScKYTw609Ac5CuioFqiQp9EJT8qRzht6m+bAsVBwVy0ReujUH65egjQNIb+8WPmGpzCKrZPg+uRN32TC/3DqbYOdv68gQItFcnb/4V9DVwxjFUEV+CR
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:05:36.1195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4109fca5-5884-4aac-6ec2-08df43c92941
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_020544_512357_9CCA8FD0 
X-CRM114-Status: GOOD (  18.16  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

Thanks for the review.

> Use seperate patch to fix existing problem.

> use new patch for memcpy and memset change.

I'll separate the existing fixes and preparatory changes from the new
slave/cyclic support. The revised DMA series will contain ten patches:

 1. Source-trigger bit fix.
 2. DMA mask setup error handling.
 3. Channel coherency initialization.
 4. IRQ, error-state, termination and resource-release lifecycle fixes.
 5. Submitted-descriptor status reporting fix.
 6. Managed DMA device registration.
 7. Explicit descriptor length bookkeeping for memcpy/memset.
 8. Slave SG and cyclic support, including managed OF DMA registration.
 9. CIX Sky1 binding.
10. Integration clock/reset support.

I'll keep the IRQ/termination changes together so the descriptor lifetime
and channel-state transitions can be reviewed as a whole. The coherency
initialization also affects existing memcpy/memset, so it will be a
separate fix.

> can you use enum/define/struct to avoid hardcode

> convert direct at d350_fill_slave_cmd(), most likely cpu_to_le32() do
> nothingh, to avoid additional data copy

> feel like, needn't save length informaiton, you can get such informaiton
> from cmds

I'll name the command fields, fill the pool commands directly while
preserving the existing little-endian format, and derive SG lengths from
the saved command fields instead of keeping cmd_len[]. I'll also use
scoped guard and the d350_device_config()/d350_device_caps() names.

> Suppose should update it after other field ready. and need dma_wmb() to
> make sure other cmd already written to memory.

> Needn't do memory barrier here, suppose there are issue_transfer() have
> register write, writel() will do that.

The header is a register-update bitmap, not an OWN/VALID flag (TRM 5.7.1).
These are newly prepared commands, fully built before submission; we do
not update an active chain. The first command is loaded through MMIO and
the channel starts with a non-relaxed writel(CH_CMD_ENABLE, ...).

I'll remove the prep-time dma_wmb() and rely on that final writel() for
ordering, without adding a separate header-publication barrier. The
command refactoring will preserve CPU-endian values for MMIO loading.

> Generally, access peripheral register space needn't map, does your hardware
> go through iommu when dma engine access register FIFO?
>
> If yes, I think it should map at set_config to avoid map it every time
> at prepare sg.

There is no IOMMU on this DMA path. However, Sky1's RCSU remaps peripheral
addresses, so the DMA bus address differs from the CPU physical address.
The dma-ranges property describes this, and dma_map_resource() performs
the translation through the direct DMA path.

I'd retain descriptor-owned mappings rather than move them into config,
so their lifetime stays tied to queued/reusable descriptors rather than
subsequent configuration updates. This maps once per descriptor, not once
per SG entry.

> why previous check CH_STAT_INTR_DONE, here use CH_STAT_DONE, suppose it
> is w1c register?

Yes. In CH_STATUS, INTR_DONE/ERR (bits 0/1) are read-only, while
STAT_DONE/ERR (bits 16/17) are W1C. Clearing STAT also clears the matching
INTR flag (TRM 6.5.1.2, Table 6-8). I'll retain that distinction and clarify
it in the patch. ERRINFO is read before clearing STAT_ERR, since clearing
STAT_ERR also clears ERRINFO.

Best regards,
Jelly

