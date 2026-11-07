Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32884606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a++RQ5Dz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eWYJGGRB;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=YA3oaAqq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TjMdFk8RF2kaRdnGIftRqRXHaK9TIJqelTHCSWvnKbg=; b=a++RQ5DzSigGVW
	v1yP4L2vKRsJSiUe7cVjtbo2xEdTSCXvHq5rmBsYsRI4ItDw99G8yj5LJ1GjNZaa0llyy9Y/xK0hs
	rZZQkEAmg5tFgSisQIFN/Jr4SEeP7ardahAQgeC+ZBm6ivncvK0+ckF7jAC/o10vMMSXOT0xbtBzt
	eg6Z4c65jqLcBZ+djvjy8EDmWBA5XwdATQ1WVDL3oaeCyPBfywchptbw+Mn5pxgwZ0JJAHhAJGgLL
	ORUxFOQTqMTZP73RFvQLiSRoRw+TikQGSPZaz0UsN/wb2qLE4z7DHUh8Hw1u8NjGku5O3dLyK/VRH
	2e8HZnP11L9qxgbYVRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdFj-0000000ES4I-2azO;
	Sat, 07 Nov 2026 10:02:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdFj-0000000ES49-1NgJ
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TjMdFk8RF2kaRdnGIftRqRXHaK9TIJqelTHCSWvnKbg=; b=eWYJGGRB6YJSDWx5tNBc9D7TeS
	0J2Wq+86pDeCGTlk2aQZ1bX3A20WezVYgM+VffNYwXpSh2X6J/r8SEGE6qLR1tAB2w5NzOFfnEy0X
	EbhkdvIpLcp1KPwugdKir/CU2bKSBSsP7vmQ8fJzwS+wqQHUstx1IqYDEX9Yl0MlLXLbGNYouuCSH
	54xbosV4QGQVOQXrKo6GL3C5bxzr+VTGCcse0m9tZSMRJczdSf2nq2hhMWEsqtFenFPCl5wnkpgKs
	biNcmMVNSEAEI2tKOEDihlg2FgS6L3zX2RxjQZe6tH5F/x8tTIVfdZ75XQNeUPmmzeOOO14blMQSA
	0m2HAisw==;
Received: from mail.kernelriot.com ([74.208.142.49])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdFg-0000000579N-24Oy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794045741;
	bh=+/ah8vkaUP87DIJHEblp3tls1hoAvi5cG63uzTk2jyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=YA3oaAqqZeN6mMwRbLlWFxUHJTOS/YV5Tf0YMXVoJGIeGL1kBg3ADZFfe5MNss8vE
	 MIEoobu/aDKNIrDejwSZFcURBEatbOt+BAIuzjkZ12NRCYmeGkrHMnGDIOSWsNpEGL
	 MLf7cp1GrS1iC0Gx4bH5sxaEq5fH4DhVKFjeqsM2x7fbVWaYgtZRG2Ft0H2JG9ORJ6
	 zI2LEmpGjLw+Yx/XISWN6bbUKkyzu/ViR20cEfpKUwmyJpEkeI11ITx49iO45mk6sZ
	 XwvkqaG4hxP0HO+2XeRh9sURl+EKV0txlu5rE6XO/0QqJ00xhuY0DmB5bfzSISoDvF
	 lMG6KdXpegkHw==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 3E6128147A; Sat,  7 Nov 2026 10:02:21 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel interrupts
Date: Sat,  7 Nov 2026 07:01:40 -0300
Message-ID: <20261107100140.8279-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179379704484.488856.2140619507341432623@kernel.org>
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com> <179379704484.488856.2140619507341432623@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_100224_580398_F2664760 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Should the Fixes: tag point at 1b9707e6f1a9 instead, or also include it?
> As written, stable may backport this to 5.13+ trees that cannot hit these
> storms.

A data point for the RBU case from the YT6801, same 64-byte UDP RX
flood, all on the same 7.0.13 kernel:

  stmmac from 7.0.13 (has 6ccf12ae111e, not 1b9707e6f1a9):
    no storm; the MAC interrupt never fires (4 streams for 10 s,
    and 8 streams plus TX for 30 s)
  stmmac from 7.2.11, built for 7.0.13:
    storm, the machine hangs
  the same, with only 1b9707e6f1a9 reverted:
    no storm

So on this hardware the RBU storm needs 1b9707e6f1a9. I did not test
the RPS case.

> Since RBU and RPS were enabled only for statistics, was masking them in
> multi-MSI mode considered as an alternative?

For reference, d3265c19b35d ("net: stmmac: xgmac2: disable RBUE in
default RX interrupt mask") took that route for xgmac2.

Magnus

