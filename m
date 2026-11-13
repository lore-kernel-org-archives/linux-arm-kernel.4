Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327AC60A3809
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qsTt1RxL;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y27pSlBF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZIaozk2aBHaH1oFJEjjG6pq54xGfHGZXMiLG49FuxWM=; b=qsTt1RxLzdKXaNbh+tJoUn5TAZ
	zBktnIOkO/cS+RmGaHPHnk9XG69j+lHo/lydgGfrkW9n/xZWiEg19HWygvf2ryBAgWQEBX2NYHqO3
	x9b5ooEGo1/0s6fIv7GNS8g6WSPl99aILkpdU04eUt8hs1gLLla+e3/a9cahT/14Ft360QW1mjp0+
	SEB5es3509eW2O9nNuJdnqSauf5FOv6asG1taE4i4wECuGfv15TLhB/qruZN2YanzN0N2ZcZYyF8J
	FNQCFwfdEjhL084Bj1x08KLb3ZTgEUiwVgSwvgC12ukRGamsGRyMYnVHwoqnRaP5XJ7DjN1Ff7XHW
	MUTv1AMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuK3-0000000DadQ-1nEN;
	Fri, 13 Nov 2026 16:40:19 +0000
Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuJM-0000000DZpw-23qJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:39:38 +0000
Received: from L30177.local (unknown [158.255.110.170])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id ECC3913F8AE;
	Fri, 13 Nov 2026 17:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794587970;
	bh=Nq5VMxuAxZkNVKKpbGt5VbkTDNOsTH++OiONsbi9n9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y27pSlBF6JC60hVZAj8IPVqa48C/9DgkKqOkQDESe2muCIMq1QiH0t2hpY74zGNor
	 OtZzOAz4r2ULrN4s+CBzg/XtDOlc9O89iXA+G0s6SUgY7mlQnzDErXQV+ELA5RNaVW
	 PK2PDB4K43IBDzZj9SO+65cyDlC491QsHI1NYeRwF/XtNGdaiyb8ChPIcKkIUVC2In
	 dvO1b1pdQocvaDngZ6qUQv0TZJtqExY4YIAmBF+5gHhlvome38PHRk5sKV9ag8cLbe
	 xkXCmw2A00qeLS/JkZrIUoxtz0CyY8rdsqNrklwxDAO/6T8FiPaISATPfhBBiQvTEd
	 tKScOcofIrrdA==
Date: Fri, 13 Nov 2026 17:39:05 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Christophe Leroy <chleroy@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
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
	imx@lists.linux.dev
Subject: Re: [PATCH v3 3/5] soc: fsl: guts: add the RCW override of any RCWSR
Message-ID: <avc9KbxQ4dxlibGQ@L30177.local>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-3-5a0063f1da9e@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-3-5a0063f1da9e@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083936_688027_083A331D 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi Christophe, or Vladimir,

Le 08/11/26 11:06, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
> other fields of the RCW:
>  - fsl_guts_rcw_read() reads a status register
>  - fsl_guts_rcw_override() changes fields of one under rcwcr_lock and
>    waits for the status register to follow
>  - fsl_guts_rcw_override_supported() tells whether the DCSR view of DCFG,
>    which holds the override registers, is mapped

May I ask for your advise on this topic ?

I am looking for the review of this serie, then I'll adapt it
for u-boot along with the integration of Linux.

thank you,
  Vincent

