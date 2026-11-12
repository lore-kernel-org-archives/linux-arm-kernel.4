Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3208606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o8jFOGhJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jYd/fAZz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a1xEK6Aga3yjCNS1Hmlu8sGRBKzLE3yolmU5IVLWK9g=; b=o8jFOGhJYECRZKs3C0kLVJkJpl
	Evee21+unGBAvOqLZLBNDkKvJthv4abvTwH2UmI64HOAavaxZ8MgmjF2YIsCUYWl+kGLVcfCGkffw
	a1zFV7mK/JGs9iKTH7FX3n4cfqCLUWiHOBgV/x6aZ4F5Xp9WqvuwhkPHvkqbb7kzOPjD3Q9/cvTxD
	/9ZGeK3RTpIpkJgHYVIniF8ilM2/lQzjb81JkBvgssPWD/vMXCc+/yNsopI3rmle72BQX7tZoB63x
	ib4x9Ldll5jLaPC8oy8V/h4Qbn2dBOrPrqO3EnDqPxCIdYO5N5Un4kTGPGgkWkqQvV4z9XxlEo6Ii
	cMvxloFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPBJ-00000008v9X-3D62;
	Thu, 12 Nov 2026 07:25:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPBB-00000008v96-0Ltf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:25:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FC1F41AD7;
	Thu, 12 Nov 2026 07:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCABA1F00A05;
	Thu, 12 Nov 2026 07:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794468304;
	bh=a1xEK6Aga3yjCNS1Hmlu8sGRBKzLE3yolmU5IVLWK9g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jYd/fAZzm3pNLz3fQRYz76G0ehETIQ1m4H5F5RwgD5a5V/lt8BdhrdeqEUQ8DrKzx
	 5Lm/FRO0U6X7Onjr+NZLtQHmdJ9ja0FHhIy1RkskBrSOcRr9vNkmTVZspK4JLV4uMt
	 8/eIzPHtw+eHGdO3q2Gfnz5uYplSF2TLUk4eAHssQV2zNdjMRbOOESIz1I5njrPCdZ
	 nzChP00C8o3u/dr9voat0JXLcVqm7c/t1+V3g7dM5lTjv9/vIW3ciP2Qfe23xM5xyO
	 kPhovEsTMClfGYhNs51SrAFMd9/+pKnPuHSym9kHcY7uil/x+RAvJ8MhFoRVMngQN2
	 cGxWUKLdAT/cA==
Subject: Re: [PATCH net-next 1/3] dt-bindings: mfd: syscon: add ti,am654-gtc
From: netdev-bot+sashiko@kernel.org
To: jjc@jclark.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, s-vadapalli@ti.com,
 rogerq@kernel.org, bigeasy@linutronix.de, martin.kaistra@linutronix.de,
 vadim.fedorenko@linux.dev, r-sharma3@ti.com, robertcnelson@gmail.com,
 nm@ti.com, vigneshr@ti.com, c-vankar@ti.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 12 Nov 2026 07:25:02 +0000
Message-ID: <179446830222.2199510.13606408467624966277@kernel.org>
In-Reply-To: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
References: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new compatible "ti,am654-gtc"
  (Documentation/devicetree/bindings/mfd/syscon.yaml, line 134) is named…
- [Low] The subject line "dt-bindings: mfd: syscon: add ti,am654-gtc"
  starts the description after the prefix with a lowercase "add".

--

dt-bindings: mfd: syscon: add ti,am654-gtc

This adds a ti,am654-gtc compatible to the generic syscon binding. It is
for the CFG0 register frame of the TI K3 Global Timebase Counter. The CPTS
driver writes GTC_CFG0_PUSHEVT in that frame to pick the counter bit the
GTC exports as its push event, which provides hardware cross-timestamps.

> dt-bindings: mfd: syscon: add ti,am654-gtc

[Severity: Low]
This isn't a bug, but MFD subjects normally capitalize the description
after the prefix. Recent commits to syscon.yaml do this, for example:

  dt-bindings: mfd: syscon: Add ESWIN EIC7700 compatible

Should this be "dt-bindings: mfd: syscon: Add ti,am654-gtc"?

> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 80ff0e1caca22..b1030f11b2dbf 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -131,6 +131,7 @@ properties:
>                - ti,am625-dss-oldi-io-ctrl
>                - ti,am62p-cpsw-mac-efuse
>                - ti,am654-dss-oldi-io-ctrl
> +              - ti,am654-gtc

[Severity: Low]
Is ti,am654-gtc the right name for this node? The commit message says it
describes only "the CFG0 register frame" of the GTC. The compatible,
though, is named after the whole GTC IP.

The GTC has more than one register frame. k3-am62l.dtsi maps a
0x34000-byte window for it:

arch/arm64/boot/dts/ti/k3-am62l.dtsi:
    ranges = <0x00 0x00a80000 0x00 0x00a80000 0x00 0x00034000>, /* GTC */

The generic syscon schema allows only one register region and no extra
properties:

  reg:
    maxItems: 1
  [ ... ]
unevaluatedProperties: false

So a node with this compatible can never describe the other GTC frames
or resources.

The syscon.yaml description also says syscon is for registers that are
"not cohesive enough to represent as any specific type of device". The
GTC is a specific counter IP, and PUSHEVT is one of its own functions.

Compatibles become DT ABI once merged. A full GTC binding added later
would then need a different name for the same IP.

Would a frame-specific name such as ti,am654-gtc-cfg0, or a dedicated GTC
binding, describe the hardware more accurately?

The ti,gtc-push property in ti,k3-am654-cpts.yaml, added later in the
series, also describes its target as only the GTC CFG0 syscon. No later
patch in the series changes syscon.yaml, so the naming is the same at the
end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794284248.git.jjc%40jclark.com

