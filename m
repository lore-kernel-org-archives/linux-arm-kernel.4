Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B060A2637
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bL8fvq1K;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3tkarMG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ndSvCKL9DmCz1Xlym3gvmuPi6Y2z+W2Q/BEPD9rU47Q=; b=bL8fvq1KQ6ZtQn
	CDXueTQs4rbnx/Eu0x3ctlmfCrIWC280yU/+dbTserQ6yJB+rFWIR/WeCv46pdd6NwZ+9Cs0uCAOR
	O0ZMwNj4MGvFQYXhvf/LA+pd8EP+4tqsggKW92CNvA9Eqsp3Pi7z08fGmokCxvzoqTu7Ba9g7e1sk
	Z6bd3KzN48XfQdL9ULjI6SnCltflKx7SJCyrx6saCSeEuk23PezsBEMby2kNCb/zUlPpCdZ1xR851
	Bfs6qOi8wQHsnH8U7MIrYrw+wj99eIRk4gtGdBflzb8shfpFv0DOY20z5eoZGHF6DasPyJ1m36Q50
	qntW1/jSywuG4NGjf19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfI9-0000000BLHK-2xWu;
	Fri, 13 Nov 2026 00:37:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHu-0000000BLCO-2CoQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so4787225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530225; x=1795135025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndSvCKL9DmCz1Xlym3gvmuPi6Y2z+W2Q/BEPD9rU47Q=;
        b=O3tkarMGnKF44fXs5oUrLH5S2a5HAtwt/Q6HfsOr/S3lfJrdVqEjIWiuCmOyjGkP17
         l9CDebdVQ8K31nxGmnoocQetmcErChJYWywzc3gzZHu0W7STXtCbpWXciyE0Li55Kjz/
         Dj9YjZx2vOeMOSpNAJzv8JFwB0z4P1iNTIUQGL6ISbHIAE5HbBC/QSSbyGulhu06AoQ9
         1NmDjUAOmqNCWzucvatoDjngfNSlISTpDg4wt0rXFLBV/3wT+Hk897qYxqgvjouTZ5rH
         BTpKRustx1snRRPAmPGJ8Y7KNkt4hErUCbk7gAwSJ9BMNvfJWpni1R/214r2V9TIiklu
         vghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530225; x=1795135025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndSvCKL9DmCz1Xlym3gvmuPi6Y2z+W2Q/BEPD9rU47Q=;
        b=mCb4Eu5KHJ1NntfSOmVLyAvrricuXOTxw2Q8JxbWTT76iOoyck0G5vK1RU0xLMzoSm
         1EJ+w/nDRMs+nv9ItNsWZyYevMAgMoj/07LPCMwKgGTg6Az64qCWYUTYPo6fTfKtJpgg
         uAQdM4F6ixMg2/44zMeR98kQ5kAJCXMdAriLwDQnARKrt6jqr/KWPs23vxK6gc0bwGDP
         GhsyTagRzSHgXxqRQIwf1MYi69blz/vKjum6O3eTq8yeL6Z2wlyr6RY42pkEK6HxN1GS
         yuFGKIO8kZ8u/BIWOo0DxH/KXJEqCLXdaoB/CLucnChZ0NjUP09kI6GnicHYvgt7QP+z
         yEkA==
X-Gm-Message-State: APuU4Z9tjlJ4JvHueHJ6UpP1J3lA0CqMkBvh4/XO5AwkmtA+lpJJFoqd
	UaLNCfRCLhLgAZV8fRh9glPg76PguKzpMMTnKA5OxouRrCWgvTea4gT6
X-Gm-Gg: AYBFou3Pga9zhcs8Xugh+gOG0ykl3mG29GdxNNtULiisBMs+vfjrOq372oTX02bc/oy
	4434hJo2raGOboHcc1ZsRrpBxYSEerr3jeV4zMb8jUV/XnQ6NGjLJZmZF044nODh8lBYzyLeO41
	W11oFCBFZnJEGanofWi2CABDM39Pxj7eO3430IyvprgPMCYdexQLkuRaAlKV/Kf9wTjRdPFbEzl
	36WYP4y5W6KFaiFMIc1sU7mll4x/5ZIU8zEWq0+STPKv668neL33ZUTcP4e5qZbghkxostYBOCc
	yMXDyNeQ9jY8SrqxJF7+U65x+VnMq9x8dEOKJ0lkRDewU4EUxcQj9d7l5+q+KtVLZpNcd/efM54
	MmMSILp3QCW+3Bm/DrtsmlldW2FcA3gUr2/uHPxRF1EL91aImFrLHi9vNE7v5yLTNclpQCyDzK4
	oQ/AvTURq2FY4ok9AYkvXLXkA/h4MMsL7LV7v8rLV9nuh1H7JKODMChvTf+Mmfp3yfswCvVbzS5
	mb9nE2oy38VjQEZySarAD8FDRaccaRXW3C5jFkmMfUQ9NMdusex72P9jvAIx9nCiyf/7tvH4gXe
	v/JCL1ZiqNyDgZubPIddeWcc4V7Kqe6hRodMPmqf92mXq0P/KByMpgKosKJMIAv6VvEdBxQr3aG
	yLojJZwtdriVOvyuOtL178mG6eFyJKDvdbzccXU2JHGlKGdSa7BvQvlBWNwcfAsC2WvsVnsjXnc
	ezELV4QN3g7+p1RqmZ
X-Received: by 2002:a05:600c:c05a:b0:4a3:59c9:a750 with SMTP id 5b1f17b1804b1-4bb55a6a5e5mr14393345e9.9.1794530224913;
        Thu, 12 Nov 2026 16:37:04 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f6a40sm2591625e9.2.2026.11.12.16.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:04 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 15/24] net: mdio: Add ZTE ZX279128S MDIO controller
Date: Fri, 13 Nov 2026 00:37:03 +0000
Message-ID: <20261113003703.3666085-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <595371a9-6b7b-4ad9-985e-66f0e659f4a1@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-16-ghahramani.navid@gmail.com> <595371a9-6b7b-4ad9-985e-66f0e659f4a1@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163706_584737_A7B6804F 
X-CRM114-Status: GOOD (  15.69  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Andrew Lunn wrote:
> > +	writel(0, base + ZX_MDIO_STATUS);
> > +	writel(readl(base + ZX_MDIO_CMD) & ~ZX_MDIO_CMD_START,
> > +	       base + ZX_MDIO_CMD);
>
> This is the same as what you did at the beginning, but in the opposite
> order. Is it actually needed, and can the same order be used?

It is not needed. That clear came over from the first driver I wrote
for this board. There is no public documentation for the MDIO block, so
that driver was put together by reverse engineering, and I never
checked whether every step was needed. I removed the clear after the
transfer, so only the one before the start is left, and tested it on my
board. All five PHYs probe with the same IDs and link states as before,
and a few minutes of PHY polling plus traffic gave no MDIO timeouts.

> Is this the bus clock? Does it need setting to 2.5Mhz?

wclk is the MDIO block's work clock from the LSP1 clock controller. The
driver sets bit 12 of the command register, which I took to be an MDC
divider. The 50 MHz and 2.5 MHz in my comment are not measured, and the
wclk rate is not confirmed yet either. I will find out the real MDC rate
before I resend the MDIO driver and fix the comment and the code to
match.

> It needs a device tree binding. But that is mostly boilerplate.

The binding is patch 14/24 of this series and Rob gave a Reviewed-by.
The MDIO, PHY and switch patches will go to netdev as their own series
like you asked.

Best regards,
Navid

