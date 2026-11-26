Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6F6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 04:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xnxal3tP;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=gZDYSHT+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7Gltq0J+neesPC1o9IUwhCGnJYXEolSS4bAtXjeOr4Y=; b=xnxal3tPbozHrR
	bpzUEbvtQmNIbNQgATFkTL/5BfwYwRbRoOLLP9vx33HDnhwoRAVCUloHcwn04klLjI86SKG54MtlW
	RwFfpKWwHWNRLVwDlxazM5E1M779fQOuIGWKkcSdza0Lcymb1hF9rPV7QPV9Sih3ledCdJQmD9UM6
	cJbRGPChMOBLrupsa0ngSVXcmu4h4MoRX7hPA0O4w5nWlUaIuDdvByXzZXAA0/GjwupCfZb08bt2M
	ZfJqHxDEn2sGfvZqTUHG2iD4hy/OUcw1+HL1UGI3gCbhEqqgg1+qihsee6/Lnr7o00YQWkeGa2O8S
	CHbOwyYMrUNfFuU1LdaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQgu-0000000C2nq-1KxK;
	Thu, 26 Nov 2026 04:02:36 +0000
Received: from mail-10698.protonmail.ch ([79.135.106.98])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQgr-0000000C2nR-1Taf;
	Thu, 26 Nov 2026 04:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795665750; x=1795924950;
	bh=7Gltq0J+neesPC1o9IUwhCGnJYXEolSS4bAtXjeOr4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gZDYSHT+0VZl6WXEwngoV9+Abm7kbJQpwF4C/I2C/q54J9ddbIQN7VO9Gd7BJMlJe
	 CvhpI428Qkbcr9l2dM9J0yYz4sac+CX7WugihFloqGJrs9Jde4SctB1WOUt5KKQn9V
	 P+0Qe532R/sRMevdLeqSedvZkJUpt2r2ao58nzrcG37ZZVUWdZVaDkZ9HXTSffZmfj
	 cCVaapFRLpRLC5MYd78l2q91tJE5K0aUrMCPf+k1gd5yrl2YiyncBILqqjO9+Z/+vx
	 N8oA4XID6ckAp/sVzXDzyJlBsIg69Yqjv9AzpmJaCUSq6r2EQkDC/7dkJtCvv/s5Hy
	 T/jpfysnHz1qQ==
Date: Thu, 26 Nov 2026 04:02:17 +0000
To: Alexey Charkov <alchark@flipper.net>
From: Ryan Leung <untilscour@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] net: of_net: Derive MAC addresses from a unique device ID
Message-ID: <WorU-BRgoHyPr-8qvenYMy4zDTR4joFxkzmN-qmrABKdMgS7LJ3Nx1rAUQFAoulhS7YjNRIM_bBnK3KdCFGhEF0PgQ1FLq0ieYeGRnkQX_Q=@protonmail.com>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-3-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net> <20261125-rk3576-otp-cpuid-mac-v5-3-b3125c9a5fc8@flipper.net>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: f5a7475f279d2efed66dcb8a5e8b361db3facbcf
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_200233_577915_E7DFBDE7 
X-CRM114-Status: UNSURE (   4.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexey,

Tested-by: Ryan Leung <untilscour@protonmail.com> # RK3528 NanoPi R28S

I tested on FriendlyELEC NanoPi R28S (RK3528) with ethernet200 =3D &gmac1 a=
lias
and the MAC address was exactly as expected with XOR 200 the last octet.

Thanks and looking forward to using this.

Best regards,
Ryan

