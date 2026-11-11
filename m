Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A105606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SkWNrRv8;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lfYGMv79
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TmyvoYQN8Xr0ogKf42Npt/1uUvAg4Sn8MVVxHY9pi3g=; b=SkWNrRv8UZtsF21hV7NWSYCdQF
	YWKdme5XktFROHfbJiobC3upwCnrChyxEwzCblxrhp+lmPGSnzDZxEOnR0k3biUZvGslsNxjGcbzP
	ek9TlK/zr2Mc3nD4KhUuvi6h70zcHwygy9LsQLrLOrRlTte2Y2HbG8PiFZE5ytS8RmHTaE2XZgKnj
	yAqmxloHfXBNthBHLjrRbx4yYsfR7QK6i0K8jZWXKDdFuFL9mW1URqSBaV6x4AVbJMxvACQlYUe7s
	dEtPMUwp0XCi/IiYqXI1Y32MX8iy+M3+gtN6pH7HztyWbxZ7/qx8hi8vFwJg3EQ6N/nzNeXN2L06i
	W43WatDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR492-000000066QD-2ADs;
	Wed, 11 Nov 2026 08:57:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR48w-000000066Jv-0WDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:57:23 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so1893384a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794387440; x=1794992240; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmyvoYQN8Xr0ogKf42Npt/1uUvAg4Sn8MVVxHY9pi3g=;
        b=lfYGMv7905wStwHyIdGQTmh7I97sN6/mSC8cDAUqRqZtVLNyxNQjU45t1zbu3/uWMw
         +Uyccc98VefoQScqv47IswkAKl5fTdLbAan6Z8uIaZ2bvCBodEnTECz0qvSdwO0Hkr2r
         F7jcmduJ6bsgvNC++Hvr4ltF8aXkn/bcjgdh3UXWY8lMR7BjSyWRe0lpD/g6qyM3AZNw
         4QcSF8dcbDAqVDYBYNL4nw5C9149QyGamaeKbunEG0QuR16AIGMoeoCgEGmop8V4oNET
         wfd9M59L/Q8O/Q3JenbLTVbV/806xBC+c4EWoTfU4R3JB//ASArC/T1KrtLouXXhkFtG
         aPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387440; x=1794992240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TmyvoYQN8Xr0ogKf42Npt/1uUvAg4Sn8MVVxHY9pi3g=;
        b=KeL1PCWds0q4yXVLc0JSyxMy5vGKNpTtzmSFEjSrOjewWaWojHxpjF5T9xurIHpUyc
         4FOWN5ik2pAEESs84GhGCsTc9Zs8FCyM4kCdo+Itg7Ye3gVN0w/Y2v2+yU3DlkOvHGW3
         IUeadM9XxAY1zfwcHjRdFfgXV679Tk0y1L6WwYvzDptN52MJ9o3736xIuNwHpXm4fWe4
         Cz2l8ybQ+KygN5ETMlA935fQfItQsjtaPh9ScZv6Eprb1widQA5h7sOvn24cZ0TP+kmj
         kJnDiseXj4EAbzmafAif6LAe5SaH1ddOxH+1PuCs5jLzLriT5fZNUTOEH0Ku4/Cl4hEB
         ZQtQ==
X-Forwarded-Encrypted: i=1; AL+hErF7LXmR/9JoGkn7kJMeUWtO8LFTo1hvoetIDNn0usnjOUasLHjCTR4PB5SHcVR9CPaD2vU5utkA1gDa1Ow6AfCZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/sPhruHkXvYNCCOTpHkOpXupN9Kj9eTvVjt9h15/SDHFfocyk+
	tfLWA5KxDtm5LLDHtMBbetiYjFYA/WZ19cFj4IRZVMzKAEaSr3hvIBOtcgKk6eeiZCNyKcfiT8J
	X0kgxjg==
