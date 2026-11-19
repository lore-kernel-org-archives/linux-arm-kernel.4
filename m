Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BEF606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 22:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zUOTHU+U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjqQEh6G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7xduQdNjK7mJjEqx5hP5wE9y2/GSeXNusATUAA017PQ=; b=zUOTHU+Umr4Cqy1FfnTUcEMf71
	t94kS3ezX2vQ2Bookvg/sB4oFpr0ziOSct2FKRu8raPHrjI72RfbHBiEFUpWhzvM7mKEHK5dPx4bB
	+zW6U5JKUBpbVYKZh0vIpvm3QKEtpfAkNUwJ87a6rpjiALCQPerWadjtMwPInYxWICdmHW5kRCNUW
	r/UL11G+TSvB+Cd2KLjMpn3tlaIpseeVXNxEff9SGLreBMdQ1d89t5Jc6kcN7oGLr81vluv/ZN/Ve
	w9FTorUBXU7XrgriXKMnTGHmYk+67ybdJ0bHwmo6Pu6gy4X+l79D5Rdmt8FHPFCgtk2nawsrNNYVC
	acnJWGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAxp-0000000DcQ3-3Mg7;
	Thu, 19 Nov 2026 22:50:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAxo-0000000DcPt-243a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 22:50:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 973AE62220;
	Thu, 19 Nov 2026 22:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B781F000C0;
	Thu, 19 Nov 2026 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128643;
	bh=7xduQdNjK7mJjEqx5hP5wE9y2/GSeXNusATUAA017PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZjqQEh6Gx0gp0et0cBUyPAqE18weJt7P/UMLhpv/c7xd9GacXzYAPQ3ibFhWfaiu+
	 H5G+MTSxKZji4wKq36Gl0zgY25MqBZyDImEc9MysVB7I4UQg0KlBGvYl7KU/VaX0tk
	 n2gOtAx1g8zRfmb5TyQuAHPyp21F/0rOZ0OU7ffpGcdygh24FEfrkWHp7wrxXfr01e
	 mCL49keGPEMw16RIEn25alBzTzoZHItaV1IZYj9VtBqWlskIxJHP/x/xCYOYFy/9Qx
	 EmA+B+IL5lCXUab+F7bQW/TCQaaBmJ/bx+dIOjuWETBpWVRZ/DdIJTZTkdmdp6oAcd
	 YLyaqsJtEhnow==
Date: Thu, 19 Nov 2026 14:50:41 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH 0/2] raid6/arm64: Use aggregation and 3-way XOR
Message-ID: <20261119225041.GD1894@quark>
References: <20261118183335.1944213-4-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118183335.1944213-4-ardb+git@google.com>
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

On Wed, Nov 18, 2026 at 07:33:36PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Tweak the arm64/ARM P/Q gen/xor code to use 3-way XOR instructions where
> available. Details are in the commit logs.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Demian Shulhan <demyansh@gmail.com>
> 
> Ard Biesheuvel (2):
>   raid6: neon: process four data disks per Horner step
>   raid6: arm64: use the EOR3 instruction where available

I left some minor comments, and I don't know this code very well.  But
overall this looks good.

Acked-by: Eric Biggers <ebiggers@kernel.org>

linux-raid@vger.kernel.org is supposed to be Cc'ed on lib/raid/ changes.
(Though I don't know whether anyone from there pays attention to these.)

Andrew Morton has been taking lib/raid/ changes for now, so you should
Cc him too unless you're trying to get someone else to take these.

- Eric

