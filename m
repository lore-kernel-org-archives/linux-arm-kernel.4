Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3wLN1eA6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=e/rFmgN3Z5KxfWW+Rzz0lvQ+GFMHmAzHgZaIrh0Ft3U=; b=3wLN1eA65WQUXMrOI8Zust2NmP
	XlQAIhd4NhAiPRJta+wjmNjrp6tBy8ys5f94eygBr1nRM8IDXGl57Byqs2MxyNK+IUqf7tEUwXjAk
	Pwlks4kweoF2DttNVShlX1CXVvf9aN37iFUsNUgHFGVMCTkW5xD+mswgP5Gyk6vieOQ5tc/Ga3Ft0
	befCtdagYx0SjMyRSu89+quN1IJCdH1FvpPjQ5rqHnGDD03v8faVNxqt2Ry4P2sLYfQt8M9jVfxTt
	2xdX9zGXXGnqpmgFW2hgCafXzUSGRD7n1dZltOuspdE3pNleqgy7Cp4Vf6S6DFnpSMG6XPk/sWuc1
	mnS8KXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbTU-0000000EMOJ-4BXw;
	Sat, 07 Nov 2026 08:08:33 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbTM-0000000EMLJ-2r3X;
	Sat, 07 Nov 2026 08:08:29 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM7w265jZz8RVJk;
	Sat, 07 Nov 2026 16:08:18 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6A788DXS022834;
	Sat, 7 Nov 2026 16:08:13 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:08:15 +0800 (CST)
X-Zmail-TransId: 2afb6aeedc6f415-84fc1
X-Mailer: Zmail v1.0
Message-ID: <20261107160815352Q4eO0zXOX0KF5AwEbOJ6f@zte.com.cn>
Date: Sat, 7 Nov 2026 16:08:15 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
Cc: <lgirdwood@gmail.com>, <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <wens@kernel.org>,
        <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <linux-sunxi@lists.linux.dev>, <kuninori.morimoto.gx@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>, <srini@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDAvNV0gQVNvQzogZml4IGVycm9yLXBhdGggbGVha3MgYW5kIGEgTlVMTCBkZXJlZmVyZW5jZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 6A788DXS022834
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:08:18 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC72.001/4jM7w265jZz8RVJk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_000824_880807_3ED5DBE1 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Five error-path defects in ASoC drivers, found while reviewing against
linux-next next-20261030.  Four of them leak a reference or a clock, or
drop one twice, on a path that is easy to miss; the fifth dereferences
a NULL remote port while parsing an audio graph.  The patches are
independent and can be reviewed, applied and backported separately.

  1/5 ASoC: rsnd: fix NULL dereference when remote port has no endpoint
  2/5 ASoC: wcd9335: fix SLIM interface device double-put on error paths
  3/5 ASoC: rockchip: rk3399_gru_sound: fix codec node reference leak
  4/5 ASoC: sun8i-codec: fix bus clock leak in runtime resume error path
  5/5 ASoC: rsnd: fix SSIU node reference leak in rsnd_dma_of_path

1/5 returns early when a graph endpoint has no remote port; 2/5 removes
the four manual put_device() calls that duplicate the devm action; 3/5
puts the codec node on the two skip paths of the Rockchip DAI-link
parse; 4/5 disables the bus clock when the regmap sync fails; 5/5 puts
the SSIU node after the DMA path lookup.

Patches 1/5 and 5/5 are R-Car (Kuninori Morimoto), 2/5 is the WCD9335
codec (Srinivas Kandagatla), 3/5 is Rockchip (Heiko Stuebner) and 4/5
is sunxi (Chen-Yu Tsai, Jernej Skrabec, Samuel Holland).  All go
through the ASoC tree.

3/5 was tested on 7.3.0-next-20261030 in a QEMU/TCG arm64 guest with a
synthetic DT; the test section in that patch describes the setup and
the observed reference counts.

Shao Mingyin (5):
  ASoC: rsnd: fix NULL dereference when remote port has no endpoint
  ASoC: wcd9335: fix SLIM interface device double-put on error paths
  ASoC: rockchip: rk3399_gru_sound: fix codec node reference leak
  ASoC: sun8i-codec: fix bus clock leak in runtime resume error path
  ASoC: rsnd: fix SSIU node reference leak in rsnd_dma_of_path

 sound/soc/codecs/wcd9335.c            | 4 ----
 sound/soc/renesas/rcar/core.c         | 2 ++
 sound/soc/renesas/rcar/dma.c          | 5 ++++-
 sound/soc/rockchip/rk3399_gru_sound.c | 8 ++++++--
 sound/soc/sunxi/sun8i-codec.c         | 1 +
 5 files changed, 13 insertions(+), 7 deletions(-)

---
base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c

