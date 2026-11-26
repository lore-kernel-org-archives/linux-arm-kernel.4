Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VFZD2cQB;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qulIGXwJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qbYUQnraIR9RiROQnfT4JURPWt6f6uoEIDxWbSfFuL8=; b=VFZD2cQBXg1/L/FpsDgWA50B2j
	DRINPcyewTccX1ALA820L0aeYI21vaz7KTFbRQWuBuTNk+SbAkq2z4pqL0eB94qlRFXXyhktqHGku
	4JO6PQzLzE6mUeDknHpRnfEVq7GQyhP99BWC9qW5HrMRtw0eV8XZlVBSe1fEVsetC2/mE+8rQi8Ma
	Oz8yQsABFMidbBBqlu1l3W+L1nItZ1Ubj9wcaujMv8AesWNtkAXurLNmFniDOAZ4NBO1JciGGASBD
	nBNJcge08UYEqpCkwGBBAgOk1TsH2hLUbQ8wdq1iBtSdERUYusmZflHmZwVozyWHxZ5tVSWALmUIu
	grI+kNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcBz-0000000Dsud-3RYl;
	Thu, 26 Nov 2026 16:19:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcBw-0000000Dsu0-1Cw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:19:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6C51BA8;
	Thu, 26 Nov 2026 08:19:20 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDA4A3F86F;
	Thu, 26 Nov 2026 08:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795709963; bh=+1cJobFx/hmnyVcD3xqPnhuB7i0y5kiN28v6vnttq4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qulIGXwJ46lk8EKkfjw7bm3rSRREKytZAsyObgI/DstFralkoSqrrdb4g3sbT+Ihw
	 tZO1QS8NdE9bkevlNJYbgoC05KS86LorIedHR5Pf3Fqk5PzGLvt3M/HN+0bGoKwAa1
	 bRZV8Nv4nXeHbadXlUoJTiOh36PmXpbyoIREgppA=
Date: Thu, 26 Nov 2026 16:19:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Long Wei <longwei27@huawei.com>
Cc: will@kernel.org, shuah@kernel.org, mark.rutland@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, hewenliang4@huawei.com
Subject: Re: [PATCH] selftests/arm64: signal: fix inverted feature mask in
 diagnostics
Message-ID: <awhcB558hdejyj66@arm.com>
References: <20261114081013.964933-1-longwei27@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114081013.964933-1-longwei27@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_081925_955045_8E2CF0F9 
X-CRM114-Status: GOOD (  10.20  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 04:10:13PM +0800, Long Wei wrote:
> When a testcase is skipped because an incompatible CPU feature is
> present, test_init() reports the feature set with:
> 
>         feats_incompatible & ~feats_supported
> 
> That is the set of incompatible features which are *not* supported,
> i.e. always empty, instead of the incompatible features which actually
> triggered the skip.  As a result the diagnostic prints an empty list and
> gives no hint about why the test was skipped.
> 
> Use the supported set so the offending feature is reported:
> 
>         feats_incompatible & feats_supported
> 
> Fixes: 32de73e89099 ("kselftest/arm64: signal: Allow tests to be incompatible with features")
> Signed-off-by: Long Wei <longwei27@huawei.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

