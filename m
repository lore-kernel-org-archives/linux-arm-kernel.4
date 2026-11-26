Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902FB606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wUQgeYaL;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Uhs/uJs3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+oW+HLYblbjUyMWtUikyEnlaw7hVq5s4tKw9eK5zNt8=; b=wUQgeYaLxofK95u1O3YphWQR/P
	C4uYI5m2teBNj80XWDnPmaVF/bBDEUbz5hCcBczMIsgSJlwbs9wUgJP264lGz7YljyRBSB1AKGeKo
	vca40j5xV0z32iesO8OEowmol3twvNGXMz7Nf+PPtuZPp5gSCfeCFx/nE+SzIKlznk2TqebdFM49H
	BsqFEz6BPaDltmUueW1GeEoixekoJ3Jifw3odJc13f29sWDsJg6gt7zTM3kCgzBUyODfXHlQBmCE2
	CNJfWV4PMobWuLyR4VOtl6okgpENhNzl4UYjFJQoQZozpIXQr6uUd7YXM4b9ThrXIaqwoN5aclBal
	bcNgcURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWHH-0000000CgfE-1u7x;
	Thu, 26 Nov 2026 10:00:31 +0000
Received: from out-163.mta1.migadu.com ([95.215.58.163] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWHE-0000000Cge7-2zNS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:00:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=g28CqIM9YUuvU1OT9rEa9+BMl1iyiZT0LWgm0NR8SX0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795687224; v=1; x=1796292024;
 b=Uhs/uJs3+IC6fxOjiBbOqa7ZJuZM954EKtDDYqdsGbMl1udKpzDasnc3F8iE/BXdETFrtOe8
 jmCKgcLspzzKXPdyxHJsVKqo4l85hRUGexJ4PPR6X2jCeGdeeu3YYiN5ZN56UpErq0t8fovLfno
 Afow2gK0nDhCivX36qjkD+S0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 572ca904ff9ffd69;
	Thu, 26 Nov 2026 10:00:24 +0000
X-Mizu-Trace-ID: 572ca904ff9ffd69
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] KVM: arm64: gic-v5: Reject an ID_BITS too large for a linear IST
Date: Thu, 26 Nov 2026 10:00:23 +0000
Message-ID: <20261126100023.1286902-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_020028_903136_DCAFC9CF 
X-CRM114-Status: GOOD (  13.29  )
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

Without two-level IST support in the host IRS, KVM allocates a guest's
LPI IST with a single kzalloc(). The guest picks the IST's size, up to
the virtual IRS_IDR2.ID_BITS, which userspace can set as high as the
host's. With 24 ID bits the IST is at least 64MB, more than
KMALLOC_MAX_SIZE with 4K or 16K pages, and kzalloc() warns when the
guest enables the IST.

Reject an ID_BITS for which a linear IST would be larger than
KMALLOC_MAX_SIZE. This applies even for a Linux guest, which
configures a much smaller IST. Userspace writes to IRS_IDR2 are new
in this cycle, so no release has them.

Fixes: 71091136d1452 ("KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Tested on FVP, on VHE and nVHE hosts, with and without two-level IST
    support in the IRS. The vgic_v5 selftest passes. A reproducer that
    sets ID_BITS to 24 and restores an IST that wide hits the kzalloc()
    warning without this patch. With it, the IRS_IDR2 write is rejected.
    
    Based on Linux 7.4-rc3 (aebb727447640).

 arch/arm64/kvm/vgic/vgic-irs-v5.c    | 4 ++++
 arch/arm64/kvm/vgic/vgic-v5-tables.c | 8 ++++++++
 arch/arm64/kvm/vgic/vgic-v5-tables.h | 1 +
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-irs-v5.c b/arch/arm64/kvm/vgic/vgic-irs-v5.c
index f73349c02656c..97362caef4433 100644
--- a/arch/arm64/kvm/vgic/vgic-irs-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-irs-v5.c
@@ -648,6 +648,10 @@ static int vgic_v5_mmio_uaccess_write_irs(struct kvm_vcpu *vcpu, gpa_t addr,
 		    vgic_v5_irs_ist_id_bits(&irs_caps))
 			return -EINVAL;
 
+		/* A linear host IST is a single allocation, limited to KMALLOC_MAX_SIZE */
+		if (!vgic_v5_lpi_ist_id_bits_valid(FIELD_GET(GICV5_IRS_IDR2_ID_BITS, val)))
+			return -EINVAL;
+
 		/* Min LPI ID bits must be greater than or equal to the HW */
 		if (FIELD_GET(GICV5_IRS_IDR2_MIN_LPI_ID_BITS, val) <
 		    vgic_v5_irs_min_lpi_id_bits(&irs_caps))
diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
index 8f72704209b0e..ae5f380fa783c 100644
--- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
+++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
@@ -1207,6 +1207,14 @@ static unsigned int vgic_v5_ist_istsz(unsigned int id_bits)
 	return GICV5_IRS_IST_CFGR_ISTSZ_8;
 }
 
+bool vgic_v5_lpi_ist_id_bits_valid(unsigned int id_bits)
+{
+	if (vgic_v5_irs_ist_levels(&irs_caps))
+		return true;
+
+	return GICV5_LINEAR_IST_SIZE(id_bits, vgic_v5_ist_istsz(id_bits)) <= KMALLOC_MAX_SIZE;
+}
+
 /*
  * Allocate an IST for SPIs.
  *
diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.h b/arch/arm64/kvm/vgic/vgic-v5-tables.h
index 89096926563f7..ba049978157b1 100644
--- a/arch/arm64/kvm/vgic/vgic-v5-tables.h
+++ b/arch/arm64/kvm/vgic/vgic-v5-tables.h
@@ -123,6 +123,7 @@ int vgic_v5_vmte_free_vpe(struct kvm_vcpu *vcpu);
 
 int vgic_v5_spi_ist_alloc(struct kvm *kvm, unsigned int id_bits);
 int vgic_v5_lpi_ist_exists(struct kvm *kvm);
+bool vgic_v5_lpi_ist_id_bits_valid(unsigned int id_bits);
 int vgic_v5_lpi_ist_alloc(struct kvm *kvm, unsigned int id_bits);
 int vgic_v5_lpi_ist_free(struct kvm *kvm);
 

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


