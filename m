Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609EF60A6F44
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5G2D4p22;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V26dFJz0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9bIAYBNiz3NB6EQnZLvtp2y9CTLyvsz22fhiOVY49c0=; b=5G2D4p220lNKkpoOC7z0v7Cp8f
	i/W65CHMWJcH6csdcVwd6Dkd2vIAr8voddHR5OdA3f5HGsGqu9ZfU5nMNwsDSQ0JnOP2Vmn/C7Bzw
	DiCBY0Fg7KgSBnp79yRSD4q5vgJuiJym/+eVHrTh37YGfOLXoJGky9OCVYCF2M2VqDk5cGU9PRxoT
	jEbIqD5mnCGPojgGs5Bs0vM+i8sAWVDRlLUHA11dP0u+IDb61gd+25gwtVbeOQLvM0MwcvSzjewdK
	JoVpaaORUwjrw9JLsc1ifYlMYfdZZrHF544+JrECAOXAX3064++Kb0Omxv9OFromRptXRIY9Q1VaO
	qwiZ40jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2wD-00000003oyi-02Nc;
	Mon, 16 Nov 2026 20:04:25 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT2wA-00000003owI-12ox
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 20:04:23 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4db3db8687fso4952417b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 12:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794859460; x=1795464260; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bIAYBNiz3NB6EQnZLvtp2y9CTLyvsz22fhiOVY49c0=;
        b=V26dFJz0e2EPVStVRyo7aGyEQ90PsSoGWbUh9nC5uNACIBTWnwn5b5Kq5qssgxM/YO
         VKvHnpjpPGoHkknpC27eKGCEg5Qls8om/HnUTFFwCeMoaaI8/DDlXd3qqFfqOyNtU6qX
         L56T/oCv/rEtmaKMk021rPwQDtTw7bEDivGpCPLEerBYqsNXhLsCcxktkjZmBtkuz2QV
         LfHIlxrfZo5g3I6OECXJHZcfBIDgK90k3pb2JNUSIcWSwAE5LQ/MEg4247QrawKE2HN6
         1Egb+vu/a0OtTB7LMUorxlp8OPOKNeGrQyDM0k0QwIq2EQgnaoyRUA0ByW9w9NgHQ9S8
         8s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859460; x=1795464260;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bIAYBNiz3NB6EQnZLvtp2y9CTLyvsz22fhiOVY49c0=;
        b=FcC4iVZYJckyamxqhRZpg9SSVHjf6S52YPieDSdOHrkeZLhhRvsacVoNQWEHqe71kD
         5p1+I1aSSc7slWlAO7PajMqo3vrU7FUp4eiicFqGcJFOjCJYSX0i5eOBzuGXm/dt6tnr
         ipS7Ns0sNEmMmT5yrSSjEWZuJ6f44If+1qsJOidCKAQJglkLNoC7mLpWUApCjo3sJcQB
         K1P2uLwY6tMsmMvthQhZYiJs1cfuQXIKhqBbFk5nME5sTJn1P/4Pk67l46tvdgv6+fGn
         KcJXdKIlU9E4p+P9sV5gIReGRYUkpURUy6acwEhCSFF0ljtF0e4WQ9gERrs8khm5jfAp
         mRvw==
X-Forwarded-Encrypted: i=1; AL+hErG/Sh+t9//d3KfrQpYCxbfQICTgXYDxfbM0x50ysbY4Wz4tXYP9+4jDT0mTVxhim/+jYqCxwflHzopkbTvR50qW@lists.infradead.org
X-Gm-Message-State: APuU4Z+coBGKv5V3rGispgtqSoslJgsYDzOO9q8COusnKcnQo4PGq2+i
	NtTi3w4CKuD3jst9T6KIrqa1N+8EFV82Kn/74HdXvNFS++LOUN804DvlJr59xc2vEJJxnQ74gBB
	CWvCeOZfDrGjcGit47vJsWQ73FA==
X-Received: from iodf4.prod.google.com ([2002:a05:6602:62c4:b0:9ca:727a:80b2])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:152b:b0:4e8:721f:2824 with SMTP id 5614622812f47-56e65625626mr9335826b6e.60.1794859459512;
 Mon, 16 Nov 2026 12:04:19 -0800 (PST)
Date: Mon, 16 Nov 2026 20:04:16 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261116200418.3535619-1-coltonlewis@google.com>
Subject: [PATCH v1 0/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_120422_345091_F5B5D30F 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive
fixed-value bits") migrated HCR_EL2 fixed-bit masking to hcr_feat_map,
feat_nv2_e2h0_ni() was written as !kvm_has_feat(kvm, FEAT_E2H0). Because
ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where IMP is 0, NI is -1,
and NI_NV1 is -2, !kvm_has_feat(kvm, FEAT_E2H0) tests E2H0 < 0 and
returns true for NI_NV1 (-2), leaving HCR_EL2.NV1 writable instead of
RES0 for VHE-only nested guests (and conversely treating HCR_EL2.NV1 as
RES0 when E2H0 is IMP).

Patch 1 restores the check in feat_nv2_e2h0_ni() to
kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, NI) (E2H0 >= -1) so that
HCR_EL2.NV1 is implemented for IMP and NI and forced to RES0 for NI_NV1.
Patch 2 extends the arm64 hello_el2 selftest to verify that HCR_EL2.E2H
remains RES1 and HCR_EL2.NV1 remains RES0 across both guest EL2 writes
and userspace KVM_SET_ONE_REG writes when E2H0 is NI_NV1.

Colton Lewis (2):
  KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
  KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1

 arch/arm64/kvm/config.c                       |  3 +-
 tools/testing/selftests/kvm/arm64/hello_el2.c | 34 ++++++++++++++++---
 2 files changed, 31 insertions(+), 6 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.750.gf70dc682cf-goog


