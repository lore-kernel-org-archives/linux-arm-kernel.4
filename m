Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DC1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lmrWOaff;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=buhFtz8C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=; b=lmrWOaff69/tmH
	kdN9bwOvIkDWQubUWp4lZGScc2+znS8N3ltrzXN9hGtFjshrPfEZH3sGJl5Zrtoo8U8V1NuMO0APb
	gTMkujIzFqY/YWQpzJAG4VcNw+zXXYx/zj//c2Z1DoTwuYcNpHfw1TfIJCBI/dDeh4VN+IueRZJoS
	nrk/lOd3+mLJbjkK2qfCHYt2wQ0zYtKKzh2S4G7nWlBnTnlf3yWbKl/xvh1FEzTb7quW24dYFbmPG
	XE/1svfzB6XUSOEKCvLZIQm3+nPIsz+F8+8uutJULa7yaHGX2ODwyQ9eppzMEDT4y96xVXkRUXeet
	k6HrTLO/wk2tt7pzomcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6wb-00000008lZ2-2tbn;
	Wed, 25 Nov 2026 06:57:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vz-00000008lEj-1AzO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:56:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so47664325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589809; x=1796194609; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=;
        b=buhFtz8CckSI4eEPPMrU2/X8jMUysv6PKnlLvjQJIGPq18dWC50TPG8JkbCbff0yIY
         E1pmNx6nXkAPgsxtf9SrCFBToNGyIZuCIUgJNc/tu797qqvn5Tds+BNtVsp4Pa0NVqUi
         mt2ck9cWJoLRK2yqrC1luIS5WqvkNE7y1zxjaj+WbJY+DxOOIKzGoEcyDtGqc6YU7r6D
         CsKwJQPDByWykXL9LGse5u5Ahn/0T/EU8/l1wR00FTNC47EatRfMJgTJgQMjKm+42wxw
         ClWA5U16YexW+TMOoIGx59LtqLG5PzDFx1MvyN3TY6nO1QYzbiiJcXbtwPAYrzUzVRnm
         iWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589809; x=1796194609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGa577wX/xgJLkYslmrPB3AiasjRjUBJpObETRH3ZKA=;
        b=g0VvUCVgLz7mgr0EoAH/RoIC82FYqI4KBWkWzNOtxvXGf3/YD1pwCEJHkElgZoycU8
         X2ZERafhx5CR++jmwaQTyYhpqJMBYeXdoZIjMO6PVVEg1MyH6NNznbqDLz8tlYM/jBhx
         8sqVqX6ZTbfrcyV22KJaLpgOK5AsKMy8154uFINx7Pkdh+K7ZD5jMOzZKnHuFjTBjiVc
         iEOUS2RERHy/yVkn6DRfuO20gs2/R4CGT3ZTcaBlFLeeeFVLn7eU+1BobYMjpnxvQ3Et
         L9darC5DvmJqaJ0k9WkEXEUxskT0hGDIvVL86XcFErO1wc6+RS/UfWJ1tQeUEImF7dUX
         +zsQ==
X-Forwarded-Encrypted: i=1; AL+hErE1H+RQ7ExcgIS1fSjDCy3C0SqKfskSUiKP8adCuzV2SU7csegodl0NSGrJyvv46U8PBAVKwjTh4b8AFtduQsV7@lists.infradead.org
X-Gm-Message-State: APuU4Z/yMRYm8p8I3L2VAHsa+/MOyRZLzdiAwGWacNdBnqgVBCXOzebh
	nZyqXjiqEv7bzz1CAFVG7Q0fCycYUmVQKfNN1SIkhVsjg7744hjz+OcuaCzWXXFJodo=
X-Gm-Gg: AZFdTZet0KxPJup5DzHz5h9WDUniGwctomla0Zrn2AyK3sCjtOnPgbbZKNt5mNAL7vn
	qZWtMJXFyvtULHGxooaXDHO+kRIgLC1J97WG6fPeKLry9PLwIWPKR7pIgSl11724tWVKyRdbFZq
	I7MgXvwOvFgKumlZS+pAIYrDx9MFY4bB4pMRwmhVroWdQRJuGOvT5tJKGcOqNtiO+o/4/XZ47Un
	SJGcAK+pCShYoyAQoQ8KEUTPplpEyQPGx3/JM+eUVAj2zDeX4PwNeKZp1sbEVpy/IzY3MQv8d4Y
	lsQjkEVNfqvnAMm8wGyf5SrGH+/joHgeIv9xYyam3z2p28uQUDx5T1PAV8qW+U4vWe5sDqLPCIl
	54KFYTw88nhOIIvUpY76s5BVKT6HpN2zMk79e1edT6TI8v8aLyqai5nqUXKF+nV/MQo3va30Naf
	NbWd1GyiS/H76BUzeuZJDIspxYNb273Eg8haQzxEx9EVFdPZcFCk3MxTGg0e8WVxmj9w99XGHoK
	hu2tRE7c/4rZAxiZWG3zUvPfl+Q5LzZEEd5ddONSUDPlP8RKHLDimkCVNeNj9DSvQSaXaakTkRT
	Szjn1NLpVabnwhCxVnE=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr352660555e9.27.1795589809163;
        Tue, 24 Nov 2026 22:56:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm414574595e9.9.2026.11.24.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:48 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:20 +0300
Subject: [PATCH v2 5/8] KVM: arm64: nv: Replace a pending SError when
 injecting a new one
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-5-224689d8a764@pereq.eu>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
In-Reply-To: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_225651_368759_0A8D7B31 
X-CRM114-Status: GOOD (  14.71  )
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

The kvm_inject_serror_esr() function injects SErrors as the name
implies.  The bug is that it doesn't handle already pending errors
correctly in nested virtualization.

In vanilla KVM the kvm_inject_serror_esr() function always sets
the SError to pending.  However with nested KVM, it might set it
to pending or it might deliver the SError directly.  We can only
have one pending error at a time.  Imagine we enter the function
with an SError pending already.  In the current code if we decide
to pend the new error that's fine, everything works.  However if
we decide to deliver it directly then the pend flags should be
cleared but they are not.  So we deliver the SError directly and
then the SError that was pending on the next exit or entry.

Clear the pend flags unconditionally at the start of the function.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-229065@kernel.org/
Fixes: ce66109cec86 ("KVM: arm64: nv: Take "masked" aborts to EL2 when HCRX_EL2.TMEA is set")
Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: New patch
---
 arch/arm64/kvm/inject_fault.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index aa2011cc0d5a..0f6a89b65074 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -361,6 +361,10 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 {
 	lockdep_assert_held(&vcpu->mutex);
 
+	/* A new SError replaces any that is already pending. */
+	vcpu_clear_flag(vcpu, NESTED_SERROR_PENDING);
+	*vcpu_hcr(vcpu) &= ~HCR_EL2_VSE;
+
 	if (is_nested_ctxt(vcpu) && kvm_serror_target_is_el2(vcpu))
 		return kvm_inject_nested_serror(vcpu, esr);
 

-- 
2.53.0


