Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC9606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xfEaT5KG;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nEylbCvu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fffPhen65RXvgrHvozLgMLsmu+SDxyuRcwXFiGMhJew=; b=xfEaT5KGYbCGhws7i5+nH+goXY
	mBwYC4Z5q4tMBDdqOokO39I8vRe7c4MWpud17yA36psHO0uveFDejPhzTyM6L9c+kSj6TmymLCYVo
	Zt9MDuP41OOhfsDFkhNtXStJUp5fmO2Hu4Yef+p73Tq3ePEQIuPBLAOmlOUc5Q5P248I4xpfcHz+E
	LhXjGO7qMIrJJ/q3zgfqTwMuUQ/SCA05WEAaWckyMmP6ypEvX1dD+3OWj4xT5WHTpHNGyu27HkTdn
	AXssX7Kc6h2TnF7AiH0Yz4vKRE3gK4XoPxuKdiouZgHTBTGVDokI/wOkztbpDQAbWPjGGpJNLynZE
	9RWcskgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlFS-0000000HIFl-088n;
	Sat, 21 Nov 2026 13:35:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUlFP-0000000HIF5-2XcE;
	Sat, 21 Nov 2026 13:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=fffPhen65RXvgrHvozLgMLsmu+SDxyuRcwXFiGMhJew=; b=nEylbCvuQdGWOM/Z5RINWTpd0Q
	ZKohSuNpjwv+qUOH+VwAOX6t1I6AhjQcjdO0UNXQmY4IYWW31T+vGl11olyTl22SSSukG4H/CUqjM
	vh5OthKF5we6rnV+eL1JR9NZSnXcfDXBOHp528Gswn27fALsq2tzDLzZgCT+nscdib5axuNJw85l4
	asYmd0Ze7D5MBfuRwSeBqQAGjsYNyEw7L4l+n5mejjv5Kb+mZvMDyw8rMRMw+Joq0Rm92HXlVddDx
	H8q20B6fQgUdj/NVFy7PMz0kUI0XDJQF3a0j9Etgqapx2yPN1kUzG+Vkqj2Hw4wEeg75Z9u0Zq7AG
	mFvw2B1Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 ZhuXiangyu <1194781887@qq.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ZhuXiangyu <1194781887@qq.com>
Subject: Re: [PATCH 2/2] dt-bindings: pwm: rockchip: add RK3506 and RK3576 PWM
Date: Sat, 21 Nov 2026 14:35:17 +0100
Message-ID: <dcRZnWeuS9WMWkKE52x__A@sntech.de>
In-Reply-To: <tencent_85AFCE164FAAD1CCAB95DC7CD804CA9BB309@qq.com>
References: <20261121065936.1125919-1-1194781887@qq.com>
 <tencent_85AFCE164FAAD1CCAB95DC7CD804CA9BB309@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_053519_646865_F482A969 
X-CRM114-Status: UNSURE (   8.56  )
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

Am Samstag, 21. November 2026, 07:59:36 Mitteleurop=C3=A4ische Normalzeit s=
chrieb ZhuXiangyu:
> Document the PWM v4 controllers found on RK3506 and RK3576. They use
> the pwm/pclk clocks and may additionally provide the osc and rc
> clocks used by the extended features.
>=20
> Signed-off-by: ZhuXiangyu <1194781887@qq.com>


please check mailing lists, before submitting duplicate work.
There is already a better (yet unfinished implementation pending,
that also incorporates the counter input).

Especially as this is a new IP block - including a different hardware
structure, this should most likely not live inside the previous binding.

All the process issues, Krzysztof pointed out in another thread still
apply too.


Heiko




