Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C123606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SMUs7jbh;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=LfvPAdQZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OKPy0Il+wJ56FOWGfFGGjchypiWTwMVJH42Ujm6j6NQ=; b=SMUs7jbhRsOraKLQwZv535FFdn
	8Ew8Y4dXjZ2EqT3BTzRKbvQDr+2AlilW8aVGcz+WVSkSdE3gNWjSDxSpEXX2nAQz2PjWNn1IQfvHK
	tk/kwSWWC7yDFHY7w+PiraPRVIsXAO88D4xtuPbx2FfWP1jmXSYcWk32+utcTjKhM3J+jqk3+2MZT
	olYsRenXup542GncbpVDwxA155bbxiMEiTW6in/DP0t8vb03sD6Vsu34y571HyU/yXm1ZsBx1j+W8
	UofgNu+A1UDcV8lwhl3R7gUhxTIeaLlxKTJZq6u47fWHHzMOKWUdDMmREqksbCvbgLUdIlq8KM/ZK
	eOG5U4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfMQ-00000008uX7-32Fk;
	Wed, 18 Nov 2026 13:06:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfMO-00000008uWQ-2cin
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:06:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso771549f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 05:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795007158; x=1795611958; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKPy0Il+wJ56FOWGfFGGjchypiWTwMVJH42Ujm6j6NQ=;
        b=LfvPAdQZDVb4L/GtXRnQQrmma1s3EeqYJHoeSElT4sNfLjLqhEIl8zinFfQ0u35gXo
         LmaSOIggUTbLK12lUBVAhMJ5KsnH25vHKfDroyNzBRslq1BzLgfuZCQhqqrjFIaPNzCC
         xB0CObqkxuwHa+w2MW5jrgeJK31mx9ciirZNPcQRe0HnzmuEmP0zZ5PFxTutzudoSSHd
         ZUmkIFkSdU2GK99SauJF0RbVdatfoOaULQYjobK18K/up3XobkIbW9d7MNUCc7bMrQT2
         +KgE2Wa5X57rueiYT7j4zK8xEwmJpwRgCOpf0O1j0oUmCdMznsT+oYhjttptYJ8WsRN8
         5PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007158; x=1795611958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKPy0Il+wJ56FOWGfFGGjchypiWTwMVJH42Ujm6j6NQ=;
        b=ev1YqrFY/yG2E/jmLSGWdToljH0f10f4YC2smsMmlrfi9DS5iWwR579z9FpZpSe0wC
         j/YeM6UtP2QBCL0uK5Cb5sxCFpBIebyoFO2YPcQgO17kaeYdcU7LYXuOmznb0PAEKj0H
         C6vKnOg0OKCTvYc5xpkRgTtChg3wBHDW7pPrHv4qeoF6/01digbVNlA5ajI+crmygQuW
         RchgnTGfigsyLrHPPER9KNzoISGgrR6RgHAbmp+YDOLRSN02GzhY8nO7v7MCDhO+re8N
         j7HmTVRpdc3nMb2B3xpddOR0TG9Xw0RQmReL+SQRtHrID9BSSuQuEHrKFmGYWgfGP3yU
         FQxw==
X-Forwarded-Encrypted: i=1; AL+hErFC+QETdxwH12FkdGXyLnb1jvq2npzAhiYLgfOtDqu6U+LNsA+McaIntVOOJM4ng5EHjsBWR62OgbZyn2YMyS3w@lists.infradead.org
X-Gm-Message-State: APuU4Z92CpGeGjjez5Wh743L22y2JWXbF8fT1U7BJIAuAHSPedpRfuib
	ViUl+Ad4iFNO97zQgjjvEcua0baxmiIc9SA3z8nVNSmPNR0K26zPjlTbFJ032BQsMtE=
