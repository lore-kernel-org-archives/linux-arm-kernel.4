Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1BE606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=03lZCfZ5;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=plUj1VpA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=; b=03lZCfZ5Qiut7D
	z0fxHEGDGk80G7xYfhHr+23FVdDoAbj488+6Dkp0+DE6CWIA7lok0/Mk8u8fOIoXCL8Iv4CIWBJ4l
	4eiswWsq5VhYGhTncM/9/wbN/hUHxXX2YfHqVl0Acz8Wndnzh2B2PDpnTJ3lQcYGIJB9t5dSzd6qB
	2X/Sz76EyRcnD1bN4SbIUpJscgYDgs/ZQ6pkpd2SsFuPPciaudG6waNhVwTNeGcuTLcVa0u9zNo4T
	F6ZL1vokOUnVtCyYtcxUAh3MM4epmp245fja0blBUeI437V1rsW34LFeGLSAPEDuwa1AHvhFbjrZ5
	bd5xGJiaeLJ/E9v+2jmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUO7F-0000000F0w8-2oFT;
	Fri, 20 Nov 2026 12:53:21 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUO7C-0000000F0vb-2Mey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:53:20 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8b4cd576f2aso7009877b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 04:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795179197; cv=none;
        d=google.com; s=arc-20260327;
        b=stbi8iM/VZGE08m1cY0jvxiipEON6Bfztj+x2LEBe75gOODDRzgzqx7BeoFMOXL4t1
         TNPpDbECkUdUevELraCPnCruvjQQDTrxLgZD23tRqr3lnkOmWkac3Iht9T+N6uiCQyWp
         jxx2cbl17lY4BQdrY5I9SWmume1Vvdls24Vm4iy26bThi2OYGqj4ZJ5ccY7Rx/LJctrb
         RKNaHKvn3rWw+h00cLvkTcwn5slaP6QBedMvFg2YlkkrZwRMlUQuaUZR6+jgVqi7uCos
         SE7jBxMGB7GVbbFxBOx5nKuBfgKbtE0fNlkRLSeGZ5j9p3NI4L2Bg3LCcSCkyZ8DGNo6
         +XGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        fh=h31Kjb/9G1QTsOZWxbdqpQwjqsNoeBglvSs0eC27cHs=;
        b=FUv9hylp1InWqonqLyonoaCM/lPTWj1g0iOHr3bdaxAwlFSDkJMXyk6gmHRmdmo+/Y
         LyGAoMU17BaBDyaTfv/xDvMxnPcBtfmDETQLwd/Qan4h7zXtCMC2NqFpL5EhdYLc+f23
         osHLQcNkJ8daYQMKLbiOSlsPbTrs4fTSC1ATl1cRLsDlXv3/5Xz3VBlNIgIZzTbziz0q
         wdTePyldSVd80IXPL6kFiRy+0/6Rz/QpbL1cJR4akcIO/l65oIJua7fBzfnyNYHOaxL7
         QbDD4xXvJSaoCQDRtb/dry0JMXXGY1z+Grw3Oynzn/CB3di4eJXbGDPIg+Xe6nhqN81M
         jUDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795179197; x=1795783997; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        b=plUj1VpAnIB/6sm4QWoto5M6DUgOsgolFd++cBRnvkTx3QFGT7nz7uAyjV10R6ZOw8
         IG+vju5IMZKUeF6gA+Y0MWm6p2Vx1fBGsS+1nmwW6RRlQiouzr8VG2g0wa7+2K/wQfpV
         QJYRJrRWdeeYrCsWTaca2ldiqqMbGY79sDf0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179197; x=1795783997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        b=jJV3mJyiXVf3n90j+yusCqgdbBnPEDGyU5V5ZE2aFlUSFS7J/FtbrxOM9SpqkRPhJl
         xAlJkaMqk0PdtAj9p8aASX2jXrKE8Qe9qvIU5A6yKr809wJEf0Qi/laVhQ5aor1xV04j
         3gQ1mTTnOikTfrNZYuSfelBzzrPezGx1K3IXEgUdWRQ2HGxFvNvQYQbGghpy/EzlXN7q
         IoKDy7HhYYNcsZamGi5GJ91VheGmVssQhfR1ZIRXqAGVAxgsBmBbW3Fs70D07dal7/78
         i/leDcP8W7hHSBxCK2mEyHuEGY/hkfapCt6ssq1YPuAf/eETL3OkQcnhuvRT/YFWtkf8
         65fQ==
