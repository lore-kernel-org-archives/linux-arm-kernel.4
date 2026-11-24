Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yyrueg0B;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KpRIyljk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L6pQMYki7sS+ddqocnsqWk+9Da2cF7VilW12M3TX02k=; b=Yyrueg0B9VAMHq
	rxuZl2oVfU8LanbxUUPrmyONpxXlH+Ih7a+c6pnu72vE47oCQtT5bNCXb6h3lM/uW4tYYkAC/xqsM
	wCgvgdW6vXBqA3k8nXujQXZniaDBnh2TbooQ9a41mUOoPawBn20SVNmNm9/bpE4CRW1Cq4jw35TxL
	lhmANA24Pcq5A7x6LnEHbQpBw9MGHgLPX7oHfwfWN0fsGieutONjaHbxUudSszq9qAVh3G3zEMn5D
	yJjjjocucn0akzV/Sxej1biPDtOAEP9sr8qI575IJRnjNd3fNILTleK89b0jzQZYfYXoLc3sIWWWZ
	JBejEtcmJbN8hUDfuyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxpA-00000007osh-3KET;
	Tue, 24 Nov 2026 21:13:12 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxp7-00000007orE-45TS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:13:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6aGRfH/vC8ebfxtDrbhyjR2PvBkfa2dTe27gU0/4tnsufbCZVFcRPK96U4bEMaGYUTzxMOiadarf8HTk1nSpcwPdq9iTbmdTmfRWjL9FpVnqLtmgapozpSN1eKVjz/qdA9fvtbhHSLIwB8PbQWNFnm1ue8bE/Hvjrdefb9mkdnDDAtL6Jq9nmHFBhZec9sKEs19E24Rfyon4XBIseCXJsxkT7+kd+fNxmqPsa2krYisGDd1KV66VJyLYDBUEd1sV91yGAt6Q+zDmFtgFeJ7vWyYDVUWGzAgiMqCL2oDtLkQ0k0A0YWbRALPIBYo8Bfcc3+NRNAR6IblJIvQ+HUrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6pQMYki7sS+ddqocnsqWk+9Da2cF7VilW12M3TX02k=;
 b=lbeyCvIu+NGZm1NMm7FYMlFZGIEP3Wh+du8yuaUut8U4dat1VWCwUYDDJmZzoENjClJQLRp9t2Oxm05py6NaqRtLKZA4gf9JCqcP6VgNBomM5vWltRNAGY21RdFXjsIj8YDDKg7rmpEBQkO/VauWisG2GJQulj6jnFzj8fti40gWk0ztKfOFDUqG1U5ypymkz3jBei9ppFPt7fVus8QBNgqFFsWGDaQ0rNrSINO6/D0+2ow3Ic70EBuMNb1oh2+kHtL0JksN0whZoRBMqwEAgyUTCotX20lrVZTxhHQ/kFsBa3Q803ebe5WhrLF65p1k/OJIrvdlI1V/HT8rcXq+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6pQMYki7sS+ddqocnsqWk+9Da2cF7VilW12M3TX02k=;
 b=KpRIyljk4CKlQpRQgoaxyTKfneJ4oPISIp7lXl/vtQHpEmvruey1fngw3qG6XWUY68eKo4UOzOEPaS50aArMA+lsbTHmXmFShv0iFrmlAb8/TSjZ0abcQooewYbLEYeKHcddaB1nfkfTJ7IedKVXr6EE99np+TWfOyvDGEUbYTCxNs/RwU17NR6hNhsIUq1L8n+Zc/5EIkHfqWkOjXsjTEcZK/EWDdAqXVrMLAERn0I1SG1Zu6X1xRmCjVUBVqI4Uz6r0rgekBw+m+JZJHwYES0OALEvnFMy7kHRsG3FLM0llRLkLmTlqpONeurIHuzRel8pwp2j9OkmEOJgMdHxSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:389::15)
 by LV9PR12MB9784.namprd12.prod.outlook.com (2603:10b6:408:2ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 21:12:25 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::2815:c27e:a0a:2720]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::2815:c27e:a0a:2720%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 21:12:25 +0000
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
Subject: [RFC PATCH 3/6] KVM: arm64: Add kvm_arm_vmid_nr_usable()
Date: Tue, 24 Nov 2026 13:12:15 -0800
Message-ID: <20261124211218.2751086-4-nathanc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124211218.2751086-1-nathanc@nvidia.com>
References: <20261124211218.2751086-1-nathanc@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0244.namprd04.prod.outlook.com
 (2603:10b6:303:88::9) To DM4PR12MB5390.namprd12.prod.outlook.com
 (2603:10b6:5:389::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5390:EE_|LV9PR12MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: a57099b9-d843-48a0-bd3b-08df4a6fa34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|10067099003|11063799006|260925021311599003|260925021911599003|260925022911599003|56012099006|261021121427099003|261009223027099003|261102123227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 61eE1qXaRJSrZK+iTjKwGLLzsdcPJ4B2fn19hRcQlPFlyN6kleIsl1Om94hZN3QrzHQYKWj+lKWyHpn0dG++eWHN/zDJE1ifmDVdRkwiOL85yu77esHzYwhag9yxJqAhpTPKqmI8rI5F61blmtFQS2I1RdMhx2jJhBIwAc0qGkyfflK7CyhZOuTmHwZWKNvAjCQAYhB9c+e/Z6PyILYXElto7v+2oI7dj52O2+cd5IQB2VNIVYboASoE429/i4aYn5Tm0ZvcjD7o9gHDuolECGlpyTaSKfui7ZCOsmD3PRgoVnj3IsCINCgW+1F3wSiyh3HUhA6jfduDphNxN83CDDZgNphDlwLQVH6svPkL2AgmkI5E9nmhq2X/qVBz69DY2H40iRux1Dbx1qU9ncqfYK1DJrnVKYH1geoWruE+XlLQZp6mApu83HWHkU4+qir4mOOXt0jadNxholI+L0arr3nozabNycVjJXV1YSEwbuelJzVbpJxraMpGDJL3Ie91DTHhqilzUf0RFQabecazQQ/3gCwAamhy96ZXu7qp3p2lkvNXhBLSFumIoLUADejGOZQwulZj5/S8zqbKvJm6RWW264cLPeMHNytPcB2Mf5Z1hmfhtbNeI6P+7OesyHjIhukkvwz5jyKJiU+BcatJnlxag27U/aDHu3a5ynrespY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(10067099003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uHtKeipQ0UKu5XOR+2NbXiIuc+JzZ3s1cObolOi5EDNfgciz/eBdtVpC2fpj?=
 =?us-ascii?Q?ty6XCUzCPSX6hfsC4f+OFQXE9Yky/yS8awl8Pn1NJv/ps7kcBfHmUNyI8LyL?=
 =?us-ascii?Q?/U1gHmIHhPb/ZeE3N0iahLLBaUQjj1BLhDnRqN7KVQW10xLYQTSC3efZwJNd?=
 =?us-ascii?Q?EAlc2N0QjBwuEc/AVJD9fj6SeOIi7kaxsg556BMLYtuN2+C+EYjo4oi00gr0?=
 =?us-ascii?Q?D+U57lb6vatUpHsYmTPKDmlBemwpp2dHzp2zr54MB9kPX8hqmtuYtPNNM+Bs?=
 =?us-ascii?Q?jMUSLmV4J/TweSArKswK1Myr7DTOaVr+XUwTZPI2eYUTxpXALk0vdGfhKbXK?=
 =?us-ascii?Q?YABy/rYZ+ZZ6Ero9K89oAR3eJq3+rhGaNqynE/GVGTkQaKY738ydBeNinSdt?=
 =?us-ascii?Q?WEDcTv1XH/zfrpslp0KPP+hcRhfwEjT3F+vUGKvluShijCO2Z3iAsJ1MYoSD?=
 =?us-ascii?Q?6WeHNnF0KR5lIZeknhd1J2TyH8e4dAkwq7QXLS5hoW5wsZZ04ryUiwqcMPLL?=
 =?us-ascii?Q?/UPSibA7UzxLE82J6hmeY8krBrMBS3goSWXv1RHIRZ65zHtAmnVYXp6gJ2Me?=
 =?us-ascii?Q?OTF7OCUSj27hZ3FlakcmRwLB+TlaAwhDeFPdjyMV/Dp7tUxEt2Igjy3RGdDW?=
 =?us-ascii?Q?qVo5vtqtI0xZ0hIJoX/LHNWZd8xj+qW8F0f+uaSGQlh2rfn5sP7ax5VhBfZR?=
 =?us-ascii?Q?r0xh2b81j+5bix3HlO6Wdfa1T8MsyhEL/gWBSOp9kscb3VwdfUt+yCBZIbUQ?=
 =?us-ascii?Q?hpLeC4oGXNDubg+2xAQ7T2zNG+CoUzKss3Ru8glrYYf+fLwzDfCAIy3J4prM?=
 =?us-ascii?Q?wMLyDFJzPOi7vG4SkJ9L46+49BTKX4ZMTAYjfQuPqzK432APA6SjWumdWobd?=
 =?us-ascii?Q?UqlJo1IlGkzMK+oY6EBJ+nq+RskAaDdGMp+RG+RH/hXRNDUIBE/aDu3qm6fA?=
 =?us-ascii?Q?/LJ6DXZ1wph74FQiJ8UNhaikHiyq00hXYQsaF6oxnI3gxirNDURAKHbkhq8l?=
 =?us-ascii?Q?E4WhglOM/XFpbyylb/dc9T9JLh6SjrJtzM613QJhYLFBTeHwX0k0tT3ivgdd?=
 =?us-ascii?Q?+k9W3UDC6Uy2QQoCK4dBwQZEAyI3oS0kCNDT0LL63bLDKBBLfEBX7v2oZbuQ?=
 =?us-ascii?Q?owCDhorfoGeQ0Yise3jGchwjxF+B5zSNr0tQzpv/ykYZMoSiDWknX7p4dvR0?=
 =?us-ascii?Q?vVuPHgSTY7p06KVoQZqoMFHBUjZbKCWCoi2vBU2W1i61IzXGWrYxb5mwAR5m?=
 =?us-ascii?Q?e+zeKG3buNIw0N85ChhAcx4VlJYD8UxA4yPyPCWKoEimomH1e//CuRMssY/h?=
 =?us-ascii?Q?UQEDbIAX6zU0d7oZWsAcGXdxdsFSMinLtlFu1VkCulCoTzWLNfX5h1w45bXb?=
 =?us-ascii?Q?3icuwAkAXp03FzE9/f2gb+fJ4k42poBaIByVV9k/v1QjB3RMEoQsWgnQa/4U?=
 =?us-ascii?Q?ndIpDd22uY9OnTG57JZRGxsFCG1zaKudfUfytTAOJtCU/e+XOetBN66yP34s?=
 =?us-ascii?Q?K0ix5RPL/ibHazCyO/Hi7nIfqncgwaiPLDtlkRGMnQaapV1E3aoPzDbHHySA?=
 =?us-ascii?Q?udRmNnqK/Td+EhpAcPAEdW7ZBvEzMWp1gIh3356XR5v9IEGsOQwKnFHgBKRa?=
 =?us-ascii?Q?nFZx1PP4DsQEqy4QjgVDCNK+EKUmZR5/v36Y63vvn2joXPkj47Q0tc6wO5AC?=
 =?us-ascii?Q?Rccu8ZUDL3sDKsyKQMm4mcmchtHcak2OJN3Mee3qsBuRoXSBaNQFy2HtXlsb?=
 =?us-ascii?Q?9OoJD+E57g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57099b9-d843-48a0-bd3b-08df4a6fa34d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:12:25.3468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTMl7DrTAEHrTNU3Ugk23bcMe97Z/dGRyPWoUn/spUcsaINDRedKIlWY38RbKzb1uUa0MT3K5dXAkdwmh5FWvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131310_018559_32EFB5D9 
X-CRM114-Status: GOOD (  12.43  )
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

Growing the shadow stage-2 MMU pool of nested VMs needs a host-wide
limit derived from how many VMIDs the allocator can hand out within a
generation, before a rollover.

That is fewer than NUM_USER_VMIDS: VMID #0 is never allocated, and a
rollover can keep one VMID reserved per CPU for the VMID active on it.
Add kvm_arm_vmid_nr_usable() to return that number, so that the limit
is computed next to the allocator that sets it.

Signed-off-by: Nathan Chen <nathanc@nvidia.com>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/vmid.c             | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c7133999296f..6ae86bc96600 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1431,6 +1431,7 @@ int __init kvm_arm_vmid_alloc_init(void);
 void __init kvm_arm_vmid_alloc_free(void);
 void kvm_arm_vmid_update(struct kvm_vmid *kvm_vmid);
 void kvm_arm_vmid_clear_active(void);
+unsigned int kvm_arm_vmid_nr_usable(void);
 
 static inline void kvm_arm_pvtime_vcpu_init(struct kvm_vcpu_arch *vcpu_arch)
 {
diff --git a/arch/arm64/kvm/vmid.c b/arch/arm64/kvm/vmid.c
index 7fe8ba1a2851..cf044f434531 100644
--- a/arch/arm64/kvm/vmid.c
+++ b/arch/arm64/kvm/vmid.c
@@ -129,6 +129,18 @@ static u64 new_vmid(struct kvm_vmid *kvm_vmid)
 	return vmid;
 }
 
+/*
+ * Number of VMIDs that can be handed out within a generation: VMID #0
+ * is never allocated, and a rollover can keep one VMID reserved per CPU.
+ */
+unsigned int kvm_arm_vmid_nr_usable(void)
+{
+	if (NUM_USER_VMIDS - 1 <= num_possible_cpus())
+		return 0;
+
+	return NUM_USER_VMIDS - 1 - num_possible_cpus();
+}
+
 /* Called from vCPU sched out with preemption disabled */
 void kvm_arm_vmid_clear_active(void)
 {
-- 
2.43.0


