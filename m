Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E16606A6A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40HSjW8q;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cpHEi8hI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fnds1nB0cIupqib3I+md1sT/0uWOulwds2MgFsk3VZM=; b=40HSjW8quKAUEd
	zFv603pGeW7VFUKxkF0l0luXUMnwgzC0ku/2CeelYcuq9cg7kclVyELpaWBSRGjoplLkiaQjAARFy
	nPjEBrywgTd7TLZOniECt4nYQSsPzP8VIdQ82iK6PJPbmRAbWEY31tuG/J/679AsiJwaCLZgWsBdE
	eczuoDlPziOjmsBlXRQcG6kx4RjfNagFc5NTLxyTM6lLgh5WO/XQhTvpTc3rSuYUF+XWh+eAqQb/r
	R9QtaoDIYo6Ehi7P3B7T5ZZO6g/x35/6KKhAXjw5taRr1/hC21d1O+hBjQQWPRdgISN7A37Op+Z/G
	i91R8+TnnDoV5/CKIbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxsq-00000007qCa-1ljy;
	Tue, 24 Nov 2026 21:17:00 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxsn-00000007qBH-2te3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfoCu+aXa3CW5WzSOP4V/JZ8VkdYIJPb4q7+gqZIkNaAtqYe+uAyzD4eQv1FsJewdiiOMcIkQtgqxrTpmVJPjkHRRvthdYliHuS8Y8aNCN/nTeEFp8jqVrroqZODTEVDoWYbHO1LeJdwIMm9kp52wEc7gKV8GcigGhZHuZPSOk/cEWrQ3dUGUB9oZonj1uX/hTuL260X2869DcSYU8aUyKSR5Lp7wMFEZSNHCopbx3LskogxRiDN1OQKmRC8Dk3GcOcYqFnVmaCqy1hr3Iu69loqGIZwSLwpSOvXZDtWuJjY4e5CvFJ4ajRWeDuPCUpebNtp/ZlAjqQjAZdgshURyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnds1nB0cIupqib3I+md1sT/0uWOulwds2MgFsk3VZM=;
 b=uV2Oyr6YlFAYFZ0wgbK79KaVG6HDgkkVuTT1Zft9SEUhZMvH5vCDEZE4YViLUpjNf8W1ahqXCMKIMKK267c8CyQ9YErFigdL482949VXdBS7YjG8NSqqBMGEx1UbAkDs4BwXpV0zPI8RHUEI9ri0odisPm51RK1ou/h2WRbAh5R9lTs2A1r1kJ3pk0ETviQwe2MbiNi8E3d0zoXJZ1SbZ3P9QlNFd+rzwWnnsnESxC6FrIWYToYZ/8r6XjUlg7AVn3JpE0+7mpUJ7NiQIWevqN1E4iBIXCfVcwwmpYzlHjFLSS8w3tExKicScy+F2CWiCoMXz7OqmAbzBTFieoZQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnds1nB0cIupqib3I+md1sT/0uWOulwds2MgFsk3VZM=;
 b=cpHEi8hI0iJjqa0iQbr0ggdJvD1GpTFBjwMsCMLZ4NIPNN+ZB0AwFRdLn3U6rrRH/zY4GqMvWRWvhlOGE0nh2VDuXFm5NFmvMjAAEgW731ByN9yseacu+0lxekxR80aSkT8uC9glFn73ikULdv5pG5ZESqc2eAXXscdrigPcJD8vfqbNCE1eatJ4azLms+ZGhnzE6J5wsuIVMWo3E594uD7r+qYYLM36VYgfLEirIQPGbYp5FM6BzOxibo/uywvt5hpYayB2ho2qXuQwaNKQncR3JsFC6zSqQ/PrJnO7/pfq4FLQ2hQOLd282to9RkOL6+7GgQqJCAAGUxi+4bp6Wg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:389::15)
 by LV9PR12MB9784.namprd12.prod.outlook.com (2603:10b6:408:2ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 21:12:23 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::2815:c27e:a0a:2720]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::2815:c27e:a0a:2720%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 21:12:23 +0000
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
Subject: [RFC PATCH 2/6] KVM: arm64: nv: Pick the shadow S2 MMU to recycle with a clock
Date: Tue, 24 Nov 2026 13:12:14 -0800
Message-ID: <20261124211218.2751086-3-nathanc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124211218.2751086-1-nathanc@nvidia.com>
References: <20261124211218.2751086-1-nathanc@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::21) To DM4PR12MB5390.namprd12.prod.outlook.com
 (2603:10b6:5:389::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5390:EE_|LV9PR12MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: e0637e69-c6f2-4e93-5d95-08df4a6fa231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|261028144727099003|10067099003|11063799006|260925021311599003|260925021911599003|260925022911599003|56012099006|261021121427099003|261022105027099003|261026140227099003|261021123027099003|261009223027099003|261102123227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: J+mxGp76IsBB+/YMm6e+tPhjYJED80CaQ8tOKL6OJA7qR+T6LWXRveQ4UoZsamhR7DH0a73hOcr56/tlTH1Z1qI8LS/92plXiNlAqpDvSguebjxMrscG/aA0DLLKdQtf0zGAbqYtRdvKpS3TyGmOOd3cDbGsjVnlznT/KJbIQZ2KqE58J6F3GV98yzRifDKNacb7XAgADmHC90bGEgrUnV8dsHcPeZO4ViL4JltpEV/iFnA07+h2TTz4adBV7HiGyIrtm/vNoBiGzEcyZPEDraDUqIHA0jqBprlPSXWsv64Pi+5OzEBR/v/snWfsBKIThKEVQ+oTdo/0z4u9T9BSE3ZUx/S24J9Ns0rdTvIODFcni0DPCuym3IGG09aRaTOedkX9Jw+ATz7UTey6SD8fXzlNFhBz2f8po6vXpc3yKJkllfRTrW9GMuXhNGUA/FPSDwg3RTUvbLSqlpLFx6a/X6KECBqt1uYkI3ESjPx7JvVLqZsC1BZtqZlllsEbBJttdnv8iNBkiYUdm6rRaRltw2tGQlInh6p6XA0L+kcsOj8aGDSbBXlg0WKJNehZMxS8IcVkAf7Bte5db2uW9SKnClYuhszE2MOzylR3HjEfCgBRqbVtkzjGZsuwcPxhAM1uFjuGQvtn89MkL6Ptr1bg1R5rbLMXsO0hKn/Qbz3MltA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(261028144727099003)(10067099003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261021121427099003)(261022105027099003)(261026140227099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1SWNoST2ugwyfJWhgi6nyYoS0H3ujn1jj1ynH0AhTXhAZG1DlRL4xLFnLFDI?=
 =?us-ascii?Q?2BbkemAWch/KymDgiqHRECiUVeDouqMh/mImqHYPD8Prtt56yHEAP7XxJFq5?=
 =?us-ascii?Q?X7gKvn1X37+izSVMw5rnqDE8ZYx2Z/NtEgc0IP9k/+7Lqi/Px/Tpw1tq3XAB?=
 =?us-ascii?Q?m2XXMS841owQe/PuVut3bHjUDJX/ica/qQsaA/T19x+0u3ol/+9hE5S53KqI?=
 =?us-ascii?Q?+mrMQZ2W44cR8dtlgnUf12Ezm2S8VwNh0ZefzxSRBRxwoxze1xOSuxrE763I?=
 =?us-ascii?Q?x6MwNG/sdRqCjLGPtHuuCWJZKfMUuKYIwD+f+J577V0FYCMo9BG4CrYHx04Q?=
 =?us-ascii?Q?G9LA1mM5HL2X5GYSYzEFG9jYHoqmp4rtHKu8Zbo92GbM4H2UDI1qQydZ5a1j?=
 =?us-ascii?Q?5znQfPZHMba2XgQ+BIL8nSWQUGaYKBPHmnrZY3Ih0D03OUKpEuBkTt8FBJZL?=
 =?us-ascii?Q?cV6xfGLioD1R8NDRe7Nj7Nh9Bv2yVqL5lUBswzUDlYU88mdaARPFN8WS66Ii?=
 =?us-ascii?Q?kAF2QWF7TM6zO85AjKvcBGM1Ly5S0/cqVWRPabsuK7rUsOqaStV798XBrVul?=
 =?us-ascii?Q?iptctJmDX6mjqoD9UjWDIIuBmUx5i1jEQim3IDkNwfeVLnUhbxQON2vP+5nj?=
 =?us-ascii?Q?3FuT+wus4oGsM9ZUzIFIk3kg//8JKJrLEhvhrPrwulOCgKcKEG8fCya2sRR7?=
 =?us-ascii?Q?g4rmPP33Qg/Ze0S/TaOhODF8P2+yv+rHe4BW0Z0y3Q097QRIOyV3/ZvxCvQe?=
 =?us-ascii?Q?YxUMlIoBZEuTUEGF5TbYPQ2//mddE3j6gMKO7uN+GlD/z8CX6Y2ufKDHKd8p?=
 =?us-ascii?Q?YI2bDdO+bEzY1V4K39KoqO+bcy3ddtZODxbll0euVdbN6ej98LJtJqp/c8Qj?=
 =?us-ascii?Q?8EVgEAcllQycLEtRHe/OodoOJJyFXe38OBlfP4jlTtvGhGtH8spPsk8Ngcff?=
 =?us-ascii?Q?ZMJVixPpcNqF0jjjrKFOElK0Y43093JB64pQc9dHmRHsxvwcv85sNBt3wgJh?=
 =?us-ascii?Q?tUToiDmdowtlNhb9nvGqyUrolZstHw3xPGjELQyBQtZOrRJC9Kku4ts09lu6?=
 =?us-ascii?Q?zA3imYRH/sFUdOqDnVDk3c/aBlDtkYdX5z+CYH1waGKnkajI/Moi8pADeTZ3?=
 =?us-ascii?Q?Y0Kif7y4fRi0G2B+FHH7AhhQCvm1J4FhjH0Rq2rptqnB5EQ9mocNHaN+FtP3?=
 =?us-ascii?Q?Sv/qbQIQ76vD5EvQ9jTUu993OQQ3k7N1WVASE5A6gzV7AAnmhxfxE52xkVfR?=
 =?us-ascii?Q?Fc1K2vW17v+63uQ2PCPRB6AyTtdrL/F5iYAZh0lADW4q3Cz5CeRdNZBlt+du?=
 =?us-ascii?Q?KwtzqCsJgWCmHyWz97HJqpCPBpIKbZ2HJHrQuKgh9HuxZ249vuXRLlpz3pv0?=
 =?us-ascii?Q?5uZ+K6BvUKGy9sSl4OcyN0gng+QGAWIsxgUC3xNOfgzHt/l//gyALzGsO4Lm?=
 =?us-ascii?Q?AJ7rMD66jc5iB6XAp6kvtENS2VpqfJS+iEk1oSRtSwShR58p1E77qCzpZlsN?=
 =?us-ascii?Q?MuTkFxm1woMo7A1xWBRE2lWXqaVx5uJxlBPZhhqauTlurSboKITdY0WmdoK9?=
 =?us-ascii?Q?1FVW1li9LQSl20nbjV3V6iK6740oCc8nU8t8uEjtFlLVh3xIhYsbC4kjGf8x?=
 =?us-ascii?Q?GjSPhkAkiRQ9boCY6uPR28Y69MBdHmKhCDasuASzrmP0sZmO75mEmRQpNYS3?=
 =?us-ascii?Q?XeyhW+JZT1fHiX+F+M9ehfJaqlR1lWjOFGrlJla6AW7NI52LE1LbuuBadTFz?=
 =?us-ascii?Q?H2oRw5EiDg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0637e69-c6f2-4e93-5d95-08df4a6fa231
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:12:23.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFZhwJiOyv0nLR3E/NnZtZkX0ICBXaTQC9Zwun9Zo/H6XaaS8vDhvRbRpUw1cLaUi/GOSriLE80q0i+EAd+yqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131657_735886_A5CC8C93 
X-CRM114-Status: GOOD (  21.80  )
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

On a lookup miss, get_s2_mmu_nested() recycles the first free MMU after
the last one it picked. That MMU may hold the shadow stage-2 of a nested
VM that is still running and about to be loaded again, while the pool
has MMUs nobody has used in a long time, such as those of torn down
nested VMs. Recycling a live MMU throws away its shadow tables and
makes its nested VM fault them all back in.

Track use with an 'accessed' flag, set whenever a vcpu takes a reference
on the MMU, and pick the victim with a clock (second chance):

- A free MMU that is invalid, or wasn't used since the search last went
  past it, is recycled straight away.

- Other free MMUs have their flag cleared as the search goes past them.

- If every free MMU was used since the last pass, the first one found
  is recycled, as before.

Signed-off-by: Nathan Chen <nathanc@nvidia.com>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/nested.c           | 30 +++++++++++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ff5073b13338..c7133999296f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -325,6 +325,9 @@ struct kvm_s2_mmu {
 	/* Index in the S2 MMU array, only valid for a shadow S2 */
 	u16	s2_mmu_idx;
 
+	/* Used since the victim search last went past it, under mmu_lock */
+	bool	accessed;
+
 	/*
 	 *  0: Nobody is currently using this, check vttbr for validity
 	 * >0: Somebody is actively using this.
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 7d78efee5296..44dc6780fe6f 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -842,7 +842,7 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_s2_mmu *s2_mmu;
-	int i;
+	int i, victim = -1;
 
 	lockdep_assert_held_write(&vcpu->kvm->mmu_lock);
 
@@ -854,19 +854,38 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	 * Make sure we don't always search from the same point, or we
 	 * will always reuse a potentially active context, leaving
 	 * free contexts unused.
+	 *
+	 * Pick the victim with a clock: a free MMU that is invalid, or
+	 * hasn't been used since the search last went past it (such as
+	 * one left behind by a torn down guest), is recycled straight
+	 * away. Other free MMUs lose their accessed bit and get a second
+	 * chance. If every free MMU was used since the last pass, the
+	 * first one found is recycled.
 	 */
 	for (i = kvm->arch.nested_mmus_next;
 	     i < (kvm->arch.nested_mmus_size + kvm->arch.nested_mmus_next);
 	     i++) {
-		s2_mmu = kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
+		struct kvm_s2_mmu *mmu;
+
+		mmu = kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
+		if (atomic_read(&mmu->refcnt))
+			continue;
 
-		if (atomic_read(&s2_mmu->refcnt) == 0)
+		if (!kvm_s2_mmu_valid(mmu) || !mmu->accessed) {
+			victim = i;
 			break;
+		}
+
+		if (victim < 0)
+			victim = i;
+
+		mmu->accessed = false;
 	}
-	BUG_ON(atomic_read(&s2_mmu->refcnt)); /* We have struct MMUs to spare */
+	BUG_ON(victim < 0); /* We have struct MMUs to spare */
+	s2_mmu = kvm->arch.nested_mmus[victim % kvm->arch.nested_mmus_size];
 
 	/* Set the scene for the next search */
-	kvm->arch.nested_mmus_next = (i + 1) % kvm->arch.nested_mmus_size;
+	kvm->arch.nested_mmus_next = (victim + 1) % kvm->arch.nested_mmus_size;
 
 	/* Make sure we don't forget to do the laundry */
 	if (kvm_s2_mmu_valid(s2_mmu))
@@ -886,6 +905,7 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 
 out:
 	atomic_inc(&s2_mmu->refcnt);
+	s2_mmu->accessed = true;
 
 	/*
 	 * Set the vCPU request to perform an unmap, even if the pending unmap
-- 
2.43.0


