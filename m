Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F7MsERbB;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=MTo5W3Qq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9RCUmBluXL32Xv+pv5scriRF4mb+lkStDc3uAW97NWc=; b=F7MsERbBfnJHzg
	Oxj3inoKEd7khNFPILu+2vKKRo+398snuhn+/MW4c4FCaU3mITyN1xnS6Tze1sC96FYn7RXIKk2i3
	UFhfRvIY52MFaABrI1vTF21bQJ4OitweW+LLngwvP8b/Gk0zMsti4CoR33WOl25jlEX2qJsxaDhJ+
	Yt4W7x5rmw4d54zRX0YIJzdIdqlAEzRF6NMzTZ7h00JjyxCAMUG1HwvQy5+QsBkkQBdw0UdJnfzH9
	u2W7uBU8V/LIf9lXxYM5HFBu5c1EBxbpQhZlXfMY9TYmnlU7pOMJM9SDvYpJkkajavsQni5syeKyx
	CLQMVP25aCaCzFNNOV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29d-0000000C1rO-059B;
	Thu, 19 Nov 2026 13:26:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29Q-0000000C1fP-1H60
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:26:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so14162715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795094765; x=1795699565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9RCUmBluXL32Xv+pv5scriRF4mb+lkStDc3uAW97NWc=;
        b=MTo5W3Qqm23OvFPO3trTdwqgCspGh241g8ZNzyRQYZI+Vqdr6i02sQOf3j5iB+ms7i
         ZFLtJzgMGlogY3FNcCM41L2AwaLW708lh8Pj0RZk7mTk28/9UDsIpgJ+fD1McAoGo4rS
         n6QzvT3DRvQvSza/k39Xz0AWJinYfLP7WlDcqSCGlvBg7KNyGYsroDWKCRZrzn6oissd
         kb/OgXSnl5B6xQIqZWam7Vtx+tgA8jIfP2CxaAfDZwIhDs+AnXxzWZEx6mQlYRB2wlQQ
         2abf1erKeXsvRDVUZVPxZO6QQBGRX+GtrgKuthXUzhlTcGouo9fvMycrZIcmXJPsa4ab
         mgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094765; x=1795699565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RCUmBluXL32Xv+pv5scriRF4mb+lkStDc3uAW97NWc=;
        b=1kcANro1cWRt86fiGgkMitteZuHOa4HivmLjzu9JHxgkaiSgtcXdn9F+YCRyUfjcPX
         TJbSxCX5AzR0dBTSAhe5qSUyceJh966J6f/1i/hFdkI3JjslREgpHNugvEvlg6TWB18L
         vBPjuNx5tUcj/3Y5J/cWJgKYmVcwG9+KrPG7OT88N5n/DKijecHehBtXDDUdBk+Z+gPQ
         NNLJguqDJzIAcHWZyREtkxGMHVBSCOpeggXR50rjdvRch1g2UtXz0jZL4CC32GNr6V71
         wp7htM2gVljw4JBm/v0yAL7h9iYwBtx11SVTwuSlMJLsJe3lvEqiI5TETodpGS9yx2NO
         hyhw==
X-Gm-Message-State: APuU4Z9X5xMbiOUKwb2b84Os1TV6JAH7iwWqVKZmGUVz0iNvIYq8Eyxb
	3OYkwNtVbuTIkxuoM/AlNpChaHNJnfRA5WDPzC9gclIE12Pn38C3me6s2DOZsmNtXQM=
X-Gm-Gg: AYBFou0SyRDzUlzh7TgqefsrCTlJz9GE+2GxOl8llpLPKJlaF95/VKSs5K9MkLuPXcs
	3SfKQK5ulh4Hj2QxlMCDcbrQZkIJ1hs9TZA9IIT3Ihvu0BLnG+9T8WhzYfgNOQXoDuHxtoSpbXE
	+tImJ85TXcreeilPilkj9mrRXFY19E9vLQtYE7Z3IBHPZ1mawlH45galEWL9xXa2X5S5671ejHs
	Hp9cyQ3Vw332zlyF0P3M19DWzZyR+oQtg8gEdn0W3jFohJPJK1EnzbvsXGB1hOWs3UiWxBc+2MW
	V/or4UDa1Dqq0dTMz+x7yDC+4GbmLJ60hUn+yNB9ShvqNovOronQUXk2qjmmqvwA6PVbkCjBWfd
	nqau2ocKn3YD1LDTKMFHG7sDx4MSiESS5Mtq+RvhpOswPi1VONHG+wqQzBPlbTsfaFTi5QaMyhz
	SQDdNsQBZY7dZrm9xnxASfbyykg4X39TEJnsMjJ0+AcNFr8hJPGquEigvGIl/qClOtpUPOdCUzY
	tvswYF9QPdBWO0i02pptcycCbia1zGb32wiIRB9qo3OtMUrgRySUY7d1e1XPnjaghwihQ0MjyQp
	GrB08WGcvHvy+Q0sHfM=
