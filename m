Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4694606BF7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bc+imLqm;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MpcYAwBM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dD0T8dgSUguzAe93p9YMVxo+6FxHhXvK08KHlYhmqa4=; b=Bc+imLqmlaAonZ
	/SlL4H54Foff78eam8LpnHVFXRraQyifnJDvhVU5uaDSR6WlGTne33RYXbHvn5YXTidG/nsfiokHb
	ToA9MOJaUn3iUAAtMSCB0myVMEAkXul74SYNULY4LOGXkKsDdOQpJfn/lp9VcuSPwR1mEmdd5NQ6a
	3jeG9gkl9sVtO90GBLm0UIILfa52rFjRD4gYfeOs8DMlNmgGR6US7Sds48Fji83cPEgjqRaXi7u+k
	WtT61YB3okIsNCO8LBOHXgVOpQ+Vi33bI7S3uQv0toXpxjd0tAcpk7i+Kk/Cepago9vd3cUvHuVhd
	qfEFe7mRGyy8mYxNkA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF74-0000000AOmC-3rsG;
	Wed, 25 Nov 2026 15:40:50 +0000
Received: from out-80.mta0.migadu.com ([2001:41d0:1004:224b::50] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF6T-0000000AOSF-1R0q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:40:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mvYtBRC2OxyaS9QiFUPVqxRONTSDvgDwLjJRSI4wiFw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795621211; v=1; x=1796226011;
 b=MpcYAwBMgb2H7Pe4FNA7hd/Sg44aTvWFUOeAYlCDzxN3HcodWx/ILDnRLRt3RFQbgREdenF4
 HYl7rcIJfRfu3bqBXe9uDFTKW0gLyWWDkEM2CrxnVxijEw1rlBrByHNFQ8gp5gO3Zpu/gmiI5nI
 RRYsu4IVEMG0wI/nXPJNV+z0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id aa2ea6faef9e16eb;
	Wed, 25 Nov 2026 15:40:10 +0000
X-Mizu-Trace-ID: aa2ea6faef9e16eb
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
Subject: [PATCH v2 10/20] KVM: arm64: Advertise the GICv3 CPU interface to protected VMs on GICv5
Date: Wed, 25 Nov 2026 15:39:01 +0000
Message-ID: <20261125153911.106793-11-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125153911.106793-1-fuad.tabba@linux.dev>
References: <20261125153911.106793-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_074014_053467_4BD70492 
X-CRM114-Status: GOOD (  11.20  )
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

A GICv5 host with FEAT_GCIE_LEGACY runs GICv3 guests, but its own
ID_AA64PFR0_EL1.GIC is 0. KVM sets the field to IMP for non-protected
VMs on such a host, but not for protected VMs, which read it from EL2's
copy of the register. The next patch computes a protected vCPU's
fine-grained traps from its ID registers, and with GIC at 0, EL2 would
then inject an UNDEF for the guest's ICC_IGRPEN<n>_EL1 accesses.

Set the field to IMP in EL2's copy as well. The vgic isn't probed yet
when the copy is made, so test the capability the vgic itself tests.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 2753686982f0b..3b4bc646d894a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2819,6 +2819,12 @@ static u64 get_hyp_id_aa64pfr0_el1(void)
 	val |= FIELD_PREP(ID_AA64PFR0_EL1_CSV3,
 			  arm64_get_meltdown_state() == SPECTRE_UNAFFECTED);
 
+	/* A GICv5 host with legacy support gives its guests a GICv3. */
+	if (cpus_have_final_cap(ARM64_HAS_GICV5_LEGACY)) {
+		val &= ~ID_AA64PFR0_EL1_GIC;
+		val |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, GIC, IMP);
+	}
+
 	return val;
 }
 
-- 
2.47.3


