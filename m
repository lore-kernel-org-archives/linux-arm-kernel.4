Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bjISQ+bD;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=efmFLo9W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fLiUogQDb6C/5hkqgN4Zccv3qSnCF6DVX/+qKwo4uaw=; b=bjISQ+bDcOZ06wRc9luWF0p5sx
	t+hNIMMpAeAFAkUlao+pi8dn6Oppgg/WJlSzKCk0bmtXLecDUU6B5gW+cs8o6vEOjhh9MP1uN9Fbs
	fMLMe1nAXoZr1uShHGU6H5rDS15ZgiT3iBzyuJQsfS70hdagw10oTIMuGkJLrZT5D00eJIOuMlCN3
	+43aRdzG6dFO6O7V2I9sFu2wJtblCRPJySr7kQbIRi89KXniDBmGUQlcUlpHutQLeqzaXn2DOkTlp
	M4QOM7SDDrBy/pJwcs53yJRQ3RfvwQEukzvxJkuL5LJ3F7csCzW2FiDpCweIl++S8U0SXuTalv58b
	03Tyxnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2wJ-00000003p0E-0P7T;
	Mon, 16 Nov 2026 20:04:31 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2wA-00000003owK-3Ml0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:04:24 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-571bc0b66d7so2543222b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 12:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794859461; x=1795464261; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLiUogQDb6C/5hkqgN4Zccv3qSnCF6DVX/+qKwo4uaw=;
        b=efmFLo9W5a0av/r3fnF6tYq4Z8U67TQeufFIFta58/K730O0F+EtbYz1I1Cw8ByH02
         /5g8ynVKFwsaD8uDVkAklCIiXTNRUK6M+1lY0h9n5pCwkK2JdTV1oQMgelyZtRHRWr48
         D7Fk6PJM9qCFq6jbLMFkJmZw6gyrk541IG9oghibVq6YmJ8UEn/pz6NeNnHYC19yA/Q9
         ls9USCzDKnPzOXRZ6jwr0XXyFMkEx8u93/OV7jtTOHqapasvYuAbY7nQC4ZHc8tXFbgu
         0bOnm4/j4bD9gPSHU5T5KStvGpkCKsR56ISBYcR2hT/W1ipzok6pFMVA+isINnsew6uK
         fPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859461; x=1795464261;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLiUogQDb6C/5hkqgN4Zccv3qSnCF6DVX/+qKwo4uaw=;
        b=mxNhXJtd5uOx+x+/CGlnKYPPQNVf4LcTuRqRxAq26BHuoKeP7HkdDwHp9yRXvIhAs6
         qQw2qRKZ5zhlzJ4AXP2v1o5fwUTXoGao613X1dmrOInkf+twKr7970WU6TnQPybRHBDN
         hHkR+eTGLJdeRkcKxT/syiOt8ulSLqZpdcpGN085K8zqAH0s0BEa2DYLBDyECfJqDMqU
         u96088npeOqpsm2569IPU3Gai2JtyOk28XDBcIwO++DlzUN+lwzaTYBY96oSSHbfiuF2
         +NQ1ggef212uYFk/9rTiA18fvjltILv+akE5QWdnxhqrhlyYrGmbIzZCJbpysqpUOyJI
         6XUQ==
X-Forwarded-Encrypted: i=1; AL+hErEt6o2JksSvp6W669FDZ13ozO3j+ibhCZWmskOoLu+vvNf1V1xLKCuYf5DAi8wPfLa9MdydEIJWHi6Ct3mrei7E@lists.infradead.org
X-Gm-Message-State: APuU4Z+hCZOvNxcbDyQLdtwFEuVPOh0yxm5bAVHdG1plH94zmp19er/y
	wTdcIO5NUMMTy/bobBs1T/DvwL0jadMIRoouSMyy1HQ9LoE58GkJsTKUUaiP5Ho83S5Snxd0uz4
	E9GMhmi4bNelgAkmpnOo2sHo80g==
X-Received: from jacnj25-n1.prod.google.com ([2002:a05:6639:299:10b0:60b:77aa:12a3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4d06:b0:572:86c8:6b4c with SMTP id 5614622812f47-57286c86d22mr6304607b6e.6.1794859460579;
 Mon, 16 Nov 2026 12:04:20 -0800 (PST)
Date: Mon, 16 Nov 2026 20:04:17 +0000
In-Reply-To: <20261116200418.3535619-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116200418.3535619-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261116200418.3535619-2-coltonlewis@google.com>
Subject: [PATCH v1 1/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_120422_840738_C16945FE 
X-CRM114-Status: GOOD (  11.42  )
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

Check kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI) in
feat_nv2_e2h0_ni() so that HCR_EL2.NV1 is treated as implemented only
when E2H0 is IMP or NI, and forced to RES0 when E2H0 is NI_NV1.

Fixes: b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive fixed-value bits")
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index adaf26ab93b85..b4f555d39f54a 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -258,7 +258,8 @@ static bool feat_nv2(struct kvm *kvm)
 
 static bool feat_nv2_e2h0_ni(struct kvm *kvm)
 {
-	return feat_nv2(kvm) && !kvm_has_feat(kvm, FEAT_E2H0);
+	return feat_nv2(kvm) &&
+	       kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI);
 }
 
 static bool feat_rasv1p1(struct kvm *kvm)
-- 
2.56.1.750.gf70dc682cf-goog


