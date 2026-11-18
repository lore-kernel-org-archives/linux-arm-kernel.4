Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9178B60A2611
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQDPMDvZ;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k+YGnK9Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lv45tREYCt7GqWPtl8xyiubGXsrPN8dnOBdjmKX9gXA=; b=PQDPMDvZdY2eIwtEqB3QldWuUo
	TSXRVj2DrRsIunJe9TeMhqPoJ8aYVwMQgJu22POIZwMzJs3UhUQkoAXiYruQqXFS8cDr8CsL06bo2
	+Ld5wOmvWPIfGTCOal6ELYcK+bb0rsYUS8gVVOLIUcPpBo5ibema6j8k9HWfP7sKW3RTLX7OyXGlG
	puZMDsdvolIqMx52aFNuuBb4SI5fgpwnQHVNmp16GHVwwEi8FmvjQVTnumOdREROFpQ7+6wy4YA8P
	tyNV0ukDiOLmNj/QwIyTeanGD3Le5wZ/jzTMymerGHPtgelEGY4NDvmpwVV3H9cjvPrXDoAW3zdgF
	e6TCPO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmOP-0000000AEcV-2AnM;
	Wed, 18 Nov 2026 20:36:33 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmOL-0000000AEbE-1ZhB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:36:32 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-547ae874949so1823704b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034188; x=1795638988; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lv45tREYCt7GqWPtl8xyiubGXsrPN8dnOBdjmKX9gXA=;
        b=k+YGnK9Q9wNZ+/R8KZD937oJtRKkZvbgSqUZlG21DYqIPlM+Y4sEDz79VsaRVBR/2k
         2NC0ZVSZHcEvdQSvK4G21jhDS389ID2iN/8sZIUklwT4/q54AL0sGrKaAmiol9cJA/S8
         jt0khualW+FWCDff0wdetpHXomCy4De8xIPo+PGT/Odbpa1Wxte4otv09caxnSWOb7iG
         1QSZb2kznISdwWXsEhVBY+1sYTeqw3JZQDHrWFf6xDv8FvtS2V4D+S4+eZqkyl0hr1g8
         VK81br7ZDkIhoO8beT+B1TXA9Lbu6Km8XPcHMctZYMLYHySVi1cCAI+XvOeEMeXmsDdJ
         vaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034188; x=1795638988;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lv45tREYCt7GqWPtl8xyiubGXsrPN8dnOBdjmKX9gXA=;
        b=r5u5G8mpMiG7sJSMniyx1IDmcqOSRRDhrdtCv2XNEOdfuynlRJ/mDGf8Ss6Gdpgvat
         GpZi4Rb6DCK3w66JwTzxD4GpBY3vMSthuaR5dCZ/9JiyPegghs+pXkuvzgbMafV/5t6G
         4NIyKIQEA0YnM+4/hoYyl0ub0qxZF/iJGRCUqxgW5i0OaYbDPXbWGYfY2v8tgDAX2qqP
         C38jhif1N1EilwtDYa7DSPv6i0KL7VeZF0MFikY6vX1PpCnF1khEdyn1W1OgSQ0dTgGw
         ZjGgFnG4ZMrIjE+iSfhAwPMIARCCOVyq1932OQj6dVZiNP7ughBxaRamn2pubhvk90Vi
         sR2A==
X-Forwarded-Encrypted: i=1; AL+hErEzpdtGZd1+m+eZELHVkH+1NpIuqp7oZlJbIiutFDr1Jf/cqqgtlgMdEVO1nhJwAsqH+WyTjfee742VpQClnCWD@lists.infradead.org
X-Gm-Message-State: APuU4Z/0SrEIWg3RU1FNyatfve81BsgckrHpFkCrV44T6vy9AI/KU0ob
	RIUM+qPDmzYydvJnEwohuHP2O5MjFVSXXfteYEeip1upn7WLgM5iXxIhGu4hy3+Fb9Uxi3N1kWv
	04OOnOmUiY/SJI7PCVN2cfZeaLg==
X-Received: from ilrb6.prod.google.com ([2002:a92:dcc6:0:b0:547:9c99:d6d5])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:f13:b0:573:399d:d487 with SMTP id 5614622812f47-57742f41c5emr4038906b6e.65.1795034187562;
 Wed, 18 Nov 2026 12:36:27 -0800 (PST)
Date: Wed, 18 Nov 2026 20:36:24 +0000
In-Reply-To: <20261118203625.743428-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118203625.743428-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203625.743428-2-coltonlewis@google.com>
Subject: [PATCH v3 1/2] KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_123629_430542_F4476B48 
X-CRM114-Status: GOOD (  10.81  )
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

When commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive
fixed-value bits") converted HCR_EL2 to hcr_feat_map[], feat_nv2_e2h0_ni()
was written as !kvm_has_feat(kvm, FEAT_E2H0), where FEAT_E2H0 checks
E2H0 >= IMP (0). This inverted the condition: feat_nv2_e2h0_ni() evaluates
to true when E2H0 < 0 (including NI_NV1), leaving HCR_EL2.NV1 writable
instead of RES0 for VHE-only nested guests where KVM advertises
ID_AA64MMFR4_EL1.E2H0 = NI_NV1.

In practice, KVM cannot handle HCR_EL2.NV1 being non-RES0 in any
configuration: limit_nv_id_reg() exposes either VHE-only EL2 with
ID_AA64MMFR4_EL1.E2H0 = NI_NV1 (and E2H0 is not userspace-writable), or
FEAT_E2H0 without FEAT_VHE or FEAT_NV. Checking E2H0 in a feature helper
is therefore unnecessary.

Drop feat_nv2_e2h0_ni() and mark HCR_EL2_NV1 as an unconditional RES0 bit
using NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx) in hcr_feat_map[] (shared
by HCR_EL2 and NVHCR_EL2). Because HCR_EL2_NV1 is not part of the
architectural HCR_EL2_RES0 mask, check_feat_map() accounts for it as an
implementation-defined FORCE_RESx bit.

Fixes: b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/config.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index adaf26ab93b85..2e81f45dc9921 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -256,11 +256,6 @@ static bool feat_nv2(struct kvm *kvm)
 		kvm_has_feat(kvm, ID_AA64MMFR2_EL1, NV, NV2));
 }
 
-static bool feat_nv2_e2h0_ni(struct kvm *kvm)
-{
-	return feat_nv2(kvm) && !kvm_has_feat(kvm, FEAT_E2H0);
-}
-
 static bool feat_rasv1p1(struct kvm *kvm)
 {
 	return (kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1) ||
@@ -1034,7 +1029,7 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 		   HCR_EL2_NV2		|
 		   HCR_EL2_NV,
 		   feat_nv2),
-	NEEDS_FEAT(HCR_EL2_NV1, feat_nv2_e2h0_ni), /* Missing from JSON */
+	NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx), /* Missing from JSON, RES0 as an IMPDEF choice */
 	NEEDS_FEAT(HCR_EL2_API		|
 		   HCR_EL2_APK,
 		   feat_pauth),
-- 
2.56.1.750.gf70dc682cf-goog