X-Gm-Gg: AYBFou38lxu5/8QV+Lv/IlCBSM5TwBd0Q/EHnHrG90EnGm20/hqwc39JTubbcnuovJe
	qeYK36trDCeafNPcLKC+CI8e8VWHjSZYW48UEKSnJA66PPFQ4ayLJ1ZRQe+aN1hGILf6v/IyXB7
	C+yMIjV010mnC87AWFe+MbUx8VsW08Di3ZMVvWfoYySWXXxCS583ZvVasNMKrE5H1k4yPRjwxF6
	xW09oGAnNGKd+7GrJuyFTwsV3P+lUxGRiqljEP6DQhAVpGXhig/j15uDIWzz9POtBv2cNRXwnpL
	ZS1BPDsyT2aV2gCZFG6K4RROps1/PNWy0KzB2Ibrl1ZGXIw0Dcb2mCu73NC61ANZZDvlI+s6Oon
	JUCQLOzwpANvPpo4QnIJ3ivvvLFCR9TtLA3oNT20eBe8hGWo5umiQ5ndqV2yH8NatDdTN+Ey7DT
	N+AUEyOKKERCOGwi8KMJB67H+O4G5fxpmbOXFhFfcH5fA8tyjuSvjluHVKQDRd5zogsBe0g0Zks
	wux5LGu+z5coIlfq1y7YkkfFYyJK7hNc93ZELZLL8ghrDb9TuLtr8OqbF7QdAlnoPKkLBOhJFww
	nwQ0XkhljAknXBTWJP/f+vW6Ongk0jwgVBJ6IViA07mAFy3f78RuOYbnzXrk9TwctQ==
X-Received: by 2002:a17:907:6ea7:b0:c44:9a32:b27 with SMTP id a640c23a62f3a-c5066b4a859mr135081366b.25.1794387439434;
        Wed, 11 Nov 2026 00:57:19 -0800 (PST)
Received: from google.com (202.70.147.34.bc.googleusercontent.com. [34.147.70.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a663f3bsm213970866b.72.2026.11.11.00.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:57:19 -0800 (PST)
Date: Wed, 11 Nov 2026 09:57:15 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peter Collingbourne <peter@pcc.me.uk>, stable@vger.kernel.org
Subject: Re: [PATCH 01/24] arm64: Fix lazy TCO clear when enabling user MTE
Message-ID: <avQqdBEGwje1iVlz@google.com>
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
 <20261107-mte-kasan-split-v1-1-d84ea5f30f94@google.com>
 <avNjcKtuQkZW0_Sr@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avNjcKtuQkZW0_Sr@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_005722_181798_12A8999B 
X-CRM114-Status: GOOD (  19.75  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Catalin,

On Tue, Nov 10, 2026 at 06:33:20PM +0000, Catalin Marinas wrote:
> On Sat, Nov 07, 2026 at 04:36:07PM +0100, Pierre-Clément Tosi wrote:
> > On kernel entry from EL0 with HW KASAN inactive and user MTE disabled or
> > in async mode, mte_disable_tco_entry() leaves PSTATE.TCO set to avoid an
> > expensive write, as it assumes that EL1 tag checks are not needed.
> > 
> > However, if the thread is in the process of enabling sync or asymm MTE,
> > set_mte_ctrl() updates SCTLR_EL1.TCF0 without clearing PSTATE.TCO! As a
> > result, kernel uaccesses miss tag faults until the next context switch.
> 
> Nit: next context switch or another syscall. I think this makes it
> clearer that the only potential missed tag accesses after the prctl() is
> a signal frame write as we don't have other uaccesses.
> 
> > Clear TCO in set_mte_ctrl() immediately after setting the task's SCTLR.
> > 
> > Cc: Peter Collingbourne <peter@pcc.me.uk>
> > Cc: stable@vger.kernel.org
> > Fixes: 38ddf7dafaea ("arm64: mte: avoid clearing PSTATE.TCO on entry unless necessary")
> > Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
> 
> The patch is correct but I wonder whether we need a cc stable.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks for your review.

I'm happy to drop the cc in the next version. The rationale was that this fixed
an unexpected userspace-visible kernel behavior and closed a window during which
tag checks were not performed, which _could_ be a concern when userspace enables
MTE for security. I can see how this doesn't make a strong case for backporting.

-- 
Pierre

