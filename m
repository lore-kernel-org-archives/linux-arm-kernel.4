Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA59460A5BC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2WGcEiWL;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oN8tFfM7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=; b=2WGcEiWLvHy9pmjo+02noTi2aY
	c0txbZaO+hbsut7sNwJDFO/uzDv+wmchT5dqdpkIzcJS8WezaevUB413V3sSkmvkW0JvQexbOYrVU
	Mxr8FlbOGNal/YLTsN7v4KgaIAB/00NLZZ3q6+3MI/s6rRSb3IuxFU/4+JbUJiHIz4yMc7c4hQNaJ
	TtI5wK0qxlnx82D0gdoZpMVrT1BR119nIgK1HYtunONwfnfykZPFVXeI+QoTRGFUk1uhoRVOj4tcI
	xx4l1gW+s64uM4Fch2doTe0zvbi62tgC5I6a15WIfLt/iDy4tMgGVyKTbS2hg85uGF8rHkMfQ13zS
	8vOaiPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FP-0000000D490-3m2C;
	Thu, 19 Nov 2026 18:52:39 +0000
Received: from mail-oa1-x46.google.com ([2001:4860:4864:20::46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FG-0000000D3u5-2FK3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:31 +0000
Received: by mail-oa1-x46.google.com with SMTP id 586e51a60fabf-4ad9bc6aa91so178079fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114349; x=1795719149; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=;
        b=oN8tFfM7TUgAOCvdDasmz4YBCeJb0S8zLIM19LD2wZv9gPbiYhyAn718WXJsEkqeWb
         gbo8oNzWGkHjHTx5NzpIRkCGBDG791TjbAxT0mrQNg+tY7vVXdRZNRFWJ6vKQPPiSdtd
         Sp5yGdWzIA8jKUhl45f+sAerUVVRY4vD+tvLctzUATke3xTMDsi9St9A2jm6qdara0bk
         XW8CvstbVjmwx1GKZl3BxzzncLzkASdKnihASxSjCLYdfvJTfIWsipTuLvSHnq5iOTze
         IIg9aiU2XwSGG8szhGz4Z4PQuuKqqP2Weyydi6AFpXdSxZU5l88mzy59AoTFY18J2AOl
         hiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114349; x=1795719149;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dri93dGf86JD2a4x55noboCN1Q6q179kTQsK767li90=;
        b=GFe0djHcAAM6HCIA2yds39nHD23RobGA60MaMyMNVNrknYCOXKwQResK6beNYjHaS0
         tZJDVT2cvVB2MeM4cjaeZXkPlUw82RaTYq+9zZAy+sCF0eCCSxtD4/ddD4IU2qq2tlk0
         UGNSFcqZIfeR7Bztole3Sn/H9nXrwquDnaVZaG6mQgUpIX4EfGmqi+MK7MZtkbnwuqBm
         z+Z6pRUm97CXHzaYENH6tM1jD3pkHD8QGfLScNzCz8X7H+5VK9m6zQUdsjX2Z4r6d5GQ
         qGNpm/0tNJW2q90BJOKyunrkHlW4bIGeXf6K3+xIwrx4JMHSP5MOvRAlrvfnRpf2xTwt
         tjiQ==
X-Forwarded-Encrypted: i=1; AL+hErFaPT/SyxPuGPrIqecfHUXMVv/3dQzDKYbF+7IoLJHJJ5oecEgmUpiLUZoZsZNL7BxdL1rV3zraismMQrcv/yAG@lists.infradead.org
X-Gm-Message-State: APuU4Z+ql6FQFakDCnxHCvYoJC64Mou4fRyjhdH9vToC6U7y+kY9WM4g
	XXatJmmHAyra2/fDDIkczyXQBDbFF/SZehjqSDvylm0peza0atxUBgIpRaU4Qy3t5p3T61utXL7
	VQD25mYMsrXf15o5dD1flw/YL9Q==
X-Received: from iok4-n1.prod.google.com ([2002:a05:6602:c604:10b0:9cb:3bd8:aa36])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1805:b0:549:572c:fd42 with SMTP id 5614622812f47-57a0bb85010mr976405b6e.47.1795114348499;
 Thu, 19 Nov 2026 10:52:28 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:55 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-14-coltonlewis@google.com>
Subject: [PATCH v10 13/33] KVM: arm64: Make __vcpu_rmw_sys_reg() atomic
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_105230_586758_CC574B36 
X-CRM114-Status: GOOD (  11.68  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use try_cmpxchg_local() in __vcpu_rmw_sys_reg() so read-modify-write
updates to vCPU system registers are atomic with respect to local
interrupts and GICv3 pseudo-NMIs. This prevents lost updates when a PMU
overflow handler (which may run as a pseudo-NMI that is not masked by
local_irq_save()) updates PMOVSSET_EL0 concurrently with vCPU register
accesses.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 89683a690828e..103c25001c0d2 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1313,12 +1313,14 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 #define __vcpu_rmw_sys_reg(v, r, op, val)				\
 	do {								\
 		const struct kvm_cpu_context *ctxt = &(v)->arch.ctxt;	\
-		u64 __v = ctxt_sys_reg(ctxt, (r));			\
-		__v op (val);						\
-		if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
-			__v = kvm_vcpu_apply_reg_masks((v), (r), __v);	\
-									\
-		ctxt_sys_reg(ctxt, (r)) = __v;				\
+		u64 __old = READ_ONCE(ctxt_sys_reg(ctxt, (r)));		\
+		u64 __new;						\
+		do {							\
+			__new = __old;					\
+			__new op (val);					\
+			if (vcpu_has_nv((v)) && (r) >= __SANITISED_REG_START__)	\
+				__new = kvm_vcpu_apply_reg_masks((v), (r), __new); \
+		} while (!try_cmpxchg_local(__ctxt_sys_reg(ctxt, (r)), &__old, __new)); \
 	} while (0)
 
 #define __vcpu_sys_reg(v,r)						\
-- 
2.56.1.708.g77570a6a1d-goog


