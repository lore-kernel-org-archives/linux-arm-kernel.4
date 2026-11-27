Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B67606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lqPUDSrc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQtt4+ii
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=89RMRIKWWNaBea6ane5hEPw20FRJlePAyLcF62QfklU=; b=lqPUDSrcuORrlj
	6luL6emz8qkOGDAmZ+ciIp6Ji2xIYRE/EY51TXAjuB41aygoSzsu4NaV3eemu5Be7qB1mmSDZq178
	2nMfUBrJHm5Y4S4M5Ko02Hrhf7SnHbcA0WqlhueSvwl1BD4wKFyqBsoyPCXDrTXaBl9YooXjYoNu9
	hiETkeBjpAmC0Ci+I/nU4R50XcF7NfBFIlZ0CWF/1guudXdXuEUPotJzK7BXlH/jBDi9UoSBg1K6s
	7F5FOWeDHGL1mCpqQAycySAFnDC+e8sT6/ssMKYAPvqoPQVHeUS3JQpIORhIyTIElVgqsSzQZv7HH
	DucdD3znK6n2QtPu48+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rk-0000000HRjV-3o6c;
	Fri, 27 Nov 2026 18:40:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rE-0000000HRTc-2AAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F15BE61499;
	Fri, 27 Nov 2026 18:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9981F000C1;
	Fri, 27 Nov 2026 18:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804779;
	bh=89RMRIKWWNaBea6ane5hEPw20FRJlePAyLcF62QfklU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jQtt4+iiEUJaEq4hN4+2BgJ/ay4ze84LOlKVtro/iTenbCE1eN2aDuzgDJURlAOf8
	 TVPK50fxKHgOU/dC4u4faJ0/0YodGF6xqo5MSJDE/gDcrj/WdgLkcLJTQBHhW7T9Z5
	 pduIqiWoMC8fTzOXJHqj39wz5KHPmpnLE9cn1Zot2NCtojXvrWBzA6x2UL2xg88xqz
	 GlzLTtQY3CATZt0aJ57EwRkuvDgK9NR9mSs9crgc9aVdjus9DeVmGVBLH9xtvqJhef
	 Lze5GUh7LuEpnIGh89tdxKBjlOnBielMN5Tc7cw2nHRESU7MZKl03W8u4wnjRSBKrY
	 dx8RVnw2j+vyA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thorsten Blum <blum@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: patching: Use uintptr_t in aarch64_insn_patch_text_nosync()
Date: Fri, 27 Nov 2026 18:39:12 +0000
Message-ID: <179580147175.1460223.17763348667928173059.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104095943.97344-3-blum@kernel.org>
References: <20261104095943.97344-3-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026 10:59:43 +0100, Thorsten Blum wrote:
> Use uintptr_t for tp instead of casting it multiple times and pass addr
> directly to aarch64_insn_write().
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: patching: Use uintptr_t in aarch64_insn_patch_text_nosync()
      https://git.kernel.org/arm64/c/df82e34e4a18

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

