Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBEB606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ujQafLSo;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jgXtxTf1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=; b=ujQafLSonB9PeslDlqDtKQJgJt
	69F739dChgMXNTYUXFtSaLiGgtETwehJtJXXbKITrsYQw6GEUcSjK0bkeFIAj03/DOniNn9DxFaee
	JCgoASU8IPOq2rtq9TqMx1sDANjfNUghWonWhL/r7P2sYHKZxzNkEIB4dA4CHAgpdogV+qjlP9yMG
	DD0J0m3oPywUwEJqQmtZBLh1Ci7OtYHYAp2Jnzbaa1EFQvhKopRWaZGNFBF/VrhzFkhYdHo7baMH2
	ECTizJce0613AtcuGjbsSomJgqYQuSWFJbPMbYGJN1CODoU/IC2rHsLKh87ARAzIVveLuf6PHqShZ
	xXKHXjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsfD-0000000FUB3-3fF3;
	Fri, 27 Nov 2026 09:54:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsfA-0000000FUAh-1ysh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:54:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so63908695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795773278; x=1796378078; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=jgXtxTf1oGKxhoW/IsNpAPnB/Tn4t+TxVwDMojIom0hQBP656JDCLXVgUchz56QbYW
         G91SxVx4S56DVrHQy7kG9037CiHGKn8j+YSTBVkf7bYfAfdmjKOc1hZy2brJ32LYov4M
         Jya3S+6m+COZ3BZ3dJ3p1U1dQnJx7I31KiKpmIKundIOX7JcXZUd/H81TJZ46syXEv7+
         oHm/EibwkMsOpAg7QZvrKo2Mo6WkKrTUf0vURcJpOBuzaqVk7zK0yIVQ2D9bRTARvKk2
         lE6eCMGjWIEGo3GYHemBSKUqmUPQ5j1Dml4L6YW3VttPPSt8UBH1IK6YxSdJUhQzcsiu
         11tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773278; x=1796378078;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=osHSAeL+2IqabGFR0JsqziDvX/zrD4z/G2m4JVlJJ7R6jzG0AjcV4pjWnJUG7KnVsN
         IGhVgCDSIJBCVD8Qwtk2e0PKFPwGvmvzi1vXhPk4XBHKvnpZr+TSXunh2r21qHGMYufy
         +8xA3fAklRy81bcRWu+FtCQTYbJ3zsv/+QIQPZ4tzBWBPJlNQn9Lpj/X2pyVt44MiHvg
         U063gFpXTbQ8FZ/O+6+HT/gvhlySAU5tDUNFxBfLI+DC3Nj+m/r3yEoUHWsQFluf63Er
         xxdVsIukW8mNix6MAe2ik0jhd1mt5L4xApY8/G/9StBh8aNqZ+01x2F0AYsYmC8dUfUC
         BVhA==
X-Forwarded-Encrypted: i=1; AL+hErGRgkW+rppfUOXZM/4LpPGu/NrERdbLAdvkCc+h7J5UHblt1PELwZPg0AHrMov/VxhU9bOegcwK4ov4l4iGhrcZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/gdq0r1Ejkj3c1Db32CgJqyBOKMrmIdK7SCzdGf66GapO4Pu4D
	y9RImL7GiSeecrKFkndLHB2oVUEiI8FDr5rBUk2vsweBa9BWNYrJVaM/VK0Kf8fl6PQ=
X-Gm-Gg: AZFdTZd2VGcXKYOgBAfPO2T481e5vea9oBD3qGOFAxvDBC77lO7EL4Ip9e2X0tf/Dxt
	ZypGapuFsiB7MvqjKN74TJV4fjYKYKXE4ZyhcIBO72dDYEvG6BHpMjjrc4QjT1q/AgLUx0y9v4U
	HKT3fYpDOlTU9B09wwQNTW7Ly8VV3jjSdCgNImoaPIVHg00LiyXKwGbBvbemJ2DXzAX8DaKq/QC
	EJRcXTjwnCJcqf5vhrFsoFezaPKPF7uku0+S797Z0F/xjz9WBtsx4I7yjk+jloBFq14PUNp37Os
	uPC2yDKS8jWkMoFV9u2Wl7PT2Drs86bwYxLz0HwU6hzRwLK5bKYgpPcAJVOoZ5LjAshijwClH70
	VkQE/F4Et2qCOC0E8v7aQ5iHT97hRNfS36/g7CmGSAYhDhw58ZxN6CTRS91QeSKWeLnrXd6YCVm
	5jzWvKsm2jPwANsiXYyMjJ1EfrHQBtFUS6Vh3ro/NqqcXNPU+iQDyIMvhkj07ryiXFTIEtHf8Zh
	b8sRoQk83wKfcFhb+Ba1rjmGhWd9m3K9hXOvKYxeaAbMU4ezNrtuKnnu5plKb9N3DfRIKMOeCYR
	TciHVrFC80VTf+dpVwYJDwfO2E6S5WS5pyoomP5cZG6SRAl7
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr473789905e9.10.1795773278505;
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm560118415e9.9.2026.11.27.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, Andre Przywara
 <andre.przywara@arm.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alastair
 D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: sun55i: Add support for
 Allwinner A733 GMAC210
In-Reply-To: <20261126064345.2569445-1-alastair@d-silva.org>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
 <20261126064345.2569445-1-alastair@d-silva.org>
Date: Fri, 27 Nov 2026 10:54:37 +0100
Message-ID: <1jik1iwqea.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_015440_526072_CE4DC19F 
X-CRM114-Status: GOOD (  16.75  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On jeu. 26 nov. 2026 at 17:43, Alastair D'Silva <alastair@d-silva.org> wrote:

> Hi Jerome,
>
> While testing A733 GMAC210 on the Orange Pi 4 Pro (YT8531 PHY), we hit
> two hardware differences that also affect this series:
>
> 1. External vs. internal RGMII TX clock (SYSCON_ETCS_EXT_GMII):
>    Unlike the Cubie A7A, the Orange Pi 4 Pro wires the PHY's 125 MHz
>    CLK_OUT back to the MAC and stalls on 1 Gbps TX with
>    SYSCON_ETCS_INT_GMII (0x2). It requires SYSCON_ETCS_EXT_GMII (0x1),
>    matching Allwinner's "aw,rgmii-clk-ext" BSP property. A733 GMAC210
>    will need a DT/clock way to select EXT_GMII vs. INT_GMII so both
>    boards work.
>
> 2. RX clock inversion (BIT(4), ERXIE in glue offset 0x00):
>    With BIT(4) = 0, Orange Pi 4 Pro required ~3.8-4.1 ns of total RX
>    delay (matching what you saw on Cubie A7A with 1800 ps MAC delay on
>    top of 2 ns PHY delay). Testing with BIT(4) = 1 (ERXIE) confirmed
>    it inverts RXC by ~4 ns (180 degrees at 125 MHz), centering RX at
>    0 ps MAC/PHY RX delay. Andrew Lunn requested fixing this clock
>    inversion rather than compensating with ~2-4 ns rx-internal-delay-ps.
>
> I plan to rebase the Orange Pi 4 Pro Ethernet support on top of this
> series and address these in follow-on patches unless you intend to
> roll them into a v4.

Hi,

I'll resend the series soon. I don't think there was a major change
request on it. The way forward on the delay matter was not
entirely clear to me to be honest but I know a similar discussion was
happening on an Amlogic series. I need to check this pan out.

I'd suggest you build your changes on top this. I can't test your property
changes without the board so it is better if it comes from you.

>
> Thanks,
> Alastair

-- 
Jerome

