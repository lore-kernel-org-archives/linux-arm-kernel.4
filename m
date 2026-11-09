Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CCE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dK6bawv8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTZeoKAA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YQwiMbJ6wk3a8ki4tGknCqp5ZXdiEZZalr4HJ25sGLI=; b=dK6bawv8OabAdt9xvSDZhlIgZg
	HnhY/P4nmE+ono6Sut5mK5YprOJs0IKC1OY5NuC/5tHFm5yxVKS+rL+nqhMs09M6gt0laMqeFO4P5
	8UkPJRInr1ekVLmz0FXo0hw1hWA11XQIhA9cQXEAIPn53v5RAXWn2hDWnaVNkJ7ysuPI/hdJ64krO
	454NkKtv+k03XOIcBaMzi2NchvG46peG4UDS3ChzyFniRMpVd0tZfvuW0C6tu5ZIiSdKFq5FiiPiA
	OH59RT5BNw4dElFSdPj56ts+Vz/hFymj6ZjsgHAVGMezdNkP9e0TKYIzLXqFiwfheWgwQAd3xtwK1
	bJaH6QPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJWZ-0000000HY0J-09L3;
	Mon, 09 Nov 2026 07:10:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJWX-0000000HY06-3rc6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:10:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 19D80612F3;
	Mon,  9 Nov 2026 07:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 496321F0089F;
	Mon,  9 Nov 2026 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794208236;
	bh=YQwiMbJ6wk3a8ki4tGknCqp5ZXdiEZZalr4HJ25sGLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTZeoKAAqqBWr5G5W80KCtsk3DzAHDLYLkNuU204LWQKPN4YXCNBvEr7IUej2oxzY
	 0lyQCsBLOhyYoxC94GO0uQwVWfsNPPJyH6HmKDRQbj1ZXqwEdPSBmRxEBS4/mzPtjZ
	 KhW77Mk8GZdOSaL1ubEH51pkMM+oEez18cOPdooGWcoAuQ7Jx5tm9WRYg9mFOg4CGa
	 7TqmTFbOD/fr6MyGWk+ZPxgKCHfwIVV4R1Oib2XKqqi/HZbYU1jKjxewG/hra6HwXG
	 iDuzseZ6U9xZZiYC3fkMdtivJ3H71QxH6d56LYvyE058IiMKFWyHSG8qxw1ieRf/Yr
	 VmNb8quYe1lGw==
Date: Mon, 9 Nov 2026 08:10:24 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] ARM: kprobes: Rename test-kprobes.ko to
 test-kprobes-arm.ko
Message-ID: <avFx4KAiDPYlYAaC@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
References: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
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

On Mon, Nov 09, 2026 at 01:46:42AM -0500, Nathan Chancellor wrote:
> When scripts/modules-check.sh is fixed to normalize the module's name
> like name-fix-token does in scripts/Makefile.lib before checking that it
> is unique [1], there is an error due to lib/tests/test_kprobes.ko and
> arch/arm/probes/kprobes/test-kprobes.ko having the same module name.
> 
>   error: the following would cause module name conflict:
>     arch/arm/probes/kprobes/test-kprobes.ko
>     lib/tests/test_kprobes.ko
> 
>   $ modinfo arch/arm/probes/kprobes/test-kprobes.ko lib/tests/test_kprobes.ko | grep name:
>   filename:       arch/arm/probes/kprobes/test-kprobes.ko
>   name:           test_kprobes
>   filename:       lib/tests/test_kprobes.ko
>   name:           test_kprobes
> 
> Rename arch/arm/probes/kprobes/test-kprobes.ko to test-kprobes-arm.ko to
> make its module name unique and clear up the error.
> 
> Reported-by: Sasha Levin <sashal@kernel.org>
> Closes: https://lore.kernel.org/20261108225808.1809266-1-sashal@kernel.org/
> Link: https://lore.kernel.org/20261103110411.11698-1-info@daylightlinux.ch/ [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> We would like to take [1] for 7.5 in kbuild-next, so we would appreciate
> an ack to take this directly or a stable branch that we can pull in.
> ---
>  arch/arm/probes/kprobes/Makefile | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

