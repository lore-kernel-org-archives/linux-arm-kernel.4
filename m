Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C1606EE9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M9nk7+H0;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S9jMCK95
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bo1WlELU8ik+Rr+Abdwa067G5JksNkxTfxKiETgF/pA=; b=M9nk7+H0KQ5Tsf
	fY3/XkXcNa+8W3olWX1mZ5TbL1+403rdXEeBU4VLbiGoUwRoXWI76PhVynbMKgUXGAFyjzTi72IKb
	VvoJzZ1MqaVDT8qOoed/klKRXYuydI/bK7E3ZhCXSrU+qY6j360o5OCwY59mmgvzzajD+kpNfMrJv
	yqliD70spGcAIK3eGzjZhF5zAnmpcleTU9fpgVWGvL/tKa4vaMjye2YdjZSehDMR7707XVeu0tQNA
	93fScOT4yd3g0bf+jASAS7p/6oq8LPLUrt2q29Q6OnkWO8Mx9EsYayuL+wPhYEsBRmZg1SMvp+eU4
	hWRZFeQ2CV6/SKfUSNUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKoD-000000004Yw-15so;
	Mon, 09 Nov 2026 08:32:57 +0000
Received: from out-51.mta0.migadu.com ([2001:41d0:1004:224b::33] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKo4-000000004Nb-0DkQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:32:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=W7dlvw4NdcdYKD2+I77uCjjseY0CwzVUAyYBCfePwsI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213166; v=1; x=1794817966;
 b=S9jMCK95QtcoMLf+7bXj5kUxvWLP+RKC3Y6fSEZhcv58cQDtKU+0kt+GkJkWHatYSbGK6KJg
 IlMykHYdMLqNAxO8qrnGq2hAky39aOsP1i4a8dvo1yfJClM/VQTaVgrJVJY2tDxyGad1qRxefYG
 LQn5WdLi51Kxu1L9Zo+JDv4k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 909104da5cd6237e;
	Mon, 09 Nov 2026 08:32:45 +0000
X-Mizu-Trace-ID: 909104da5cd6237e
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
Subject: [PATCH 13/16] KVM: arm64: Advertise AFP and RPRES to protected VMs
Date: Mon,  9 Nov 2026 08:32:02 +0000
Message-ID: <20261109083205.806619-14-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109083205.806619-1-fuad.tabba@linux.dev>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003248_235858_C0494B2E 
X-CRM114-Status: UNSURE (   9.08  )
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

Advertise FEAT_AFP and FEAT_RPRES to protected VMs. Both are controlled
through FPCR, which EL2 switches with the rest of the FP state.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 73ef47a8e687b..08805c7e4e5a7 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -169,6 +169,7 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr1[] = {
 	MAX_FEAT(ID_AA64MMFR1_EL1, PAN, PAN3),
 	MAX_FEAT(ID_AA64MMFR1_EL1, SpecSEI, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, ETS, IMP),
+	MAX_FEAT(ID_AA64MMFR1_EL1, AFP, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, CMOW, IMP),
 	FEAT_END
 };
@@ -212,6 +213,7 @@ static const struct pvm_ftr_bits pvmid_aa64isar1[] = {
 };
 
 static const struct pvm_ftr_bits pvmid_aa64isar2[] = {
+	MAX_FEAT(ID_AA64ISAR2_EL1, RPRES, IMP),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, vm_has_ptrauth),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, vm_has_ptrauth),
 	MAX_FEAT(ID_AA64ISAR2_EL1, MOPS, IMP),
-- 
2.47.3


