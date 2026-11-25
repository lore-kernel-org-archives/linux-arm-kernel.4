Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC6607DE88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a9j+mVvF;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wALhDrPH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LCnVdHirYtBKX2t/3K8ljhm+P9aiBrtU685db8fTm+U=; b=a9j+mVvFL184sV
	jjfjcf5lKtoPe8D+Qcs7MKjPVFJfX7Cl8VyDpfqoP6/TcOrpobBzjEgVesbGXaVrWtwbBS59zMO6D
	EXpXBLvDzuG+6aq0ZMMXqjjEIn0CQbtrKYPA9I31U+J2fm+pujXMnoeukoRASF0CaWD7XYZOtesmJ
	tyCUIvtbiYDJ0kkKJZAntY+nzREf4wOwAgUUmL0cUutBgIT7EkwcQ2eK6C5akRA6g+gTIaFTxk5s1
	JCs2IkN0JpM3n12pn2Qn2srm4+aXOo/JkdqQJbQyNNWxejuJW/nf/rEoQyQCGFDt0SfARbdV/eeFA
	MuRvbWBQPokgQOGzwACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF6H-0000000AOKr-2sLk;
	Wed, 25 Nov 2026 15:40:03 +0000
Received: from out-21.mta1.migadu.com ([95.215.58.21] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF5a-0000000AOAm-3ebA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:39:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=o/SZfwEeYhSxZ5cZ93jBl6fDIchTpBEO/6emnlOmEC8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621156; v=1; x=1796225956;
 b=wALhDrPHUWRg+PnqBIVx+mxcK8l9B5eVX7yhtcbiSL6rCAaOfbBky+29ZklmAUKpVE6l/uSW
 44X01pscOJFIM/bi3O9KlVHJPxOgE9E/lsPcaqvCb5h1OVtHFPy9Izhflf13+0gKlEKWyZPwl7y
 ep/OCYkzSH14QmG7cg87eAIQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b3ce0fa6c33041ea;
	Wed, 25 Nov 2026 15:39:16 +0000
X-Mizu-Trace-ID: b3ce0fa6c33041ea
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
Subject: [PATCH v2 02/20] KVM: arm64: Don't advertise the host's MTE_frac to protected VMs
Date: Wed, 25 Nov 2026 15:38:53 +0000
Message-ID: <20261125153911.106793-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073919_377585_55768323 
X-CRM114-Status: GOOD (  11.40  )
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

Protected VMs don't support MTE, so MTE_frac in their ID_AA64PFR1_EL1
doesn't apply and is RES0, as it is for a non-protected VM without MTE.

Commit 3d7ff00700d1a ("KVM: arm64: Rework specifying restricted
features for protected VMs") caps the field at NI in the pVM
restriction table. However, NI is 0xF and the clamp is unsigned, so the
cap does nothing and a protected guest sees the host's value. On a CPU
with MTE2 but without FEAT_MTE_ASYNC, that value is 0xF.

Drop the entry so that the field reads as 0 again. It was the only
entry capping an unsigned field at an NI other than 0.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 32e82653ebf7e..e1749138f7507 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -105,7 +105,6 @@ static const struct pvm_ftr_bits pvmid_aa64pfr0[] = {
 static const struct pvm_ftr_bits pvmid_aa64pfr1[] = {
 	MAX_FEAT(ID_AA64PFR1_EL1, BT, IMP),
 	MAX_FEAT(ID_AA64PFR1_EL1, SSBS, SSBS2),
-	MAX_FEAT_ENUM(ID_AA64PFR1_EL1, MTE_frac, NI),
 	FEAT_END
 };
 
-- 
2.47.3


