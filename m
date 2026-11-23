Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D43606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hj5jeTYO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lI2iSTbL;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=IgsJAasd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9s01IOL/VfsGnGIqdOhwdDoI7uOEMrcArvSSD1ab7Bk=; b=hj5jeTYOrsJJ9bsoSkl0O2+lGE
	Xs8f8tVqZ4rcn3N62Oq/tr2vSFoa+Bb3SEHJ0M+x2Vw+ejlB48aZvXBzjpDE/0B4aLXXIXBH9kb/Q
	Is81ffc3JbX8NmTQI3+upXy5Lb89ok50bZVpx19PGOquPRID3tef5pfLJq8olNLefbBHALBbaEZAb
	1WuD6vGqhfNTP9cJScJPzWCycb3xnXAc6hJa2kvQLWofZufNEmvmh+yhKHQCV4x3FR7FY3hoQPufr
	06P821ir+GanS4Fl4JK8GOnhxtuc/a6KLD4sz3TE6j4nPYB1QxEfvXcMNIvxco4VL3yjixIEDkqJM
	cJDAFH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQJX-00000002hye-3ycY;
	Mon, 23 Nov 2026 09:26:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQH8-00000002hZy-05VO;
	Mon, 23 Nov 2026 09:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9s01IOL/VfsGnGIqdOhwdDoI7uOEMrcArvSSD1ab7Bk=; b=lI2iSTbLirT7/Ue6rnM79IrN4W
	FvvoYH/c8TIb6CHMk9ok/JEwvzLuv+LWnaVf9iGdVNn7SayiSkzfp3FlSmIZvELwNor+JLsgMf43Q
	Fvv29Eve0XAZjxH2mrU3Vua66yh/2p+D9fh+ZU/IK08xF9W7OHgssTFUBd/otc+Q1qh4kjREzMuMS
	uzYg/pTpkasbY8+2vJsZy4UctCwjtZ3Opgdo8odc21bh+64KN5zk8ENXsjlnfvI89yce5rF+FKx3p
	/Zp+BYNmvl/6U+1tmt/P57cE51ZBSW8OcEPcLnU65ls8u1FJ0z49eKELIreqruOYrPAqRHYtjw/Wq
	8JFC2vBg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQH0-00000002utc-0u3X;
	Mon, 23 Nov 2026 09:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9s01IOL/VfsGnGIqdOhwdDoI7uOEMrcArvSSD1ab7Bk=; b=IgsJAasdLG82fnozH9SFHpbn7P
	rQN7p6u1BmpqmfCVrfFpMN/CPRVfnjghSvLdu5DNRY9Kx2aBOufpGSPkLjPPtS8/GHRKm5ZntGM8g
	7QHA1Qmo5knPoVIFe8WGG6mRangNs/0gnzzFBRfMZsieglXNU1VL1v2kg8xs1v0KMKNGz0x2jH5T+
	9z1t9OEv2OGKRFD7xefUZmA2NG2M1CyBskRYiKtcZtgaQ9IAdGDKrJpi1ExtuCcP3mBdx92lYzdhH
	f9j2eWYk03aHVkkpRG+lIT+z/rWGv6H4XR0xeKrr6U4ifh/4qj7JafF5dXRdxiZdtTaeQsnNPj2Rd
	HkQaL/Mg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Xiangyu Zhu <1194781887@qq.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] clk: rockchip: rk3506: Add the SAI MCLK output gate clocks
Date: Mon, 23 Nov 2026 10:23:26 +0100
Message-ID: <pWqLoF7FQU26AfZrjX9Cfw@sntech.de>
In-Reply-To: <5176e5e2-72f3-4175-8b29-1dbc64c4e418@rock-chips.com>
References: <tencent_C2AD19EB4A6C91A75AD3DC4089CB875C4005@qq.com>
 <5176e5e2-72f3-4175-8b29-1dbc64c4e418@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092344_233951_D2864AB0 
X-CRM114-Status: GOOD (  17.78  )
X-Spam-Score: -0.2 (/)
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

Am Montag, 23. November 2026, 02:51:32 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Chaoyi Chen:
> Hi Xiangyu,
>=20
> On 11/23/2026 8:38 AM, Xiangyu Zhu wrote:
> > The RK3506 has four SAI MCLK output gates: SAI0 and SAI1 are controlled
> > by bits in the PMU GRF, SAI2 and SAI3 by bits in the system GRF.  Model
> > them as GRF gate clocks so the SAI MCLK pin direction can be controlled
> > through the clock framework.
> >=20
> > This is v4 of the earlier "rockchip,clk-out" binding/driver submission.
> > That one introduced a generic "rockchip,clk-out" compatible plus a
> > standalone driver, which is not acceptable: upstream already has generic
> > GRF gate support (branch_grf_gate together with rockchip_clk_add_grf()),
> > and RK3576 and RK3588 register their SAI/I2S MCLK output gates with it.
> > No device tree changes are included.
>=20
> Please slow down the pace at which you send patches so that people have
> time to read them. Don't send your patches within 24 hours.
>=20
> In addition, your Message-ID seems to have been modified by your email
> provider:
>=20
> Message-ID: <tencent_C4C715C962613597F98212938F8940633306@qq.com>
>=20
> Please try the downgrade the git version[0] you use for
> git send-email, or switch to a different email provider.
>=20
> [0]: https://lore.kernel.org/all/8771714B848C3A9F+9f64a309-ff70-466f-8d29=
=2D15950318b728@airkyi.com/

tencent is notorious for mangling message-ids (adding that "tencent_"
in front. This will likely happen with all git versions.

I think the best way forward is what most "qq" users do nowadays
to use "b4" and use it web-submission option [0]


Heiko

[0] https://b4.docs.kernel.org/en/latest/contributor/send.html



