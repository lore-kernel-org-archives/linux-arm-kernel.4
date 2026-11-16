Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r1Kih0mb;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=IdjU/UeN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4EJinoQFWOQAxBpp8/0xszfKNpVkrh34c2hx1lgmetc=; b=r1Kih0mbzy3yvme5SfWivwRk8Z
	cvSU2YVuJ45dPOwSukkeYM/pde3yKJxFYh+Ab/uuY/kwvrIspZ1p5QlgzNRJZxqbf0IUyPjoI+tZs
	SA603s+s5jLvbGTm8xww6a4dbxOQpQW3FZdnLtihFoqVyswJX7EaDqTD/ZgPYPgP32Q1bVNmh83nZ
	yL2+hQASsPQ48n//1fAh8gLx9k3dtMRlciJxLRj8V3SxjoBUZWGuSRmijIIK04guBVN3ek68us3mt
	zsIK+4bJTKsZyUO8Ff5b/ZP5AyBF/MWzwbZWg5vxfUQuzkMLJuHsgOz7MkxCJkLR3KQBaEJLGngk9
	a9lFb9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSplm-00000001CMb-0uJX;
	Mon, 16 Nov 2026 06:00:46 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSplj-00000001CMG-3V7m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:00:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso4574490a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794808841; x=1795413641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4EJinoQFWOQAxBpp8/0xszfKNpVkrh34c2hx1lgmetc=;
        b=IdjU/UeNbicnOHzIUNo9eE9HikkZnxGZyqF9N6V3l4z7bblLjf4ELVy8Z6L4HJtq/F
         IeOxpPyOn3nuE5j6OhMcJpNkov5oas4+uBTkcH2a0+CICcAafmdDR2VREIi37gvbRYSX
         hZoczGYPjXgdvL/x06rko+Xz27UPRTKNkttAhMFvHwYVYj8Se15y2KPJgM3SUtnbnKOl
         HttKhrE8d9PLjy26di5AL6lttUun79UormY+nqz2rgTZiJm3M6BmRm35iNUHfl3dFkfD
         4RI6HpXj82ScPjdRcHmBs/dYw1xNMcGaSXL0LKRVToheh1DZsv6GohPqO/oNvxgmRFlX
         kEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808841; x=1795413641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EJinoQFWOQAxBpp8/0xszfKNpVkrh34c2hx1lgmetc=;
        b=ViKp80jRRVarXO5gjgr94TXpUtro4QROyk3Oly1F180WC+jWcF7pFYBAVP+uVrPSPy
         t7StbZMvbyEesKAZtcKT6QgrJ6S41Mft+zyCJt8omFYXzybtZq43FnkpnTQwVm0w9x5W
         w8Nc50hImhR/oEgLiEtsPlQsjevss8TN48d+kUo9+niAOreyYHmob/Ug9hC7XsIU2tng
         mWOfmURVURi9eOmPnpZK4XSmBH2lIGDG2wn754Ts0LkxM+bAvn/ZmhDell7z3XszVdop
         DW7/JMIKa3caEHiKbqLij6kew12hdTNIP1IRu9l4JyFgeOhzS0rYL7WinQ1vfSNuYX3/
         UA0Q==
X-Forwarded-Encrypted: i=1; AL+hErGhmUpsx7tEN6By5ti5GpJfuHsT+F4vVEG6elWr0pQzifuE45OEmO3YfDr4efoAr5gMbnaneZyeX1nHM+ciDLNm@lists.infradead.org
X-Gm-Message-State: APuU4Z+JrsyryqTB5ylK1ujppzWEMZ2yf80JNlYnwnIY29YaI7woJfzy
	Mohgwz3yJWxEc0ZB2vl9inFck2umaFXWGEFY6szp/k/ROGc7UqIoS/hdXUn2sREs210=
