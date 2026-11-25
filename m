Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ECE606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YA+I2glq;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WTRrXEUt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=; b=YA+I2glq5fJ642y5SXWFyUA+El
	RO5C7P2Xp9FFt29Um9B+VtgOmnBnNQNE/XU4+BOHeK7JmVG1tEvmn0QqxvTx38JEAiEhbpl8jpTIg
	orkTVcXf3qDv7RzNJEY5h439Wd38DVBLwakg+9+7o/rlgkwbN0WRDZQ7TiF9mXucA7ABEapBAJVUT
	eKdyFqDfYIatptArCQbOnQ3WEcZ8FV4xCEBN7/cvq0O73y2ls04KvrGniv6yoGeMWFV3kJxHHQ8VB
	IdX69nSrqnwKT23bxzBevntJCd9ewn2Ij34Go/DkiT4eKxeZlmNWwUHRBn1TU5Y5rws5Nxx6Toozh
	bvDCttOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEEh-0000000ADjL-1BFA;
	Wed, 25 Nov 2026 14:44:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEEe-0000000ADi5-2IGP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:44:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so6435955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617874; x=1796222674; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=;
        b=WTRrXEUtayl1oBaAhaKaO+tcAxHWNn+Z+EZqBPGbAWk/uDfDGAMKpcip8oMtFOL9xn
         d2e2/4L3FELKEx2c0Zzy26lIGCsrqmySZAz/2tql/9pDgCTdpkGEXQhEnD3+tQoLJflo
         OHrtAnL0zG0TXGfuQKiHZm6+fHW1t+AuxxL7utz1+WtXf9iwpinOTg9E906OiSuObq9w
         9JomJZjHM9+lAVT6bpRmP/+uQhFhikYgWeaTPbINl9SAzIblONxWKpTg1Udn3ZuUyXt8
         JZ/wxJVpTL4WGiOdknn7pNEnram0vuNH1c7RkX4smW9I/8NUM2aLKfCqO6Lt1aRIIFgc
         T1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617874; x=1796222674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ll/7pjiu26j2DN45BTUViH87j7UCm3E+vVLd5MHWxI=;
        b=O24TNSzRiDMCO/3FDp3+JiJrLNeZMiT+w8sRC0ksgFIgKD8PiKLyWtHWwDDXTL9jbW
         ngeDTYkiPaMJJnRutYYS2BJlGunUgw3qJfZf7r5WYAhJhTlmzrueeiG3Hd+a17VAfSyn
         nsWYEMVgo2QIk193ZOF93a06TKsJhg88JNR0ympAPEnunPrErUcSpQRN2cElDtCh45Au
         RT8HBcTPf+DXymv6YvVcYqO1qDT2dENfyO+JA8vcAutPUmuSkPPpEvlZwvfksw02pJOI
         jLv9xkNITK6ieiR33GU96rxmyiHkulWe7BqFnfp3y2WqXYHyQt/Mt+I7khxmp9UQhFNl
         BN0Q==
X-Forwarded-Encrypted: i=1; AL+hErFBiHWl0cz9Sl9C5TqSVz8U4VyZ5wZs9IK1b1jiTgpQtY3eUhK+hDBNQ0Pl98sDx2itXnTHx0ii5qroaGxYi+/K@lists.infradead.org
X-Gm-Message-State: APuU4Z9V7En+DKk0HfOKuL3lZgMEW+gPgf0NEgb2qJsGEq/y5DQNeu8x
	aC8i4zZglRZB7FBSSFxyfG8RB+fOr7/1MLQ+TgpCpY/w7W8pZgWqUjkppB2vHQ==
X-Gm-Gg: AZFdTZcLFUyRrVVR7P2yK+LjVIurS6n4sY3LyDs1Gt/H0jXrVj9CqZ9JrC9BU74yt+D
	Jz1BIlqTjamsreA5d0okJBG/VAs4kUOKv9tHM1iLqSCs/b7ZBnBAdtPGaJoMARgAMr8/XNo5zQK
	G9AtwbrK9xANxcc5TMcHwm+sw/2U9vaDdWGVUIfu4W2qUBfHT7xGwWdquHitOhroA4svLxSk8YH
	SBNzeSbWpgX77yRTZRLiIr+072GckDw4KAZPK93Ept5gG6lsIkVTKFYWkeKV9eVSN7HgZZGWxzR
	0yDQUZjPhsE3DXYzk6NmIVQPUsU1MyFTa4z/L3vfEk6Io6ydJIqHla48FSf2HSj/MteVEpZDVSY
	TNoN+QTu187TiXbDigwOtet/BWeUxdswOOMscuaaE0Qv7mT4kchUceCjEdO8kWMAMP1uZCrLlJ5
	hGaKWsYSnYskepPXrnpCZ+76gSWicqvG+mL199gUaR5RPvCsh0vHrxp5Y0hfHTBbmrS0GmeN/gx
	2lMqXUgrtmUeEmHQezP6+yLYL/zprF6xVdwC03yPI6v5xaiDFTyzsqp/Wk32+lfRQW3cdneWJuu
	FuidVUxCcGlkmgCivjEK1Q==