X-Received: by 2002:a05:600d:19:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb8701a2eamr15744495e9.17.1795094765053;
        Thu, 19 Nov 2026 05:26:05 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85342cedsm36282605e9.4.2026.11.19.05.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:26:04 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Thu, 19 Nov 2026 16:25:35 +0300
Subject: [PATCH v2 2/4] KVM: arm64: Trap TCR2_EL1 writes when S1PIE or
 S1POE is hidden
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-nv-tcr2-v2-2-3deb1a6cdba8@pereq.eu>
References: <20261119-nv-tcr2-v2-0-3deb1a6cdba8@pereq.eu>
In-Reply-To: <20261119-nv-tcr2-v2-0-3deb1a6cdba8@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jintack Lim <jintack.lim@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052608_390161_9E0CE5F0 
X-CRM114-Status: GOOD (  18.61  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A VMM can offer FEAT_TCR2 to a guest but hide FEAT_S1PIE or FEAT_S1POE,
for example this is done to keep the VM migratable.  KVM then stops
loading the PIR_EL1, PIRE0_EL1 and POR_EL1 registers for that guest.  But
the guest's writes to the TCR2_EL1 register don't trap, and the CPU still
acts on its PIE, POE and E0POE bits.

If a guest turned these features on, it would run with the permission
settings another VM left on the CPU.  Technically this is a kind of
information leak and a guest could figure out another guests permission
setting based on which accesses fault.

For these VMs, set the TCR_EL1 bit in HFGWTR_EL2 so that writes to
TCR_EL1 and TCR2_EL1 trap, and clear the hidden bits in a new
access_tcr2_el1() handler.

Fixes: 58627b722ee2 ("KVM: arm64: Make PIR{,E0}_EL1 UNDEF if S1PIE is not advertised to the guest")
Fixes: b86c9bea6349 ("KVM: arm64: Save/restore POE registers")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: This is a new patch

This is only a partial fix, I will update nested virtualization in the
next patch and the !vcpu_has_nv(vcpu) condition in __compute_hfgwtr() will
go away.
---
 arch/arm64/kvm/config.c   |  5 +++++
 arch/arm64/kvm/sys_regs.c | 14 +++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index e295435a30b8..f756f7c4fdf8 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1896,6 +1896,11 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
 
 	if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
+
+	/* The CPU acts on hidden TCR2_EL1 bits, so trap writes to clear them */
+	if (!vcpu_has_nv(vcpu) && kvm_has_tcr2(vcpu->kvm) &&
+	    (!kvm_has_s1pie(vcpu->kvm) || !kvm_has_s1poe(vcpu->kvm)))
+		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
 }
 
 static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index afd7e76bedff..3899702d438b 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -615,6 +615,18 @@ static bool access_vm_reg(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool access_tcr2_el1(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	if (!kvm_has_s1pie(vcpu->kvm))
+		p->regval &= ~TCR2_EL1_PIE;
+	if (!kvm_has_s1poe(vcpu->kvm))
+		p->regval &= ~(TCR2_EL1_POE | TCR2_EL1_E0POE);
+
+	return access_vm_reg(vcpu, p, r);
+}
+
 static bool access_actlr(struct kvm_vcpu *vcpu,
 			 struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
@@ -3501,7 +3513,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
 	{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
 	{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
-	{ SYS_DESC(SYS_TCR2_EL1), access_vm_reg, reset_val, TCR2_EL1, 0,
+	{ SYS_DESC(SYS_TCR2_EL1), access_tcr2_el1, reset_val, TCR2_EL1, 0,
 	  .visibility = tcr2_visibility },
 
 	PTRAUTH_KEY(APIA),

-- 
2.53.0


