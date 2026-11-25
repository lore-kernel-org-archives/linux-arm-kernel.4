Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C162A606A692
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RGTbiMJu;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p1aEF8MK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KckL5gT/cZCh8aqKHeG36wBG6xN/CeWQhPwBIStZpLc=; b=RGTbiMJurGvyZD
	/cK1Uk7Qi95NxBHxKGAOKcit4v2pgHn2+m5F/qeWSfu4KvsV3iYAxcKVsmiUc3/XLc0GlsgtUCtqH
	MRLsCtEBK0CDWInyZSFj5HxIl4lqewISvdQc4mltyz+ZVr1p3ad+EHyIV7blwPpI/AByDY+niVD1l
	x7+JU04/aWaMwh6qJ/o73OKPVjaZx41lY45Zj5iPoLvTv1YsaMb/68H88Buhj6lIwogK5+MgTZrMF
	H8CoSSrIfoe+TvoqxfImmXw/ysFP5dw3loOh58H94HfRoY+xwotUDEavA3RYtTLv+Jk9MuZ4dysU4
	ipD7LzOUds/VosSDQEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF8G-0000000APqw-29mD;
	Wed, 25 Nov 2026 15:42:04 +0000
Received: from out-223.mta1.migadu.com ([95.215.58.223] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF7A-0000000AOqE-3REo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:41:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zJwtMQBlLjNrOfYjaZ/GDzfZnTT6tgmTp26QYSfx10c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621254; v=1; x=1796226054;
 b=p1aEF8MKpF/vDVBF2nu4R3oguXjEkwI5pDIdmHrVR4TTIS2V4Y/1U0VGedx1lLFGcDTIJTwF
 btPlFaxLaxyET7bcNb4lx1w/tnGDr7LUgPUt69rwied0uoMWl4DWqWZfINXSNfzPVXKqM0t7SH9
 iLAp+u6hfObY5tgBJXeJkDJM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6162857881d00979;
	Wed, 25 Nov 2026 15:40:53 +0000
X-Mizu-Trace-ID: 6162857881d00979
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/20] KVM: arm64: Advertise ECBHB, TIDCP1, TTST and LVA to protected VMs
Date: Wed, 25 Nov 2026 15:39:09 +0000
Message-ID: <20261125153911.106793-19-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_074059_563112_471C7867 
X-CRM114-Status: UNSURE (   8.93  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Advertise FEAT_ECBHB, FEAT_TIDCP1, FEAT_TTST and FEAT_LVA to protected
VMs, capping VARange at LVA, since LVA3 requires FEAT_D128. TIDCP1's
control, SCTLR_EL1.TIDCP, is switched with the rest of SCTLR_EL1.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index fdf405629dfd3..dc7c70ac46f2a 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -169,7 +169,9 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr1[] = {
 	MAX_FEAT(ID_AA64MMFR1_EL1, SpecSEI, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, ETS, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, AFP, IMP),
+	MAX_FEAT(ID_AA64MMFR1_EL1, TIDCP1, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, CMOW, IMP),
+	MAX_FEAT(ID_AA64MMFR1_EL1, ECBHB, IMP),
 	FEAT_END
 };
 
@@ -177,6 +179,8 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr2[] = {
 	MAX_FEAT(ID_AA64MMFR2_EL1, CnP, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, UAO, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, IESB, IMP),
+	MAX_FEAT(ID_AA64MMFR2_EL1, VARange, 52),
+	MAX_FEAT_ENUM(ID_AA64MMFR2_EL1, ST, 48_47),
 	MAX_FEAT(ID_AA64MMFR2_EL1, AT, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, IDS, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, TTL, IMP),
-- 
2.47.3


