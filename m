Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58E2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ldF9EIil;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=HsNp5YFE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zgSLzQzvj94+CU+RMzv+1QgkSdJmrKstSCWUmbLgimg=; b=ldF9EIilwxpaiLkrJ7wEjBPAAX
	sCF6635oqu7PVkhVz+WUQ8KyH9D1zpkLzd8LvZDfHNnf2y0xYB7wLkRC3ufivZ6piZJbbD6blO2oo
	4mZOuGyeE2pf1e55ClzD07wX+zhyspnB60LKEZKhwYORGRqK7Me7OS/MBFVh7GtvXSIW1wAKt3dMZ
	cilD+/9jByx2lLSmdAH9s1V16dNnX4mBdItSoQtOXCqepx0oER3FLA094IQU0N/F2R7+kz0stvctG
	6ErMEb+kyZh5v0/uoldJtPZ0fdSNUP1SbV5STQ1EvVIOphyZkiYfn7ISyJiIoPPtoSvQBMdWggfJz
	RL2ulD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLAs-0000000BRCg-2buc;
	Wed, 25 Nov 2026 22:09:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLAp-0000000BRCJ-32ke;
	Wed, 25 Nov 2026 22:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zgSLzQzvj94+CU+RMzv+1QgkSdJmrKstSCWUmbLgimg=; b=HsNp5YFEYBEH6UIUl7uJpBPD1S
	kEIA7BRehcSxPC8vULQaJazoTL0GdjJL7hD8w7drcGk0CSQ8hcQM1B4dy+GJjLclNwiOWZfRyFLWr
	+suXXRhIMkmnzVfBdPq2NLCT1Q64oA9E26MGiul15QwbdlV1JUj4vyf064M7J++yKTa1d6pT+t8NY
	nw6HPSmHE4tIWNW/kSMme56UlQyOXvNaFAQ8qq6KvPZE49326kHNWJuQB1JBpL+7fCsubwcI8bF2S
	DKE6Kc02+6PwO/YtowuVgKPb5D+y3DkqDMQZIahZ/kefWPRVofdUvrqaTG1n+gJvbeBY7SBXUql0J
	u8jqCAow==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, John Clark <inindev@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/7] arm64: dts: rockchip: Updates to RGMII PHYs on Sige5 and
 NanoPi M5
Date: Wed, 25 Nov 2026 23:08:50 +0100
Message-ID: <Cu3H0uEZRa63R-pg_rJRCw@sntech.de>
In-Reply-To: <CAKTNdwFrQErYOgG9gnCc3g6JOGoimKa2AOKMs3LAcBVYuDuE0w@mail.gmail.com>
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
 <179563805247.3885553.6358930861216631692.b4-ty@b4>
 <CAKTNdwFrQErYOgG9gnCc3g6JOGoimKa2AOKMs3LAcBVYuDuE0w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_140907_823972_6DD19EF6 
X-CRM114-Status: GOOD (  14.62  )
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

Hey Alexey,

Am Mittwoch, 25. November 2026, 22:58:09 Mitteleurop=C3=A4ische Normalzeit =
schrieb Alexey Charkov:
> On Thu, Nov 26, 2026 at 12:21=E2=80=AFAM Heiko Stuebner <heiko@sntech.de>=
 wrote:
> >
> >
> > On Fri, 20 Nov 2026 14:48:08 +0400, Alexey Charkov wrote:
> > > Both ArmSoM Sige5 and NanoPi M5 boards use the same Realtek RGMII PHYs
> > > which currently share an issue preventing them from enumeration unles=
s an
> > > earlier boot stage left them out of reset: at power-on, their reset l=
ines
> > > are asserted, so they cannot answer an MDIO probe. Until they answer,=
 the
> > > OS cannot look up the ID to match a driver. And until the OS has a dr=
iver,
> > > nothing releases their reset line.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/7] arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs by their ID
> >       commit: 693e0c4f00389a097d710577ed5c24c4ac3f75a7
> > [2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
> >       commit: 5d839ad9553f90c727157c45471a911f64cd067a
> > [3/7] arm64: dts: rockchip: Drop NanoPi M5 PHY reference clocks
> >       commit: 9c83b53e6c858a9a8f00ca82ecd1f46d2d723b70
> > [4/7] arm64: dts: rockchip: Enable ALDPS on NanoPi M5 Ethernet PHYs
> >       commit: 620ad5b09bec5abd83d35bf23c1af1fb68eed80b
> > [5/7] arm64: dts: rockchip: Enable ALDPS on Sige5 Ethernet PHYs
> >       commit: e48f1d304f7b69b47c6f98b701aa6f8c84ffbb9a
> > [6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to dat=
asheet timing
> >       commit: 5efab9e7c28448f6035e7216255f7b76b28ff97b
> > [7/7] arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to datashe=
et timing
> >       commit: a2a390e7fa9e73ff07d2a9fc002114e299483202
>=20
> Would you mind dropping the last two patches here? Sashiko pointed out
> that a later revision of the datasheet prescribes longer reset timings
> vs. those in the revision I had, and with those in mind it's not worth
> the churn.
>=20
> The rest should be fine.

I've now dropped=20
a2a390e7fa9e arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to data=
sheet timing
5efab9e7c284 arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to =
datasheet timing

force-pushed the branch and re-created my for-next branch, so they
should be gone now :-)


Heiko



