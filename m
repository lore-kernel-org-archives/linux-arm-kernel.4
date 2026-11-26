Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mQ9Is6Qv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RhloDf5h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZokuwfU4kATqyfaTag6SaT3MT9q8pH3IyIO6M5PAlLQ=; b=mQ9Is6QvKh5PN7
	V6hNRUdpbIY4G/Xg0n0SB1eaIFoZmVer5K4W5lJ0l7IA4rrpYQPr2gxveRHm3nW7wv48n9czU+85+
	Njuxy8Bp+9xpnzzg3sdBcQpM06Mqc2xgQ4bZl4MYx2iSlp+q8M9vjTGwPsq2akProRdO6+eNIAYYK
	V1DrP9kA75IC7ybz0Uz+reKLF1cOdKT9/dszoZs4NmzGBbEoNVT0v7NxjKAOM2ZMu8LWnJVp/YvCO
	5NEK3nLF6jsl+U4J0waxqbC4Wzpi9Qqm+H1yLOoMc/82KBLnRx3OOYgN6UkrzfNhRnyFOAT6ctRFI
	WzYA191/XafP46ScT/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZVB-0000000DLGK-2GGX;
	Thu, 26 Nov 2026 13:27:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZV9-0000000DLGE-2uJI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:27:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 351624624F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1C21F00A36
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699622;
	bh=ZokuwfU4kATqyfaTag6SaT3MT9q8pH3IyIO6M5PAlLQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RhloDf5hjViDM1wa120MCgd7yIwpKXtodHert8PQGCu3nBm3Jhrb09TaNG4V8Vs5/
	 d1vXZiZry4y/sMZO+BHWZqI6I8kbwDjJ5tj7eo69vxWr3+mO790EUTeE93erN6DUug
	 /+Xrz1C+FBXYxu00wHMRsUx0TeB7gI6IBwCtH6p4ScNc3/1sNZ48q1pUb+ZpywnDgZ
	 XVRPR+txQwLdlqSwSwgjtDaLOXnffR1tbfJNLZDhTgUKD7e3Yw05AETznW/H3wSsTH
	 XVEdiem2CXwXSMkBzP2IING/Njo/LlWbqYyIccI4XEG2KwHon9RuKWhsn/TqVpF2si
	 RlvpUjUD9LcsQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso8476412e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:27:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFo2iF4mHY9aLwhUcuOBPA3udm7NBHudcTmG0z+gOpOWXfqCYK9fXVRfzCyCaOVtP7+580FIV6/HAi+ZSBevADb@lists.infradead.org
X-Gm-Message-State: APuU4Z/c4WUHZJxDzXXTrq167wIQz7cjVEnLCm2qXnlQvVftgKwtV4EU
	E/v8f3h3eBVoIaWZACFCWHkLYhUNHOleYniMsU1XrDW32/7pBN3FIvjIxVJ0xHmuqJ3zvknTq8b
	QnrSWP2U7kKhqXxObLlB75D1EV7uN3cQ=
X-Received: by 2002:a05:6512:23a0:b0:5c1:5a42:37ad with SMTP id
 2adb3069b0e04-5c1b7beabfcmr5752337e87.16.1795699621444; Thu, 26 Nov 2026
 05:27:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116124832.662455-1-arnd@kernel.org> <20261116124832.662455-4-arnd@kernel.org>
In-Reply-To: <20261116124832.662455-4-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:26:47 +0100
X-Gmail-Original-Message-ID: <CAD++jL=TmzH8tm46CvCd1=B_YMyiZM=f1vys_NhDZOM4MdxzFg@mail.gmail.com>
X-Gm-Features: Aa3M54oJhuqbanKDTHMwhtXUm4eQYbQ6svpItwvRIwSjJelTST1VrzQM13SDhkU
Message-ID: <CAD++jL=TmzH8tm46CvCd1=B_YMyiZM=f1vys_NhDZOM4MdxzFg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] ARM: pxa: support arbitrary PAGE_OFFSET
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Malin Jonsson <malin.jonsson@est.tech>, 
	Matthew Wilcox <willy@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michal Simek <monstr@monstr.eu>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Nishanth Menon <nm@ti.com>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	sashiko-bot@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 1:49=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The pxa3xx_cpu_pm_suspend() implementation hardcodes the default
> PAGE_OFFSET value for CONFIG_VMSPLIT_3G. This has always been broken
> for other configurations but becomes much worse now that the default
> is changing.
>
> Fix this to use the correct compile-time constant instead.
>
> Reported-by: sashiko-bot@kernel.org
> Fixes: c4d1fb627ff3 ("[ARM] pxa: add preliminary suspend/resume code for =
pxa3xx")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/sashiko-outbox-212719@kernel.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