X-Gm-Gg: AYBFou1Wfa3i9IU9yyoMudopdl0Es81o8tIyN3KyT3ejJmyRT1WYoLABaCEXZASGc77
	nW+tKnMEXNpjh9Fl72qsfla6NxY58KR7xkZaBmUiZwls8XNWAK8j8dvmrMJ6LUptkdP3yCxBV38
	DIQB8Ql+Hua8Ci0Eb8yAB2UdtXuWW10/mG38e5eQxF7BN5OPbPKsJY/eONTFrNWOPSroH8WYGLp
	IBgzBmY6ooLvMIe7FXAD6ML2s6Rx4pZndr48BOSz3CbPVZFDPGy5d6s4KhGdQWfi+x5AbKr0OSx
	3PU6B23hmv6qx+cKmKjMbxNfl4UFcNd/7s/roMOX8k7ToNko+yywd69Q6PRTN5j2LhfHSsT21Fo
	BSC/264ww3K40XlDfWAGREX4OPWEHHlfNBqWHMRtz8I2VrOgDSQkbR3FuhtGSHQflvhieRsMYPu
	/X4RNOvvlblkc2jN0wF/3Bpe8p5RSwty3BmtufCdC2U93CQ3j1Dx0cLElmheKjnIfGJ6IrfROq8
	h4eHrRovDV6Z5aGJXeqvmGIywilK+29S2j6cVBAFuvcx9F83q61+OC7aVsT+UWm+cbdCRT6ciPu
	M1CLu6sLArB+ptislCA=
X-Received: by 2002:a05:6402:2389:b0:6b7:1c:ead6 with SMTP id 4fb4d7f45d1cf-6b7c0be11abmr4151963a12.28.1794808841111;
        Sun, 15 Nov 2026 22:00:41 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm3973648a12.4.2026.11.15.22.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:00:40 -0800 (PST)
Date: Mon, 16 Nov 2026 09:00:36 +0300
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
Subject: [PATCH 2/2] KVM: arm64: nv: Update the shadow MMU's VMID for AT
 emulation
Message-ID: <5467fc4aae218b86846454bba96c3ba2b95931bf.1794808373.git.dan@pereq.eu>
References: <cover.1794808373.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794808373.git.dan@pereq.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_220043_914600_E7E66445 
X-CRM114-Status: GOOD (  17.16  )
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

There is a missing kvm_arm_vmid_update() before the __load_stage2()
in __kvm_at_s1e01_fast().  The bug affects nested virtualization on
arm64.

In KVM a "stage 2" refers to the VM's page table mappings. The
__kvm_at_s1e01_fast() function emulates the AT instruction, which
translates a virtual address the way the MMU would and returns the
result.

Each stage 2 has a VMID, which the hardware uses to tag TLB and
walk-cache entries, so that one VM never uses another's entries.  There
are only 2^8 or 2^16 VMIDs, which is quite limited, so vmid.c hands
them out by generation.  When they run out, a rollover starts a new
generation and flushes the TLBs: the VMIDs active on a CPU at that
moment are kept, and every other VMID can be given to another VM.

The kvm_arm_vmid_update() function checks the VMID's generation, takes
a new VMID if it is from an old generation, and marks it as active on
this CPU.  Without this, the shadow MMU's VMID could be an old one that
now belongs to another VM, or a rollover on another CPU could hand it
to another VM while we are using it.  Either way the AT fills TLB entries
tagged with another VM's VMID.

To fix this, call kvm_arm_vmid_update() to update the VMID before loading
the shadow stage 2.  That marks it as active on the CPU.  Then at the end
of the function, undo that.  Restore the original VMID as active while
checking for and handling rollover.

Fixes: 477e89cabb14 ("KVM: arm64: nv: Add basic emulation of AT S1E{0,1}{R,W}")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/at.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 06765881a4c8..34c9d10188e0 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1455,6 +1455,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		}
 	}
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, SCTLR_EL1),	SYS_SCTLR);
+	kvm_arm_vmid_update(&mmu->vmid);
 	__load_stage2(mmu);
 
 skip_mmu_switch:
@@ -1496,8 +1497,11 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 
 	write_sysreg_hcr(HCR_HOST_VHE_FLAGS);
 
-	if (mmu_cs)
+	if (mmu_cs) {
+		kvm_arm_vmid_update(&vcpu->arch.hw_mmu->vmid);
+		config.vttbr = kvm_get_vttbr(vcpu->arch.hw_mmu);
 		__mmu_config_restore(&config);
+	}
 
 	return par;
 }
-- 
2.53.0


