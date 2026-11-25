Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C139606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qHVr4QXl;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gy2It9DC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k3lgUkbhF48x9uWXDW9CSm5otQP2vPMMqrsbaam6pJk=; b=qHVr4QXl7rmRQr
	S9OOud4o1FwCKjbAtS1vIiQesYnrIU8wEPHMVVy8p4HwUHSMkRSaQ5UO2odCSvO2HdjFLobKKeQlU
	meY7UdNB0PGjL/nqi3kgx4ztHZon6jViI6G0Lu2Q7V5FZO2YGwihYxSQcnjMsIezsl5xnCj75CzGP
	qBvevrILpJLWB1yhV/a0YBY36P9vRIeflAPWiAWU1NecAFeVRfA/1gYXFDiNfKFkt62irTE6kEJx8
	jbP1h7xhKF79MB79MmToM4TrBt8BLjCusomPmymE5za5VIfUoPTgdsEFkB5pQONfclxypQwlo9fTc
	fQdYTaL90neg5mkkMo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF6J-0000000AOM3-3tLr;
	Wed, 25 Nov 2026 15:40:03 +0000
Received: from out-39.mta1.migadu.com ([95.215.58.39] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF5j-0000000AOCW-3Fk6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:39:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IZNUpS1OAqWftHWv01wPPqIUYNpQ1VNp0oAA/VL5VMQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621165; v=1; x=1796225965;
 b=Gy2It9DClKQWo8n+IIMff39GHjaO5XGBYXV/jpSFZRrGhm6Ngo4zulUq1stBLWzaW6o4ert9
 iGYWyhUx79ej+IGopgjxsd590VtpXZ5puU83lQog5v/O9cW7wuTptN5QWDrsUQh4k7lp84lXWrK
 VWPK4OghDtIgd9ssUD5kefJU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7efd5e36bdff3cdc;
	Wed, 25 Nov 2026 15:39:25 +0000
X-Mizu-Trace-ID: 7efd5e36bdff3cdc
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
Subject: [PATCH v2 04/20] KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
Date: Wed, 25 Nov 2026 15:38:55 +0000
Message-ID: <20261125153911.106793-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073930_950297_1CA85F8C 
X-CRM114-Status: GOOD (  12.40  )
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

With pKVM, EL2 saves FP and SVE state through the hyp vCPU, whose kvm
is the hyp VM's and whose sve_state is already a hyp address.
kern_hyp_va() returns both unchanged.

Remove the calls in fpsimd_sve_sync() and __hyp_sve_save_guest(), and
the one in kvm_hyp_save_fpsimd_host(), which only pKVM reaches. The
ones in __hyp_sve_restore_guest() and kvm_hyp_handle_fpsimd() stay, as
nVHE without pKVM reaches them with the host's pointers.

No functional change intended.

Tested-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e0c55644224cb..ee85a8bc4d798 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -594,7 +594,7 @@ static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
 		fpsimd_save_state(&hctxt->fp_regs);
 	}
 
-	if (kvm_has_fpmr(kern_hyp_va(vcpu->kvm)))
+	if (kvm_has_fpmr(vcpu->kvm))
 		ctxt_sys_reg(hctxt, FPMR) = read_sysreg_s(SYS_FPMR);
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9958ca6d7b0a2..57c3f7a2d4b14 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -482,7 +482,7 @@ static void __hyp_sve_save_guest(struct kvm_vcpu *vcpu)
 	 * on the VL, so use a consistent (i.e., the maximum) guest VL.
 	 */
 	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
-	sve_save_state(kern_hyp_va(vcpu->arch.sve_state), true);
+	sve_save_state(vcpu->arch.sve_state, true);
 	fpsimd_save_common(&vcpu->arch.ctxt.fp_regs);
 	write_sysreg_s(sve_vq_from_vl(kvm_host_sve_max_vl) - 1, SYS_ZCR_EL2);
 }
@@ -531,7 +531,7 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	else
 		fpsimd_save_state(&vcpu->arch.ctxt.fp_regs);
 
-	has_fpmr = kvm_has_fpmr(kern_hyp_va(vcpu->kvm));
+	has_fpmr = kvm_has_fpmr(vcpu->kvm);
 	if (has_fpmr)
 		__vcpu_assign_sys_reg(vcpu, FPMR, read_sysreg_s(SYS_FPMR));
 
-- 
2.47.3


