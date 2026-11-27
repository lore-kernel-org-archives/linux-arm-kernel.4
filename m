Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kjGSKG6R;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HqZwLFpW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=enwqfl+4wuR8Y9y1nhqYyOCu6F3YAaMqLXfuufw2+xA=; b=kjGSKG6ReIHh3/
	ejPzGY+ofHmPG1qcCe3PdP7qRoDmJ905saVTR1ntmwZcjBU6c921VR+q6WhtxEiyrvf1BPiGVY0Tq
	43grAQfCKnpDaYiPHvC4O6wrNy4Nb9U9VQieMU3DmJdVzsiZRJEjv2xmt380ztqYd/P7rWsu21xRy
	H9NdfF2fwqHJDWEvF4Op4JylmxbvR9alTrgD99E1taDi+vcGMFfbx5wVBhGor/MUQIhUehL8Y9zwW
	7JCZy9yD7J/YDjy6uUaWCvBExdNNscnqjjM1IfDDKVO1uDp2QXHsCyaqhP8yr/zHGC87ve9b0fk+Q
	iAJ+nJdmlBHISdSXKe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rl-0000000HRjq-0ZGa;
	Fri, 27 Nov 2026 18:40:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rG-0000000HRVS-2zit
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 203BF454E9;
	Fri, 27 Nov 2026 18:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3853F1F0089B;
	Fri, 27 Nov 2026 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804781;
	bh=enwqfl+4wuR8Y9y1nhqYyOCu6F3YAaMqLXfuufw2+xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HqZwLFpWeO26pfdnY5/zZYRdP1dl9tCgeeqG8/OagVRyDzZ/oLLoyKv4BRqD17R5u
	 B7yTjiLOgpUhmMAfX0CtCD66C1m7PfnEOuoLG4+hjI95a7in6bAkkfsiJ/NyZFMZyi
	 GasFAczc0+AsKlDBt0KkuuAyOR90Qsda/GKtLIg9mCi58O990CJ2o+PS9yY1XeANuy
	 YVC2mcd3MCfpl7KfB/EkjsLayWpc80wJ5yIjkCWid6sNkW9a78HpbRZ9exqtHC/PTx
	 XJ0hi8tyK21RTL1fKGbiZN/O55jJJBmUUbEJ6DQ4Yr4yj2TnyGUt3hNBNOA+LaJvxZ
	 DWM8io67sR40Q==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Dmitry Antipov <dmantipov@yandex.ru>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest: arm64: fix README typo
Date: Fri, 27 Nov 2026 18:39:13 +0000
Message-ID: <179579974710.1442780.5884936987110829758.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020085316.1880320-1-dmantipov@yandex.ru>
References: <20261020085316.1880320-1-dmantipov@yandex.ru>
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

On Tue, 20 Oct 2026 11:53:16 +0300, Dmitry Antipov wrote:
> Fix trivial KFST -> KSFT typo.
> 
> 

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest: arm64: fix README typo
      https://git.kernel.org/arm64/c/efded46f0a94

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

