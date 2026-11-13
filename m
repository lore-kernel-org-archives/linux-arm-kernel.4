Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F580606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MgM4AR3h;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=fVZBrCXJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3cvVB8oLNqlQFPwFKMUuhi1X/vDmZWiN//JjPAVvjJ0=; b=MgM4AR3hX1DC4jEWvsmnpmLeGo
	fooaLhQ8f4zW0jgYPpXOT7cMCjQk0Wdf316K/jKGPeIFpFtfAnJe0BeN5940AGMXBpnCC1el7TKL8
	O6jzziwl9II1KdtiQZwDrFGpUuJMtnrnkYcgTRgBdhZUvnl2qnsXx+2mnmYOVDLgG2PvTaClKUc0U
	jLdD6PSQfbuZ54ZTWraI0MrvAi4BmvzibVpsARl7jmC2oE4QLQZnWpgryJhP7IO33rGm/vy75xjUd
	nTbehRwkvC6iRIMg06ZX9e/HmbAFeg9jpxZhjp1dJrYbZOQmibFS2m/5IEbACyIEn/VSL7szKBBCZ
	obKk2TUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRx1T-0000000EC9Z-1PQr;
	Fri, 13 Nov 2026 19:33:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRx1O-0000000EC82-3Yxh;
	Fri, 13 Nov 2026 19:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=3cvVB8oLNqlQFPwFKMUuhi1X/vDmZWiN//JjPAVvjJ0=; b=fVZBrCXJTi5Hl1cAhnGXFJnaRu
	uMXsLtdE1sDHiPTxTusPdRssUAoUOYtakcLkZ/LWCPzewerEA1H1XO/EZ/1+lY8yrLmMxmnww+xHq
	TZhwZ4BjqUxm8JjFT1Hh3b49h1JZt9p7NQ94uXiguQuVByGvEoGY5VDTSNns4d+IwCt+VW1ca3SkI
	Axbdal++FeVlMIzagivufXUhlzcz4hKODHuTW4TjeORRK2WMgIdicX2nI4vrJdtK/sV4UNs1YY+sV
	7FFhJSFN9utZgqJg85ShL++yfXstm5Vo43AtuVyoyAEbPQkr2OLkSFMbocetyE+yxZ1lBA1TNVFRW
	w48brsbA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Tim Surber <me@timsurber.de>
Cc: Tim Surber <me@timsurber.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Valentin =?UTF-8?B?SMSDbG9pdQ==?= <valentin.haloiu@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: fix HDMI RX 5V detection pin on CM3588
 NAS
Date: Fri, 13 Nov 2026 20:33:09 +0100
Message-ID: <7ONBekS7Tj-N3VFFry-6aA@sntech.de>
In-Reply-To: <20261111210059.3489502-2-me@timsurber.de>
References: <20261111210059.3489502-1-me@timsurber.de>
 <20261111210059.3489502-2-me@timsurber.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_113314_890303_91144E20 
X-CRM114-Status: GOOD (  20.54  )
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

Hi Tim,

Am Mittwoch, 11. November 2026, 22:00:27 Mitteleurop=C3=A4ische Normalzeit =
schrieb Tim Surber:
> The HDMI receiver node uses GPIO3_D4 both as the receiver's HPD output
> (hdmim1_rx_hpdin) and as its 5V detection input (hpd-gpios and the
> hdmirx_hpd pin group). Both pin groups are in the same pinctrl state and
> the later one wins, so the pin ends up as a GPIO input with pull-up.
> The controller can then never drive HPD: the source sees HPD asserted
> all the time, and the 5V detection reads back the HPD line instead of
> the source's 5V.
>=20
> The driver relies on HPD being low while it writes the EDID, at probe
> and on VIDIOC_S_EDID. With HPD stuck high, a source may read the EDID
> while it is being written. A source that does so at boot keeps the
> damaged copy, as it never sees the HPD pulse that should make it read
> the EDID again. On a CM3588 NAS with HDMI0 looped back into HDMI RX
> this happened on 3 of 10 boots: HDMI0 logged "EDID has corrupt header",
> found no valid EDID and fell back to 1024x768. Changing the EDID with
> VIDIOC_S_EDID was not noticed by the source at all.
>=20
> FriendlyElec's vendor device tree for the CM3588 uses GPIO1_D5, active
> low with pull-up, for the 5V detection. The NanoPC-T6 uses the same pin
> upstream. Use that pin and leave GPIO3_D4 to the HPD function.
>=20
> With this change the pin multiplexing shows GPIO3_D4 in the HPD
> function, the source's HPD interrupt fires on every EDID update, and a
> changed EDID reaches the source within 0.5 s. In 10 boots (5 power
> cycles, 5 reboots) the EDID read by HDMI0 always matched the one
> written by the receiver, and HDMI0 came up at its native mode every
> time. The receiver still detects the source's 5V and locks to its
> signal.
>=20
> Using the pin in two groups also made pinctrl warn on every unbind of
> the receiver ("not freeing pin 124 (gpio3-28) as part of deactivating
> group hdmim1-rx-hpdin - it is already used for some other setting"),
> and in earlier testing the following bind sometimes failed with
> -EINVAL. With this change the warning is gone.

you're fixing _one_ gpio, this does not need a novel size explanation.
Please make sure you're writing commit descriptions yourself and not
let an LLM run amok on it please.


Thanks
Heiko





