Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C59606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z+eyNCnc;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TwD1yvrl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UylABhHfMzOQ0RLRFhdTYzyaF2aCJlo2Dso0YnLTx90=; b=z+eyNCncGdH6HK
	yRBhNcylohmi1UoAQNBOar3qcH4jNpkvM53LdUYgCIyzAcgEDgvvsIj4k69AjRVRI63yFLed3+Nas
	zr6wfndrxY/w363QUH3V/s4NidNc5hVIt82fuxJXK8ppkUB8tS4W+uLiQ80aewvvJOCW6MgxWLS5G
	+44zZ+sb1KEYK/VreKwn6Qm0/alBdA9FCYXKcBnlz3SvsXIepASGqkG/amVCGh89XR0OdTYRx18hk
	W1ESaxro2SFR/l/QxNx6E7kQbFpKVdvU4OV4N5zxjHhEt/py4cFX7H3b96hdtBYFTsxGiPOxqrof/
	z85EiYPYTtB8N/dQT6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxpJ-00000007owd-1aJe;
	Tue, 24 Nov 2026 21:13:21 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxpD-00000007orE-3a3f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:13:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKQmlN3S4sTb4rM+d7C75nkJp3MRh8V+DL5cv8ufW9LOQSBH37wJfqWV+MiHUx/OhTsthucmK3nuO9TqfaFWzsoCFhvlh1L4vMvGy0brxWS6lHRnJnS+x32nkAwlSA60K8X5GGjwKEAcC5s+BEHM8XlxPpl95ZOzRL0vUSWJU+PYAyHWZAYV4os/9d/WNtG6qF1A6AbUsyOBectc08S62os1nA/YwAdSYQNMYC7vw4IzbO6fz+zkrPC8sVoruvCnU7neDR/W8fqySSxA0sAnC1JJ5lAvwPWvu9VFAxqnHYTmS5OfPgT25DvWrXb+03uGmYSYakvlAaZPVu3IaKwDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UylABhHfMzOQ0RLRFhdTYzyaF2aCJlo2Dso0YnLTx90=;
 b=ByfjWMGWmJ6A264P7qI5Qc441Q7/UNUGiqrlYmNQXwTWBmrU+L+oEEqzYquKCGPdvneo9KXCCdd3eI5fOyzCDKpaOQj+sBG7NdEDghNaPiVW52sbZD0lIFP8/VnO8NXN4f8IA89NJBOpcvcRiWkUpE94FuG8OZfTfFUKYeqdlyoZOQNZHLzQIradcwMEzuB44i/5DftdhqsVPcKXtcVMTSCThuwrqYu3bBLjiY0/jJ37cgqgw9p+0rgrmM2lHUfp6/ZYoNSIRWLPD+gSWyWYzJGeUM4vOi4bMDCh2aJ6BZkmgbOB1We6JdkDZ4PtfGTM2uep+/xK56NNCAh0aGM7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UylABhHfMzOQ0RLRFhdTYzyaF2aCJlo2Dso0YnLTx90=;
 b=TwD1yvrlmdJGM4/JzgPZZTE7d1rbIIWSsXtpANcKai5f6NyQDMcKnzf6dSVFQOy0O3QLjzoerbAtfhk4YIuz02TxRS3HhLrPgatD16dsV8dfED3Rah1vBgY6izquabnDm1oQXiiL3QsfnJqHKRpzwhhdfDJgqyEhQy6oj3INjWju2VVgdnZnGZFhYxll2bDsflhhezu/2zJ31nEkmufMY1OnyzjWvb8gxNKe71XLlflZD9DbQcilv/NYPlkBlve3FCB0iSMaQrzR7BxhAk8BLkWOp/1NJlQ4a55ZlPLbznihV0YIOxSB0vuCBmM0Ltljj3ux74DFsMumi6YMlWoqTA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:389::15)
 by LV9PR12MB9784.namprd12.prod.outlook.com (2603:10b6:408:2ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 21:12:30 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::2815:c27e:a0a:2720]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::2815:c27e:a0a:2720%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 21:12:30 +0000
From: Nathan Chen <nathanc@nvidia.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Tom Matthias <tmatthias@nvidia.com>,
	Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Julian Miller <julianmiller@nvidia.com>
