Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7A7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SASWKYIa;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+uIpCBz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HGXQysssI9IIITPAFgPzUZG2M/Bh6Ayigq869gs8CCY=; b=SASWKYIaAaPBOwmEYC68ps04iq
	uGN+jrqK42fcZAn2bY+A+gOIS9a7Mu/63WCHPhOlTHtwFY5k87x2eaKXatPNJIQQy+IVnrCiXQueB
	smNTg0fiY47ZIKRkD4J1mG78DnPyynecZWH+LNPllpgFDX8zwZ/3gNq1ZwF/H08xeQxLGzqHFYWJK
	0xYRQl2sRCaHI6DdY4MA7nLM1G8KqYOq8NV36jcpXVT/9pHms73Vx5Ub2DwFV/5yyXYmLnLxaosia
	FP/dtc1dfMsM68z4JzZ0+fWM7c3urBL3L2qgEcOfEn9qIP053QeLywf5ONYXa/bau+pkQmzTlIcRu
	jXoeKYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ3p-000000072du-1XCa;
	Tue, 17 Nov 2026 20:45:49 +0000
Received: from mail-ot1-x347.google.com ([2607:f8b0:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ3f-000000072Zl-2NoA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:45:40 +0000
Received: by mail-ot1-x347.google.com with SMTP id 46e09a7af769-862b2e1885cso232149a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948338; x=1795553138; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGXQysssI9IIITPAFgPzUZG2M/Bh6Ayigq869gs8CCY=;
        b=K+uIpCBzI+hl5XYbQRhjz1raGZ1DMouuUl0o3qzKuzC8fpXvPYhJOy1Q2+Zw/KT58Q
         6DRxuKITDIbdvoONoWbM54xjZcxb9hgG/tem+4BYCjom6o1v4izPlxpTkpw3k4oJxvI/
         KLkQMfcRuycQA0dvM13UN0qwHQicAa9o+VnZhfUDOmKsdrciaPvb7XRSbhGRNN7pUyva
         dYYIeGombec4qTCDjhtX+BZlPnXqxW5qiwVxURHgy+o07WgDFMNArNqO0ADOORGKzeb7
         g3EStwzb3tgj8bjyv8Ko59ILsS85Uwv5q8/Z4hkbJ79NU/cbEIzM4REheK+K7TkVC6l6
         O6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948338; x=1795553138;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGXQysssI9IIITPAFgPzUZG2M/Bh6Ayigq869gs8CCY=;
        b=R5FUR7SKrpDnDMgsK8A8BvT2y0bdXnnrZgb7EryW3fASmIe7PhIQQfgp1FsRhboe7u
         dASnlKfD3M1wLsqXvGYc32vG9dO4Lf0n9IK85YNDTQppWNkX4b0ePYmYo9wqpGJi7es7
         2quJTEuduqHukaJcmOGNo0a1CRVlu7AD6Q3XAbaMxfx2imPMZc7rbIznYja9yEZzPz9F
         5gm3UfQO6nAJI3UictibKhVM8NTDtOQP3Iq0R+58DfVBH92+J1NhHzxSGnBzuwtFoGkH
         N/IJl/M2z+8ejxcVwfEQyJwKabIZZu0ZjnYbSaQ6tvfgqq5nksIxFFdjB16BIRRHDaxH
         kOxA==
X-Forwarded-Encrypted: i=1; AL+hErGV4JINyNWABE2bGNhcIeghtjRQhyqU2vC5HTR5c70VXt9wvXwI5g0NoBDuUhJ+xHFovdoatQwLHUZzw9TaJYk0@lists.infradead.org
X-Gm-Message-State: APuU4Z9yaF3c694CSQvbvLlpgOYMiMc7PFNLwUiHhIPutT9dnUXrYxVh
	mRtNheJ6XPpJFR5BdjJiyE/eYfsBMawhwm1TEYeG4COD6GQCeNXITwZBPOpiDE8cSYWxHDsYeLJ
	QdPsqaUL9u4QoMZYmG7XP+6/K/w==
X-Received: from ilnd10.prod.google.com ([2002:a92:d78a:0:b0:543:4359:a143])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:bc9:b0:574:524d:f242 with SMTP id 5614622812f47-5773c52675fmr1094757b6e.26.1794948337558;
 Tue, 17 Nov 2026 12:45:37 -0800 (PST)
Date: Tue, 17 Nov 2026 20:45:34 +0000
In-Reply-To: <20261117204535.4036191-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117204535.4036191-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204535.4036191-2-coltonlewis@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_124539_610908_AE8B62EF 
X-CRM114-Status: GOOD (  12.67  )
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

ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where:
  - 0b0000 (IMP, 0): FEAT_E2H0 is implemented.
  - 0b1111 (NI, -1): FEAT_E2H0 is not implemented, except HCR_EL2.NV1
    is implemented.
  - 0b1110 (NI_NV1, -2): Neither HCR_EL2.E2H == 0 nor HCR_EL2.NV1 is
    implemented, and HCR_EL2.NV1 is RES0.

Prior to commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to
drive fixed-value bits"), kvm_init_nv_sysregs() marked HCR_EL2.NV1 as
RES0 when !kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI), i.e., when the
signed E2H0 field is less than NI (-1), which matches NI_NV1 (-2).

When converting HCR_EL2 to the feature map, feat_nv2_e2h0_ni() was
written as !kvm_has_feat(kvm, FEAT_E2H0), where FEAT_E2H0 checks
E2H0 >= IMP (0). This inverted the condition: feat_nv2_e2h0_ni()
evaluates to true when E2H0 < 0 (including NI_NV1), leaving HCR_EL2.NV1
writable instead of RES0 for VHE-only nested guests where KVM advertises
ID_AA64MMFR4_EL1.E2H0 = NI_NV1.

Check kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI) so that HCR_EL2.NV1
is treated as implemented only when E2H0 is IMP or NI, and forced to
RES0 when E2H0 is NI_NV1. Rename the helper from feat_nv2_e2h0_ni() to
feat_nv2_nv1_not_res0() to clearly reflect what it tests.

Fixes: b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/config.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index adaf26ab93b85..a975ac73ed876 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -256,9 +256,10 @@ static bool feat_nv2(struct kvm *kvm)
 		kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, NV2));
 }
 
-static bool feat_nv2_e2h0_ni(struct kvm *kvm)
+static bool feat_nv2_nv1_not_res0(struct kvm *kvm)
 {
-	return feat_nv2(kvm) && !kvm_has_feat(kvm, FEAT_E2H0);
+	return feat_nv2(kvm) &&
+	       kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI);
 }
 
 static bool feat_rasv1p1(struct kvm *kvm)
@@ -1034,7 +1035,7 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 		   HCR_EL2_NV2		|
 		   HCR_EL2_NV,
 		   feat_nv2),
-	NEEDS_FEAT(HCR_EL2_NV1, feat_nv2_e2h0_ni), /* Missing from JSON */
+	NEEDS_FEAT(HCR_EL2_NV1, feat_nv2_nv1_not_res0), /* Missing from JSON */
 	NEEDS_FEAT(HCR_EL2_API		|
 		   HCR_EL2_APK,
 		   feat_pauth),
-- 
2.56.1.750.gf70dc682cf-goog


