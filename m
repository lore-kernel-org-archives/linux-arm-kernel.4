Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B5606D823
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ZdZUcnL;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vW+rWMbC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=//2W4dF8dRqMAfkwRAhImATI6D+c4FVFBxbhqBn9xzk=; b=0ZdZUcnL8LzYCyMkPMPmMD9FAt
	TbGHVWXxpFi9w5oKf/MlGBYg+us1//vlRcSoxOARNCJxPnQM7kwv1GgkUzr71+QHUCtNq3GXcSbI9
	V2Xe9WH1QSAXGiBzo3k9ijazRsLBvo0yvGKpirdDHolqDbU8KNo6685BBUF5+wXfzy9rO2Bf8z60h
	lnYrry+jh5lfAKUpueHuYtzi0IDGd/mwEPEO+n+rlCzG9EJa2eLH62RRD6utYNjvSM2rpZ9Q1Dj8/
	GdTrkwuZTY+2Jd7D0I46gRa0Tt+5THXMohGxa0hDwnnv5IH4JW5sJ3Kc2S8+NLLrwysEcGLANBKs/
	92cBeukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOp-00000000nky-2ALb;
	Mon, 09 Nov 2026 13:27:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOm-00000000ngp-2LMC;
	Mon, 09 Nov 2026 13:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=//2W4dF8dRqMAfkwRAhImATI6D+c4FVFBxbhqBn9xzk=; b=vW+rWMbC+7d9RHvWCrWsBbFsUk
	5idnG3Sd13NpxvsuTmz0VMYqvaK+w9Jjq3+bj8U2rNF+hdX5K9P1M7WmFg5SvIMIRaMxtc2ZFhr9w
	ytwlggqCzUCrzwzrHd87GqnRYc0aE9k6zGwt7pjlOw44xerDF61PYznkQ5P6Z0HJlM54CB8yQ9lKR
	zyzcQ2JdveVONjsLdyQ5toBWNi0wI4+SQ8sUKexxsMl9XN97ubqW1RZj83jTsAahKc1cl2yD/h3Qj
	cFgsJWGF63ZWqoFHc5JZka+d4erYO0TJ+tOnU62kwgDdkG2h4/Qiuzie5IHW4EPRIOY3hCwkBKTVm
	l08L/sdA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
Date: Mon, 09 Nov 2026 14:26:44 +0100
Message-ID: <5573124.44csPzL39Z@diego>
In-Reply-To: <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <avDN3pPY5Qwt9B1p@venus>
 <b60b7079-b7b6-4d83-8167-2e4fc6021aae@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052700_730387_CA1B950F 
X-CRM114-Status: GOOD (  25.30  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Montag, 9. November 2026, 02:31:35 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Chaoyi Chen:
> Hi Sebastian,
> On 11/9/2026 3:42 AM, Sebastian Reichel wrote:
> > Hello Chaoyi,
> >=20
> > On Sun, Nov 08, 2026 at 11:15:09AM +0800, Chaoyi Chen wrote:
> >> Hi Sebastian,
> >>
> >> On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> >>> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
> >>> combination. It contains a Wanchanglong W552793BAA panel and a
> >>> Goodix GT1158 touchscreen. This adds the DT description of it.
> >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++=
++++++++++
> >>>  1 file changed, 90 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/=
arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> >>> index 6a95a8bb6fb8..327ca13b60f0 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> >>> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
> >>>  		regulator-max-microvolt =3D <12000000>;
> >>>  	};
> >>> =20
> >>
> >> I seem unable to apply the patch to the latest linux-next tree.
> >>
> >> So I tried to resolve the conflict manually, but the actual
> >> test screen did not display. I will look into this further.
> >=20
> > Strange. The base of this series was Heiko's for-next tree from
> > Friday. No RK3588 EVB1 patches landed since then:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?h=3Dfor-next&id=3Dcabb6811c38a46337d5f4252b4dc390f9296856c
> >=20
> > If your board uses the original Rockchip bootloader, which shows a
> > Rockchip logo on the panel, you also need Cristian's latest YUV420
> > patches that reset VOP2 at probe time avoiding some issues with the
> > pre-initialized panel as a side effect. Those were recently applied
> > by Heiko to the DRM tree, so testing on linux-next is indeed
> > sensible.
> >=20
>=20
> Hmm, the newest linux-next tag which I used is next-20261105, and Heiko's=
=20
> tree last updated date is1106. I'll give it a try on Heiko's tree.
>=20
> And I'm using mainline U-Boot, which obtained from the latest nightly bui=
ld:
> https://gitlab.collabora.com/hardware-enablement/rockchip-3588/debian-ima=
ge-recipes.
>=20
> The backlight working correctly, and the DCS command has been sent, but n=
othing display.
> Perhaps I should look elsewhere.

I would assume it could be the SPLL (again).

I.e. a recent u-boot change broke the SPL-based forced clock init and Jonas
fixed that in [0]. Had the black display again recently too.

And it seems it hasn't been merged yet.


Heiko


[0] https://lore.kernel.org/u-boot/20260804002643.2308515-3-jonas@kwiboo.se=
/



