Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E5A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kIGMGecj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hPcUXXPJ9lqr7gnnI/WO2aVWDUyWi+0TICJP+pC4I58=; b=kIGMGecjwSCd7i6qPsdAXxmdVT
	otOzdoLD43Pf5x+CXKogJdYG6bMoD/T/xkOvne4utsE8rMujr33ITVp1SHPDFtnHhAk5oKafpbNPv
	ze5hnrjGVUcT+vp124ZexK9lRNW2/mqTLiCd3D/osxvDNaz/N7RNVRT1aaozBB2ipdQXWEjb6QZjb
	UOjr6yTR09HU0gNS9AlpL8eUIi69yPjJ31v5RCyfGzBkr5nhX0r3KNmC7fITxAzByz0VtkxiIu+dJ
	zOYXPszUBuYx/+0CdJYiNUHvW3OFwWgFb5VEeScUZXymotwUXPPhjFe4GsyKhJkl1uHWT9GcdVlbG
	tsVAmGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3iF-0000000089Y-0nU4;
	Fri, 27 Nov 2026 21:42:35 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX3iD-0000000088y-08eT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 21:42:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xX3i1-0000000008G-2ORN;
	Fri, 27 Nov 2026 21:42:21 +0000
Date: Fri, 27 Nov 2026 21:42:18 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, bui duc phuc <phucduc.bui@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org
Cc: stable@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/1] clk/ASoC: sunxi: fix H616 audio PLL and codec clock rates
Message-ID: <cover.1795815223.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_134233_091428_4B49B654 
X-CRM114-Status: GOOD (  15.92  )
X-Spam-Score: -1.9 (-)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H616 CCU reports the audio PLL at half its real frequency since its
sigma-delta table was added, and the H616 codec support was tuned on
top of that, so the two errors cancel for the analogue codec. Other
users of the audio PLL run at the wrong rate: sun4i-spdif plays at
twice the requested rate once the codec has moved the PLL to its
sigma-delta setting, and an I2S driver for the Audio Hub that asks for
24.576 MHz gets 49.152 MHz.

The fix is a single patch spanning clk and ASoC. Correcting the CCU
alone halves the codec rate, and doubling the codec request alone makes
the codec run at twice its rate on the current CCU, so a two-patch
series would leave one commit with broken audio for bisection and for
stable backports, which need both halves together. I would suggest the
patch goes through the sunxi clk tree with an ack from Mark for the
sun4i-codec hunk; taking it through ASoC with an ack for the CCU hunk
works just as well.

Tool use: the root cause analysis, the patch and the text of both mails
were produced with an AI coding assistant (Claude Code) during a longer
session, which was asked to bring up HDMI audio on an H618 TV box, then
to find out why the analogue codec played at half speed after the CCU
correction, and to prepare this fix. It measured the PLL, the module
clock and the DAC drain rate on the hardware with devmem and the
AC_DAC_CNT counter, and checked them against the PLL formula of the
H616 manual and against the vendor-derived H616 codec driver carried by
Armbian, which requests twice the table rate. The measurements in the
notes of the patch come from those runs; pitch and channel order were
checked by ear.

Daniel Golle (1):
  clk: sunxi-ng: h616: fix audio PLL and codec clock rates

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 4 ++--
 sound/soc/sunxi/sun4i-codec.c          | 8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1

