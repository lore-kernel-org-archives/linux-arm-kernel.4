Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EFB606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SaPTI7F8;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ak4ncVZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8ZCc0kYbccT1j2j1nFYSj16fkgBLnDHoEzJYA6Hd1Dg=; b=SaPTI7F8EeNqLnfTTQfCTZizqa
	sUSOLGulPma0kYanKD3u2Xfmsz1uPU6iHr2HHeOy70onPK++o6w9x9QaMGGQo2iW3BitjQla1G+IJ
	TFQHEhWcxs5nGCoqQF3jJ0WEWfGhU+2iYdCm7f/114k6wPV6tKLs3jcplFKkHUcGQEJzwn96eHqdY
	YFJJOVPDj1vvyHoA3mE+c87jWdHVOkJvVhlLAldmLkQsO0WhPIrsCUVEdrEo15vUx5m7S25/5EQHv
	WmnyVrSSd6bfg0xpCVy4+Zq7XWflFChOQk0h4KCAyHlDZTu/qgUzAu82FagzCPn7qY0PLJKUA7hWO
	6Xsk7drQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYgD-0000000HTYc-3Mfi;
	Sun, 15 Nov 2026 11:45:53 +0000
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYgA-0000000HTYE-2TA4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:45:52 +0000
Received: from L30177.local (unknown [78.242.88.98])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4BB8AB0051B;
	Sun, 15 Nov 2026 12:45:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794743149;
	bh=8W7U3lk1daoKKwP7PjlQ54EL6MrGZ5IE9j29Mm2B3/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ak4ncVZcgW2qLwK9X4/zElIA1HMdni3U+8SbMT5UJn4dFCQlROXyKI8G9BQvCqj/C
	 85l6Z4oISGhzno9CeY6PTrTRE16V7rEvBAopAKZHId28/ngsYuwohsm5rhE03spsP4
	 nID1pNcGQt1JAF+7EOp6kDRnQEx8qPLR5JJB2oheBDRAzcy1WKl8vf3sph6+E6QF72
	 Oyjb3pyxSWpoFKCVmPAMDn5Eok8cg5T+kAEmQdHs7+LTQNZ+5guh1S2uQc3OBOUn5Q
	 6lMfFyadDcci1ncA09egoRaOrl0cflBClFU7y+lWlhikwoJ5lZuqMlNVeo3IrjQP72
	 SlnDToNGaCUuA==
Date: Sun, 15 Nov 2026 12:45:23 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
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
Subject: Re: [PATCH v5 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avmbUyfeTd_VMSYH@L30177.local>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-4-d246166ea469@free.fr>
 <avmX2HwOji6MBuhj@skbuf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avmX2HwOji6MBuhj@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_034551_267596_375823EB 
X-CRM114-Status: UNSURE (   8.27  )
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

Hi Vladimir,

> Did you see my feedback on this patch for v4? Comments?
> https://lore.kernel.org/lkml/avjaK3cOj3iQ6G6w@skbuf/

No !, for some reasons, I did miss it..., thanks.

I can prepare a new serie to make it a bit more generic,
but I'd need NXP/your reviews for those CPUs, since I
cannot test.

It seems to be quite easy to update, I'll just
run some basic checks.

best regards,
  Vincent