X-Gm-Gg: AZFdTZemIZjt7O+7cYCNuuE9cl5DOXpTtNLMvKkr5FTg2vJUXHQf1qhwJ7qIHgdOcAE
	ljf10nglzxyncyqlrVXZA9MBwvldAY1ES03XKZN8WoO36jum7K1OC86mZbdP7uFL726vre/QcZI
	L+rEdRtXNmY58eUdQyPX5VgZutrfjh+Wfa2n4nkxbLqxt7k8betG/AnhIwKNvQqGVUPAkwfQ7Ui
	NevUhGUQcm2M3Ae4Iz2m83s78cf6oJEC4SYSlFRHO8xGVJsHWwfTISDeiCESmIkkDXOnfA+2UTM
	xrs9gWmtsbEWAJnvNl5bm2U0tlZjcob9mWvLVeXm7rJXIlf37lto3/pPfHQIFOibGmVv688KEox
	iuOlx+6dMdVFMpDeNPeZdje6xrfX84LP/Nd8KY7zFRINjyzdb6obvH49Z8dwKOguz9qp7cwdCYc
	7gLwmpWKi5Ibty+0vuRdZxxCUsPhSLXCcJzRDLIMSAYKeKVCwWnKGl36Ga8B/dQ1RBluL9UeMJE
	zok6OH2UuGfkI4rg9XtdCZHcm0M+SjuTw6u6Kb5UCXkapL669hs6VCTnz1VJFejYViYDBU9fFqQ
	WiGcgmnvgfzgWTthgcM=
X-Received: by 2002:a05:6000:3cf:b0:4a6:5a2a:f4c4 with SMTP id ffacd0b85a97d-4a65a2af4e3mr5264577f8f.37.1795007158296;
        Wed, 18 Nov 2026 05:05:58 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11f1csm5156596f8f.53.2026.11.18.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:05:57 -0800 (PST)
Date: Wed, 18 Nov 2026 16:05:54 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Congkai Tan <congkai@amazon.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Haris Okanovic <harisokn@amazon.com>,
	Stanislav Spassov <stanspas@amazon.de>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH v2 2/2] KVM: arm64: nv: Fix NULL dereference in
 kvm_pmu_nested_transition()
Message-ID: <0f35f6e21bec19774e23c991370488fa99fb37da.1795006659.git.dan@pereq.eu>
References: <cover.1795006659.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795006659.git.dan@pereq.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_050600_690919_B4544A3C 
X-CRM114-Status: GOOD (  13.05  )
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

With the KVM_ARM_VCPU_PMU_V3_STRICT feature, kvm->arch.arm_pmu stays
NULL until userspace selects a PMU with the KVM_ARM_VCPU_PMU_V3_SET_PMU
attribute.  The KVM_SET_VCPU_EVENTS ioctl can inject an SError or
external abort before that which leads to a NULL pointer dereference.

Unable to handle kernel NULL pointer dereference at virtual address 00000000000001e8
  kvm_pmu_create_perf_event (arch/arm64/kvm/pmu-emul.c:710) (P)
  kvm_pmu_nested_transition (arch/arm64/kvm/pmu-emul.c:1357)
  kvm_inject_nested (arch/arm64/kvm/emulate-nested.c:2927)
  kvm_inject_nested_serror (arch/arm64/kvm/emulate-nested.c:2979)
  kvm_inject_serror_esr (arch/arm64/kvm/inject_fault.c:365)
  __kvm_arm_vcpu_set_events (arch/arm64/kvm/guest.c:827)
  kvm_arch_vcpu_ioctl (arch/arm64/kvm/arm.c:2161)
  kvm_vcpu_ioctl (arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4772)

Return early if the PMU hasn't been initialized to fix this.  After all,
we can't transition a PMU that doesn't exist.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-217134@kernel.org/
Fixes: ad220e275c39 ("KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: This is a new patch.

 arch/arm64/kvm/pmu-emul.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e2b28dbc0451..388a6244e7b2 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1342,6 +1342,9 @@ void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu)
 	unsigned long mask;
 	int i;
 
+	if (!vcpu->arch.pmu.created)
+		return;
+
 	mask = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
 	for_each_set_bit(i, &mask, 32) {
 		struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, i);
-- 
2.53.0


