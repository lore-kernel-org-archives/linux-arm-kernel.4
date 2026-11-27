Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAED8606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Scw5DkKA;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=CWLuM13f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eJH1nUsnbixxIHEWvpIRBGng9yzgxFYLz8dPDZYEZSU=; b=Scw5DkKAfnYnq5
	lx7O71RzxL0bbUpuENdxGu3v1Bk2EsmqWeJPCG+1sfVOTTSN6QZKDzGkcsE4LQ7mJCy0k8Jv/gmC2
	IOp5SuiELZyReAN/eQ+UCAubwYk87HCqROJxhxOAjqMXNiPxCetnzS6j/+9rrMfUwBHRiGioxDRcV
	/x6Gsav2N33YRmiuF5EYjLikjfhjDb5dv2d9maGq6FQe0JWzPBIkST7oACvwiX06v+EVdSeibEejK
	d5EHFcnbi3rD7Yiil2ckk79hRN+tzHhKGhibec6+GLUS1s3xbvyR93ayfdf5vUf64XvGVfqWY3Q1z
	mC/dkMjnChvvOTc87vLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxX-0000000Gq5Q-0Anh;
	Fri, 27 Nov 2026 15:33:59 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvY-0000000GozN-0fTb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:32:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4a357b1c649so4769207f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 07:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795793514; x=1796398314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJH1nUsnbixxIHEWvpIRBGng9yzgxFYLz8dPDZYEZSU=;
        b=CWLuM13fRlUWKLaB5sRNDshhHyDcm/FQoj5ojroGXqNzD3/IZvV9Lhj3wpnDHOYPJ1
         5S9RgbIsd0fDAJMevNBsXxfRx1ufD047n8TE9uROyYRCzjaT9RloxMGuJiCIl6rbbq76
         EG8yPeT9JL+R365i1P8nV6pCW9zewSUuqRIV6T5psgY/2+pn+AUlkZkurKWOUO47DVuA
         td/ohaRj8Kvy2y63pX4fDrJlbCK0X5uZNDSUAlh1pRAmCaOXUE5V1D9ctfkFZlX5QRQd
         8tY4IHkTNWY3iz4rjdqs1q43/sD0kujQiffQjRuLwj5Jir1D82nTKd9XN7Vp/yGXx+0D
         blNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793514; x=1796398314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJH1nUsnbixxIHEWvpIRBGng9yzgxFYLz8dPDZYEZSU=;
        b=MUtWuKhwkMK3lU/Q3l9EpfXJt8tC6IkKZ0CV1uEFgwcFvFDQzGxCUT90cmzDTHRY+T
         n1QJuqAnkcDqUm39hb34azhTQvjcMFS5vLmcllss9bc2ZP9IJPdbBywxcgTUog+pNOaF
         tx1s0H5ms+ccx1Pw2UTO9aGoN+bfc67pNYxJqr3jhpSVZ0t0kCUi+jqQB8Smpr8iU/0p
         QkLJIguHA8X0qkqDhh+l3EafreBgfCCxsJgn9iFsFWN4sEwh1uHNkFKhaBS6NdQL7pSH
         N67RjJLHb4YoLUdZu2jCHvxJUYD77kofdm1o+fxVDiKluNsWxZyoc8V3Xl/6WUKPEkt3
         Y7fQ==
X-Forwarded-Encrypted: i=1; AL+hErGLTiYKbu6EjIhC+fkojK8uXSy3BVO8Wbq/s4iARMMaQQnP7oYkA/Zq7vHWUaelhbnTcAgOAwHHVsabGH2evdK+@lists.infradead.org
X-Gm-Message-State: APuU4Z9hQg6AerEHj4AjguxFwLwKcdCGkxC1atf14FDnnfPpX0ZqzvYi
	MC3jCwz66DTNn+zsPs/OnLvUW2bxT0GTc+h/MDDBzeD4aYzXIAJDIz8OLjL0tuPYHP8=
X-Gm-Gg: AZFdTZdM6UsJGhnklVuFF4j1Jzwdm07PUQcwSGURapL0YGCzd2ulN6CCI0PrNZ8UXjg
	N9vVB2RRpXOJz0jjhqro7GkscXmV8yZfU2mENzCXO8o6Y030p71xdNr3wcBCeU4Qr7r7OPhH5tk
	avXxoVKfAMZR3gSOnA/xPrTIdr7+NwpGicnS81LS+tUfwGF3PGPTGCLt+/aekePqV0QR2/uu1XJ
	LX034CTRm/412zA8M82tVpWChjRJsg4AZvK5cqXYHrUTkjKoPVSLQKMXWN+q69EKYIFlVqqcrpt
	wedi4H24u72jJOu6ktTbUdfio+rK5aMvLOk2CEfrecBXlWeZd9+ygs2KpiU69U3uxoS0xsdlcr3
	utZ2bhpRihTA4X2vziH5kJ3jdB38zKOAXfZQVranJl863Re9P4T9CO74nQPO4ONLAf0qxV6eqMX
	QQLNDViykUxFQFyq4GbfH36rzK0S9qffIo7BHK8wvITWp+xkS1/iM4juWe5i+E+gWlNzc+JAe6p
	XIXUxVx5D9uTmTd4ohWPFI9iqlCPoBtKGqhqUuU4bglp/u9yZUlVNAvXkK8jzsM8zFIjq7xTTf0
	u+FMojOzdbkxFquLBf18WiRXFhcXMkfuLnJhuO6Y
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr44357884f8f.40.1795793514001;
        Fri, 27 Nov 2026 07:31:54 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm47510901f8f.5.2026.11.27.07.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:31:53 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Fri, 27 Nov 2026 18:31:40 +0300
Subject: [PATCH 3/3] KVM: arm64: nv: Update the shadow MMU's VMID for AT
 emulation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-nv-tcr2-v3-v1-3-9c15c1cabe01@pereq.eu>
References: <20261127-nv-tcr2-v3-v1-0-9c15c1cabe01@pereq.eu>
In-Reply-To: <20261127-nv-tcr2-v3-v1-0-9c15c1cabe01@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073156_252737_9B6FAD03 
X-CRM114-Status: GOOD (  15.86  )
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
v2: Unchanged
v3: Unchanged
---
 arch/arm64/kvm/at.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 893bf88f2f75..4a1767704d22 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1476,6 +1476,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		}
 	}
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, SCTLR_EL1),	SYS_SCTLR);
+	kvm_arm_vmid_update(&mmu->vmid);
 	__load_stage2(mmu);
 
 skip_mmu_switch:
@@ -1530,8 +1531,11 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 
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


