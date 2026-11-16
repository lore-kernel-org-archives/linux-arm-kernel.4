Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A18606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lBH3/zDe;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=PzUsyI0U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rYZSKiWzbzGDSkOFczv6tAqyqip908dCHTB+bDdlwYA=; b=lBH3/zDen8W7NEWkG58gUDFcYa
	gFSsT8D6zza5T9cfny37nQxGRsu3Z2OsaNBRcSJ1aWzaGIaz+pDEgOGZPeOVrFyfcRAxsotyHxshx
	ggIx/TUP/NNm1Uo893c0OKxITZ27ppfPwQyY1leqOYf0CVPsIUwAIExvJDNsJn/SuVeL/QN6d0kkN
	lA+Fc2OUjBTtUExy7K3Nal/rtCuQ+oWKnjFmsZBvhHYjDGouXHTPoSmWYnLYKYhU2tH18OJi4QHRE
	A5uYCIS1yzxMznvmy9qPO9xn2U2d+J14rLDQGyL5r4Ih012/gq8T6veX28mNyOekynA+ih9eek5B1
	Ryfrj+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwxJ-00000002fj2-0Y3v;
	Mon, 16 Nov 2026 13:41:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwxF-00000002fha-3rvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 13:41:07 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c4d21051042so91903666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 05:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794836464; x=1795441264; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYZSKiWzbzGDSkOFczv6tAqyqip908dCHTB+bDdlwYA=;
        b=PzUsyI0ULXaZtuk8UJ6Zqd1Ufww4nrIlcNixCtp3wQAWim/L1ZexfrpSOAgDg02YPn
         GXiS3DrVQs/dhOTs7hIyUVvsPM1xtzCoicl2t1zsWdYo9BGCALSmsViWZ7zXg3K6/41a
         eiL20zo+cc7KmgXCQcrV/XpAzs4x/lZ8kdcW8mIqHD0DlAe/8otQoxFGukGDcKN98nDr
         evah0/NFB9NVAd2zSsTfiqwseXQrEDc2P+eZzp2BCKyMN4BK3B8kH3Bfgx7GDOZaIgIe
         KOZY3zdAmP9JLlD9k0U4mmmHbIrKP6B4dT4n7m0U/BG0GOkxNQ8BlPy0J5f3QyVVW7WZ
         momQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836464; x=1795441264;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYZSKiWzbzGDSkOFczv6tAqyqip908dCHTB+bDdlwYA=;
        b=C7QK7rEA7AvVnPREzrqQVWiKwOX1xbkVHnyCdxpcIVlw8YwvAC6BiOAQmOxmb+S5iX
         qpzsB1tEcqEs9ER8l+fX2dFLyZOiBSlkpo6XbbM9qtqxdrUHJ24FxtejhLe9ebP0vIh0
         Y5wGgsdCDKQA95B31/vrplljDdtqgD2eJVe9NLBmF4tcMQUmj0u0jRZYx3dQhmYFgJ6j
         hslCpejBeFJWaZIRSDwk+Z9jc9O4h+CwX0XlA6g+p5NY0qa3URb/nUvhq/XAV3d8AZ+h
         PHbvE5PBVNG8z7bCdbYwzKZQEhZ+5gxucaVWCkZHaj3Ukss+7txvYVL0eHq+yOfor2Vm
         nS8A==
X-Forwarded-Encrypted: i=1; AL+hErHKqwbXvkSyE3NyhqnwkfVW/ZiK8VGiP/93HV/oBhymAzT9yJs2CMIi5D5yCg0y0pBiR5qNL2yd5breNmP0kZXE@lists.infradead.org
X-Gm-Message-State: APuU4Z9gFgllu5yF848ljUOD6C2UWRrsipfyDf/0e2jd2kUAGKO6DVY3
	Kjh4kS49ynCGWRoZ4pmS2Crjb9QwKoXkXqhoaGgb/F1KlcvBE7GPUoroFzz0oGcsHH8=
