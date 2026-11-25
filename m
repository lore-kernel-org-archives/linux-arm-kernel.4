Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C858606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mtBqiC7w;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=La4UcxR8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MFSOXianfxaj57yMPDU1y2qVIXC/Ket1cVe0mZA7fvM=; b=mtBqiC7wE/CjselPWfifBqLFxo
	kBAssncHvT8/b5jW9+LaQwhSI7IKiGhQaOdEYKOKb2D8J7IAqjQbYYcNU9SMAQ4DSnf880dII1Hlp
	gbz4xexP6vRBLI8gcjd9JN6jjoNhTZQzaCA38Z2vKZMF5xGKhsw/69JmuiNJkLLXDZ35TEixk2NWx
	HapiFLxeuLhxzr0RWUJlV5fvfp7B52JiNVpbTUULM9WfyJJc6nfSklzue71/70msnOfa4Vc680nSk
	hIvD0d/OeqcZrC/808blcG4K5hG8/7JoT64Js8v/CmSx+pbdXQTG0f3bU+KjtC7vMHiGXFjszTbkH
	wMgPh05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC5W-00000009pEo-2m5d;
	Wed, 25 Nov 2026 12:27:02 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC5T-00000009pDj-3B6k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:27:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso1725449f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795609618; x=1796214418; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MFSOXianfxaj57yMPDU1y2qVIXC/Ket1cVe0mZA7fvM=;
        b=La4UcxR8w4hbCljU6c5dw1SOzEROSsVSH077I4ctJGidarWGBnfDyo5wCArV09/LV2
         g7g8+ecOhs7w//9zXf4wH/tgONwHxaXreZHedGam9t5Bb7vvTSEPYne0T1kjahOeax1Y
         7Nxkbu6UrO6ZZ13HctWm+Ld4lGjIceYCveM2EX2giG+yEaF2ljGzklBAxA9luJSIu4LP
         pExbQb/DAIf3odqXG30yGxcqVbBlwCsXrT31Rw0+ORa12oZWqS2vz1/gIPPtOHjxrqAp
         L9Z/a+giCEblcLMpcD3yI3G148DwIjq2MgG4MYKFZt9+5Gve9/VOfRl/F3l/AXkP4HLl
         Rlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609618; x=1796214418;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MFSOXianfxaj57yMPDU1y2qVIXC/Ket1cVe0mZA7fvM=;
        b=QGRslLij20gWdDegVFpmaG0CVtU+lnzdZEAH6lU2M9b3+B4NiWC+LPhJl9KupWTV5z
         3qvatX3TzW1in0KTSPWmfzJshdZKYfTIBpG28xaEdXol80Qi8Kq5q6LxW36uuQD2gDpT
         XMvuiK9aXzZjY5VwxSxcK2u6gtcMCZBjp5KUV7Ez8EjYaavJ9H+DG1uM5vEiFW9n2ezJ
         BN7q+8exS9tk/uKcP+EUe8kCpX/SmiOPHNof0GxzmVBsErzJiuOdTp6PNs9lrwAmp111
         gjbpMY0tpZ0JmrEqr5zNGn+4amO6vMcnVcmxBqjmDdf6oaPeUrc11wkmv0FsqS5q5SXh
         YLiA==
X-Forwarded-Encrypted: i=1; AL+hErH1SHwAHVnyVSDui0RhnOikZo+k8YXC5GnRR/70D1Ei1CbMXiuPfOkI37OCkRzb7s+3gr5q/sp0wFQPNM8GFK14@lists.infradead.org
X-Gm-Message-State: APuU4Z98ZWto28T3/v4WgLJbzgtHhyQDyIUymKnlj2mhW5UpXdYeCZrK
	AyU7g0Akdtby/0NTnbuyRf5WVpVKy5uj+23jxAFbbYDUWO3IQ5bE+I92VJ19N/lmesU=
