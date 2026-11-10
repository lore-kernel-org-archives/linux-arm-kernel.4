Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6789606B15B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VwoRDInV;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=IIflIg2E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n0D0+tx7FbyqEL0k4/TajM7uZjJ5rllM2A/2eggVTKc=; b=VwoRDInV/6f+ts
	5xMN/Yo+R5NerfDYdkNgfFHo3TLYDD85B2SQRGbnmuOusCbov7WanLTMp8poMsDHvV00AfpEMmyWc
	4Pj+MJyCEMXAKxBGCeVwFJ22p8VQ5hVsr/6Y0+JwmEroouxVfswwoxplJoOGiZRizmZONg3y1brTd
	A78Upzxf3XjLbxNW563GFB7WthAWeX3jQ4mGUdDYtrQ98SZs8Wnf/QlZkhMjgmmoJAsYS6ng+91nI
	ygLXnYizBvauCpDjKHpUb3BEbPE3FYW28q9y1Gr7/ENxNXnZJcAtnmuPLOwYRbfDvnVfKuDIOxN0N
	pHHipRtQwfTBRSarezog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiWu-00000003MRq-1O1j;
	Tue, 10 Nov 2026 09:52:40 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiWs-00000003MQk-066J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794304357;
	bh=OmSerbMpq8gn3IS3GN6ckwDmRq4C2MPhAgkxcbG8rmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=IIflIg2EfwUPjp+E9jfJgmJyWG5mRTMPmDy/lrl2OeraBoKAvAo4jC360znMbuDNy
	 v+qsloPdkEaIdJBwwfLnuNRQLvvO2AMF+D9yMzPhzQ6zvjArQqmtmgdDk4HDhRucL7
	 0a4tDEdI1gQd31MAAl8FEczSjOzSRFgHl1L1W25Yk6yEJ9usOBC3DckCT/1KFesMvB
	 wU5c2x+3uRiwrvLZwaxtood52WGXUjvKrZAsau/MittT5xXsiEhtMuv9a2sBFGQwwm
	 oSnNRoxqgtLyQ7IM2jeX2SftUooSlFygvoVY1hqXrMi15eFnfDmv20Gx4oriJTCB84
	 zgTht6z0VKkXw==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 40D4F81428; Tue, 10 Nov 2026 09:52:37 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
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
Date: Tue, 10 Nov 2026 06:52:11 -0300
Message-ID: <20261110095211.16184-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <817d2bd1-64fa-4a6f-bec6-5a4dd4d3a76f@redhat.com>
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com> <179379704484.488856.2140619507341432623@kernel.org> <20261107100140.8279-1-magnusleatti@kernelriot.com> <817d2bd1-64fa-4a6f-bec6-5a4dd4d3a76f@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015238_118836_33ED131D 
X-CRM114-Status: UNSURE (   8.54  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 09:30, Paolo Abeni wrote:
> AFAICS 'statistics' here means accounting of some corner cases errors. I
> guess this could be a preferable route.

Hi Paolo,

Went and measured it, since my numbers from this morning only had RBU
masked. YT6801@7.3.3, this time with RBU and RPS both out of
the dwmac4 abnormal mask.

Floods first (4x 64B UDP, 3 runs): 0 MAC irqs and ~3.2M of 9.6M frames
delivered, in line with v2 and with RBU-only. Still 0 with 8x UDP +
TCP TX on top.

Then RPS: each XDP attach/detach restarts RX and raises it once.
MAC irqs per attach/detach, 3 cycles, idle link:

  both masked:   0
  v2:            2
  RBU-only:      1.5k - 25k
  stock:         0.9k - 32k

The fun part: I expected RPS to take the board down the way RBU does,
and it didn't. On stock and RBU-only it's a burst that goes quiet by
itself, and the box stays reachable the whole time. My guess is the RX
handler acks it on the next frame. I did not try an XDP attach in the
middle of a flood...

So both masked is the only one that sits at exactly 0 everywhere I
looked. The price is rx_buf_unav_irq and rx_process_stopped_irq, which
stay at 0.

Scope: I masked them for everyone, like d3265c19b35d did for xgmac2.
Masking only under multi-MSI would give the same result here and would
keep the counters on single-irq platforms.

Usual caveats: one board, and it's a 5.2 core so only the 4.10 mask
ran.

Magnus