X-Received: by 2002:a05:600c:1088:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4bb887f43cdmr285531595e9.2.1795617873970;
        Wed, 25 Nov 2026 06:44:33 -0800 (PST)
Received: from skbuf ([2a02:2f04:d401:2601:d3cc:6bc:a861:f9da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm303747515e9.4.2026.11.25.06.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:44:32 -0800 (PST)
Date: Wed, 25 Nov 2026 16:44:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: jan.petrous@oss.nxp.com
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Bogdan Roman <bogdan-gabriel.roman@nxp.com>
Subject: Re: [PATCH RFC v4 09/15] phy: freescale: s32g: Add SerDes subsystem
 PHY
Message-ID: <awbmvSYZ9RJ6agIu@skbuf>
References: <20261125-s32g_serdes-v4-0-3bfe0589be8d@oss.nxp.com>
 <20261125-s32g_serdes-v4-9-3bfe0589be8d@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-s32g_serdes-v4-9-3bfe0589be8d@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064436_610164_A48BB826 
X-CRM114-Status: GOOD (  23.40  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jan,

On Wed, Nov 25, 2026 at 10:33:51AM +0100, Jan Petrous via B4 Relay wrote:
> From: Vincent Guittot <vincent.guittot@linaro.org>
> 
> Each S32G SerDes subsystem is made of one PCIe controller, two XPCS and
> a shared 2-lane combo PHY. The lanes carry PCIe and/or SGMII.
> 
> Add the SerDes subsystem driver: the PCIe PHY, the combo PHY bring-up
> and the setup of the XPCS instances. A MAC gets its phylink PCS through
> s32g_serdes_pcs_create(), which also creates a device link, so that the
> MAC is unbound and suspended before the SerDes.
> 
> SS_RW_REG_0[SUBSYS_MODE] is derived at probe from the consumers' phys
> references to the SerDes node, <lane type instance max-speed>: a PCIe
> root port names its lanes, a MAC names its lane, the XPCS instance it
> is wired to and the highest speed the lane is wired for, 1000 in this
> series. The driver walks the tree for them, as the mux is programmed before
> the reset is released, long before the consumers probe. Each supported
> mode has a unique lane mux; a lane nobody references takes the function
> it has in the first matching mode. The reference clock rate is
> validated against the derived mode.
> 
> The SerDes provides one PHY for the PCIe link, whatever its width, and
> one PHY per XPCS instance in use. The XPCS lane PHY has no operations:
> the lane is brought up with the SerDes, and the MAC drives it through
> the PCS, which it gets from s32g_serdes_pcs_create() with its own node.
> 
> After the subsystem reset is released, the PHY needs up to 5.2 ms to
> become operational (MPLL_STATE). Poll it before any further PHY or XPCS
> PMA access, in every mode.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Co-developed-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
> Signed-off-by: Alexandru-Catalin Ionita <alexandru-catalin.ionita@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Co-developed-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

I am trying to spend some time to understand this design. I have a few
basic questions:

- Simply explained, what do you gain by integrating with the Generic PHY framework?
  The XPCS has a dummy phy_ops. Clearly this means phy_init(), phy_power_on(),
  phy_set_mode_ext() etc will do nothing for it. Who and why is better
  off if it exists?

- If you have 2 physical lanes, why do you have 3 Generic PHY objects?
  Why not a Generic PHY object per lane?

- Does the lane mux need to be programmed by the kernel driver? Does it
  ever need to change at runtime? How do previous boot layers use the
  SerDes? If you leave the lane mux set by a previous boot layer, and
  make the device tree describe that configuration as read-only, what
  doesn't work for your use cases?

