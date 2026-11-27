Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA9606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OvtZH+S3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7kaoySV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uaHjZLrpMN9L3WSVjOAbvZ+Ofavq6wRNRY6SQzdluZo=; b=OvtZH+S3hEoono
	HvIR/pxha6pUfpBWQB+djxBBCn5ytDoOlAtilhgVH+ftZASsuf11BGzqQrj6FipFd3zHt+5kRjEa8
	dEryQMg28hb1EgvUwbCwnwwyOWl7Ob2WXQHCYC1Dcg0K/jf3gQTmDR3uMyhbnbdf6bqObub/Z7Kpb
	Pou+ml9a4lgZHewGm0hU2agCTug3fNREUcrhDa7blMtsBuKNnGs9E/nJNNrVII8w2DctY4iaN8Cu0
	jF7lrQ6lD2v+4nIfmGyBe9RKcz9nT9ep5MReO86968emZo/akvgj7hKq5zJ58Ta8UtHPqPbgOXJHe
	2Dxh3t09S1k3pZktFW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rl-0000000HRk8-19kE;
	Fri, 27 Nov 2026 18:40:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rL-0000000HRXV-2aRJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 158DA62560;
	Fri, 27 Nov 2026 18:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832D91F0182B;
	Fri, 27 Nov 2026 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804786;
	bh=uaHjZLrpMN9L3WSVjOAbvZ+Ofavq6wRNRY6SQzdluZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a7kaoySV7RUwt9W65cgLLNjJBHeZtcDXUoIEth4P33tRmbiiNcmRIxAYz9qgfDndA
	 Q0I77tvReSoszeWsBzwgSagXxqiCrRa/eCsNDMMFOPLf0XGkqjWjOmHnI89Q3+tOvO
	 8G5lLpDn9u6PJwUs4LfCJ7nrW9TmJa/Ejv9t+6n+EvLaU/WJ7rAQHO81aZ2SNhD9ef
	 Us3zEnGH/5q5rQQZWgNdExxthbIYV4X6lPurSIj0Q6hoYwBVIo0h2fQou6p05Ysh6/
	 6l+dNNlLDmGbogTmBuhVXSuAKnbtKh/kN3/ZuEig8W2CIchwf/kZxSDuGqlN3JtjIR
	 /H0cIN0b2A43Q==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	broonie@kernel.org
Subject: Re: [PATCH 0/3] arm64: fpsimd: Misc cleanups
Date: Fri, 27 Nov 2026 18:39:15 +0000
Message-ID: <179580139911.1459144.14039240319708843388.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103121346.1858305-1-mark.rutland@arm.com>
References: <20261103121346.1858305-1-mark.rutland@arm.com>
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

On Tue, 03 Nov 2026 12:13:43 +0000, Mark Rutland wrote:
> This series (based on v7.4-rc1) is a collection of simple cleanups for
> the fpsimd code. I've split these out from some larger rework that I'm
> working on.
> 
> None of these should have any functional impact, but they make the code
> a bit easier to follow.
> 
> [...]

Applied to arm64 (for-next/fpsimd), thanks!

[1/3] arm64: signal: Remove redundant SVE/SME cleanup logic
      https://git.kernel.org/arm64/c/f5fe3071b459
[2/3] arm64: ptrace: Simplify sve_set_common() SME-only logic
      https://git.kernel.org/arm64/c/76a0b08cf5c5
[3/3] arm64: fpsimd: Simplify sve_setup() format strings
      https://git.kernel.org/arm64/c/35c781f9b591

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

