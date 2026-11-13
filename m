Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8050A606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I9Qy/fKz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDV/q7oM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kYMHJFNVFiFalk04m96v7i/1RAseK2KlDLd9FQ6zj/Q=; b=I9Qy/fKzLgbkMZdmLX3fzlaJD7
	b2jAIeMVFzkGnll02I6HYj6j/VwpzHiH69rcu5Q8lxfeFIqxX3KqcKTxZFhA4ucFrH+by99vDrVL8
	hUmxN0Rtoc3Lwdc0ebZWdDe+pFWIjZWf3vOlC613HxbVLxQIIUgmWCy5KmBki2u9Zchp6ZUuUSYtB
	CI+Qqnz8WkxMN3Q2e5aqLc5xErZyhCm4/YxWybupwV3QxCnzMVmd2/SX9aIqLV40i0ogyf4WHuLVv
	i5FgAN8feDtA8PmpIQBxhNEunMYLUT/TtJ6yd45qyVDarreJJc0Le9UXxIAPZVxYFlqRzP0/Rw6kQ
	NKgWCePQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwXF-0000000E4Re-3P0Y;
	Fri, 13 Nov 2026 19:02:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwX5-0000000E4PS-3kEp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:01:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF4976242C;
	Fri, 13 Nov 2026 19:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B431F000C4;
	Fri, 13 Nov 2026 19:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596514;
	bh=kYMHJFNVFiFalk04m96v7i/1RAseK2KlDLd9FQ6zj/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jDV/q7oMWa+7vgvll0P1qJXRQwxO1z8iFN8dVuBgCuncKhAPRW4DjdXTD+QFIU1Q4
	 3NpB5rna/S+VrUs5Il+9NcQt0Eo/rxchHCXoomUJ8oddhzGJ/bBfweWpmThqGIb6iU
	 w3eZa/Mw/NxNozytYgfoLN3lfVzmtYTGF/DYCYuVJ0QjXCfzRAflPKFIy2+pVNHN3L
	 oc2Dg2jzCAFLKd51IlPsehSaRLZWloqxrvhfGQma2H1ZZIFqOJkkpFSBHRGp9rxTeK
	 vZSY6Z9GXW4o7bA+jrdxr2hlaX+rtcthU3jxk6UgF/6uds6UPrLRPVQB2RUzGAW4qU
	 iMguJ74Pz+feA==
Date: Fri, 13 Nov 2026 12:01:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
Message-ID: <20261113190150.GA2857474@ax162>
References: <20261029135020.272082-6-ardb+git@google.com>
 <20261112222720.GA188816@ax162>
 <bc58b973-3d54-4480-aaaa-f5d5269418ea@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc58b973-3d54-4480-aaaa-f5d5269418ea@app.fastmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 09:23:03AM +0100, Ard Biesheuvel wrote:
> On Thu, 12 Nov 2026, at 23:27, Nathan Chancellor wrote:
> > Who do you think should take this series? It would be nice if it could
> > start making its way to mainline sooner rather than later since tip of
> > tree clang builds have been broken for over a month at this point.
> >
> 
> Are the first two patches sufficient for that? Perhaps Eric can take them
> through the CRC or libcrypto trees, and I can send the remaining ones
> through the respective arch trees the following cycle.

Unfortunately not :/ we need the third patch to resolve the error since
that is where the conflict is originating.

-- 
Cheers,
Nathan

