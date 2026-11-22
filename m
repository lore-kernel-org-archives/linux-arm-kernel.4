Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814E606A681
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DzNNQ4hl;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=h+spo1R3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4mSY2yw665WGUw4XAsg4HFioud5kltYn3bVe4FnNDPE=; b=DzNNQ4hlWwA8qWTLNuv9B5c/1V
	UrWhKS/TkiowfRoAlDHIQ5govYBhY3FTH9kOxBykHNcnxN1/WghGCBJ4ySNJgKqJ8oPIXFSuQWcMt
	JfR5DthA3PEzB14bWwFmT2h697w+/UpnHQrPvRmTxDZT/p1KL1K0B6EqtAwTuMwQUAufVL+qGZDhd
	rlBQE4dPW4//emon94IvNtyy1zEJh5b07soXLeA9eu7I8tRhhsuHeSNj5RcKEDjj74Kn9CFvjL8sY
	JcVlUP124V51Q+Xly+BIIzi53OiEmzI5tTe5LCBoYYWTRAoHPRgMSDT200B6UGJWG64sUN+hxV2mE
	02eUqQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVANj-00000001LdE-2ZQ4;
	Sun, 22 Nov 2026 16:25:35 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVANM-00000001LS6-3oY6;
	Sun, 22 Nov 2026 16:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795364702; bh=4mSY2yw665WGUw4XAsg4HFioud5kltYn3bVe4FnNDPE=;
	h=From:To:Cc:Subject:Date;
	b=h+spo1R36h5PIYzqJ+ef+X/YXfvPODE2mxizEXMzUpPSuxGfA8wR3lEk6rg7ddfd5
	 ygtQsLE76g7D+EoQvbbaVoBdKlwq/NCND5vgXeeWGTfM9lf5a6VtDUN3ovw14WsVsO
	 XSar3a4dXSqp9WC/RCkThzqOFGe2HYlaGWS8Kx1I=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 640042D7; Mon, 23 Nov 2026 00:25:00 +0800
X-QQ-mid: xmsmtpt1795364700txd9pgylu
Message-ID: <tencent_DFDA05189A0FAFA816FFAB91CC2F95247C09@qq.com>
X-QQ-XMAILINFO: NT2OMgh8In2+6/V0YtNlBRwCr45RUbQO+7+y3qbnTb3Ch4Baud2fc1bKvA9DFW
	 SFfqa/39n9Te8c/l+W8qoaNj0zWQbv0Wefr7XhXoVVeu7v/XzQRtH8/XIkLSRe9CUpqxeM1O5CME
	 IPuBSYl3Du2SSfZN/+vygNowy68Kw7cVT32Gx282bMgJGvo+vBICN8qQSfN30/hJ5MuM6lNpcef9
	 KrvdiGt6FpzEqOO5amD+c+qFzZydGIO146M1hMKUXpPDoxICI+xGGylHsNNCHYrCncx3Bd6XjA0o
	 ygJNXQWCfJBcHYc5FUeSI37RNIdrhZLbOSgoRe68LySy540FX4zuQds6AVugYRv26HJyqroQEhji
	 bI9yfeKSEOsKQGDRKQu8UA9L7Fj+ZDy5zsEwWbejKf8+VqU3jRA042N8EtHEx/PuKey+gbX5I9AE
	 L6Fo7Y2U2yhz5NCDUhOMV7ni2Q1MQhocnWLS/AiV1zijuYcmEzxh3Z3Pp07R53/zj9XJZFy+2xz4
	 Nb7VaWazo4TJOidzWbQnVbHuTXgwpIS1KpszW+HQv4S2XlD+tA3JNCPbaZrhF3eUiBMZjMKjAzXS
	 Sj+1sSrhhQ62Jrh6958PUHJxWkFNFfcOXoLxGShGAuSlWIC2916SOF9N5kbpbDkFgQjJl7xcHGl+
	 nUeydKxpvqqcbNb4ujHwcsalKl76wm7fZw/1XBAANIXoXn2d9RaFHUyEJt06BPushMhJSkEBOqYZ
	 Op8mm+u6JZMQxzdoMPOwZOBI5PaJSIAW/jHiAThuzl8Yiq5jQakRP/zSsa3IfYOdCD5nEABPH9WU
	 MjSaHOgYZhI6L43MNsVWPP3H9eGMsVXduwZF7HwKs9AtNDiMEGlTgk1j5VTBSG48IWaV9l1liVD0
	 3GgKDTu8AVpWX4tqm8qq6sYEft01CX3G55kJjXjmi2TzcvzTyX7fVQxYTrELbpXbvU/XpcN1v1xo
	 80frI0wXaoJdcjXLTIUnmK0RuDJHACSzqNedncv6b1JqMHsiYKRZ9ZSUipiNyI2g3QUMHTyp4jh9
	 CEXHxKo6unYZTCJM9T4INSEkRRSvDtZi6K0xUtIzOzfTCZIjz91E4UUffLXifCkbs6epB2yvP3c9
	 k1rqHnyG8f1UJZuwVCmk6vBYBIEq/VwESk7ujkGc2MlRAVhorMmp3jdioB1NgqmPoC21aiI03k6S
	 uxzJ4gj0ZQr/3drIuV++pHs8gd
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: rockchip: rk3506: Add the SAI MCLK output gate clocks
Date: Mon, 23 Nov 2026 00:24:44 +0800
X-OQ-MSGID: <cover.1795363509.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_082514_956529_C9D5B2C8 
X-CRM114-Status: GOOD (  10.73  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3506 has four SAI MCLK output gates: SAI0 and SAI1 are controlled
by bits in the PMU GRF, SAI2 and SAI3 by bits in the system GRF.  Model
them as GRF gate clocks so the SAI MCLK pin direction can be controlled
through the clock framework.

This is a v2 of the earlier "[PATCH] dt-bindings: clock: add
rockchip,clk-out" submission.  That one introduced a generic
"rockchip,clk-out" compatible plus a standalone driver, which is not
acceptable: upstream already has generic GRF gate support
(branch_grf_gate together with rockchip_clk_add_grf()), and RK3576 and
RK3588 register their SAI/I2S MCLK output gates with it.  The new
binding and the driver are therefore dropped entirely, and this series
only adds the four gates to clk-rk3506.c plus their clock IDs.  No
device tree changes are included.

Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
drives the ES8388 codec, audio playback works, and the GRF gate bits
were read back from the registers to confirm that they get set.

Changes since v1:
 - drop the rockchip,clk-out binding and driver
 - use the existing GATE_GRF support like RK3576 and RK3588 do
 - limit the series to the clock driver and the dt-bindings IDs

Xiangyu Zhu (2):
  dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
  clk: rockchip: rk3506: Register the SAI MCLK output gates

 drivers/clk/rockchip/clk-rk3506.c             | 23 +++++++++++++++++++
 .../dt-bindings/clock/rockchip,rk3506-cru.h   |  4 ++++
 2 files changed, 27 insertions(+)

-- 
2.47.3


