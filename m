Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87609606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 03:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uy0s5gD6;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=L6yA8bNX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dNj8Yd/9RCqTsai/mMDRldXnsFtI1EFpZ2mNGrB/CQk=; b=Uy0s5gD61IDC2q
	qk96EWxye/cv7gw4Yqy6Cvt1ly8gMdDTTR4nCAJ1n6IbRqzDZwTP7m/RmjayWQX7CpaQDZFT27drC
	zD7tqolkks6pPfnaCmvsP71EKe6mT3A9G7ZvaljpNsvRYmwMDG0ELjAUNtCwIbZR0RGQPHleVB4ax
	4xv4j+xF+2fVHrhma+fdqP5oHW4bA3a3U277lCTBLMknNElv5I3PX/qwLEjZrRgbkyFddWFiFedqB
	UIwQzh38eauAIS8Blp0wCv/2lai5QQITAC6ILbvurN0b7L/Y7iymCC9LxAFGB0FAf4XtFJJGQBgvg
	QsGCao2TNwAzwh2BNkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLcx-00000008dYC-1Tdp;
	Thu, 12 Nov 2026 03:37:31 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLcp-00000008dUU-3e1N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 03:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1794454652; x=1825990652;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=mCMmdFehXj9Yk21VBRWrrvPCjVt9jTpcT09zRI/0xpc=;
  b=L6yA8bNXstvrNVSjq3orS4/Q4FhBASKZZPZa6vXLREP0sS2ddJD8nJVZ
   SwvxEM5Hk1PA5UnWTyqdV+efoCuFaeNynf93ZQbwsDa4PMkDMRZeh5TKH
   q3uhgDZXFXa8Z2AQLegR4KOH9yt3VBKOFehOpFekOHGCfUgf4ysoCV4tk
   vTDTyILo3rC9M8cFMxDB1MjdbRln38cbt6XIuFh7vunkNyE4Hf2i6A2N2
   7zCdNvjA9bGmNPn4dobQMo0ar7ZTnJEJndSWKwNGX4SCfylyoehum/BGw
   paIkJCPd5/m00o1J5iu0OnOA0XgLDS0gB6n1uXsEsjSuG3TsilaxGbrf8
   g==;
X-CSE-ConnectionGUID: hDnES9k2RMGfmyQ6sYGOnw==
X-CSE-MsgGUID: aYR/vy/tToyuynDml1Peng==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="261426556"
X-IronPort-AV: E=Sophos;i="6.27,208,1786978800"; 
   d="scan'208";a="261426556"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:37:30 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F18741C0065F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:37:21 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9D603C008B1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 03:37:21 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 87A6E1801921;
	Thu, 12 Nov 2026 03:37:15 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
Date: Thu, 12 Nov 2026 12:36:22 +0900
Subject: [PATCH RFC v2 2/2] cgroup/misc: Add support for Arm CCA MECIDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-mm-v1-mec-v2-2-0d1dd260a588@fujitsu.com>
References: <20261112-mm-v1-mec-v2-0-0d1dd260a588@fujitsu.com>
In-Reply-To: <20261112-mm-v1-mec-v2-0-0d1dd260a588@fujitsu.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 cgroups@vger.kernel.org, Kohei Enju <enju.kohei@fujitsu.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_193724_204114_CA51A4F1 
X-CRM114-Status: GOOD (  21.58  )
X-Spam-Score: -4.4 (----)
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

Arm CCA MECIDs are limited platform resources. Add a misc cgroup
resource to allow the system administrator to account for and limit
their use.

The cca_mec resource represents the number of Realm VMs using the
private MEC policy. Each such Realm consumes one MECID. Charge the
resource when the Realm is created, and uncharge it when the Realm is
successfully destroyed.

