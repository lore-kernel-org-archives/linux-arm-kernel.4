Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A78D606B7C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dv+CqJwq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kP6QkGWf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cd/uujLGZzwEqXuug02cxdjnVdUI9NU92QKxsbB/new=; b=Dv+CqJwqZfHgId
	a7K4jMqNFywNJ4FzgJqyngG4ZobrFvjwd33NFlQ31vF/idXJmtVRHsPIqn4uxBB957CSlBNERHS9E
	WAwgw/r/rpC4zj0p57E/5OQRsJMpHkoPtlaZ9ZYDv7TiCrYPzJRXjHkwurvkDUnfyKLxo8bwJFh8d
	t7it+95HCxMo4Dj+ChW+3+thhOD0W+FehlI3Jye+l8AizonLDwRIBuimJnFtwgaBjnP4Af+fY4E7S
	lCgqeznoZ1KbhK2S09gXJWUP45nYj85JZ9dEU1vcxAiFj1SNQfgMRUE6mKW/WN3Q1cFiDqGFU3YXm
	wEOLBlMzZkXzGHcBZ8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGP-0000000BKYA-1rWN;
	Fri, 13 Nov 2026 00:35:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGM-0000000BKX5-3nRU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:35:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so5538565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530129; x=1795134929; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cd/uujLGZzwEqXuug02cxdjnVdUI9NU92QKxsbB/new=;
        b=kP6QkGWfIyirtI0YWZouiCErcfqcH+99hKy+VIispoM0RZksN4Jv4RY84tSHY6CDoo
         FcLq6eBYJYjzIoz84rDJ5oCZqcQ3efoCsc5udwIRv/NqGE/LzUnBgKsxS9xKM5FzT5TE
         MUOEGq3ScJN0Rplx5SfoRDH5662lzFwZ1QUd7P/7Zn5JRWMDGUjFZldw9nbTHXORmGJE
         n5+lBod0EblzM69asY4egsEsrltmidcgEUVOjnn4GEP4wwXLUcAY+qSySmENia2aOiJH
         umD9I1TwQeSUg7KcTHyhVGEP17soHdr1jrdHGY4W14ZVY+1cGp3z/LMz6S/0ja/80Le4
         HObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530129; x=1795134929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd/uujLGZzwEqXuug02cxdjnVdUI9NU92QKxsbB/new=;
        b=Ae6it/qhWZGqmkmnF92Gaxde7TLJaqMCLJuW43tdrpYsqh2oc777rixTRHsmnM57GL
         XoEUCiMmyukf9KagrdoPEPrO7SgyqpK9EfpuHKdAnk09BDkq6nNK5/0rZJiqEMOhERqz
         lUZA0ALz8jJTpfgI2Qxvg0iWOA2DL9pQ3IRdMAEaDf2vEptA/Qe+Ehpti6H0a1roQw+l
         65X4XsF+j9anTOYBEkFBHC4hPyqSumT3m1sdnMWnNNRSKDRVFsaMmjTY5wZ8uaMnZofK
         TSCsOZgCxSo0c3I+dRxe1PmQyTulh++FB+F1N7n1ApuplZid7froKNnrcvvwqAtwWIJ6
         B0Jw==
X-Gm-Message-State: APuU4Z/Z8jVZIwixluc05T1Vc9kX6KyqKBHNzx6TG7gHT0F1/eXjU3YW
	IGufBl/onw1wSNZ/720vUoGbD+vym+HgV8d9IN4mX/5Cy1BFkSdHhce0OTgSmJvc
X-Gm-Gg: AYBFou27QqUcdprIWU9pMxmR2P6FknFmYWTHfELglAX8gwfwrmUQclCar9bQDEUyXZe
	Z+E1nwAjIbbf3rj8oOSMooXQ+xFgPSUe1HJ3NBIpuYjMBd41cV4KJcFktdP+3rHY8KbSOd6zby6
	BkNwjCjZPjIp3EUmR1x+NAa8qUoAIUZ/c4gBo+vA1yPZKG2Fx1T6un1BshVGT6mqexMdLx5CTvJ
	gWmPBN81+sZHPntahLxgDyVpqanZ/Tz/yg4X6dJjS6YWxuA7dOTFB9ZM/tbrj5xqlxlRLsovLUs
	AGMF5M6zCXtnyOP2P9TG3a5NtFU47W87by5Oy3UaPdjm3B0mKi71sjdDr1vcq7VaV2TwZE39/vu
	PkQSdmBCBTF3uUL3DAsjsa2mx8imz4w/Iw15p4imTlf6HCZ1mGM14WNVAyWBx1mVKac6OrM5xo2
	1/9pbeDdkzNfAH4YnPxfZCWfFdri9EyDpG+Q+IkNE/AH2O9qt8p7AVp5j0LPxLl+ai59/JQnHU5
	Bb5RX31FnIbhR/jwQG9Ld5G+/vayGfEoocPMqrKeU3ao9vIwchxRsvl7bheN+hXEu9uQn6lU5TN
	/9xO8h/F6WIGa3rFmogqqj+QCOmrzg+Vk3yRjs4BdWTIN4u8cTO6vDjGhLyxve/pyMuWkNwYSyB
	HdbPKTVqiaryoT5wUvjcAtgppUAqjrw9UX4P8WW8QhrWGtMrlfPgUCWeEOXQf4EPMk8p9/7PsAr
	m5gCe1SdW6fHfhpX0+I6AGXKlPv9nePuqlsiZ52W0=
