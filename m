Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED4C606A68F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WyRdJjSr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPrgk4/c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d5UxhRENKrjN2WqdptUK5eL7RckbgwjJ8al7suyNLmw=; b=WyRdJjSrgp/odC
	UlEyl/jBgEB+BGp3Zg0al9+ZA1fGbpQ0QoDib/okSxq9U2+s6o1zmnEVJDEuyBhFs1qak0+ZMItRm
	u5qyXPgIXNq4FaWcbhYwVT292aoMwi0nW5Mi7wmr3NmHnWvLLaSVarkP38muY8Vw3MIox5Ga/zcJE
	fPY5ac6f1twr6ZSUwC9bWjaDJQDbVuyLuPVigsSDA2IOhCa126pyDsknrsYHJp/h+4VOxZ3MBgrCR
	cdmSOkw4Lx5YZq9Zw/3LZywA9VzhqoR4ABp0sAI7BxNKQHxJA7VKOLUcvCcrx64rhhkB0cX3KB+u9
	WSxddGFPLl72xiE2O9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUY7g-0000000GQEO-3llL;
	Fri, 20 Nov 2026 23:34:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUY7f-0000000GQED-0oZf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 23:34:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D48E41096;
	Fri, 20 Nov 2026 23:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B661F000C6;
	Fri, 20 Nov 2026 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795217666;
	bh=d5UxhRENKrjN2WqdptUK5eL7RckbgwjJ8al7suyNLmw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=kPrgk4/c9iGM7d9omUE7JaPkkuE4JeyTzm9y0r1D5O/JrECRYDQvPeP1BbMl8ciqk
	 8TCLIMZGVUGGgg4QuP4XMgmo64/zsUkKTewyF0A2dy1ssZ2HTqiGrd3V6r2Y+C2C7I
	 II/c0bF/VPCB/WbMMGSil6/nXU52M405WuoIaqVEJSLej7Ao1pCEB/0REFefZ5zH+d
	 ZdYPcwP5GVJDVYWxFd8iCyg9f/WwmGSjr+mrhKQDaHQB46TTVxXNvtPQXW8gdEA1tJ
	 3ed6bbLji/Tj4a6Ya8zgXPxTltDkg/nd+mS2SxxhMpjX/gEKMICeT/nXycy2mTnNc6
	 DBzTCnMfxQLfg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 93458198003A;
	Fri, 20 Nov 2026 18:34:23 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 20 Nov 2026 18:34:23 -0500
X-ME-Sender: <xms:-tgAa40WMd_EPWFNg07JZwyPJcDR9Hl4neZG2sZ60S43JjZakvJQFw>
    <xme:-tgAa94btA2FcjGmKSDp7fs53-xd9zJUgeojcI1BpmZaQ8Kz0eLzPAdMkS9qQ_7FU
    OZr59jIhg8MHlYyQnwbZeEYlF7PpV4Vxlr8KoLe3U5t0r5NWyCYNKk>
X-ME-Proxy-Cause: dmFkZTFL9seTInIL2hUW1OvhO1WNW9/yDQMQ3sNpaBykWH23VqJykrvUISWN+rBSHQ+5bq
    /JQwHxFYPIkL2Xu86dfOWtqtRPVNB/qIKe2+3mjFHHflxOdiuobuj78Hw/FMM8RVcs5xMb
    dS/DET/rxsPx6SEKm1JZ2K/buPZvqwh9FNjgcHALkKy/XLVkevo5sDDIARq2Z//kZnp9CA
    rSEoHmeWmhoezQror9Ty81ka79pfF/gOgXmZ1GkKqAi2/yxezmh6ijdV1UEGYFqsznmeWL
    g6Y1Onmgdfw7a6cltPUu6V6KYEQymMJvNVprAPmF42FlCo/F4k4Y9IbQe/ue2Z+ZHcN6bR
    AVBfQNgkF9KQh6PxBWA+qfee9aUYQOqptwYa8VjqHfwnjVYok5TV5bLTBLvGn0rIl/+57i
    WO2CFNlMLurWUHycX9pn9FDh03suHQbu/a60gn8A1Unl1x/x+0E2LPeaCXK7ov30TPL9HY
    o2ezFIxHQHCXTJI7edwpEegWtCs0Eg73XGWZUHhg6NY3KaNTAF6vI4OBcklGStE1NtEpHe
    N3vHrVedPTfuvnZlHDtl4lFSJEfm8EUJI7Pvrs07l9xMCrxgGBfUi29jmIbjOM3Gg8ZgCg
    sI/r+DEJkCrbUJ/3Cs8u1BxQF8UUwcuBBDKvKM9/eCBqk19JS3CGIDZU1VMg
X-ME-Proxy: <xmx:_9gAa8qH40BxQBQvJaXjFARB-PhdRsMar2JTklrPA3z4SJQHVTmxBQ>
    <xmx:_9gAa3xjvPAkaVp2Sku5NRZNcCLQid1uQn0F3mHKuHRTI4Ze8YW5dw>
    <xmx:_9gAa4fNmE8P0lI-MJYK8bBx9g6OJsEHDExPpHD4o_STbil2bs93ag>
    <xmx:_9gAa7et2LQJdchwIic0GV_SClr-FVPrJ93hKkhrIDg8-j26-Wdt_A>
    <xmx:_9gAaya0K8B0H7iHsoh_BofrwBklH8I5ogjHkW64OyKf3gN1PHCDP1na>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CDCA4F80093; Fri, 20 Nov 2026 18:34:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 00:33:58 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Justin Stitt" <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, "Mark Rutland" <mark.rutland@arm.com>,
 "Bill Wendling" <morbo@google.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Will Deacon" <will@kernel.org>
Cc: "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>,
 linux-integrity@vger.kernel.org, patches@lists.linux.dev,
 =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>,
 "Ross Philipson" <ross.philipson@gmail.com>
Message-Id: <243c6d70-7c81-4ad3-9a67-eb8cfbf454d9@app.fastmail.com>
In-Reply-To: <3-v3-22d1a1eb7d2e+17de-arm64_drtm_jgg@nvidia.com>
References: <3-v3-22d1a1eb7d2e+17de-arm64_drtm_jgg@nvidia.com>
Subject: Re: [PATCH v3 03/11] efi/libstub: Have efi_kaslr_relocate_kernel() handle
 extra_size
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

On Fri, 20 Nov 2026, at 18:51, Jason Gunthorpe wrote:
> extra_size is additional memory required that must be immediately after
> the image.
>

Given how extra BSS memory is essentially free at boot, is there no way
we can establish a worst case upper bound for this memory, and just add
it to the image unconditionally for DRTM capable kernels?

