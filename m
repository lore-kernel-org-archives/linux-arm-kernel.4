Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF218606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0VPu+lsO;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=ETF71HiU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TxCm5SXDQZvehy91cumJ8DrMIrDWTNnrR4NDVBiT94E=; b=0VPu+lsORJRLjhc8arUNu0zEMp
	1lr9WgqFoH8K89QErLG8QR+wQIaTuY5FxMyvmWitCADAAn9IQsuZHsL4X6D215a90i6okyd1q2vyn
	GAEzlyhTLsjhR+9FLjJWKDHVOH49EGqlR3VFTCAeX8OMJPTfqwZnTVFXex4vPMNUnkHVkC2KkuJcm
	g+aThIb/IDK/RsUGA9k7SP79Q3DWREhcukyUrPyDIrPdsQ1J5gFsXq+nD+Ism+FthoiyxHVMtwIe0
	1mPoaeStEKlrzpVnMBmvxnDQKGxZ2TGse6rhybCDdYBG2JGQePGvnTfniPZPkYe29zFvAELbh0SxK
	G0N7tmbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThc0-00000009Igg-3xu1;
	Wed, 18 Nov 2026 15:30:16 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThby-00000009IfP-2AUA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:30:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c50a4a2132cso147976566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795015812; x=1795620612; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TxCm5SXDQZvehy91cumJ8DrMIrDWTNnrR4NDVBiT94E=;
        b=ETF71HiUkEYOT+uQ24tg252D9Fiu/CyUM8L0/vcBUTLp+ff9FCEP7bFQw/RTUbH95g
         gbgocf6F7StwgSicGlGm8erWjlWZ9cPb8j8/aRvLSrkkFDsSXgurPFeIHLUbCKmNo2Z9
         I7NIzbWiKQaUVrO85Tt7OV/13cDp91JnsKPlRZFeA2I6wHyk5Ecy3ClYxwhO/ER0LzkL
         zvOZ4KedQDop1STnBCIl/aSH1Lvlk1o3Q0wlesMN1UOwew1kemcPUPsGheCpCioxaK4Z
         vohKo28fcTYqifNyAJFQfNrrLMEJggIprCwmmdtlBLPH4vnpp38+zv6kbGr8MN7H7dPR
         A3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015812; x=1795620612;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxCm5SXDQZvehy91cumJ8DrMIrDWTNnrR4NDVBiT94E=;
        b=soaF+c/QRcw2PvNRiu9+9IzA+O9eXnj6tiYnVyTM+kFc54D2MCkXi/UnEalsvlXfgS
         TkjbOs3A6kaflnY4/nDHfMwUuCpAiIqsVFUi6Y1NXPpdjEsKS92WxRtPgXIWCjpwRw7y
         KXWl/48UYYRem2wItnasDJ3Nc+QYpuKKCtd98VTGyzZlJsLLojtSiyUn655K4OaD5Mf2
         8N5W2n0Kf2TTFjIkJa0l//wTquZv0NyZ9nql8H3VkJc+fpnopl2vtsJahGIDJeQ87z8a
         lxMpKiFzEzc+hqTkPqHFkpWJVwVfV9DdRv8Qw7xR0rdPFDnpSCcJGPY/26StfhHDTLEI
         L8Xg==
X-Forwarded-Encrypted: i=1; AL+hErFjaKSZTivrJIKmPU+QxWMmdBAlKo65yzWzHrGEFEo0AtpS3b7faOZJ4ul32W9ChFMoPGgqI4HE+qcqmuubw3UL@lists.infradead.org
X-Gm-Message-State: APuU4Z/8X7pmB8rX1gLorW7O+CKrkyCoNdHLcGhbet/6xtwTF25PAZsf
	mf9W6YdtBazvjidKLGFSE9x5WPkv2HE6kF2LVCVBathXnfAPoh25ZANnnlXihaTx0VE=
X-Gm-Gg: AYBFou0OpvutXVeECag4Fg/Dsvim7Y3294c60Tj2CnMD7p9odceqjROtx7xCulIMn/f
	aAXsPpxHigXVBi2gXPs6x72q+j/vG1i4bvrp79XvSkB6afxbH88EpqS0xQ2Oyr/ecPQvsNzum/z
	yTZeDf0msOV6ngS7yT+MKaA8kHcc4fV2q7Hfk9SozVxSNdiiQ7WpQQn9annALCav9USeP6IsO2R
	7UWBnlCzMTGpKhpVC31Acg3/AWb03Uq9+V2wsG2+B7Wm1DnA65Hv9eY6oZRF+lMC8+J28bcuDXq
	d3ba+vcj1hTGOoQ3iTnHdg8Ci7mcgcm3L6a/06HFmVg21yXuQ8VWXmq6JzSpS7H31SXagXFM7LM
	EMNMX2y7ZtcJBtp4BqD1sX0Rq1xw9vBrlAfBdaPJTN/g/hRqAGJgbAHMwJY4wuhvzReBhBGHApy
	Nq083GtTUAdJfUUDzcuii8El4+00ypVl7JmQPysrQVzqYNTRsK137NY3qh34DpBVusK+bOZAe5d
	AKw3R/Xs+6cVpLntk7nIxYsh0OFoJ2KIY369xQPmUnZQyc95u03Zps1YpAfcC7K5AvvUWBPOX5R
	2HaX82hIJKlxD5lAyqE=
