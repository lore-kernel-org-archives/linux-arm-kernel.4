Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D961606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ba0ah0oU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8Sg+5Q4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mEF01XSutK6OiYIL5GsOD9Pg+N69x5w2z8F66Ac8pew=; b=ba0ah0oUiyoBgVTJLZNsxYpMQ3
	P+OGJVDWMES3v8ECbMCk0clo2dDYKsUuv+MQk2rQHRLfdUhkG+YRahovlk0bvCcl15KWM5qbxlAWN
	elYn2vkDAeBPddcm/VTAZrevA//tDhnIaiUaJ+RHG3QXhxtFxrQPmzIXMZFjBBa6i5c0cG7F8wdc3
	fbAgfqdQUrXAf/eZ2HxQYyhZCkN7Vy/SpjYEV8evDt128BXj8L9aRYM719Szz/EmuXXEVb8upk9eu
	ts+Tvvv8Drm8jo8n9XSWuKKqsy2cN/FgGC+Wh4UCfrPf7rEQEjK5nq2lgAPLBbKY9zU2nOXXNcN47
	OKvwPGVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuYk-00000007PWH-36Q6;
	Tue, 24 Nov 2026 17:44:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuYj-00000007PVx-1Aq7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:44:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 494F6622B3;
	Tue, 24 Nov 2026 17:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB5F1F000C0;
	Tue, 24 Nov 2026 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542240;
	bh=mEF01XSutK6OiYIL5GsOD9Pg+N69x5w2z8F66Ac8pew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X8Sg+5Q4w0OgIkgoYP1iLUxnrkOSOp3EiF1ix0p4gWRW8d8IsoyyNw5Ny600vVwov
	 WmmQCLuRIvQHRMh2ihos5HyJ6WWlgQdutDRmZtgQ1GwrHbiSIguI2KOd4x5wbcoSk9
	 j1T4muALCA3oxAYZVwPb2/Ga/37lz2PdoeOR36sdL0BIqUucAsOFmii6Ppcjuub7PG
	 khasVElNqnAIcoKwkHsNMcMohBqp5agj8aDngpSXHvcJ1Li5FAdNDv5Q5jHVNR89yl
	 AsKgYB9VeNZ5tYw4opqq5zVLU24zCEHkSTg/6VC2BiZZSCgk9w6DsyvmS5DB0rASk/
	 DnHRcal1dhHQQ==
Date: Tue, 24 Nov 2026 18:43:54 +0100
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: patching: Annotate text_addrs, new_insns
 with __counted_by_ptr()
Message-ID: <awXM2h0A4UsEQ3go@kernel.org>
References: <20261111164515.77988-2-blum@kernel.org>
 <awV_Wn0PivLnU2wp@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awV_Wn0PivLnU2wp@arm.com>
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

On Tue, Nov 24, 2026 at 12:13:14PM +0000, Catalin Marinas wrote:
> On Wed, Nov 11, 2026 at 05:45:14PM +0100, Thorsten Blum wrote:
> > Add __counted_by_ptr() to aarch64_insn_patch::text_addrs and
> > aarch64_insn_patch::new_insns to enable access bounds checking via
> > CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE.
> [...]
> >  struct aarch64_insn_patch {
> > -	void		**text_addrs;
> > -	u32		*new_insns;
> > +	void		**text_addrs __counted_by_ptr(insn_cnt);
> > +	u32		*new_insns __counted_by_ptr(insn_cnt);
> 
> I'm not sure it buys us anything. The only accesses to these arrays are
> in aarch64_insn_patch_text_cb() in a loop already bounded by
> pp->insn_cnt. UBSAN just repeats the loop condition. There's no
> mem*/str* use of these pointers either, so FORTIFY_SOURCE doesn't
> matter.
> 
> The annotation can't catch a wrong count from the caller since insn_cnt
> is taken directly from the cnt argument of aarch64_insn_patch_text().
> 
> So, I don't think this patch is needed.

Fair points. It was meant as a hardening change to prevent future errors
and document the relationship, but since nothing is gained today, I'm
happy to drop it.

Thanks,
Thorsten

