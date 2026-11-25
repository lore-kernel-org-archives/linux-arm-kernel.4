Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1512E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MGdPWduJ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eUgwIOwS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oJyjfOujmSBUsGvM1/SgdU/YJl1D0UryFNbGYP9HTmI=; b=MGdPWduJAPI6Li
	0Bf1u5sibyR5JX1HGoNra729PLp5hMlsnu5+AwAgBKNLakQL1zMZJyimHlcxTHC1BdGX2HTX4N7cK
	k8PmtohBFzkbFKP6TAQW21AHRZt+gxBcNHysEGZUB4kuDrBt9XQTs/HUeTg6ipfyDAiYqoIUqpnWA
	6xWAF1c0NGgiBS56A0cOarYL+3PBk4Cv8z9AlnW0f4q0uhnENvSRTtdzcrdHbf9+Z7GMny9gA/wGW
	+ML2D+JWnhvRdey7DzdhoZukFW3zRcnHAoVcV99vTpslT1h8moP5m9YEu3V3RKk7wA2DZonCi+oqN
	n7vTOw+Ozq0b2BFFq8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF8D-0000000APob-27mC;
	Wed, 25 Nov 2026 15:42:01 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF72-0000000AOiu-1Dk5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:40:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=j1+9jq4DNPjKmn/CiJVqGm6EPhi92kwiCRK4Zpjn4qM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621246; v=1; x=1796226046;
 b=eUgwIOwSzGaFhcaIJZSM7Euvac94ds6Ysz3w/lx8J7YPL/F4o0sqSk7dY8xOc1wHMwQcE3yC
 nv/ZiPHxv67bKxJDKhw1ZkBF2cClRdY02mCYlG5GglB7J3vtk5hwjDSrMhDubNJBDdXNGiGCLzT
 I8hFqIYYyfeRh1Lcthe+j3Ug=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c6dde43742fe7882;
	Wed, 25 Nov 2026 15:40:45 +0000
X-Mizu-Trace-ID: c6dde43742fe7882
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
Subject: [PATCH v2 15/20] KVM: arm64: Advertise HBC, CLRBHB, RPRFM, CSSC and LUT to protected VMs
Date: Wed, 25 Nov 2026 15:39:06 +0000
Message-ID: <20261125153911.106793-16-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_074048_485029_D286FCC4 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

Advertise FEAT_HBC, FEAT_CLRBHB, FEAT_RPRFM, FEAT_CSSC and FEAT_LUT to
protected VMs, with CSSC up to CMPBR and LUT up to LUT6, as for a
non-protected VM.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 4ba947bd3d125..2c22317a76a5e 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -213,6 +213,11 @@ static const struct pvm_ftr_bits pvmid_aa64isar2[] = {
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, vm_has_ptrauth),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, vm_has_ptrauth),
 	MAX_FEAT(ID_AA64ISAR2_EL1, MOPS, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, BC, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, CLRBHB, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, RPRFM, IMP),
+	MAX_FEAT(ID_AA64ISAR2_EL1, CSSC, CMPBR),
+	MAX_FEAT(ID_AA64ISAR2_EL1, LUT, LUT6),
 	MAX_FEAT(ID_AA64ISAR2_EL1, ATS1A, IMP),
 	FEAT_END
 };
-- 
2.47.3