X-Gm-Gg: AYBFou3A3kGZRprhKQfy9RR5/1zQZKRBsDXCWz0L1cPnMOJITKKxmyHgAA5J3T37UUY
	+GhW/7r1dtynNjUpAMKdd4L7x/0K6P9Uw9Jaa8ObrFfmgtupAt5MxPrRylcxdyBpDvROQengnPp
	ygTlUoCKduZSCKW2LLCktrBNQKtrcGSE/j81WuGHIzS74WXkPngmwySL5kBVBSiIF16XM0BGoDa
	0t8New4zUSOf+IKH3jqpHRhtt+kzDoiaMsMUYu5qhRn4PCkeHvac+uGdq2OH6Xj8ZqsDe6bQICz
	Z6lrSXXo31qIS+wpXj5qN09S3maCKLtr+Ex5VdHOenjOFaZdGZKTrJYc9r+uDNKjdytdx2ovdWF
	vdHUOAUmic1r43+7nLbeU/ip/o3/I48Bn4uXjTAHcxr7vezvhYR9sb5x/1T88MyzTJ8loUkh9yk
	zCSe8HzrdrCfgXG4dl0cVW5Nc4j0jHraf/VrKHU85VqG84TJrLQh03Sr/sHd4/ci4Clb4gBznVG
	vN4xqMzJzTWyIYo0bGBHpO73zHic4Hzx7XoR3bwyDz8QzAmiGTz6+1o5M8RCqbzJwsdGDopIkqk
	bWtesdpu0lvR9/8YbtU=
X-Received: by 2002:a17:907:9492:b0:c2e:52d6:1fb7 with SMTP id a640c23a62f3a-c509636a2ffmr771296866b.22.1794836438561;
        Mon, 16 Nov 2026 05:40:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm426229866b.25.2026.11.16.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:40:37 -0800 (PST)
Date: Mon, 16 Nov 2026 16:40:34 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: nv: Fix NULL dereference in kvm_inject_nested()
Message-ID: <avsH0lxpLIF2Ug64@stanley.mountain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_054105_980250_EE6FE75F 
X-CRM114-Status: GOOD (  15.59  )
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

There is a NULL dereference of vcpu->arch.hw_mmu in kvm_inject_nested()

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000084
  kvm_vcpu_put_hw_mmu (arch/arm64/kvm/nested.c:1046) (P)
  vhe_vcpu_put (arch/arm64/kvm/arm.c:827)
  kvm_arch_vcpu_put (arch/arm64/kvm/arm.c:860)
  kvm_inject_nested (arch/arm64/kvm/emulate-nested.c:2903)
  kvm_inject_nested_serror (arch/arm64/kvm/emulate-nested.c:2976)
  kvm_inject_serror_esr (arch/arm64/kvm/inject_fault.c:365)
  __kvm_arm_vcpu_set_events (arch/arm64/kvm/guest.c:827)
  kvm_arch_vcpu_ioctl (arch/arm64/kvm/arm.c:2017 arch/arm64/kvm/arm.c:2157)
  kvm_vcpu_ioctl (arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4772)

KVM_SET_VCPU_EVENTS does not load the vcpu, but it injects a pending
SError or external abort straight away.  If the vcpu is in L2 context
and L1 has asked for the exception, kvm_inject_nested() puts and loads
a vcpu that is not loaded.  vcpu->arch.hw_mmu is NULL when the vcpu is
not loaded, so kvm_vcpu_put_hw_mmu() dereferences a NULL pointer.

To fix this bug, only put and load the vcpu when it is loaded, similar
to what kvm_reset_vcpu() does.  When the vcpu is not loaded there is
nothing to switch: the next kvm_arch_vcpu_load() loads L1's context.

Fixes: 9aba641b9ec2 ("KVM: arm64: nv: Respect exception routing rules for SEAs")
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
This was found through Pereq's formal analysis but the stack trace
comes from real life testing.

x86 implements kvm_arch_vcpu_ioctl() differently and puts vcpu_load()
at the start of the ioctl.  But the way arm64 does it is deliberately
and just something that people working with the code need to be aware
of, I guess.

 arch/arm64/kvm/emulate-nested.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 2bec81668361..22ca735a34f6 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2862,7 +2862,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 			     enum exception_type type)
 {
 	u64 pstate, mode;
-	bool direct_inject;
+	bool direct_inject, loaded;
 
 	if (!vcpu_has_nv(vcpu)) {
 		kvm_err("Unexpected call to %s for the non-nesting configuration\n",
@@ -2891,6 +2891,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	}
 
 	preempt_disable();
+	loaded = (vcpu->cpu != -1);
 
 	vcpu_set_flag(vcpu, IN_NESTED_EXCEPTION);
 
@@ -2900,7 +2901,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	 */
 	__kvm_adjust_pc(vcpu);
 
-	kvm_arch_vcpu_put(vcpu);
+	if (loaded)
+		kvm_arch_vcpu_put(vcpu);
 
 	kvm_inject_el2_exception(vcpu, esr_el2, type);
 
@@ -2915,7 +2917,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	 */
 	__kvm_adjust_pc(vcpu);
 
-	kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	if (loaded)
+		kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	vcpu_clear_flag(vcpu, IN_NESTED_EXCEPTION);
 
 	preempt_enable();
-- 
2.53.0


