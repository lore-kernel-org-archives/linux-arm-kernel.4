Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596B7606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bgCEyOBh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=T4GEtQyn;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nTtqyQ+t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SujFBGnh6yTulhxhe+ai56SzIpUdalRGR1bKdRxm9dY=; b=bgCEyOBhtaxqt0
	eBnqNvGxmLQKb236U13SAokIAlEMvmwTNs61Pr8auRK+syxBpk09LQ6slwzJQSDyulY5Lz9bAkW7r
	Gr8gBubctWW/U2b3EHmMFvFKFA8sJSRPxaTFS36u74V0z3oM7k3C84fxWRI6EO4k7auiWCkmQSd3N
	Z7qcz5Ciwh3yEtUV0tD75x8QlWRR0Cm70KAc0o6hjUWTQc6ea7SjuqDKFMYOC6kUVjwEqMClS8gSV
	kHC1dhqVkfKwG2Z8IVpQe7pkQAQEbvEvj7qTfsyJ58+7w4F7pBOa2ZYzJIUa9ypw+MDBt1PknbaFu
	wiv3KITQkKkJoBMAdFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThSE-00000009F6a-1nUY;
	Wed, 18 Nov 2026 15:20:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThRr-00000009EnH-1Oi9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 15:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SujFBGnh6yTulhxhe+ai56SzIpUdalRGR1bKdRxm9dY=; b=T4GEtQynR4H2oKj5yJB9dsqLMU
	/u8ZWj9V1Y3qpmyM4xheZOrV41Lehb0vvab4W5fSTfdQJbsu2tw/p2ZtvrJCQYEL6LdAWT+1vyeWT
	IIYx/8PVYLv5SJyH+EaGh8+YGfwAFC/fHC1WaCOxfMVeZyaLJfGS40U+0BEwuniSfHsZyCOtTorqy
	tiCvwG0u7rkkNuhTy2Z753n5EpJMmjbopURhwhTBkDEmRv/ZLE+MvCVql1EWrhKJwIm2SAeaVX5ID
	p+y6psOyjqltzwFR7n/KjuSXkSAcHrRDA962CglhVx96cPEPrrXgxYGHeJ/YYYpYEnJLdscJz19U/
	+VVfJ9VA==;
Received: from out-1.mta1.migadu.com ([95.215.58.1] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThRm-0000000GC8c-0Vme
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:19:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LaHx7qcqjbwEKcmj0Cj8QcEXuKFYCBuqRrKkPXxYHjQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015180; v=1; x=1795619980;
 b=nTtqyQ+tY34a17lqzHxa4NvK/WH2RL9iNEMV9574d37qvkRmAhpvU+1N5oZCWnzak9prDmLE
 NX+Z7ct8eSllzk/mRLA9CdW+nL5PeUvkQJI76iTOsGUAMOeNs+Ik0FynDAH9fGYjkR5xG9hmhY3
 5ab/P81YhtRlL3G6D1a36Xuk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e544babb2f80ab37;
	Wed, 18 Nov 2026 15:19:40 +0000
X-Mizu-Trace-ID: e544babb2f80ab37
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/13] KVM: arm64: Deprivilege the host under stop_machine()
Date: Wed, 18 Nov 2026 15:18:58 +0000
Message-ID: <20261118151904.4099560-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118151904.4099560-1-fuad.tabba@linux.dev>
References: <20261118151904.4099560-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_151942_020389_2D3C9914 
X-CRM114-Status: GOOD (  14.79  )
X-Spam-Score: -0.9 (/)
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

pkvm_drop_host_privileges() installs the host stage 2 with
on_each_cpu(), and each CPU goes back to running the host as soon as its
own __pkvm_prot_finalize() returns. That doesn't work for the ITS
takeover that a subsequent patch adds here. The other CPUs must not post
ITS commands while the driver switches to its copy of the command queue,
and a takeover that fails has to leave every CPU privileged.

Finalise from a stop_machine() callback instead, so that the takeover
can run with the other CPUs stopped and before any CPU is finalised. An
error from any CPU is still returned to finalize_pkvm().

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd23..16dfb249b4961 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -11,6 +11,7 @@
 #include <asm/kvm_mmu.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/stop_machine.h>
 
 #include <asm/kvm_pkvm.h>
 
@@ -312,25 +313,19 @@ int pkvm_init_host_vm(struct kvm *kvm)
 	return 0;
 }
 
-static void __init _kvm_host_prot_finalize(void *arg)
+static int __init __pkvm_drop_host_privileges(void *arg)
 {
-	int *err = arg;
-
-	if (WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)))
-		WRITE_ONCE(*err, -EINVAL);
+	return WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)) ? -EINVAL : 0;
 }
 
 static int __init pkvm_drop_host_privileges(void)
 {
-	int ret = 0;
-
 	/*
 	 * Flip the static key upfront as that may no longer be possible
 	 * once the host stage 2 is installed.
 	 */
 	static_branch_enable(&kvm_protected_mode_initialized);
-	on_each_cpu(_kvm_host_prot_finalize, &ret, 1);
-	return ret;
+	return stop_machine(__pkvm_drop_host_privileges, NULL, cpu_online_mask);
 }
 
 static void __init pkvm_selftests(void)
-- 
2.47.3


