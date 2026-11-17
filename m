Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9C606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hT39lSRD;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=agZnjsJQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s6kZBCjfiQkhSEJV2Z1jyMjdsrciCZ6ttNX5JGYKx+4=; b=hT39lSRDkqDxFLnS04WD6nBgO8
	Y4Cj/YTR1k0cb4J/6yLE3du/IX5W/Ot3xTGYAM4VQKUlbnCDxuQA08yI15+bqagz9AXloGRbGHHSv
	9Y8f5oVctpE0AvOgVKI8T1tsmxNDHzyz8E8L5SaUbJsuXGFAF89k2zJRhEPhXsoOXd0GB4RZNiCIg
	mzlH6hvP93puMtloK5ZdL96uTWhobVUgWQcYuDy2PnZ2w3UWSiDFkv2Py4nPtaP+ZUq32zsNmJvHE
	Raxa31NZ13CBSpCmJHxg+OAr6nZoCXKEpJOa6NHP1QsB2336g8em89Kkrzq3S2m0P9EBHsLUbXsBt
	/Hu8cxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKdC-00000006EqK-13Os;
	Tue, 17 Nov 2026 14:57:58 +0000
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKd5-00000006Eld-1HKz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:57:53 +0000
Received: from L23803.iliad.fr (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3E5A5780510;
	Tue, 17 Nov 2026 15:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794927467;
	bh=Kxv9zLHW2Eb4osegyxsTaFPBbgAIfUoYui4bAAK2XVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agZnjsJQLzDfu3kiyhn9g9Sy0L9RXmaKwOcrWY/ydd2lvFoEG5S9tDXomzsdJ1VXJ
	 6Efhw+DDCL3WoiHk12XxonGtBUnHIhNCazNoTIrzAfuRtLZMQQFyFcu2UHxCjLQADB
	 hScFR3JbvNWUVxSXxsCfq5BXGNYwnbuxoKWlRjpizBFRUIXTETgyq8CAW+oQJUDFJy
	 /SsNK4xGmX5TYhdANwCFD9lfsmUCExQhiLbR3ofnBYnQDvbmme3MajAzHttOMQiJ/1
	 jY160eWve0YCnHZLGap/GtTdoe2QJs23ebh3cXWuKGWKBwbQ7Bl+Hhl8kUsHfU0Tru
	 O8KB8MTr4ysWA==
Date: Tue, 17 Nov 2026 15:57:23 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avxrU7frfDp6HeF0@L23803.iliad.fr>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-4-3aad0860b984@free.fr>
 <CAD++jL=Np+_+wTkuLCiqjNY5EBqn5qq8zKTJB6F-=1G0R+7=Ww@mail.gmail.com>
 <au9YgytCc4TKfETI@l3017727.home>
 <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLnWcVDbh-vf20w4nfvOSZik619XqoEjXTBZ29sJkX-bCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_065751_767407_D8389FCD 
X-CRM114-Status: GOOD (  10.29  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

> > Could an ack of Christophe Leroy be enough on patch 3 to 1...4 could land into the pinctrl tree ?
> > Then, patch 5 could be managed apart.
> 
> OK let's try to do it like that.

ok, recorded into the serie 7, but then it should be patch 5 and 6
  https://lore.kernel.org/all/20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-6-5d7201970629@free.fr/

best regards,
  Vincent