X-Received: by 2002:a05:600c:3f08:b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4bb55a8d2d6mr16303505e9.29.1794530128534;
        Thu, 12 Nov 2026 16:35:28 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f2c40sm3699615e9.2.2026.11.12.16.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:27 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Fri, 13 Nov 2026 00:35:23 +0000
Message-ID: <20261113003523.3659602-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <rum7uPffTpawXUWooWWkfg@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <rum7uPffTpawXUWooWWkfg@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163530_970898_CBDD9C6B 
X-CRM114-Status: GOOD (  26.32  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

Stefan Dösinger wrote:
> I recommend to focus on the above patches first and wait with the rest until
> the basic board description and clock drivers are in. This reduces load on
> reviewers and keeps the patch series focused.

I will do that. The next version will only have MAINTAINERS, the ARM
binding, the platform code, the clock and reset bindings and drivers
and a basic SoC dtsi and board dts. It will be based on v7.4-rc1, which
now has your drivers/clk/zte code, and it will use that code, so the
regmap clocks, pll-zx.c and zx_clk_common_probe(), with an MFD parent
and a separate reset driver like in your zx297520v3 series. GPIO, PCIe
and USB will come later as one series per subsystem, and the networking
patches will go to netdev as Andrew asked. I am dropping the SPI driver
since you will submit it.

Agustin Santiago, who has the same board, has a clock and reset rework
for the zx279128s on top of your framework and is sending it to me. I
will test it on my board, and if it works the next version will use it
with Agustin as the author.

Before the MFD and reset parts are final, which way would you prefer?

 a) new drivers/mfd/zte-zx279128s-crm.c and
    drivers/reset/reset-zte-zx279128s.c with the same structure as
    yours
 b) adding zx279128s compatibles and data to your MFD and reset drivers
    once they are merged

b) avoids duplicated code but has to wait for your patches. All reset
lines I have found on my SoC are active low like yours, so your reset
ops would work as they are.

I also still owe you answers to the hardware questions from your review
of RFC patch 7, about REFDIV, the 32 kHz source, the missing LSP clocks
and resets and the TOP_CLK_EN gaps. I want to measure them on the
router instead of taking them from ZTE's code, and I will reply here
with the results before I send the next version.

Two things I can already tell from the PLL registers on my board.

Bits 23:18 read 1 on all five PLLs I looked at, the A9, LSP, audio, DDR
and PON ones, so it looks like your REFDIV with its default value. I
have not changed it yet to prove that it really divides.

The audio PLL uses the fractional part. Its registers read 0x000409ec
and 0x15525460, and 25 MHz * (39 + 0x525460 / 2^24) / 5 / 4 gives
49.152 MHz, the usual audio rate, which only works out with the
fraction. So reading this PLL right needs fractional support in
pll-zx.c, and I can test that on my board.

> Out of curiosity, do you have a public git repository with your patches
> somewhere?

Yes, v2 as I sent it is here
https://github.com/ghahramani/linux/tree/zx279128s-v2

You also wrote that you want to give feedback to a human and not to a
Claude prompt, and that is fair. I use Claude, Antigravity and Codex to
read sources, learn about the parts, write code and fix my English in
these mails. I go through all the code they write and fix what I can,
but I am coming back to C after a long break and I still miss things.
The kernel sources are a lot to take in with all their code and
history, and on top of that this SoC is closed, with nothing public to
look up. So reverse engineering the original drivers is the only way
in, and that can bring along code that turns out not to be needed,
like the MDIO clear Andrew spotted. I can assure you that I test all
of it heavily on my router, and whenever I spot something wrong in the
code I revise it. I am also always open to suggestions on how to
improve my coding style and my approach. The next version will carry
the Assisted-by tag the kernel docs ask for.

Best regards,
Navid

