Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2860606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4V3ApIFD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKltYJ9c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7omIvyqBdJHk9teCPUFXfWrEzQ9+VYkHiJCDQQJQ93E=; b=4V3ApIFDgklfcrl7vW4t1DqcKd
	dllpfkYX3dD4wkqQGXMcuEhst8VaO4wZuZEIzbfyo++v9fqndqub6VU8UU6cXQ4ATQTPcHYvwVim/
	yFT9FMJvLdnmEXWgoldqGGaSOvKy+lkfDd6ai1+V9FegbTtwWeBDzB3wTdL9nflRid/G9cbFonltm
	KrvNOU2THrzWPdROWOaDY2f0IDEZDXVk8yqArBXEd2vAB9EZ9VQ8ca/Tu+b2eNbjpCSbPbenQBCLx
	zrQ72xx+jnIcLtEDs2yvE/JzXljB2jD57j3kf+CgGbfbHqEnKeCP/NBjYB7NbM/ctxfxfINgMChjw
	QwlmqVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0vR-0000000HSqO-1M08;
	Fri, 27 Nov 2026 18:44:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0uN-0000000HSS1-3IpW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:43:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C1EF618FF;
	Fri, 27 Nov 2026 18:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A351F0280B;
	Fri, 27 Nov 2026 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804974;
	bh=7omIvyqBdJHk9teCPUFXfWrEzQ9+VYkHiJCDQQJQ93E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OKltYJ9cUaVOyvxtAzqwRPybYHoVF1i9ar2+j8nlWyjpRvwBk0HEgDkmUg26j3SBx
	 Sujd3iSaszavzxUAX+VWzocOlHxJzmOnc+Tvk7Ds4JuNJRUbBRX6V3VqSQtPcJ82tK
	 6osWERdqqRSsHGZZCZqoIAnY5sYAKXmCcYbWhKMJXyGxwFcWzp6dZ77aZI8eiNydl9
	 tWbZOdpm1citPBz/CtozN6hPb1fbDjAX26zd+E0XIRZ5SkY6eGB+lHmQ9ioaTSJ6wU
	 j6jSK5HaUehLoYJ90C/UzazsKTsTUD9ICsYT0yd8KpW4e9QgMWoQXKfH6GZbNiIQ8T
	 UxYliNOKzliNQ==
Date: Fri, 27 Nov 2026 18:42:49 +0000
From: Will Deacon <will@kernel.org>
To: Abdalla Eldoumani <aamsdoumani@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: Re: [PATCH 2/2] kselftest/arm64: Check that PR_SVE_VL_INHERIT
 survives a second exec
Message-ID: <awnPKRtczyTiEcN0@willie-the-truck>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
 <20261017182455.1884-3-aamsdoumani@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017182455.1884-3-aamsdoumani@gmail.com>
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

On Sat, Oct 17, 2026 at 12:24:54PM -0600, Abdalla Eldoumani wrote:
> From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
> 
> The prctl_set_for_child test sets a vector length with
> PR_SVE_VL_INHERIT and checks that a forked and exec()ed child sees it.
> That only covers the first exec(). The kernel keeps the inherit flag
> and the on-exec VL across exec() so that later descendants keep the VL
> too, and nothing checks that part, which the fp TODO list notes as
> testing PR_SVE_VL_INHERIT after a double fork.
> 
> Extend the test to also read the VL in a grandchild. The child
> re-executes vec-syscfg in a mode that forks and execs the rdvl helper,
> so the VL is read after two fork() and exec() generations. Both SVE and
> SME are covered since the test runs for each vector type.
> 
> With a kernel modified to clear the inherit flag on exec() the existing
> check still passes and the new check fails for both vector types, with
> the grandchild getting the default VL. Drop the item from the TODO list.
> 
> Assisted-by: LLM
> Signed-off-by: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
> ---
>  tools/testing/selftests/arm64/fp/TODO         |  1 -
>  tools/testing/selftests/arm64/fp/vec-syscfg.c | 62 ++++++++++++++++++-
>  2 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/TODO b/tools/testing/selftests/arm64/fp/TODO
> index 44004e5..90ee128 100644
> --- a/tools/testing/selftests/arm64/fp/TODO
> +++ b/tools/testing/selftests/arm64/fp/TODO
> @@ -4,4 +4,3 @@
>   - Ensure ptraced processes actually see the register state visible through
>     the ptrace interface.
>   - Big endian.
> -- Test PR_SVE_VL_INHERIT after a double fork.

Since this TODO list was authored by Mark (Brown), it would be good for
him to assess whether or not your patch implements what he had in mind.

I can't see where the initial parent touches the prctl() and the way
you've added the fork() before we even print the selftest header looks
a bit weird to me.

Will

