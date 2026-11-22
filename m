Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E640606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cZaquQmd;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=o8Aspt50
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wx3P+dKo4GM43A7D066wIsRvaq0/Fqq2FMKb809nRkY=; b=cZaquQmdPL+XDd9TJhT6tVZ8NM
	sRJpbn7Ulk3WMqiQIpnyuguXLqze6d2URfxWDg8gdWeibmIzvy41hR4IgvxSWx44IMaNkviAuWYyX
	vAwcB6i3rZYklGZMro6mcCJcqvtKzei0TBx5VSxgmp1PbRX7zclja8EpZa19Ea7Fxbn7ydx+XbLiI
	SYkMsx7RigGQzuMkIdxysOCjR6LGuqAd/hq0914EvxU63lX6MATRf2/iOz1V+Y7nm9jSELDRAMenu
	Vzmx9ULbZC31HeTJVXD3VLs4IVmmj/WDS0VTULnCU8wYaxALZ1ALnF98hpymQEb2FWv59206PvJ7h
	Ty4Sc+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFfZ-00000001pjF-0hvt;
	Sun, 22 Nov 2026 22:04:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFf9-00000001pXb-2cW1;
	Sun, 22 Nov 2026 22:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wx3P+dKo4GM43A7D066wIsRvaq0/Fqq2FMKb809nRkY=; b=o8Aspt50Btrcq59EN1EuJxGvAC
	7/DZqL56mUJ8ZIML79qYWp+JQz1VwTTmWVUNzScFzs1lypU/JdXJbBPHxE4Lb7kidXyAYr1tiDlKv
	VMZdeicvXQoQR8mVKYLdj2n1+rVF8mJkLh2+FmU4Ru70NyZC4ugsbA12XwPZYRziHSLpxYIW0HQKv
	JJO4TIa1sBvgh9tEyOeXglZPCS4JZ8TiY8Kn7lycMfx3pHfc/eso/lvOMYmzcqj0X83wSijRqcTpg
	/4xsHY46QzkbAqt58b2CDkln0RCTbsicY3RyIFxTbc8xJQJDUwSo9qHGzkvqBqgq4Fw1bd8OTYoz4
	yL3WG0uA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andyshrk@163.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andy Yan <andy.yan@rock-chip.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip: Allow single 'port' node for DP
 input port
Date: Sun, 22 Nov 2026 23:03:35 +0100
Message-ID: <GHrf8KahSYaDLPGqb0rYhw@sntech.de>
In-Reply-To: <20261109184759.467215-1-robh@kernel.org>
References: <20261109184759.467215-1-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_140355_722814_96C84CD4 
X-CRM114-Status: UNSURE (   5.69  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Montag, 9. November 2026, 19:47:58 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Rob Herring (Arm):
> Existing RK3399 users have only a single 'port' node. This was common bef=
ore
> connector nodes were defined. Allow for this since there are already stab=
le
> users.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