X-Forwarded-Encrypted: i=1; AL+hErH23JRDH9D2RggVSaT+dup1MTh/G4tOyw4O3BMisnZGg7GpO7AMxqfm5ChusV+4DJtWBydLtZKh39m/nrVCyFDT@lists.infradead.org
X-Gm-Message-State: APuU4Z8jGLX00/hQTI1b6KYi04Ec+H7zhPsXBXo+Tg5LFTq4xWis72wJ
	wx73eVFByGwpmT64F5fMXmD7O/8s1AF91KPWQDUdF/R3wI/1g2Wg0a8PcozlK0URq+fm/jxjgwP
	AsQgXO+FZxqqnN3RBNJSMjbUZOf4u18oukczD8c/PhQ==
X-Gm-Gg: AZFdTZde49otb+KRFvJBn3/s8xPCBpXhldf/TYLInKQSY3zKbjIGt3nPY84ViKZudnN
	iEjr5dFswED1MxvsL3WVeoLSJJLIp/fqKCGTbkz+bZiOX43A+Tkz04XzxW4RTeoMPLn+tgOacpB
	ZkXBQ/yY1HyyOcYjkMFhFsRApjM988xqN4ZKP9gKDbuj60JZMut2GMedl1PxVLDVlkjwA+/6SyE
	K9Ly112K8pYgQtiDlo77F1umOswOYO0WEWg/OY4SUy4GXSm4lrtjry7IPXGPJ8IR88NCN2Scsj1
	+S0bkOPmKi2LSNjVouOQs7Tz6ooTzV5zEyFk+PNDvH+XduJzuEflyOJPHYCJ89RQJeVUfm3pM47
	9csjDVhIOcHsl00/VcHFbSLqRVLmpiVNkI6mB/8HiT/QEdiOmUKQ/d7kupapZYHPY8l0=
X-Received: by 2002:a05:690c:e3d2:b0:8b2:e0c3:1f4d with SMTP id
 00721157ae682-8b5204ab2a6mr13766787b3.37.1795179197354; Fri, 20 Nov 2026
 04:53:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 13:53:06 +0100
X-Gm-Features: AclHuK9f8_4hj4WZI7U8R_PPW4mheeI6fjAZW22lb_dsLGyAMF1kCmKW69Uy0Cc
Message-ID: <CABGWkvoKQksL0vKOi2bLY5o3j998SzkAhdkkP4_ftySjbgqBrA@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH
 2.0 board
To: linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Fabio Estevam <festevam@gmail.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stefano Radaelli <stefano.r@variscite.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_045318_618706_A3A9B291 
X-CRM114-Status: GOOD (  13.89  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

Gentle ping on this series. Patch 2/5 has Krzysztof's Acked-by, and
the series still applies cleanly on next-20261119.

Thanks and regards,
Dario

On Fri, Oct 30, 2026 at 5:35=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> This series adds initial support for the Engicam i.Core MX8M Plus Fast
> Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
> SoM.
>
> The support includes device tree descriptions for the SoM and for the
> C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
> LVDS display (C.TOUCH 2.0 10.1" Open Frame).
>
>
> Dario Binacchi (5):
>   arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
>   dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
>     board
>   arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
>   arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
>     board
>   arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
>
>  .../devicetree/bindings/arm/fsl.yaml          |   7 +
>  arch/arm64/boot/dts/freescale/Makefile        |   8 +
>  ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |  53 ++++++
>  .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
>  .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
>  .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |  62 +++++++
>  .../dts/freescale/imx8mp-icore-mx8mp.dtsi     |  13 ++
>  7 files changed, 326 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctou=
ch2-overlay-am-1280800w8tzqw-t00h.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctou=
ch2.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-c=
touch2.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.d=
tsi
>
> ---
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> branch: engicam-imx8mp-icore-fe-ctouch2
>
> --
> 2.43.0
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

