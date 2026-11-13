Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECC960A2617
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R4p5wfYL;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=WSWhl2K6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OzoadZhT6+7BRQ3IJcP5Fei5yMlRSCEB5hfbLUnwCWI=; b=R4p5wfYLL2452i8wxncIsTNjmn
	N2aWFQbfkse6ctcyykkO1WUPT+hNWvtApocpZ8vczG3FUazElQAJce3rtkrlevgYRKCuGHFLr1bAE
	7miP0Z3fd+NDt60v+uk6qnIZLxg5nPFgyOhm1O3aOS3WwoxbDHcHzOM+hL3qjfo9bl4tYRK2eMgoR
	01TIhDkl3wSrwW//QFDt/TQQaetqXiIDGNVHux+5FlRz6z4oeMmaeyzkYiCbUTheGqRcwjfv7WzjU
	KR5eeIGsBoK+msvqfqFSLw0ZK5X5PYXhpH2uzGvzVG4pYNYNH79wbDruUU7CclOZD/VwV3cGSoCIA
	YNBrcEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxaB-0000000ELWT-24C7;
	Fri, 13 Nov 2026 20:09:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxa4-0000000ELVg-1Jcq;
	Fri, 13 Nov 2026 20:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OzoadZhT6+7BRQ3IJcP5Fei5yMlRSCEB5hfbLUnwCWI=; b=WSWhl2K65oqcQXRPW3xwJqF/pO
	zFtu5vaJYoHz65FakgJo1v2gCjH/3pMRL5An5WODpB3VF4tU8B1kIEVDK70z/Z+OKmcPZr8lhisuc
	vYSSOWoFAW1Igw+OpjRecyGJ2ZIgMqjr44BiO3MXe030HObNNVx6RcAeq6i3dEaPndEPyYsWHu115
	oaq7Q+0o3At+Qv9pq0IPMNyxOW6BeaKnDGjS0/gc/iB9vE+7DD3FuorFsOtHO3OoPUZSio/IUCSzq
	bB1rIRoQR3aO0k3a2aTl+1DNMx//skVXripCpxQ7dzEG6hFYhbZar0ZChkWFdgP+A7dCdVObJ729D
	ff/NKobw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, iav@iav.lv
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable SDR104 on the ODROID-M1 SD card
Date: Fri, 13 Nov 2026 21:09:01 +0100
Message-ID: <ozv3Kw_6ToOMhu6IF4wDPQ@sntech.de>
In-Reply-To: <20261110-odroid-m1-sdr104-v1-1-8edc6d5c1bf6@iav.lv>
References: <20261110-odroid-m1-sdr104-v1-1-8edc6d5c1bf6@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_120904_356116_95465D1D 
X-CRM114-Status: GOOD (  20.29  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 10. November 2026, 03:50:01 Mitteleurop=C3=A4ische Normalzeit =
schrieb Igor Velkov via B4 Relay:
> From: Igor Velkov <iav@iav.lv>
>=20
> The SD card already switches to 1.8 V, but only SDR50 is allowed, and
> clk_sdmmc0 on RK3568 is a mux without a divider: dw_mmc-rockchip asks
> it for twice the card clock, 200 MHz for SDR50, the mux rounds down to
> the 100 MHz parent and the card runs at 50 MHz.
>=20
> Allow SDR104 instead; the MMC core still falls back to SDR50 for cards
> without SDR104. With the 150 MHz max-frequency from rk356x-base.dtsi
> the clock comes from the 300 MHz parent and the card runs at 150 MHz.
> Hardkernel's vendor kernel already uses sd-uhs-sdr104 on this board.
> With a SanDisk 128 GB card, direct read goes from 22 MB/s to
> 58-64 MB/s and direct write from 20 MB/s to 47-50 MB/s.
>=20
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested with an Armbian 7.3.3 kernel (rockchip64), the property added to
> the DTB with fdtput: reboot, sysrq-b, watchdog reset, poweroff, s2idle,
> deep, hibernate, hybrid-sleep and suspend-then-hibernate; the card
> re-tuned and came back in SDR104 at 150 MHz in all 29 runs.
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm=
64/boot/dts/rockchip/rk3568-odroid-m1.dts
> index ec43dee18094..6f77e73abc8e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
> @@ -610,7 +610,7 @@ &sdmmc0 {
>  	disable-wp;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
> -	sd-uhs-sdr50;
> +	sd-uhs-sdr104;

You then want both of them in the file.
The devicetree does not care about what mmc drivers do internally, aka
that fallback and the properties describe

SD UHS SDR50 speed is supported
and
SD UHS SDR104 speed is supported

So both are needed.

Thanks
Heiko




