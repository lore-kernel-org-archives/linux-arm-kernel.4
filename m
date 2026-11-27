Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC9F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oHlqBtGG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWxheuhR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LvY8gpHqcKWeG4yrA+GvRV59Qao1sbgMMnjy/o9b65w=; b=oHlqBtGGkFug+s
	jABHYII0CgIu903EVmPvOeEPUzREPyNIgilSNXku6tfa3n3rQHAVR53WZx6M0b/jx74ahUBc5hQZg
	6c9O5IHYWtYyFJMJ5zAmKOL+nEFEKU1uvK71NnKf5hCBCIL4eS7ZxBLqY6xE7+fD4iLkHy9ZS65+v
	76TNzHT9I5syn3Yn5EkVnybjdp722BFgrARdrd1RmKtr+TsTPuvkDWjXZ9KphvOXoV/s8spU+mjUc
	b8dq5ssEt6Bo/ut5Cw9xWbqCXenQMxXxooUjhsb6l9kPRP1bAuBN6IthQGdfqprzZlY38Z47S3UjO
	6aK05tyMIPzMomFSY3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rl-0000000HRkq-2aPj;
	Fri, 27 Nov 2026 18:40:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0rV-0000000HRe9-2iqL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:39:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AB2E623D1;
	Fri, 27 Nov 2026 18:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D361F0093B;
	Fri, 27 Nov 2026 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804796;
	bh=LvY8gpHqcKWeG4yrA+GvRV59Qao1sbgMMnjy/o9b65w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OWxheuhR0q4soGEPRstxNfAs/40rpsDgln8LJ7NfDzFSiP3D/3Ifd9+V7XEXB6ZN1
	 03KyNQyf5Zf1vCn9aiaTW5zjBpu5/864zYRAgUx8WQWHeloc7wkJAaCfqa3Tqycvv7
	 C3AuK1ilUA4XtozXCkO8WVMdlSHsXXFil5LC/FA2pmz0V9/vl4+tKsAy0CekDl1OE5
	 9KBbwpJYiXg9Cq2MJ9K3A5iE9nu/h82aOW1poOMd6k+Rosq9MjVpUV5i0MDvx2m3f6
	 n7xhB7tG/EV1hGQvyazwOCMCDNvYwhkQSfD3V8xq13NKDiqQOC3ER/PeXvZi8g35aB
	 aseIDyFeM1gnw==
From: Will Deacon <will@kernel.org>
To: julien.thierry.kdev@gmail.com,
	Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	alexandru.elisei@arm.com,
	andre.przywara@arm.com
Subject: Re: [PATCH v2 0/2] arm64: THPs for systems with pages bigger than 4K
Date: Fri, 27 Nov 2026 18:39:18 +0000
Message-ID: <179580213399.1767284.8136918755635870447.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127165843.709034-1-vdonnefort@google.com>
References: <20261127165843.709034-1-vdonnefort@google.com>
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

On Fri, 27 Nov 2026 16:58:40 +0000, Vincent Donnefort wrote:
> Enable THP support for arm64 guests on hosts with a page size larger
> than 4K.
> 
> Changelog:
> 
> v2:
>   * Memoize sysconf(_SC_PAGE_SIZE) in host_page_size() and back
>     PAGE_SIZE with it to avoid repeated sysconf() calls. (Will)
>   * Rebase on origin/master (2f3abe56dcd2).
> 
> [...]

Applied to kvmtool (master), thanks!

[1/2] util: Use a memoized value for PAGE_SIZE
      https://git.kernel.org/will/kvmtool/c/fe0c220df025
[2/2] arm64: THPs for systems with pages bigger than 4K
      https://git.kernel.org/will/kvmtool/c/4b4aceb1dae7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

