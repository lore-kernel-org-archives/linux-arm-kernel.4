Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A9606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AoBiXwz6;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=HEm0RLgX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sh2nmNQTVOWP3szEFLOBn84NAH4nPLsfx0J4lAR1HLA=; b=AoBiXwz61GesEZTY+Ko1FQGiFH
	pfWNnaX2PBFgAmS6I0xOetu4gWTZSetlP7WQkd0ir7xFdgHHhurpTdO6jl+9Vn8MkUyL2k9DzrGZh
	wVHX/qf+ORviQR9bypIPQThoe6AukZPBCGga3gcJKs+g9OmWZWHJnVqoDxt8n3/xbDqVKvN1qaxyX
	L7qatYbd20/K6QVGh8kMzDkxZ19ulcviTYXn8mYbnUjI0x/z+9xtsh3Zc03tQTXUNXzQgkHUzX5UW
	cjGkbSU1oteTs4NTWJJZ+EngnKXnajFRJ2+ooDwAlt8UJe+2OBs4nunTR1UpwnzHlZVhlcUqprDRJ
	Ce7HoxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1oE-00000003e3i-1pgm;
	Mon, 16 Nov 2026 18:52:06 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1oB-00000003e3K-0Eet
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:52:04 +0000
Received: from l3017729.home (unknown [IPv6:2a01:e0a:ac2:22b0:3d85:8d5d:9362:361])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0D9C9200433;
	Mon, 16 Nov 2026 19:51:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794855120;
	bh=Cs4uDxAEdjU0yi/6Yx0YrRf3kzhxHuE7ljq+oh0YydI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEm0RLgXzcQkeMQMm5ajqLQ9UEKOvOUoWOl5Pc5Q0lkeqQge4PXgMTfi5oQs3R821
	 fs3+vi2x7Od996DyW9jGedzsoPGf57zVtZfhANZPXCrhJtPtql+njrXQTm33d7GDpe
	 fwbdKUpT9sbWzvDCSZQmID7MYyXvgK8DmDc2P1NFUDtmOmjBHBYHAxTIsy9Hhtdfbd
	 fHjljJW8FpE0OAInxyP93ShSWSTQ4Ot18Fp8YetBuzfM1+FPYTt5cd53i0GEugDumd
	 5XEGVgr+4Ki/mAd45/57SNNYyMsQVCyrQHjuLTfWNabg5RGEGpYCVNTCpw7VDpc0Uw
	 NymSo4NXmIbNw==
Date: Mon, 16 Nov 2026 19:51:29 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v6 4/5] pinctrl: freescale: add the Layerscape RCW
 pad-mux driver
Message-ID: <avtQsSmnMtzj4JZS@l3017729.home>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-4-fbdce4565a5c@free.fr>
 <avs62BhLjlpouTwQ@lxl00025.wbi.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avs62BhLjlpouTwQ@lxl00025.wbi.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_105203_235745_73AB3062 
X-CRM114-Status: UNSURE (   8.45  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

regarding Vladimir's question:

> (which they're not - iic2 is a group consisting of SCL and SDA, whose
> function cannot be selected independently, which is why you've grouped
> them together).
> 
> I suppose this is OK? Not really a pinctrl expert here (and it predates
> your work - pinctrl-simple worked the same way).

either way is ok for me too, I do not properly understand the guidelines
that would fit best the kernel. What would you prefer ?
  - muxes per pad ?
  - 1 pin per field ?

thank you,
  Vincent

