Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F03660A2610
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qOgmPNkU;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZzriY40R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Qy1Eigf44guJ94H2Vo/9twz2OBsSX8Dgz4PNAs3gw1s=; b=qOgmPNkUg2TiLMrIKG4ZxhWkYi
	2Pi/u9VhcklNTAWEG3I4s/ew/meUeYoCqWPy4c+razc2xqL+7I7WVcu24HDoTzuR2/EmGcniraIBi
	IhCbQ9oF4noUcqJ8kTmg1aoTm2I89GTHD2FsdhYprhPEvSkHYl0+hktxt6eZ88fvpavxaak9sqdvH
	YmLnnMorh78djA76knk2PzyQ5BfyeFAazAkDcuOT1qOnxVxCYNPs1j26n4/873TKTYuJzYIZFE1VG
	dlsOkBXFY1pKscpe7sMZMRcrP0LifSVPiaE97RVy9ohcSdAmzp75c79/DFyWqtt1eFP6mu6FHxHC8
	bnBKMqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmOP-0000000AEcN-1nl8;
	Wed, 18 Nov 2026 20:36:33 +0000
Received: from mail-ot1-x346.google.com ([2607:f8b0:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmOK-0000000AEb6-2mB3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:36:32 +0000
Received: by mail-ot1-x346.google.com with SMTP id 46e09a7af769-86285932977so1662943a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034187; x=1795638987; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qy1Eigf44guJ94H2Vo/9twz2OBsSX8Dgz4PNAs3gw1s=;
        b=ZzriY40RWl5inp8ydKpgBKMFeegM6h0ycycvNLpTkLqgTrD8CWZpJYR0h+IELHl2II
         ma5ozIE3R1znRKBz0uCdAIngSxpwZHrN49e/CejzZ6Zr/RNFw4vVNmmdoIlF94szL5pR
         CCTQqIPmWN10sXS4bIperw4uyfurSa1Q1dJ3Pnx+l2Hu58RXs+bOcc3p2iY3jYx55ooq
         Ru5O7vp0TBC21i+hlehz3UYCNIkk+QD1SWNlnNGAH1bUL410/9kzJN0z708xu/vTACNV
         9HLIJIrRsjOxDH4UIUq9s3WwCqE16y77LjO7uZnKD06HlX6mwjbgU7/6cG9SncwiVlEI
         JYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034187; x=1795638987;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy1Eigf44guJ94H2Vo/9twz2OBsSX8Dgz4PNAs3gw1s=;
        b=ETzSzSgGEVdvBWinf008aR3eHTZ13sUxFZl82t75hUt0yAb0O72L9VyQWwfMvSJs7u
         33RMhmrnLemPYtz+cMMRsP2YJNHXoXhLmX6qzyOSYWy/A2Lw96q+MgYkGDxXZvACW+QG
         A9rr7CbStXmlwU8Zi1qQJWeCd0PmYT4VVNps4y1qlqY80MxLyR3bnrYH4JAwpx51JMqA
         /MIqh8QXz7EIGQ7wckO0fG8ZRHjXTkhpElJ2ZRrsix6HsNPec9+1rU9mDKS0ruolVS9y
         FxfwNR80aUCRODPWtCkNUNhmPuTuPnY1zDO4J7bZEwcpjY2YVredfM+GGV8n38pfTFWu
         3qxg==
X-Forwarded-Encrypted: i=1; AL+hErHNii3A5X1pm6/ioZAxlTCcrf1iBlmzvYDqo72RcurdC2EeHgzklWiaqD9dEZLgcLVeFj+R3uPUlMJ1Sshkrl11@lists.infradead.org
X-Gm-Message-State: APuU4Z8ppJSQ9zlb8UcxfJ/uG6PxyH+9Cp6w70jTu/tIRP/vd4DP/DCR
	M7DHkwElpFVOC4LkN4nskWUltWp/GAA9qPkPXrFwxcPnVMu9AgRMopDvIxdT4uq2SVdCvrhqEtF
	/69vbiiUB2TgOrVMn1Lon3Yq/1Q==
X-Received: from iobmr18-n1.prod.google.com ([2002:a05:6602:a552:10b0:9d0:5c4f:1583])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1925:b0:574:c5e0:3d1c with SMTP id 5614622812f47-5773f0526e9mr5231001b6e.25.1795034186651;
 Wed, 18 Nov 2026 12:36:26 -0800 (PST)
Date: Wed, 18 Nov 2026 20:36:23 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203625.743428-1-coltonlewis@google.com>
Subject: [PATCH v3 0/2] KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_123628_707083_CFDF9115 
X-CRM114-Status: UNSURE (   9.42  )
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
fixed-value bits") migrated HCR_EL2 fixed-bit masking to hcr_feat_map[],
feat_nv2_e2h0_ni() was written as !kvm_has_feat(kvm, FEAT_E2H0). Because
ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where IMP is 0, NI is -1,
and NI_NV1 is -2, !kvm_has_feat(kvm, FEAT_E2H0) evaluates to true when
E2H0 < 0 (including NI_NV1), leaving HCR_EL2.NV1 writable instead of
RES0 for VHE-only nested guests where KVM advertises E2H0 = NI_NV1.

KVM never supports a configuration where HCR_EL2.NV1 is non-RES0
(limit_nv_id_reg() exposes either VHE-only EL2 with E2H0 = NI_NV1 where
E2H0 is not userspace-writable, or FEAT_E2H0 without FEAT_VHE or
FEAT_NV).

Patch 1 drops feat_nv2_e2h0_ni() and marks HCR_EL2.NV1 unconditionally
RES0 using NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx).
Patch 2 extends the arm64 hello_el2 selftest to verify via
KVM_SET_ONE_REG and KVM_GET_ONE_REG that HCR_EL2.E2H remains RES1 and
HCR_EL2.NV1 remains RES0 when E2H0 is NI_NV1.

Changes in v3:
- Drop feat_nv2_nv1_not_res0() and force HCR_EL2.NV1 to RES0
  unconditionally via NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx) (Marc).
- Add Suggested-by: Marc Zyngier <maz@kernel.org> on patch 1.
- Add a comment in hello_el2.c explaining why RESx enforcement is
  checked from userspace rather than inside the guest (Oliver).
- Link to v2: https://lore.kernel.org/r/20261117204535.4036191-1-coltonlewis@google.com

Tested under QEMU 11.1.2 TCG (arm64, kvm-arm.mode=nested): hello_el2
fails with "HCR_EL2.NV1 should be RES0" on unpatched v7.4-rc3 and passes
with this series applied, with no check_feature_map() warnings at boot.

Changes in v2:
- Rename feat_nv2_e2h0_ni() to feat_nv2_nv1_not_res0() (Leonardo).
- Drop the guest EL2 MSR/MRS HCR_EL2 check in hello_el2 (Marc).
- Link to v1: https://lore.kernel.org/r/20261116200418.3535619-1-coltonlewis@google.com

Colton Lewis (2):
  KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
  KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1

 arch/arm64/kvm/config.c                       |  7 +------
 tools/testing/selftests/kvm/arm64/hello_el2.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 6 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.750.gf70dc682cf-goog

