Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839A4606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wc8l85oo;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Vxo47W2b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C0AHV3pkmSBlkgkC6bhKAE+fGlVWZxDBcjbwoZIhJvM=; b=Wc8l85ooaWkjaf5NB9R7K9r+1l
	JzxNT+Z/HDHbYmoOJpvvq7xBubdPeIw8X37/aiK6LPduj3pE/fsuPBBBKU37Q4+ogwcixG86p9W41
	C5OXmmbTx0sZFw1YxXg/L5Y8lW1/jjSI3dfDMePKWLAB50BjWOUn0TdzVxAOXeUI2k5/CeATaBYy9
	Z9zLbc0dFpcKHbyRy5iDbgIImc6E8NV5exISjX5z/ygQWzHxKfoaLEl0PNd8DWbJqYD60ueypq6GD
	jEe5IuJ1QIncHB6TJBWpmqTkSmntlbt5HsSxKx35xoF6LupEFvLSGCRMaxnwGxXwEbwyRklLIsM6W
	KcakXFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpm4-00000001CQg-1zM4;
	Mon, 16 Nov 2026 06:01:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSply-00000001COZ-2Tn2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:00:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1105299f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794808856; x=1795413656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0AHV3pkmSBlkgkC6bhKAE+fGlVWZxDBcjbwoZIhJvM=;
        b=Vxo47W2bxg0gOTwmKb+QBu0PXkmO2jhDpig/HF2tHtOLxStSLAjiPtKTvkqMV542PN
         e3tvVMvoNv6SFo59gXoOcidzgXODIp46dnCqnBK2CgL4aayfRv1xLDUeiMr2cfWuQYcW
         ih2JQICvmBcO4OaX7dZQVBPHhOswCqxGM2JY7guPLsGUd76THptpB1Xy//gRgFq1WUOB
         GxEELWhCmThWuv5NkEn7q4dArJUwfSb9U29GuwgOa5MasH0nD3f2p7UqZIY4ww0dniwm
         e7bAtPGIUwAEOL7O7bQX+9qxKrrrsWH7wPBtCCAgof5gOG1qX/MUK8y5bCeW0eb3vB7u
         Sp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808856; x=1795413656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0AHV3pkmSBlkgkC6bhKAE+fGlVWZxDBcjbwoZIhJvM=;
        b=V96JxkMxR/7AeyMAOxSogq4UWk/eGsKlaOAke18bN8Y6oEvl37iVML7yih10OB8NvM
         1dUfSkWft8y6aDpkxt/X+E44R56SP/6bw0TuCUCnfX3y09KTpwDARQY1JR7MVdjHvuyI
         VYRFE02ASII3S6Mp0/lAqnAlzen1irdrKzDyCL1oIXEEXtzOSVOcYJYDJrrxqqBASrwO
         f5Hg7hXKVZHhux3XUC1Jw6qneC5dnVTpnCl9TjFWMDMO1iInCP8+wkb7y/ZD9fFYgSoB
         ZWAwccn/Cim1Bk6Vc04V8xYS2yARxELpJCBdDRjn+/zHXQagMzEQ756rdYlGc9VbYgOf
         T0yQ==
X-Forwarded-Encrypted: i=1; AL+hErHOK4V3tgdKoYRBbpo2hr+d3c51/gBLrHtueUdOY6mgn7hdsQpcojUZoILmQATJ9itdcoOxXcqR+pveWXGWEZmk@lists.infradead.org
X-Gm-Message-State: APuU4Z+eIFyeEiP0mFROY8gyOrwrLKNwKnfkIFGSs+LES/AqHQjrEQim
	P4KQkMSy2Nz6oyihuAIV+KgJukEcBawA6pyxxq2vrOqjE5Ds0IvIPJKizhyGTUH3/Bc=
X-Gm-Gg: AYBFou1nlxsUGeyNWR0a/w78haaxn6vUaK28yjjHM6l28mH4OwOSuaZ7wJ3H7K8/Wh8
	AHLLdV4IEdkdiMLV1axBAWbuyqh5z+MqYmpwq3xLtETNxWuUeR9rHVNfQZSXDjNuOBqGyn4JORL
	FXoejqNxr08GexBNGhwuOx1NE99GtsZazTb1tM3t3t75Edrcmq0zR/0FeJSO11Ot4Idn2Pl5kfJ
	zdevWdkHX+fGThBGH19Oe+wpdpaZ3Fln5humqUEEwDJSOndr4PHjj5dwqrR+92vtsyDvzhdK9OX
	SYJdtRNxOcO/qmewNbjHeHHFEEt2vlSrQvRRpAmxkYGRHwa+D1SyGI8jeUJzXDCXj9RLGtHVAUx
	SDd3cSEO7iRzKdTsHG37hLWLLq2B89ybi9gVOMqilo89B1flyWrbboQ/7H7VUAjjyVpHQvvXGpx
	Or4dN8S2u89D1yZSttbCn5ybTGySc6PMeD5SAASFDmjyI0CqK2Cq6Wi6MoFHJ7ONsVdv1zlXsFI
	q+oN9DH8XA488qqzqWLk1vR2QwxriDpFnntmmzpu+ZeHBh+3oheUEkDhMj1TEU7KUXc0Tko3Ryb
	nGml+3pw61T/wEtoy0k=
