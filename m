Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D506082BC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0U2lzSyL;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=AKfQpOEc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MTKqzeN2qzSEwB7wgpPDqmDOm1XJz5MFsmhF4czrNrI=; b=0U2lzSyLMXoVn1kJtM/rkbTgZN
	YonZQmlbyYMOH9W/NKU0nLIULWcDfMPlwK1cGue8z13QrtjadHM9PFUEhVp5U6AR0eb6JwckZed4/
	7JNrDAiQ/oUHQb3agVqMPk9JNkVjQCn39GL5khQmV6j27nirJ+cPzVL3FWS7auGT3Bv11a+bXCiBv
	3OD1QfwbxhnT7nw4O7bskUviEvSYG05nBaM8Rfq+QDiKK+OBVXhkyG4QJ2ita+yRN2AehpJmxwPrM
	KxyMz06ZGUQYOVc5Wazcn1DyNPLitJasr1jq9/KV1oDoI27qsP95GQSbvk4o71dY0gnBzxz0yWq5F
	UGl1/MOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhba-0000000Epx7-0L8a;
	Sat, 07 Nov 2026 14:41:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhbY-0000000EpwN-1Ata;
	Sat, 07 Nov 2026 14:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MTKqzeN2qzSEwB7wgpPDqmDOm1XJz5MFsmhF4czrNrI=; b=AKfQpOEcyMJuFY5WDsAYJCTPjL
	pgnw4g5N7gDR3sRbLbFgG73J6zge7zNIO0U5Km4Qo/IoKiabt/e8uLUdTA7R2zZXc/s+9IS57fvvF
	72zVqn2IdV6MrKoyzu9pOjZqKdtb5zyu7j2UkFKUk67ed7AEm0Dh+jLxuLdUY4pItdnHYV8H1Tev5
	vD+2hx89y6foUzJmwrEnK7jzdalIL2ZDOVxos10lo20RajGCi5S8fwui/nYnLxiTYpETen3FkgD0+
	f2wq6OjDIi1cpxq//uoGJdNTDNcF3XxMPt37xeImwXJZqfUKmYQx0vNtV0j1Hj+XlF3mdU7+Hu8F8
	tZjG+fog==;
From: Heiko Stuebner <heiko@sntech.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Oliver Hartkopp <socketcan@hartkopp.net>, kernel <kernel@pengutronix.de>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Cunhao Lu <1579567540@qq.com>
Cc: linux-can <linux-can@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>,
 stable <stable@vger.kernel.org>
Subject: Re: [PATCH net v7 0/7] can: fix bus-off restart and device close races
Date: Sat, 07 Nov 2026 15:40:55 +0100
Message-ID: <6105577.1B3tZ46Xf9@phil>
In-Reply-To: <tencent_B3369A1199D0849091BB8015C41BBFF0A607@qq.com>
References: <20261106-rockchip-canfd-restart-close-v7-0-accdb11bc845@qq.com>
 <16255046.uLZWGnKmhe@diego>
 <tencent_B3369A1199D0849091BB8015C41BBFF0A607@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_064116_321047_A126ECC4 
X-CRM114-Status: GOOD (  22.17  )
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

Hi,

Am Samstag, 7. November 2026, 03:57:26 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Cunhao Lu:
> > > This series depends on the three patches in "can: skb: make CAN skb
> > > freeing safe in any IRQ context" [1] and the three patches in "can:
> > > rockchip_canfd: fix TX stalls and races" [2].
> > >=20
> > > [1] https://lore.kernel.org/linux-can/tencent_CD05F020BAFB2537F5D1F4C=
BB425588EA80A@qq.com/
> > > [2] https://lore.kernel.org/linux-can/tencent_E25C9BE6689264E4138A464=
803B810FDFD09@qq.com/
> >=20
> > Both these series are from july and seemingly from before you started
> > using the b4-relay. So they may or may not have survived the kernel
> > releases and their threading is broken both on lore and in any maibox
> > they arrived in.
> >=20
> > And if there haven't been any responses to them since then, I'd think
> > they have been lost or so.
> >=20
> > So I'd suggest rolling both your dependencies forward on top of the can
> > tree and sending them as a new version, so that reviewers can find them?
>=20
> Thank you very much for the guidance! :-P
>=20
> I just checked: the "can: skb: make CAN skb freeing safe in any IRQ
> context" series was merged into mainline yesterday, so I won't send a
> new version of it. I'll remove its link from the cover letter.
>=20
> The "can: rockchip_canfd: fix TX stalls and races" series still has some
> issues reported by the bots during submission to the net tree that I
> need to address. Since those patches overlap with this series, I plan
> to fold them into the next version (v8) and send them together.

As that series is also "just" for the Rockchip CAN driver, merging both
sounds like a good plan - especially as it makes it easier to keep track
of things :-) .


Heiko



