Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F73606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zHz3KpqI;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fCS8IhTv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b6mleucbMdhj8MjjlIVwGs8yhAGAA7tst/tBmXQB1UY=; b=zHz3KpqI7SdEvdAYfd8M01SCm5
	E7/IoaeZ1NhPQ4aGIB6Dq89Mmy4El8k9ZFSQVprdHlNg07qVwTs9NJwh/cAhbO7pLZ649bi7zRFgx
	6J8gw+olXavseWOOSTV0rwhzBtkyMhI+E1Yvy3Dvi/JMHsC3iAg8HgglcSZgoOYY8EBQM2ftPFzpy
	ZPkeyguB847URF1M7Dogiu/hdYbLjesEIYZ/OYCrmo9gcwi5lkVVK815WIrZXalp0EPy4uTlPVXsz
	PI1TNUuNcFGjSDxZveqSMmdYtnUS6NKLo+/Ff+SquG6hNVppAzhq9P+ErDXfTvy+XwEPul1no8Bud
	FKemj9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ3h-000000072b6-17Hk;
	Tue, 17 Nov 2026 20:45:41 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ3e-000000072Zd-25kQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:45:39 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-567e742f481so101938b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948337; x=1795553137; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6mleucbMdhj8MjjlIVwGs8yhAGAA7tst/tBmXQB1UY=;
        b=fCS8IhTvv3Bl0RO5Yl5gktUSNM3YJuZaLBRfereVTHshU4+qstna/MUhXeYB5JfiEk
         ey9fJ68D4q/JddltXK1mfqnOdTSAQxTT3YU5XG1lSj8/fj4gwgYSwnQD+s8I+3Sc9ba9
         tp++bATyRRf1tqh8KBU5bDpux3DCH1aVwifC7H22OdGVY6dRSZzqVgs7qID4L/CwikrB
         LkcJK5qpLUgQaMH+MbXeS285skny+hiN+yTWJKWDhGIv8GFRk+DkH39pwMxRkih9s860
         DwioUTwj+9QGjnZ5vtnz3eIDN6qwTWZAMFgxy89PizglwGXE7iFEmY8G1WZycOHuOjVj
         HWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948337; x=1795553137;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6mleucbMdhj8MjjlIVwGs8yhAGAA7tst/tBmXQB1UY=;
        b=ayuDKFabkBdgSpllRaVpvqUOhlrOWK2PM4InL4sBXqGHJdGlVpTvGAsubQ+het20eC
         XKHiRYK9YAyHpRr8YBOUiOx/0SrqCclhKVa5S5WhSh4DW83sqnGXF4Y2T/8oMdxSJ/fP
         lfDe/35/Syp8fHm5+G1vO6mA2xCrQVRRwScGjJt3urfa6aQhFdBnSkvox+xd4kLRarSH
         0r0EKJpo7+N5cj8bljtSCnnlYNVYSHVOBlHLEG4K0FIcGHrPVNC5a7H6nK6NDMJ6MueP
         tQEy5zIaUmgFcqWHC7GogSMEb2VIpIKbXMjVqIFlMQbhtPhc0cFGS5ERcdsLGWQfg4v9
         mF1g==
X-Forwarded-Encrypted: i=1; AL+hErGz1XInSJeTNFL8F0MQApzEU7DL5TDGEk2m5qjs0xZZrDy/NJmpcsWJ0N2d0tdwhea1bPeOhRy8W6oezeYz3RjZ@lists.infradead.org
X-Gm-Message-State: APuU4Z9rEQrlHXPU0ZSJmMamWt8mw9kmGTIBzdB0ZZwM6gDPpsZ3l3hI
	zDPtp97Lzz4lONu2/wkmurFH4fn4B0Ktq/qzJgKo2KVyI3w+GCRajQnQoyD5YW5kj4bRtjWSNBp
	zxvDnVS1CQz3dPy6hYOjbqudvGg==
X-Received: from jajg7.prod.google.com ([2002:a02:c547:0:b0:61f:ecf1:1cac])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1387:b0:4c3:e93e:e331 with SMTP id 5614622812f47-5774113234amr977571b6e.30.1794948336458;
 Tue, 17 Nov 2026 12:45:36 -0800 (PST)
Date: Tue, 17 Nov 2026 20:45:33 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204535.4036191-1-coltonlewis@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_124538_544007_92DBC6F1 
X-CRM114-Status: GOOD (  10.05  )
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

Patch 1 restores the check to kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0,
NI) (E2H0 >= -1) so that HCR_EL2.NV1 is implemented for IMP and NI and
forced to RES0 for NI_NV1, and renames the helper from
feat_nv2_e2h0_ni() to feat_nv2_nv1_not_res0().
Patch 2 extends the arm64 hello_el2 selftest to verify via
KVM_SET_ONE_REG and KVM_GET_ONE_REG that HCR_EL2.E2H remains RES1 and
HCR_EL2.NV1 remains RES0 when E2H0 is NI_NV1.

Changes in v2:
- Rename feat_nv2_e2h0_ni() to feat_nv2_nv1_not_res0() to match the
  condition it checks (Leonardo).
- Drop the guest EL2 MSR/MRS HCR_EL2 check in hello_el2, as RESx
  read-back from the guest is not architecturally guaranteed to return
  the effective value and ID_AA64MMFR4_EL1 reads do not necessarily
  trap without FEAT_FGT (Marc).
- Link to v1: https://lore.kernel.org/r/20261116200418.3535619-1-coltonlewis@google.com

Colton Lewis (2):
  KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
  KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1

 arch/arm64/kvm/config.c                       | 7 ++++---
 tools/testing/selftests/kvm/arm64/hello_el2.c | 8 ++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1.750.gf70dc682cf-goog


