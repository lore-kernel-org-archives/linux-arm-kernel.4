Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2779606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VfuZrwlp;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qkdmn5b2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QsGdKG/KD49x8kh/L/31jkdnS0AYzN1/NmNkRV4H86Q=; b=VfuZrwlpnYESUSVVaICSsa7eyk
	+Jkf5b29VV5RV5N4CTl3NZDVYsNmeOj/nDuDg4+KU/A3LXKH/P+x77GaYhffomX7F+NLNfLdvvoDz
	fLo/ZGGL7blTxcxtHYZynDJLcrOtWDIPthqDRlrYchY34qQsFSxjhzB2ENtBKyDrP2pa3kCofqQi7
	HhbayR23gJuQUPkvmdQ26J8G90QR/CV/cU2D+2ytM9y874LFHRLWz4/FUI3LFDgHH0Oh+wDWFMky8
	kxOrFvxT9o3U+/fGEzrueWQMNilYVaxrf4P4pnQj2GsiDVlh+jQBAEsSeXmOu3eubqMEntQejMAXx
	ZNM83uKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqew-00000004nuJ-1pzM;
	Tue, 10 Nov 2026 18:33:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqeu-00000004nti-0Y0g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:33:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F3921477;
	Tue, 10 Nov 2026 10:33:21 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 316683F85F;
	Tue, 10 Nov 2026 10:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794335604; bh=wZpA4tSEkZzY5bAQjPtDXzsMjtvMfTAPE1zEhv36Z/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkdmn5b2WFR6H+pW4M0yFIkY8M/jdb7wwi3KaQDM0fXSoiXHNUIiBM1iJY+mjkVHT
	 vLzDDTbB6NUbsjbVkGRFOHzbVG5NQ6/HnA981y2+MpBXQUrVQKPB+4dtYDFFxrKrhF
	 FkxD5vu8FlMT/cYZlDI+Tm2lV/jNbEWsxKOZEV14=
Date: Tue, 10 Nov 2026 18:33:20 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peter Collingbourne <peter@pcc.me.uk>, stable@vger.kernel.org
Subject: Re: [PATCH 01/24] arm64: Fix lazy TCO clear when enabling user MTE
Message-ID: <avNjcKtuQkZW0_Sr@arm.com>
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
 <20261107-mte-kasan-split-v1-1-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261107-mte-kasan-split-v1-1-d84ea5f30f94@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_103328_214358_D0BEC894 
X-CRM114-Status: GOOD (  11.04  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 04:36:07PM +0100, Pierre-Clément Tosi wrote:
> On kernel entry from EL0 with HW KASAN inactive and user MTE disabled or
> in async mode, mte_disable_tco_entry() leaves PSTATE.TCO set to avoid an
> expensive write, as it assumes that EL1 tag checks are not needed.
> 
> However, if the thread is in the process of enabling sync or asymm MTE,
> set_mte_ctrl() updates SCTLR_EL1.TCF0 without clearing PSTATE.TCO! As a
> result, kernel uaccesses miss tag faults until the next context switch.

Nit: next context switch or another syscall. I think this makes it
clearer that the only potential missed tag accesses after the prctl() is
a signal frame write as we don't have other uaccesses.

> Clear TCO in set_mte_ctrl() immediately after setting the task's SCTLR.
> 
> Cc: Peter Collingbourne <peter@pcc.me.uk>
> Cc: stable@vger.kernel.org
> Fixes: 38ddf7dafaea ("arm64: mte: avoid clearing PSTATE.TCO on entry unless necessary")
> Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>

The patch is correct but I wonder whether we need a cc stable.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