Subject: [RFC PATCH 6/6] KVM: arm64: nv: Park shadow S2 MMUs emptied by a guest range invalidation
Date: Tue, 24 Nov 2026 13:12:18 -0800
Message-ID: <20261124211218.2751086-7-nathanc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124211218.2751086-1-nathanc@nvidia.com>
References: <20261124211218.2751086-1-nathanc@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::25) To DM4PR12MB5390.namprd12.prod.outlook.com
 (2603:10b6:5:389::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5390:EE_|LV9PR12MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d5f12e-a84d-484d-197d-08df4a6fa668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|261028144727099003|10067099003|11063799006|56012099006|261021121427099003|261022105027099003|261026140227099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4SUtxkGzMcIbrQVOXStMGlkJUGER8+t5mUhPFpG0GQ7kfdwPBy0tWsM4fcrl5T5trjnCklC6hqNjIMZq9C2PHpUXFuTXVbsakrVvfCm6YCChQgG1onaj4UTWFKEaFl0CFsZuwAB+m/W+9BRjx5k7gL87b22aikbimkgAt2l+acXdQrqLWzKZ4Wm6D46rZM+l45/uQ5YKCajZ1UbWJ9AYpNyIvX8ZAr8YV56scrpw/xtHHtfRWBmtKWOzpl2a1bypv1laQvylPvaxEFGIOHj/nsUn4hfS2wk+9tSYYoOS6FQFXhzKyDNzyLmtW5NYUuJFiIAcKqZcqzRbTbvHYLKPwdX8CL/xSmdrAGtViirnyMgu1zHj05EshDmR8HoSkDqdEHwAWg0zrx/2HdTHdutfDfPeihNMMbxAE7pogySWxV02W2Pr1Ne/vnp9+yhSS+gk4SchrTVXgFBpmLNVJ3gjvtiFpX3F2Bvgt1trRFkjw7/xO17r616oQ7L4p4If6GuHI1XnYUrjjgTUhhlehLNnScXRqN4ITCz29ZhBnM5LNGSePx99W39wSA5kYWomM+aoRksENUy+XDpvIqZEU1xzIqQ58ixrvVgzA2e/qVJwQuNrdjhwOv/bapc6VHzJw+R1No0Wi+9VxRsc3uqkuCTvzoEx13v6dX+45cDaJlJ8qIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(261028144727099003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261026140227099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XoJyTobKUAwt8KuAxVTCqeCZgwQs+T6KkwLTNrf4jwkC+BTwU+rU1yyO41LJ?=
 =?us-ascii?Q?bQM+FWPVEQg65TJmcBtwb92UZsMpvw5c3mU/yGB9LEFmGhpPQQAYLWSpG3xq?=
 =?us-ascii?Q?cROE9/kPjwESlJg5RCJWmtNp6FxOkwBUIlQDYxGqJj20SGCIojg5zG4XosKq?=
 =?us-ascii?Q?TsQbQeTLXD7gTl6oQXy2G2UyEGD62XgdzTz0V2teGpVaKjEdS6pv2OYbs9gQ?=
 =?us-ascii?Q?2ulI+bKcWvwyA65PFColIH0n8ECa0btRKB23ZHfrDnVfw8v22XsruZCEio/+?=
 =?us-ascii?Q?gMG+oLqiVONmrUmBQh1TYhl9szyDVoy6pwObEsTwFG6C9/1MuDF5DVMKksRb?=
 =?us-ascii?Q?wtWaP4+FWY/VrZlDB1meqIuM9WSJ7v0rXTf4MZj8NArCr4eTPVS1jbC3n3Uj?=
 =?us-ascii?Q?NanW4w7c5CkstsuHveHNdhInFMwO7B1cSxJSR7FWRmFgwRWvMeKRkSOoG4aS?=
 =?us-ascii?Q?ygGi/Qcn9Pm21ZsSKovSWXpx7sQFeY1tytJ3FxlA2f7yirjt+ZNBdk8W19rN?=
 =?us-ascii?Q?pZFvWnV9NZ7CxYGeWPkCvt9+84fw/FqszC78W8CBNDNA/9dy8TgnLipJQe3x?=
 =?us-ascii?Q?CJBff2RqdSGJt29hjIsaTga9gwuAiOYV4Ezjz+I826p92jRiXnRJEQAGtQi3?=
 =?us-ascii?Q?8PRkOmq6axqdvErgzNLARmbHrrbpavrCt9kBzPFs9byl4shUWU+fa6hUVota?=
 =?us-ascii?Q?gpLX5fILZfVChd4La8ZbxYoPxOfbk0HAsuEC3gS19Dz2JiwaBN4+0EyD1ZbN?=
 =?us-ascii?Q?7AN9RwwU/dwzdPTgClTCrRFKzjo2LIo4NVHru+JLSmxkCRKKjoMDDZO+1vFs?=
 =?us-ascii?Q?eJU7sURIHAHFDTEXWNsc3YRvdvQRQgTAQAqzXb8/oJT7rx1sCPBa3wd0/u3p?=
 =?us-ascii?Q?VT5w9uuLfVa+Tnz/uS1g25oywocENQWCfCZ3TH9c+MdvvvjaLZXipPkpblFA?=
 =?us-ascii?Q?5hFGCUTVcFp3caupZNa1go+9zmKvGlj156PFi355+hp1eIZso+WaDV10bb2g?=
 =?us-ascii?Q?CaoMEx6HMqLeKL4G07FMpSFqXwkOiiNUJyR4GoipJEYwp1meGfT5CdfCh2Ap?=
 =?us-ascii?Q?DD8837IpDCXXNxSJGd80STVH8PGh44oIoo7tfqmOpXALoh12CDSntdvZTk81?=
 =?us-ascii?Q?W2/DoRsHiqpNyTmZ6rKgyaU8y+4pp5/HJi7dwmta8UP88MJp3mfe5D7w8Sld?=
 =?us-ascii?Q?9S5JuvuPTcOiG26vpVcIUBJ2B9aA9rx0hQ+BY/KeoWtbF9Gi+19mfPBWv4ZH?=
 =?us-ascii?Q?n8ojToqaaKCndHXvCaBoAx91t84qq+9fHZt9pJEgOxfCAhvgmYPtOXfERn9Q?=
 =?us-ascii?Q?oTW+bJ0lnDusJyQTFEYn2rfghdSuuvTleCoYPmoxgs7McHHhsMc91Eqzw1WE?=
 =?us-ascii?Q?G+FXvz6bDHpPfOyYPFBvWY0HVQAYbOTA54wRfVJ6jCMZ7xmUAwMVVGxYRXAo?=
 =?us-ascii?Q?UlBxoSVNi7qSMy6rH9HAomlrFHTgkkfpD5E0HA88qdllLQF0svzNlWPCCq/R?=
 =?us-ascii?Q?MdRbxaHcrQ8kEcXRmHpXDdYKzcoq/HjbSatBYCPqsJBFB9oK2RFYuri4Vm8K?=
 =?us-ascii?Q?zGJcfsCLx80X5F1guHgoGK+Y4T9XOzckpw79Lnf/6fOHWxnQHhppA9t34Bt7?=
 =?us-ascii?Q?2n0JnMMx8CVZNqNr+MxMeJcWge4DnBk6qt1G16AjaPRIAgJQkh3qQ+GQd6xc?=
 =?us-ascii?Q?99reEdBlenqxxHiO1iUdg8M5DkPeumRmfafJKWxrEtLxLwkAV+wHw8ey333v?=
 =?us-ascii?Q?d2Bb8z+KeQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d5f12e-a84d-484d-197d-08df4a6fa668
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:12:30.4825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0j9yQELjE1nrbxcxF7esoc3HW0wLK8eXkEttCKrmSP+pheTG1qLZeemjwGZGr006KaLjhcUMGIOmd8caNpoJVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131315_909782_F425078C 
X-CRM114-Status: GOOD (  14.36  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If a guest TLBI RIPAS2E1IS or VMALLS12E1IS leaves a grown, unreferenced
MMU empty, park it there rather than leave it valid until a recycle
unmaps the whole IPA space of an already empty MMU.

Signed-off-by: Nathan Chen <nathanc@nvidia.com>
---
 arch/arm64/include/asm/kvm_nested.h | 1 +
 arch/arm64/kvm/nested.c             | 2 +-
 arch/arm64/kvm/sys_regs.c           | 8 ++++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 952853ab245a..164e42376296 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -175,6 +175,7 @@ extern void kvm_nested_unmap_cipa_range(struct kvm *kvm, gpa_t cipa,
 					size_t unmap_size, bool may_block);
 extern void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block);
 extern void kvm_nested_s2_shrink(struct kvm *kvm);
+extern bool kvm_nested_s2_park(struct kvm *kvm, struct kvm_s2_mmu *mmu);
 extern void kvm_nested_s2_flush(struct kvm *kvm);
 
 unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 9251f3fd4840..e9a2eaef9eda 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -121,7 +121,7 @@ static bool kvm_s2_mmu_empty(struct kvm_s2_mmu *mmu)
  * mmu_lock never see it go away. Parking always leaves S2_MMU_PER_VCPU
  * unparked MMUs per vcpu, so the victim search always has a candidate.
  */
-static bool kvm_nested_s2_park(struct kvm *kvm, struct kvm_s2_mmu *mmu)
+bool kvm_nested_s2_park(struct kvm *kvm, struct kvm_s2_mmu *mmu)
 {
 	unsigned int keep = atomic_read(&kvm->online_vcpus) * S2_MMU_PER_VCPU;
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index df81adf96259..99dcd2549b08 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4123,6 +4123,14 @@ static void s2_mmu_unmap_range(struct kvm_s2_mmu *mmu,
 	 * the TLBI.
 	 */
 	kvm_stage2_unmap_range(mmu, info->range.start, info->range.size, true);
+
+	/*
+	 * The guest hypervisor may have unmapped everything this MMU held,
+	 * e.g. all memory of a nested VM being torn down. If it is grown and
+	 * now empty, return it to the budget rather than leave it for a
+	 * recycle to unmap again.
+	 */
+	kvm_nested_s2_park(kvm_s2_mmu_to_kvm(mmu), mmu);
 }
 
 static bool handle_vmalls12e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
-- 
2.43.0


