Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EE8606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0i54hF82;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjsSqSr9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NSxrWerDVUD4OAZBVBT8f6aipq0wkqN4/k67VkANLuc=; b=0i54hF82Er2GDs
	4aNwavC635Iihv6REeecF/kgCqA33lbErFGMMMmcXax02LjlWRyNom63tVD7qY5x5V+B1qKPf2vKm
	/jrBupn3n2AtRtsL/SgrmqsadzzxPNX/9gXfA04Z63Dx7xfwDMPjge0YpyrZOCnAUaOk5TmTXNmWf
	9ML2Txqxx4eZQnOXPF6VNulPoNIJWYxPu4job+rraIFdai2XjXgE2Rt0nnpMP/QiYOw1mMus9/2SD
	Pj3C/lbzKThedfvwRBNb9lSIxyldJnu+xIsjdW0p0HFXC8DrDDS2DJg1xHAJeeagAydtaARNa4FH1
	VFp9ORFHADHKhztEtP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoRI-00000006Igg-0ECf;
	Tue, 24 Nov 2026 11:11:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoQs-00000006IdE-0QhQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:11:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D77664486A;
	Tue, 24 Nov 2026 11:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7321F000ED;
	Tue, 24 Nov 2026 11:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518689;
	bh=NSxrWerDVUD4OAZBVBT8f6aipq0wkqN4/k67VkANLuc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=PjsSqSr9u0NwFamvOlvxXG5jxpGF8/FSmZhX6+Bo6m7HT3SqSUPPVQuLNJksDFNR6
	 /6HxtlId/Qhw3djIMN8D1FCzkvrI5FZmPjVLhKoF+WCeimYWCJGuks+SW8y8v49XI7
	 3HuuchP0WFbqun419aD2PLnzJHbgH5GbCba3PKF4KCAWjR5Y1BS5C+ISshY3T/Gbqp
	 lrxCZ+BLi+QW4xMapcp8tuDJQA9R/MS+vtjoT/MkRmOEzCiGFoCbISwR0WteiipYr4
	 ZQX0Q/IUP0XuRCQF7RpJLSf/DEVkjZynj15ryWAJ+bT3QBIEpPGecG8ZWfpURO8pmr
	 KRBqLRHD0RSbw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 95AC41980047;
	Tue, 24 Nov 2026 06:11:27 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 24 Nov 2026 06:11:27 -0500
X-ME-Sender: <xms:33AFa8rjZyxVEuWiZPC8MB_b4jHBfwm9CcaCxHmYDZPQiPt0OOjIrg>
    <xme:33AFa9dMqkTCvGvwQHbyCq8tx2uAuQDeOsCA_09gfeJUzSvKzzYRBvkseXqFB0q5D
    gVwfAWb6uFQOdKhoyF6iaOLwyaIDbHBC5LktkG09mqrz1U02XvsH-s>
X-ME-Proxy-Cause: dmFkZTGOqtGOvzr+VHUOxMo62cqM3udAVEWtGm22R9C85i1IVw07DOw5z2ne0UbiNMh3Xm
    md+GqwxSY9YeA+u7WrSm1o/Iwt5fVYlNT6Rsxey8TbBpc29g4327/k4zoECWwlgoQjSdP8
    gevWXgQn+9CGUGzeIn3zuBxRn7KDZk+L2PwRnD7OT/3bUdEK7vnfxBTzZjQzJwnQFHYhdU
    0OhD1l0I7go5ZfQ/Eb70CrXOhS+RPON65NrktViFQjVmX7U5XBK80Ey6SsPS82P1i03bQi
    H52PoxI+SFo4ADW0smVxhYLHOR7CwWlEM4uA1cc6XpvSJfXGrkTH+xRnFvi3FojshcoCWK
    LZTyALPT6f986gSIJOJZC5Z3h6YXK8EFzeqHiLaBcgY0ii/lMVGteLw5ZiKGH8BHPfDSiG
    qDmOnlTFRrmeniZG2tDvVGB/VhZU384XSPFOh8Kx8sEjMhusaEw4wxyEDPYdeB5uZJZeh6
    wTiwdDHvVlhMvh2mazuoUxd0PagzOZBCEFOV/qyZU2ahsZfSyEQTNd+usaRK6vEyjiJcY1
    /pfqhYpVWqty1u9txqVhG08Yl0OJtCO4FPKNYRIy4qexrWTUQ0IeeqdAm8wPo+y7DU+qmJ
    CP3y9EvNCgqAh40Ac1RX1GdVgabuM1uqFT+xZ4a3+HyxxpLwG+7MC5PKJ7YQ
X-ME-Proxy: <xmx:33AFa0iKJX7EYL6NBrUcto04R7fH6f2YX17BlD8wYkF-Uror-7evnA>
    <xmx:33AFa9v-R-kJ0ZhOBjbV3HNtVlAakUHdK5vv2lsD90LAl3lnwh8wfw>
    <xmx:33AFa6QZOSZ69OLcUhnUoISdnBa4QwHuaSbyxXeAtYbPHS14Qp1aeQ>
    <xmx:33AFa52i1sBhWrwcDG3QS61ufurCkEBxlXbcHYgdCWILhOWIA3KPgg>
    <xmx:33AFa3umEnQbsyl_9BqjvsZUmmx2YYQ2NP5n-51r2PaLY_qGQ4tgj_QK>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 40077F80093; Tue, 24 Nov 2026 06:11:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 12:11:06 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org,
 "Emanuele Rocca" <emanuele.rocca@arm.com>
Message-Id: <fda20d6c-34c1-48fe-9c95-c25db12e9d4c@app.fastmail.com>
In-Reply-To: <20261114204245.67919-1-ebiggers@kernel.org>
References: <20261114204245.67919-1-ebiggers@kernel.org>
Subject: Re: [PATCH] lib/crypto: arm64/sha3: Use assembler for sha3 instructions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Sat, 14 Nov 2026, at 21:42, Eric Biggers wrote:
> All supported assemblers (binutils 2.30 and later, and clang 17.0.1 and
> later) support the sha3 instructions now.
>
> Therefore, drop the use of '.inst' in sha3-ce-core.S and just have the
> assembler generate the instructions.
>
> This requires adding '.arch armv8.2-a+sha3'.  I also tried just
> '.arch_extension sha3', but that doesn't work with binutils 2.40 and
> earlier because they consider sha3 to depend on armv8.2-a or later (and
> this file isn't built with -march=armv8.2-a or later).  This was fixed
> in binutils 2.41 commit 205e4380c800, but the kernel currently supports
> binutils 2.30 and later.
>
> Also prefix the immediate operands to 'xar' with '#', now that they no
> longer need to be plain numbers to generate an .inst.  This isn't
> required, but it follows the standard convention for immediates in arm64
> assembly, including elsewhere in the same file.
>
> No change in the resulting .text section with either binutils or clang.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> This patch is intended to be taken through libcrypto-next
>
>  lib/crypto/arm64/sha3-ce-core.S | 73 ++++++++++++---------------------
>  1 file changed, 26 insertions(+), 47 deletions(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