X-Gm-Gg: AZFdTZeAxaDBxDd7vryfIvBCpNsHaRd+QtEXOrVKeu0aExV1dTZX5FmPiun6zKfVbiJ
	e+cKoHN2GH6GTg9+nOzB588W5JrQ8kUgSV6qWHsH6hWOpWHDlSTDhm2jhs1T3+oIbtMuzVUUfmf
	U682GpPworVccRBDBBr3fiNlcLZOUbsUC+oAjxWXFHzr5AR8E9ntTuZL7MxzAZn0szuX7IVbbOE
	vGCoa4SUqN/jUBFLqS89rpSRA9Dmoikxkt26jPWA5R7WwSRVomd1jVpX1lWYXsmsWmUia3yrWX+
	LXjMN8Ln+9NKOLpFbsO7BPlxrrCQgPp8i9hBHb4w8LRTi8BGhA/CWS/ThBdM2ids+mxdqccUGIA
	d8iZiVVmYtqWe3idHJeGtKW7f/BL8zzEXrREDIdp7rRVWEQZ02IlH5N4gkj4AF+8u5qj6oq5MOW
	t7N1HwmeN+4Tl8wbgfHIgtol+SKtAStLcBw1qMSnyWnMhzxSC4flzSzvP5DyqtPVWQY127OC9wS
	bqZ3jL9aBMxoGHJguhHG3gCXITnb553KrNQ9OI1g4axrlJaciTuVuFnY5ku4K8Bph1E0FMI07LK
	JaAfS+SxepbfQ7A62CU=
X-Received: by 2002:a05:6000:455c:b0:4b2:1d92:211b with SMTP id ffacd0b85a97d-4b21d922811mr12250324f8f.17.1795609617689;
        Wed, 25 Nov 2026 04:26:57 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm34272184f8f.4.2026.11.25.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:26:57 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 15:26:47 +0300
Subject: [PATCH] KVM: arm64: Drop a pending MMIO access when injecting an
 unmasked SError
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-serror-drop-mmio-v1-1-48076f59608c@pereq.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WMywrCQAxFf6VkbcAMVYq/Ii7mkdoInSmJFaH03
 53RpctzH2cDYxU2uHQbKL/EpOQKdOggTj7fGSVVBnd0ZyJ3wrrXopi0LDjPUpDC2LuUhqGnCPW
 2KI/y/iqvtx/bGh4cn83TFsEbY1Cf49SiP2PrYd8/9QctN5wAAAA=
X-Change-ID: 20261125-serror-drop-mmio-1bf42dd8841c
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
 Dan Carpenter <dan@pereq.eu>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042659_823682_E9DAA43E 
X-CRM114-Status: GOOD (  15.81  )
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

Oliver's commit bfb7a30b1986 ("KVM: arm64: Don't retire MMIO instruction
w/ pending (emulated) SError") established the rule that when userspace
injects an SError that we drop the MMIO.  An MMIO access dropped this way
runs again when the guest returns from the SError.

However, since commit 3bd107ed6b23 ("KVM: arm64: Only emulate an SError's
entry for vCPUs with NV"), a vcpu without EL2 pends the SError through
HCR_EL2.VSE instead.  The next KVM_RUN completes the access, and then
the guest takes the SError.  So the behavior is not consistent depending
on whether the vcpu has EL2 (MMIO dropped) or not (MMIO completes).

To make things consistent, drop the pending MMIO access in the non-EL2
case as well.

This change only affects unmasked SErrors, if they are masked the MMIO
always completes.  Protected vcpus are left alone, because the host's
copy of their PSTATE can't be trusted.

I discovered this inconsistency while writing a selftest and I don't
believe real life users have noticed it.

Fixes: 3bd107ed6b23 ("KVM: arm64: Only emulate an SError's entry for vCPUs with NV")
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
I think this patch is correct but it's also easy enough to modify my
selftest to accept the current behavior.
---
 arch/arm64/kvm/inject_fault.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 1d5dfd4b9e00..91b835bc939b 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -396,6 +396,14 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 		return 1;
 	}
 
+	/*
+	 * Like the emulated entry above, an unmasked SError cancels the MMIO
+	 * access the vcpu exited on.  The host's copy of a protected vcpu's
+	 * PSTATE is stale so checking serror_is_masked() doesn't make sense.
+	 */
+	if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu))
+		vcpu->mmio_needed = false;
+
 	vcpu_set_vsesr(vcpu, esr & ESR_ELx_ISS_MASK);
 	*vcpu_hcr(vcpu) |= HCR_EL2_VSE;
 	return 1;

---
base-commit: 4a1b7259e337e8a2ea999436b47151a75c7572dc
change-id: 20261125-serror-drop-mmio-1bf42dd8841c

Best regards,
--  
Dan Carpenter <dan@pereq.eu>