X-Received: by 2002:a5d:5849:0:b0:49e:da28:4d40 with SMTP id ffacd0b85a97d-49eda284d6bmr9895900f8f.19.1794808856445;
        Sun, 15 Nov 2026 22:00:56 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm20840076f8f.6.2026.11.15.22.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:00:56 -0800 (PST)
Date: Mon, 16 Nov 2026 09:00:52 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jintack Lim <jintack.lim@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 1/2] KVM: arm64: nv: Fix AT emulation for TCR2_EL1
Message-ID: <eec50693a12e1ba34d60458ae8fe605ac198a79c.1794808373.git.dan@pereq.eu>
References: <cover.1794808373.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794808373.git.dan@pereq.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_220058_661327_AE31943D 
X-CRM114-Status: GOOD (  22.19  )
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

Arm provides an AT instruction that translates a virtual address the way
the MMU would and returns the result.  There is a bug in the way this
instruction is emulated for nested virtualization because of how TCR2_EL1
is handled.  The bug is fairly minor.

The TCR2_EL1 register has bits which turn on permission indirection
(PIE) and permission overlays (POE).  When these bits are set, the AT
instruction reads the permissions stored in PIR_EL1 and POR_EL1.  If
you have the right features and permissions then in the return value from
the AT instruction we set one bit to either 1 or 0 depending on whether
the access would be allowed or whether it would fault.

However, the bug is that just because the host has TCR2 enabled, it
doesn't mean the VM has it.  KVM doesn't load these registers for a VM
which doesn't have the features, instead the AT runs with the host's
HCRX_EL2, which has TCR2En set.  So the AT uses the TCR2_EL1, PIR_EL1 and
POR_EL1 values another VM left on the CPU, or possibly the VMM's POR_EL0.
Likewise, for a VM which has TCR2 but not PIE or POE, the L2's TCR2_EL1
is loaded unmasked.

The impact of this bug is that we leak a single bit of data to the L1,
but in real life it's hard to imagine how it is useful to an attacker.

Fix this by writing zero to TCR2_EL1 when the VM doesn't have TCR2, and
by clearing the PIE and POE bits when the VM doesn't have those
features.  Also it should be effective_tcr2(vcpu, TR_EL10) to read the
TCR2 for the L1 instead of vcpu_read_sys_reg(vcpu, TCR2_EL1).

Fixes: 477e89cabb14 ("KVM: arm64: nv: Add basic emulation of AT S1E{0,1}{R,W}")
Fixes: 23e7a34c8397 ("KVM: arm64: Add AT fast-path support for S1PIE")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/at.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 30d8f062b2c2..06765881a4c8 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1438,7 +1438,13 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
 	if (kvm_has_tcr2(vcpu->kvm)) {
-		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
+		u64 tcr2 = effective_tcr2(vcpu, TR_EL10);
+
+		if (!kvm_has_s1pie(vcpu->kvm))
+			tcr2 &= ~TCR2_EL1_PIE;
+		if (!kvm_has_s1poe(vcpu->kvm))
+			tcr2 &= ~(TCR2_EL1_POE | TCR2_EL1_E0POE);
+		write_sysreg_el1(tcr2, SYS_TCR2);
 		if (kvm_has_s1pie(vcpu->kvm)) {
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
 			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
@@ -1452,6 +1458,9 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	__load_stage2(mmu);
 
 skip_mmu_switch:
+	if (cpus_have_final_cap(ARM64_HAS_TCR2) && !kvm_has_tcr2(vcpu->kvm))
+		write_sysreg_el1(0, SYS_TCR2);
+
 	/* Temporarily switch back to guest context */
 	write_sysreg_hcr(vcpu->arch.hcr_el2);
 	isb();
@@ -1554,6 +1563,9 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		if (!vcpu_el2_e2h_is_set(vcpu))
 			val |= HCR_EL2_NV | HCR_EL2_NV1;
 
+		if (cpus_have_final_cap(ARM64_HAS_TCR2) && !kvm_has_tcr2(vcpu->kvm))
+			write_sysreg_el1(0, SYS_TCR2);
+
 		write_sysreg_hcr(val);
 		isb();
 
-- 
2.53.0