X-Received: by 2002:a17:907:9304:b0:c4d:212a:192a with SMTP id a640c23a62f3a-c510e520f80mr286242666b.48.1795015812157;
        Wed, 18 Nov 2026 07:30:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm11652266b.21.2026.11.18.07.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:30:11 -0800 (PST)
Date: Wed, 18 Nov 2026 18:30:08 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 3/3] KVM: arm64: nv: Report EL2 registers with no trap
 forwarding
Message-ID: <5a7235e9adff42aa043ac9473dbeb0354dca0967.1795014776.git.dan@pereq.eu>
References: <cover.1795014776.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795014776.git.dan@pereq.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073014_596041_00E20D97 
X-CRM114-Status: GOOD (  16.89  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

One of the recurring issues we run into is that people add a trap to
KVM but they forget to add a matching trap for nested virtualization.
Add a boot time warning to print a warning for missing traps.

Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/emulate-nested.c   |  5 ++++-
 arch/arm64/kvm/sys_regs.c         | 23 +++++++++++++++++++++--
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8efb21b2d729..0614c3b3a40d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1379,7 +1379,7 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu);
 int __init kvm_sys_reg_table_init(void);
 struct sys_reg_desc;
 int __init populate_sysreg_config(const struct sys_reg_desc *sr,
-				  unsigned int idx);
+				  unsigned int idx, bool needs_nv_trap);
 int __init populate_nv_trap_config(void);
 
 void kvm_calculate_traps(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 9e0c15e6be47..39136a89d74b 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2434,7 +2434,7 @@ int __init populate_nv_trap_config(void)
 }
 
 int __init populate_sysreg_config(const struct sys_reg_desc *sr,
-				  unsigned int idx)
+				  unsigned int idx, bool needs_nv_trap)
 {
 	union trap_config tc;
 	u32 encoding;
@@ -2452,6 +2452,9 @@ int __init populate_sysreg_config(const struct sys_reg_desc *sr,
 	encoding = sys_reg(sr->Op0, sr->Op1, sr->CRn, sr->CRm, sr->Op2);
 	tc = get_trap_config(encoding);
 
+	if (needs_nv_trap && !tc.val)
+		kvm_err("sysreg %s has no NV trap configuration\n", sr->name);
+
 	if (tc.sri) {
 		kvm_err("sysreg %s (%d) duplicate entry (%d)\n",
 			sr->name, idx - 1, tc.sri);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ef4554656ddf..afd7e76bedff 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5978,6 +5978,23 @@ int kvm_vcpu_finalize_sys_regs(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+/* Keep the nested virtualization traps in sync with the KVM traps. */
+static bool __init needs_nv_trap(const struct sys_reg_desc *r)
+{
+	/* op1 4 is the EL2 encodings, op1 5 the _EL12 and _EL02 aliases */
+	if (r->Op1 != 4 && r->Op1 != 5)
+		return false;
+
+	if (!r->access ||
+	    r->access == bad_vncr_trap ||
+	    r->access == trap_raz_wi ||
+	    r->access == bad_redir_trap ||
+	    r->access == undef_access)
+		return false;
+
+	return true;
+}
+
 int __init kvm_sys_reg_table_init(void)
 {
 	const struct sys_reg_desc *gicv3_regs, *gicv5_regs;
@@ -6010,10 +6027,12 @@ int __init kvm_sys_reg_table_init(void)
 	check_feature_map();
 
 	for (i = 0; !ret && i < ARRAY_SIZE(sys_reg_descs); i++)
-		ret = populate_sysreg_config(sys_reg_descs + i, i);
+		ret = populate_sysreg_config(sys_reg_descs + i, i,
+					     needs_nv_trap(sys_reg_descs + i));
 
 	for (i = 0; !ret && i < ARRAY_SIZE(sys_insn_descs); i++)
-		ret = populate_sysreg_config(sys_insn_descs + i, i);
+		ret = populate_sysreg_config(sys_insn_descs + i, i,
+					     needs_nv_trap(sys_insn_descs + i));
 
 	return ret;
 }
-- 
2.53.0


