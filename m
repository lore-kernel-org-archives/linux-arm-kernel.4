Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BE0606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a6volZge;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=E8isgUyy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yzusoICsZjm08Apg9oZ/jq4BkURI6t1XbBRqUFt4Xm8=; b=a6volZgeChdv5/PFSJnLMdO5a3
	C1hXB4A3JeQNJcyz+ldTaMpaLmqfolX06ANDl3gh6uxqMjlWct730/MmTKdA99N0klCNlo1fXuPRQ
	dOSBqLaLXofxUl707sromGHtC2LqCoxorIQvIWHqD4PqzLPoXqfOEyEWG/5+0xrQra0juCk8MQh5L
	FdLcbykPB7Ajws+OAhc7O1MCl4+B8RNNqAW6ZGtCmreKs025S7yERzf96zgDCXpPGW5Stujvjio6b
	62DQgIjdMBp9hxqOrh/tOz+ln48w7TEIz6gKQERYEs9ETNz/VMllTr/JX4lv9Q7fd0i8HBh8owl8A
	1328DomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpOl-00000006UGh-0uet;
	Tue, 24 Nov 2026 12:13:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpOi-00000006UG3-1NIM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:13:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEC79339;
	Tue, 24 Nov 2026 04:13:15 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 597E03F632;
	Tue, 24 Nov 2026 04:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795522398; bh=Bz7umvMoPtgIHCEppXFYHWZcFXpcpdG83AT8i+31kpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8isgUyyGUY/+jfI1aGuIyNhFLJGeRCpBVaEgIMVIro0/iHezUX1AfBowPvgiJpz9
	 Q8XwXcio+kDZ94maesvIvnFfWJA7eScolfnnIInPInsPyt/5BWuw2z90s3sSPKC6Id
	 p+Nv12OtfBR8jj+sVkwkHKNPO7e+P618mjt8jURM=
Date: Tue, 24 Nov 2026 12:13:14 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: patching: Annotate text_addrs, new_insns
 with __counted_by_ptr()
Message-ID: <awV_Wn0PivLnU2wp@arm.com>
References: <20261111164515.77988-2-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111164515.77988-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_041320_404874_109F4626 
X-CRM114-Status: GOOD (  10.63  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 05:45:14PM +0100, Thorsten Blum wrote:
> Add __counted_by_ptr() to aarch64_insn_patch::text_addrs and
> aarch64_insn_patch::new_insns to enable access bounds checking via
> CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE.
[...]
>  struct aarch64_insn_patch {
> -	void		**text_addrs;
> -	u32		*new_insns;
> +	void		**text_addrs __counted_by_ptr(insn_cnt);
> +	u32		*new_insns __counted_by_ptr(insn_cnt);

I'm not sure it buys us anything. The only accesses to these arrays are
in aarch64_insn_patch_text_cb() in a loop already bounded by
pp->insn_cnt. UBSAN just repeats the loop condition. There's no
mem*/str* use of these pointers either, so FORTIFY_SOURCE doesn't
matter.

The annotation can't catch a wrong count from the caller since insn_cnt
is taken directly from the cnt argument of aarch64_insn_patch_text().

So, I don't think this patch is needed.

-- 
Catalin

