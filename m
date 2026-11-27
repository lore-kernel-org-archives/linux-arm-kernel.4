Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0441D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DYcO/arU;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.a=rsa-sha256 header.s=protonmail3 header.b=grn3HwCD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZFxfAAA6GwTz51RC5rJw8wfbBqlOQRlWMUcxU0I/V0E=; b=DYcO/arUV2MAZG
	rZn4KHUmHw4DPU4T0UzbET/MBI16fWm3DB1HrgqQlACYikXnRrv6SiuIpLJaxqdY4RKKy052qbIKj
	opDoat09xFGulYNer0mOm9rzI2THo7bz1Dl01MQVrDeMZwp13kGOdm3zyDHj1uSG6sYPwumqJZrR1
	hEzInHi3MbN7aqr8xQ9YKBjD7thmASp0FUTEqAz9vZPJoAy/F0QpflrVOs2CjeUVuiSdmjNW68UEg
	yxUQRCeNY4ID/n5CyIrHXt1WN09USNmwfUG0iNtrBG1/43gk1pMDL36jME77UpsunZpjGcvvIIFOS
	tIGN8Xb/WAqy+ERcZT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvj1-0000000GEe1-2huI;
	Fri, 27 Nov 2026 13:10:51 +0000
Received: from mail-106119.protonmail.ch ([79.135.106.119])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWviy-0000000GEdX-485A;
	Fri, 27 Nov 2026 13:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1795785043; x=1796044243;
	bh=ZFxfAAA6GwTz51RC5rJw8wfbBqlOQRlWMUcxU0I/V0E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=grn3HwCDTOorQ5DALp09B0V9rgT7HOcv09Ofyb9FXml+uMHqwhYYArjSOQMVzhiKS
	 nSD6DHlU4jffGsj6H48yMf8lRqAxTsfI9khmN69QNMoGU+uBuMdkSAKOTWzCCSLvyE
	 96BNClbPVfSAqHyYxohYacXF9qYwgKWc6PHCJYHktHHIIVePz72+RhM+EXQbIg15oo
	 M20FCW1jcvEDPKzKFmtdO+Se3BaooawElpyxhKuBTk2RSj0oMTjc5SALYS+O3I3/UJ
	 8sEBjNFW6yUY+KUpgxUA9tfBwuFfGCQpta0G6CTUL+EuBW47NtP1Ye3ykXnwACiaY+
	 UWiZNY6WQ05TQ==
Date: Fri, 27 Nov 2026 13:10:35 +0000
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
From: Ben Grisdale <bengris32@protonmail.ch>
Cc: rva333@protonmail.com, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 0/8] arm64: mediatek: initial support for mt6768
Message-ID: <20261127131027.6af2d515@ben-desktop>
In-Reply-To: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
References: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
Feedback-ID: 27291966:user:proton
X-Pm-Message-ID: edd5e5751e2e69693495bd2942b0edb1496e65e7
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_051049_183554_A6C46365 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026 14:39:53 +0200
"Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org> wro=
te:

> This series adds basic support for the MediaTek mt6768 SoC and Xiaomi
> Redmi Note 9 smartphone (codenamed "merlin").
>=20
> The mt6768 is a 64-bit SoC featuring six Cortex-A55 and two Cortex-A75
> cores, typically paired with LPDDR4X memory and found in low to mid range
> phones.
>=20
> This series requires custom TF-A and U-Boot forks, because the device
> shipped with broken PSCI implementation and bootloader that pollutes dtb.
> TF-A: https://github.com/mt6768-mainline/arm-trusted-firmware
> U-Boot: https://github.com/mt6768-mainline/u-boot
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Whole series,

Reviewed-by: Ben Grisdale <bengris32@protonmail.ch>

Best regards,
Ben Grisdale


