Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FE8606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/NHigUz;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Rzczyjon
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+KzwTxyJe1Er1zgZJn5wO+VPIKKM9MReJr20XBLcIEA=; b=H/NHigUzyEaQ1o
	bf0ViiTGpV6CUGxiMeMVXieXkFdkV3DluVk07xGTD10rXYiwMepwJ50tXs7qWMB6kL+k8yg1u79SH
	Cf7tbANeYzYNhJJTk8fAXmPQxQwowVaAvmKR1waTKLNB6B/NLX/YmeCyzr1ipPiLYHOuBng+WfpQx
	S/dIIKd1yx6Rta43smfgPvXY1thkVK/6nRCaLzg2ddGzH4wAjAEnsUTjFTPwEO00R9QBp8yC7UHY/
	h+jhNOx0ZEpW2+aIFUeH4PXnMKI4DNbNz3YpdTIdPpLDKjvhAXHthkrgnk9ck0eyFkWzcpA+WzH+g
	2GiVPpvhwV4/JOt+SPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29d-0000000C1s1-0u8L;
	Thu, 19 Nov 2026 13:26:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU29V-0000000C1lq-2iYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 13:26:15 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2036041f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 05:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795094771; x=1795699571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KzwTxyJe1Er1zgZJn5wO+VPIKKM9MReJr20XBLcIEA=;
        b=RzczyjonHUcLK3HNAgA+6eOYesB1LozjhmtqmqiqVVzptYs7Te2aJy8jL2v5p54Elp
         jg9Ryj+leGNzAmjRTdWgZOgE1MkG4u5vWVRNS7ta99jP8bsvWkLHhDpHUtJGwl/DgFIC
         j6xtRebZRw1SRlhYJOxPyKVqHXK4ArUScLYXtNSr6LJ7NTAmgHJvToJYuJNa4XxHlaLL
         B7aYgWfQfSTOIMb7QKftHkLzVHF0R4c4ernMVn4qhH+wLIyz+iTgqotSm6SaCHWt7stZ
         s1yXEDVg8qDgFVPFGWZpwnxmpfS8KmunOLoPb8syavemvSyXCd87+6Y7InRGIAUx0txu
         paxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094771; x=1795699571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KzwTxyJe1Er1zgZJn5wO+VPIKKM9MReJr20XBLcIEA=;
        b=fqdu5yeoM4FpafJ9597CFFAEvRnW404+iz4529+qIfPBtOOmxq5ZnXZKeWFWZAlChK
         gvliWH5mamfrYaTdernGiSx8IMHc8MmykKH7AmMo8C1sfXcmQiOSbBhBOKjlZCqRRNP4
         TjVvQfzJz6CI2FE2jPmynWam5eeQR6SOo1Lp4PWOcBwdFkVe9a7RjFaq9Irc7kGBuYFf
         KYBgFPeW9MmuslyZ4QgkdxLkdyJ1C/K32XTo8JsRUW5w2IGU+JfbB1MqdwZsxH+Aywnh
         Vpn0Dx+4h8KwOKORB0dP7rtGykDwSqplCNU85BRaTL+C2vXjjBcL1aZTwquPgjZeXk0H
         DpSg==
X-Gm-Message-State: APuU4Z/6j6+B4EP9yrvsEd/HkMDm7wgdKNtvLAZckjzZRCnfey2CQ86D
	birouqiICKbHnNv3XIqAYt9EZU0yDdC6ioOA4zeYsIFkkitxXPlGM8RqXlUIdEfnIgg=
X-Gm-Gg: AZFdTZcPwOJ2rJzY6PAJlrJTmAUAQuXV8CbnijhfjiWs6RDfbweHvGLAT2zI2ZjXVRF
	HKranS9RFlmwADItLNTOKScucvyo9b1s7CVM22mQOZd+ol9228WkmtNu/yvAuAqpdj9EsnBJ2Ou
	YBtPlAFxQ+PjipZcg+3gzAi/TByXpoK8OWBYo5/xP+PsY8WDZ/meBccixjENpyyQCkmbAg1glIK
	0deXzxro9V9jABASOdgdF6aes/0MqLvBP9AllnxI5Zhmnbjnn7zzCBQiOxB8oj3YWqg6vEf6+jN
	AK8qTbiAmoUCV6rzAgB28XyBi409sDAFxEsrFCIUdFmhj18tZNd1BJb90wFbLnVAHkIrxfbd4hV
	7JFXXpg2u5aX9rkIzKVABqBdgX5zTk/8JKwfH0eimMkfczIeDECJrTrCA7L38/bU3pC1AOi9RsD
	SNNOYYlZ8syIFm414tryhXseawby5r9BZdJIqYWjVA40JIoLV1l7DjOj2d9T70+3zs7uW87ECOF
	88kglE57bKnJ/EjQ4a1PnoOuktmtqMey7ywc7/DXSj7kIRhv9ld7Er6Kdkn8E9FauVEQvoruaqp
	fjKylcCDFH/ourZ4LzU=
X-Received: by 2002:a05:6000:4555:b0:4a4:7328:21f1 with SMTP id ffacd0b85a97d-4a63ac6be9fmr8858836f8f.24.1795094771068;
        Thu, 19 Nov 2026 05:26:11 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573bccb0sm10584515f8f.55.2026.11.19.05.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:26:10 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Thu, 19 Nov 2026 16:25:37 +0300
Subject: [PATCH v2 4/4] KVM: arm64: nv: Update the shadow MMU's VMID for AT
 emulation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-nv-tcr2-v2-4-3deb1a6cdba8@pereq.eu>
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
X-CRM114-CacheID: sfid-20261119_052613_746779_C9569624 
X-CRM114-Status: GOOD (  16.97  )
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
---
 arch/arm64/kvm/at.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 9dfabd0586e2..5924cfa01bd4 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1476,6 +1476,7 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 		}
 	}
 	write_sysreg_el1(vcpu_read_sys_reg(vcpu, SCTLR_EL1),	SYS_SCTLR);
+	kvm_arm_vmid_update(&mmu->vmid);
 	__load_stage2(mmu);
 
 skip_mmu_switch:
@@ -1523,8 +1524,11 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 
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


