Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79AF60A262A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q+7KxKrr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEvLMjAR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zRjcGPEqo9GIymUz7E2xF35WQXytvmcIckbBFZO8Xxw=; b=q+7KxKrr7YaCoJ
	JLiTe6/rMCPow8Fied/4i7S8kAeks5BXNos3RNsdIYPX74IOOe4Ke9RzsYT7VWhijJBW9QTmutBwV
	47k7izOEg8H1/Qf+IqB5FhLoDOeUNx/8EAB43bLze57Ju4sfMVtLDdh20tyTh61T+aPI6aEagK++T
	+5vKtlrKgkmCs27HVgEygDX+ehj4ykwj92Vs9LZXmxjggDnrcHnM93SHEccysPQw6SSbV1k8Qcnc2
	O26OUs++DvPFg8irJrdlG0yxO46X+79uRGh5c4A1IODihOM4TBBfTNZFN4ZwPhG+jLiZYZGo4Q68/
	R5LCfjK/Q7fgLQSD2w/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UQ-0000000Btlk-1DzU;
	Thu, 19 Nov 2026 12:43:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1UP-0000000BtkY-20PK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:43:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 198AA40AE8;
	Thu, 19 Nov 2026 12:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1161F000C5;
	Thu, 19 Nov 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092225;
	bh=zRjcGPEqo9GIymUz7E2xF35WQXytvmcIckbBFZO8Xxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YEvLMjARz7pZgG6OJf6NMedt4DnGUuMuuDMIrc/M7hLWYwW5rJtdw2LxdNcjLx3eg
	 hE97c56nSSt5csVIfTta3IIuDPTIO7PTdvFHccfs3Mf+Jf4/SVWo5toqn5gjG0yk2u
	 j5Ku3RVpNmLkGZNpoS1R/AIuyfC7iDtyxlZn2Zlqwy+fm0S8cLd+1Iq2gimc3pWbm+
	 6y42EfefS9ZlG3ctNAl17WOmgySjaX6awji9dz97/TmZl4NUcSjkxBoln7lAsbx+vB
	 N6wTrMOQU93cQMhHCS9jMFdCZeArzCQA1s4vOlTuGQEQY/hg2hHK3uQG+x5UiqjOCm
	 cAwzJuOdWN8vA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xU1UN-00000000RvW-1Iur;
	Thu, 19 Nov 2026 12:43:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 01/19] KVM: arm64: Hide generic ptrauth from protected VMs without ptrauth
Date: Thu, 19 Nov 2026 12:43:34 +0000
Message-ID: <179509215925.3938200.7140871147964039894.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109084854.840576-2-fuad.tabba@linux.dev>
References: <20261109084854.840576-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, pbonzini@redhat.com, seanjc@google.com, shuah@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, vdonnefort@google.com, qperret@google.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 09 Nov 2026 08:48:36 +0000, Fuad Tabba wrote:
> A protected VM without the ptrauth vCPU features shouldn't have pointer
> authentication in its ID registers. Commit 3d7ff00700d1 ("KVM: arm64:
> Rework specifying restricted features for protected VMs") gated APA,
> API, APA3 and GPA3 on vm_has_ptrauth(), but left GPA and GPI capped
> at IMP. So generic authentication is advertised to a protected guest
> without ptrauth, and PACGA UNDEFs.
> 
> [...]

Applied to fixes, thanks!

[01/19] KVM: arm64: Hide generic ptrauth from protected VMs without ptrauth
        commit: 50e9e6b6eb3d9b2c318babce60abdf3b300cfb35

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



