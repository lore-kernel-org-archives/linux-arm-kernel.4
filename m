Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D0B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pd427nZ6;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aKniBgn2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9EDiuahpoC5a8fdBVjn+7UwWB1qVxtY459zTXN5uFBc=; b=pd427nZ6Fz9Qgr
	uAIL7Yrm0hL5N+JOp2YymHFQBXITmm0Y6C0GgmW2Mwjojs3fnipjPCLMdIdAn6ZDWsfAqlDtrdWKh
	H7xduSNfIxJ5763FrtGz+gSNwArpylXEExs5ZGF8rinVUklnTH2PMFjxvW4XkPxnDT8AYW/THH4hS
	cLvo7LdLJPQLDPqWHl6CzVJZqzfS2w/NrjvMogP6mdo5wYht3txHM/MpMQjAWqMKMkXCCF3wqNBCh
	DjBQ2vvl/kHdLo+uKifRBsGoLwJ1Y9mhTP4CXu1jUmfbIZkoM4Jsvl9wBtn1DEPs00LnWlErXnghL
	v2WJQnmoH1uCh/7vOS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3m-0000000076r-49gK;
	Mon, 09 Nov 2026 08:49:02 +0000
Received: from out-97.mta1.migadu.com ([95.215.58.97] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3i-0000000074c-0Aj8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:48:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zpKaD0TgIJfqXkuMLyaymhMm6AH9D97hWArAafrSB6U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214136; v=1; x=1794818936;
 b=aKniBgn25IHI6/+paezktja3kzUe2XHYTbZvR+c/c7IlRhOWL6NzzF3m11fb8KQs/r5okijz
 /HUM78yf3sesqRmdI2T9Ze8vyBoxAkGO0SMDUqxoZWloB6hglXKhuB9wlHE1fyeWgZUyqlOV3x1
 R8V3eI0h2bytT8Y8YlFyZWJ8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9a819a32ecff5883;
	Mon, 09 Nov 2026 08:48:55 +0000
X-Mizu-Trace-ID: 9a819a32ecff5883
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/19] KVM: arm64: Hide generic ptrauth from protected VMs without ptrauth
Date: Mon,  9 Nov 2026 08:48:36 +0000
Message-ID: <20261109084854.840576-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_004858_248212_BFDA4D29 
X-CRM114-Status: GOOD (  10.64  )
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

A protected VM without the ptrauth vCPU features shouldn't have pointer
authentication in its ID registers. Commit 3d7ff00700d1 ("KVM: arm64:
Rework specifying restricted features for protected VMs") gated APA,
API, APA3 and GPA3 on vm_has_ptrauth(), but left GPA and GPI capped
at IMP. So generic authentication is advertised to a protected guest
without ptrauth, and PACGA UNDEFs.

Gate GPA and GPI on vm_has_ptrauth() too.

Fixes: 3d7ff00700d1 ("KVM: arm64: Rework specifying restricted features for protected VMs")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 32e82653ebf7e..e5502d5651b05 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -157,8 +157,8 @@ static const struct pvm_ftr_bits pvmid_aa64isar1[] = {
 	MAX_FEAT(ID_AA64ISAR1_EL1, JSCVT, IMP),
 	MAX_FEAT(ID_AA64ISAR1_EL1, FCMA, IMP),
 	MAX_FEAT(ID_AA64ISAR1_EL1, LRCPC, LRCPC3),
-	MAX_FEAT(ID_AA64ISAR1_EL1, GPA, IMP),
-	MAX_FEAT(ID_AA64ISAR1_EL1, GPI, IMP),
+	MAX_FEAT_FUNC(ID_AA64ISAR1_EL1, GPA, IMP, vm_has_ptrauth),
+	MAX_FEAT_FUNC(ID_AA64ISAR1_EL1, GPI, IMP, vm_has_ptrauth),
 	MAX_FEAT(ID_AA64ISAR1_EL1, FRINTTS, IMP),
 	MAX_FEAT(ID_AA64ISAR1_EL1, SB, IMP),
 	MAX_FEAT(ID_AA64ISAR1_EL1, SPECRES, COSP_RCTX),
-- 
2.47.3