Realms using the shared MEC policy don't consume this resource.

Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
 arch/arm64/include/asm/kvm_rmi.h |  2 ++
 arch/arm64/kvm/rmi.c             | 44 +++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/arm_rmm/rmi.c   |  4 ++++
 include/linux/misc_cgroup.h      |  4 ++++
 kernel/cgroup/misc.c             |  4 ++++
 5 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 08c1f6d0671d..658e65454282 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -60,6 +60,7 @@ enum realm_state {
  * @ia_bits: Number of valid Input Address bits in the IPA
  * @stage2_unmapped: The Realm stage-2 mappings have been removed
  * @mec_policy: MEC policy for the Realm VM
+ * @misc_cg: Misc cgroup charged while the Realm owns a private MECID
  */
 struct realm {
 	void *rd;
@@ -75,6 +76,7 @@ struct realm {
 	unsigned int ia_bits;
 	bool stage2_unmapped;
 	unsigned int mec_policy;
+	struct misc_cg *misc_cg;
 };
 
 /**
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 01ac8d4fec7c..d25d75744042 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -6,6 +6,7 @@
 #include <uapi/linux/psci.h>
 #include <linux/arm-rmi-cmds.h>
 #include <linux/kvm_host.h>
+#include <linux/misc_cgroup.h>
 #include <linux/overflow.h>
 #include <linux/uaccess.h>
 
@@ -538,6 +539,36 @@ static int realm_init_sve_param(struct kvm *kvm, struct realm_params *params)
 	return 0;
 }
 
+static int realm_mec_charge(struct realm *realm)
+{
+	struct misc_cg *misc_cg;
+	int ret;
+
+	if (realm->mec_policy != KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE)
+		return 0;
+
+	misc_cg = get_current_misc_cg();
+
+	ret = misc_cg_try_charge(MISC_CG_RES_CCA_MEC, misc_cg, 1);
+	if (ret) {
+		put_misc_cg(misc_cg);
+		return ret;
+	}
+
+	realm->misc_cg = misc_cg;
+	return 0;
+}
+
+static void realm_mec_uncharge(struct realm *realm)
+{
+	if (!realm->misc_cg)
+		return;
+
+	misc_cg_uncharge(MISC_CG_RES_CCA_MEC, realm->misc_cg, 1);
+	put_misc_cg(realm->misc_cg);
+	realm->misc_cg = NULL;
+}
+
 static int realm_create_rd(struct kvm *kvm)
 {
 	struct realm *realm = &kvm->arch.realm;
@@ -594,12 +625,16 @@ static int realm_create_rd(struct kvm *kvm)
 	if (r)
 		goto out_undelegate_tables;
 
+	r = realm_mec_charge(realm);
+	if (r)
+		goto out_undelegate_tables;
+
 	params_phys = virt_to_phys(params);
 
 	rmi_ret = rmi_realm_create(rd_phys, params_phys, realm->sro);
 	if (rmi_ret) {
 		r = rmi_ret < 0 ? rmi_ret : -ENXIO;
-		goto out_undelegate_tables;
+		goto out_uncharge_misc_cg;
 	}
 
 	realm->rd = rd;
@@ -607,6 +642,8 @@ static int realm_create_rd(struct kvm *kvm)
 
 	return 0;
 
+out_uncharge_misc_cg:
+	realm_mec_uncharge(realm);
 out_undelegate_tables:
 	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys,
 					 top_delegated - kvm->arch.mmu.pgd_phys))) {
@@ -1727,10 +1764,15 @@ void kvm_destroy_realm(struct kvm *kvm)
 		if (WARN_ON(realm_destroy_rtts(kvm)))
 			return;
 
+		/*
+		 * Keep the misc cgroup charge if RMI_REALM_DESTROY fails, as
+		 * the corresponding MECID may still be allocated by the RMM.
+		 */
 		if (WARN_ON(rmi_realm_destroy(rd_phys, realm->sro)))
 			return;
 		rmi_free_delegated_page(rd_phys);
 		realm->rd = NULL;
+		realm_mec_uncharge(realm);
 	}
 
 	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys,
diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
index 27edf060d2d9..ba8a3e9a2603 100644
--- a/drivers/firmware/arm_rmm/rmi.c
+++ b/drivers/firmware/arm_rmm/rmi.c
@@ -7,6 +7,7 @@
 #include <linux/cpufeature.h>
 #include <linux/memblock.h>
 #include <linux/memory.h>
+#include <linux/misc_cgroup.h>
 #include <linux/mmzone.h>
 #include <linux/slab.h>
 
@@ -1126,6 +1127,9 @@ static int __init arm64_init_rmi(void)
 		return ret;
 	}
 
+	WARN_ON_ONCE(misc_cg_set_capacity(MISC_CG_RES_CCA_MEC,
+					  rmi_mec_count()));
+
 	/* Mark the RMM is usable */
 	WRITE_ONCE(arm64_rmi_is_available, true);
 	pr_info("RMI configured\n");
diff --git a/include/linux/misc_cgroup.h b/include/linux/misc_cgroup.h
index 0cb36a3ffc47..26131677170a 100644
--- a/include/linux/misc_cgroup.h
+++ b/include/linux/misc_cgroup.h
@@ -21,6 +21,10 @@ enum misc_res_type {
 #ifdef CONFIG_INTEL_TDX_HOST
 	/** @MISC_CG_RES_TDX: Intel TDX HKIDs resource */
 	MISC_CG_RES_TDX,
+#endif
+#ifdef CONFIG_ARM_RMM_RMI
+	/** @MISC_CG_RES_CCA_MEC: ARM64 CCA MECIDs resource */
+	MISC_CG_RES_CCA_MEC,
 #endif
 	/** @MISC_CG_RES_TYPES: count of enum misc_res_type constants */
 	MISC_CG_RES_TYPES
diff --git a/kernel/cgroup/misc.c b/kernel/cgroup/misc.c
index 4a9e2557141c..989316bcb5f0 100644
--- a/kernel/cgroup/misc.c
+++ b/kernel/cgroup/misc.c
@@ -28,6 +28,10 @@ static const char *const misc_res_name[] = {
 	/* Intel TDX HKIDs resource */
 	"tdx",
 #endif
+#ifdef CONFIG_ARM_RMM_RMI
+	/* ARM64 CCA MECIDs resource */
+	"cca_mec",
+#endif
 };
 
 /* Root misc cgroup */

-- 
2.43.0


