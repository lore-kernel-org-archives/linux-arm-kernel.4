Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68460A262A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YIWapWct;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0V/A88E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MV1WHVPKTUVmKoT81wiPNJQZT0AAyhIPe0JlDUZG48k=; b=YIWapWctHTw5Ye
	GlyixnMFuzovaa/AcKLLm3sL0S9hKZb3hHi8+Wwouyt6RNQXqXv71STcrq3Ht8EiI8ux0JS5Q4uAZ
	mch3kcXGjfnjwjHA5G0Kpx/RF92B8UIEpvIVon6iLduD6J+MO+r5WDlc+bc6OiB9g7ntOfdrOhEHJ
	7YZ52dFzLku6CnIHmQOdW4wULiskGrWPlO8Th3hRHUt89hLEXdi0nwjIUL74azctyLmyxhd+wXekW
	M0ztJo/WyvCXK8jILxqLhx4IYHxtJqnD+RKlPO6ZWSLeHe4DVPVs0rXBOQzyjzWCv1PRjG68Z9c6s
	bdbQWxAQt2ktrG/9+kFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UQ-0000000Btmm-2b5t;
	Thu, 19 Nov 2026 12:43:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UP-0000000BtkR-3UTJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0ED860E6F;
	Thu, 19 Nov 2026 12:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581AF1F000C6;
	Thu, 19 Nov 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092224;
	bh=MV1WHVPKTUVmKoT81wiPNJQZT0AAyhIPe0JlDUZG48k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B0V/A88E2oQSG9Ls6HnPzc/w2ZSYH5a/v/VvtYjLpNGlgxEyecPSwIq9gYsL7nv+W
	 YTHvvCwoZbgSbU8W/1k7HV5Df4a/f1Seaf7asEczEi+T+stt9NZHdcuh4gnxQbmYiA
	 jORqWFjaE1iT7k/NbqK7D7OoAMDMm6ywZhSwWtb4aGgzB2yENGXtKjltDWDzuB0tf6
	 TTO8nvF5ExsAhurVhrnr6DpvevtDInxhZJAlHRAkDDiD24n5Qwj77OZnLesHcD9cXh
	 XJS4aZ5jHsf+F7bsZzySIw6dem4RvviGWkgYkMVXDPfxgeXE3kezOjrqbp8bHxlEmx
	 alHcHH2b55xsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xU1UM-00000000RvW-0fF3;
	Thu, 19 Nov 2026 12:43:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Colton Lewis <coltonlewis@google.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
Date: Thu, 19 Nov 2026 12:43:30 +0000
Message-ID: <179509215927.3938200.1755215677942737645.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118203625.743428-1-coltonlewis@google.com>
References: <20261118203625.743428-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, coltonlewis@google.com, leo.bras@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, fuad.tabba@linux.dev, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 20:36:23 +0000, Colton Lewis wrote:
> When commit b2a324ff01fe ("KVM: arm64: Use HCR_EL2 feature map to drive
> fixed-value bits") migrated HCR_EL2 fixed-bit masking to hcr_feat_map[],
> feat_nv2_e2h0_ni() was written as !kvm_has_feat(kvm, FEAT_E2H0). Because
> ID_AA64MMFR4_EL1.E2H0 is a signed 4-bit field where IMP is 0, NI is -1,
> and NI_NV1 is -2, !kvm_has_feat(kvm, FEAT_E2H0) evaluates to true when
> E2H0 < 0 (including NI_NV1), leaving HCR_EL2.NV1 writable instead of
> RES0 for VHE-only nested guests where KVM advertises E2H0 = NI_NV1.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
      commit: 0f1bdabb82be5d1b5401364cd828caf0985dad48
[2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1
      commit: accc93b77267b739b48ab34cb5bcaffd1fbb5db9

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



