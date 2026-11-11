Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DEF606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5AeOSYW8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ml3p/AxADI1kPwVB1ta2/1LkU6QgLRbPMaZJLAyCaWY=; b=5AeOSYW85hVrBHt6EzzragrEf/
	2tnXHAWowElceoFN6x8zRqL04hKqzrbi0vNu3QRekNf3KhnsSdDvDLBhuNqrCjnKnu0pORSpIpbiO
	A8aVrU561LtvrjgL+UiAq8wgLncQvBEuS7VoctWDmHu8j/2nlXS6k9w1GcKFOoueCagMrBZe/jj5l
	DPtpXPjZihjpMZIT5BNpCOzztEhP4aAYIgyTOI/BY9aIAY8pKi5TgRfV8yy0MtHgK2J+Acj1bMt7k
	ZMGrkeiZq+GHHNA+uD3S7ztQM3qfdLeZtW8SQOWOBf2a0uyt52yOwmWU23v4NR8VeK6KLBD2KyhuO
	EvqfRxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Ej-00000006Rvf-3jnf;
	Wed, 11 Nov 2026 11:11:29 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Eh-00000006Rv3-1suW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:11:28 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so38625875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395485; x=1795000285;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml3p/AxADI1kPwVB1ta2/1LkU6QgLRbPMaZJLAyCaWY=;
        b=B5Qu9++FzrnrozUfW3hpUdc3x7u6OFUS2zfy2P1bD+gbOwkqNaC5N+MKVz1YDT8HIj
         sU8xqONF1Az0U+ux1riGyCFDHabl3IDYNH/CDCJ90kiBn8b24p0uf1BN0+E/hJ3ZwdRS
         SY/wQRsy0yoJj97D8ZTjTXJt6mrdczK3uwk3hpbUHK3e126ZXzR3fstYRhIIdlhtoA8A
         XQhIZIaATZIzmxGfZO3/fH5INe8norvSjlMBadsh74KgOt9GSBH0goq42CLpK+RWGvuT
         HclZb4Ln++GCc1RBvpG3Skf2fPKaZeUSRINkyj/RUsa/oDwFMQCi4yfmoxFJJYpV6VYD
         s+2g==
X-Forwarded-Encrypted: i=1; AL+hErGPCYS5VmgZ4ffOK6DVxto8Q1O+T6D8qowPNR58uIehUW7vxnEBVToY4HN4LczBewEFw7xPSiIWrWeljHg98+53@lists.infradead.org
X-Gm-Message-State: APuU4Z/hAv4XZ/kUt0Brnpfxt1yK7QsigSEHMXpP5Ie6lPpvdnKlS7jO
	fp/ORoW5qgitpIauuvA6Gj9mVcm2+Q28tDCuKbQmVk0Ge+nA/+1MIt6rj2wVtlv4GwfKjLv1
X-Gm-Gg: AYBFou21TCOZvAC7J4dNeJR1X0IWCqIe9ypPFO0lju+c/jEXyQLTfXklxkvuSlkrKEj
	n6xBHSrQ8vqzQHKjZzUVfmay2frmXufAiUmaX/NNpTjAeObD6xJLdoU9WFY9IRSUBHrJYv7j0Xd
	WscNkoGQgfOZdEh50V19EP39w9+nj8gepc4dvnSDa4SFqeYKL/nhqqiSk3QH6DPmZ7XxzcGvVaW
	EKdrFIUnCXxpJ4l1ZSZ17T6vAsiFEIJanvYL5HLSsHwCTAiZC+GHAhCbZCcxKdcERyus2gKi0jK
	9zGser4BvGdEEEjyavvq2xQGuNLbF6qzkq6gdUMisq6pu/hgyJsSXzciTxJM3W5P38s7fwWvwFQ
	9OX4ymGLwWeljzpX40jq5Zls3eE2Yo/iT3gKuEgSoPWzMKfAoYrZ7gd1YMLGtHQO6wNAc9RMkfO
	ylFdGx1mE0SVnHDEA03FudH3b5V/htUwdxn/EUq7m5xZ1O73RPJ5vvPX3O8MEptOaz6lGUDKqWB
	W36PjIu0i0xcPxAZ/GkkfYBo600A0ya4UPnpEKYDB4Wj86nSbZTD9U8CcawljYnlWIlME0j/6x3
	uOm0bWAGxc9811Zg4lw82OkzMnBU/aXW+n/MQEHOzANHCBUaZItH7wgtbRDBvmkKHuRJSbGTkIW
	Lj2OLYqKmerTcwbZsBEZfJyCoPbI3uCOIer8v1aeXw/nPUPesdMaFUbJR2Cxn+8s4
X-Received: by 2002:a05:600c:a0c:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4ba0938b7f3mr40085265e9.22.1794395485364;
        Wed, 11 Nov 2026 03:11:25 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02043149sm125436565e9.8.2026.11.11.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:11:23 -0800 (PST)
Date: Wed, 11 Nov 2026 14:11:19 +0300
From: Dan Carpenter <dan@cryspen.com>
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
Subject: [PATCH] KVM: arm64: nv: Initialize hw_mmu to NULL for nested vCPUs
Message-ID: <d3571fb535e1832d2a067649f294b83d824d4350.1794395321.git.dan@cryspen.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_031127_494736_EFA6ECCA 
X-CRM114-Status: GOOD (  15.90  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Before commit 6ded46b5a4fd ("KVM: arm64: nv: Keep reference on stage-2
MMU when scheduled out"), kvm_vcpu_load_hw_mmu() would set ->hw_mmu on
every load.  Now it only sets it when it is set to NULL.

In kvm_vcpu_init_nested() the vcpu->arch.hw_mmu points to &kvm->arch.mmu
from when it was set in kvm_arch_vcpu_create().

Normally what happens next is a two step process.  KVM_ARM_VCPU_INIT
calls kvm_reset_vcpu_core() and that sets the vcpu into hyp context
(vEL2).  Then KVM_RUN calls kvm_vcpu_load_hw_mmu() which doesn't do
anything.  But that is fine because we are in hyp context and the
->hw_mmu already is pointing to the correct place.

However if, for example, we are restoring a vcpu that was saved in L2
context, then the VMM uses KVM_SET_ONE_REG to overwrite the vEL2 state
that kvm_reset_vcpu_core() set up, and the vCPU is in L2 context when
KVM_RUN loads it for the first time.  Ideally, kvm_vcpu_load_hw_mmu()
would set the hw_mm to point to L2's page tables but, since is non-NULL,
it leaves it as is.  At this point L2 can access L1's memory.

Fix this bug but setting ->hw_mmu to NULL in kvm_vcpu_init_nested() so
that kvm_vcpu_load_hw_mmu() always sets it correctly on the first load.

Fixes: 6ded46b5a4fd ("KVM: arm64: nv: Keep reference on stage-2 MMU when scheduled out")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
 arch/arm64/kvm/nested.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 78fa433774c6..60bccb66e52c 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -140,6 +140,8 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 		kvm->arch.nested_mmus_size += S2_MMU_PER_VCPU;
 	}
 
+	vcpu->arch.hw_mmu = NULL;
+
 	return 0;
 }
 
-- 
2.53.0


