Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E131606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnzeeyqc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCRbOn1R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Meq83XA2zkquAPWRzQKQaEYw0Hcq8v+No+VZx0vwCJA=; b=bnzeeyqcAJWfTp
	iyLm1Skadsjc5rvPA7YHI5gRR1j0mY0UEj1TtIcmgCfRKykJo8SW+eMrQwd55/Z7o4D/2pEi75y6k
	ESZfieSueFYt9lVddfEGjoXqFj5VTw0U5h71LclZ2ekkHg/VWx3E6Fs0+seLUDdYa7gGYsDPDJMSt
	pmyTdqGx98xVuVzwt6mWvW0MeJ2p/LF4ESm0ATscA42Ej9fkkn6TYU0EuC0jQ1/eHHAkBMvV+q+XH
	c+syT7PxDlbaFwrXUSuPTdcTVRe04l60AJ2qT0JdpC4IIoOq6o97VatLFuYmJ3SR1s58Je9ZeHrSC
	gZtEb4W5DJxyApNvO70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURD1-0000000FWd4-0ylk;
	Fri, 20 Nov 2026 16:11:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURCy-0000000FWc2-2nmc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:11:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1190862E51;
	Fri, 20 Nov 2026 16:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6181F000D0;
	Fri, 20 Nov 2026 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191087;
	bh=Meq83XA2zkquAPWRzQKQaEYw0Hcq8v+No+VZx0vwCJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MCRbOn1RGGQ8XAUyxWAIdk5NonKAE8ZsEjgzRbOCbWVa45iSDkBBGXhgEfmw6yL9R
	 eDAJHz7smhUPwkVzwg2IO3bf/fZZBp5m7+BJW4GM6MHAa4G3bOVElY6Y8E6JVD0xLg
	 uSHWHEK5zDJnI3nIdq0oHJRNvcM4W7fsTyG6gj42u3DqMUPKl7kgw2kErw/ADVmQV8
	 x6JGr66+TjvG8hNn0+P4of4vkyihT587C8Srv0/ycSr+5wj92zjt0iayPwIZZAgdxl
	 4TyEgg1vYmSJtP7+ulo8uBuJSVqIH5qIq+7jxVkU+kyNTY3dIotos/3sYkZ9F7fwp0
	 8LrISKPBsTbog==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ivan Pfarher <ipfarher@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: (subset) [PATCH 0/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix Bluetooth and USB gadget
Date: Sat, 21 Nov 2026 00:11:18 +0800
Message-ID: <179519098349.916385.12962911219615170069.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 12:40:44 +0100, Ivan Pfarher wrote:
> On the Orange Pi Zero Plus2 (H5), neither the Bluetooth part of the
> AP6212 module nor the micro USB port in peripheral mode work with the
> current device tree. This series fixes both and adds MMC aliases:
> 
> 1. The AP6212 needs the RTC 32.768 kHz clock (osc32k-out) as LPO. It
>    is not referenced, so it gets disabled as unused, and the BT ROM
>    then answers nothing but HCI_Reset.
> 2. Describe the Bluetooth controller on UART1 (BT_REG_ON on PA10), so
>    hci_bcm can power it, load its firmware and use it at 1.5 Mbaud.
> 3. EHCI0/OHCI0 share USB PHY 0 with the MUSB controller. When they
>    register, the USB core switches the PHY to host mode, so the
>    peripheral-only micro USB port never enumerates as a gadget. Drop
>    them, as the port cannot supply VBUS anyway.
> 4. Add MMC aliases so the microSD card and the eMMC keep fixed numbers.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add LPO clock for AP6212
      https://git.kernel.org/sunxi/linux/c/bfa27cff7430
[3/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix USB peripheral mode
      https://git.kernel.org/sunxi/linux/c/4fb04f870eb6

I changed the subject for this patch to "Disable USB hosts".


Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

