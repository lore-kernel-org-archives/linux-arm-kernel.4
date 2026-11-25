Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84536607DE85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hAWZbygm;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BLj1maW0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4KD70GwKCbIo3iYnYiAxROa7nQMR8jUs46uCrYPzsEc=; b=hAWZbygm/N68bj
	CmFFnKY/s1J7eXxqV94rjFWJ0llBzbOvUGv/NeevCjTgYbl15QbhFU3fnUqfudqIfTo1fikI2o0w0
	SYUWOx0OzU6kaH3/j2N8digqywseTuOJ7D4ULwO5xEU5PhZmKbqrUvAORLLj7zlk3HoA6nW7Umhrg
	UaAwROY7XQlYIm4QFHZTRBl4d5YuslsV6F7udF5lvX3cUVFRF4y+3pDwirkVA1F/xDBWyrF1LKtyP
	04P5RP+RyKBatfVBv7r7oE81UQK5iyIcD5QktSekOFDYDljxzJ0SkowX1ZiN3PJl0fP8EZWN1Zk5W
	O9mcF4r2NTrTSNGGKNLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF7P-0000000AP8v-2A9J;
	Wed, 25 Nov 2026 15:41:11 +0000
Received: from out-169.mta1.migadu.com ([95.215.58.169] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF6j-0000000AOdK-0ro7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:40:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ru4wsoPUBX8BwclDhrROzB4V6cI3IIahsVXty7NCsP0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621227; v=1; x=1796226027;
 b=BLj1maW0hYMd/HYCkSc3lu+HHxonpoaNiLJZLmrKqhCi9qn6NhsVPJykaJt33Jf1J2knwXEo
 30h+lCggdkjlCskmEPkG+/6t9KdoJapuVRsOuB4CcmJ8T66xFtSLnomVuLM24962y0uJhVgRQfj
 kMzaheiPRrj8BSRXil3bEFr4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 16cf6cf1af7bb7dd;
	Wed, 25 Nov 2026 15:40:26 +0000
X-Mizu-Trace-ID: 16cf6cf1af7bb7dd
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
Subject: [PATCH v2 14/20] KVM: arm64: Advertise FPMR to protected VMs
Date: Wed, 25 Nov 2026 15:39:05 +0000
Message-ID: <20261125153911.106793-15-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_074029_395431_810A7DD1 
X-CRM114-Status: UNSURE (   9.09  )
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

Advertise FEAT_FPMR to protected VMs, and reset FPMR to 0 as KVM does
for a non-protected vCPU. With the field set, vcpu_set_hcrx() sets
HCRX_EL2.EnFPM for them, and FPMR is switched with the rest of the FP
state.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index acba7489809f3..4ba947bd3d125 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -127,6 +127,7 @@ static const struct pvm_ftr_bits pvmid_aa64pfr1[] = {
 
 static const struct pvm_ftr_bits pvmid_aa64pfr2[] = {
 	MAX_FEAT(ID_AA64PFR2_EL1, GCIE, NI),
+	MAX_FEAT(ID_AA64PFR2_EL1, FPMR, IMP),
 	FEAT_END
 };
 
@@ -828,6 +829,7 @@ static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
 	RESET_UNKNOWN(TTBR1_EL1),
 	RESET_UNKNOWN(FAR_EL1),
 	RESET_VAL(VBAR_EL1, 0x1de7ec7edbadc000ULL),
+	RESET_ZERO(FPMR),
 };
 
 void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu)
-- 
2.47.3


