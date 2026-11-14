Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132960A3803
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2+yE+BI;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qq7hAiva
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vvMUY+tfY4bLEo7J+cO96vvL91qJtRAZypMSTLnvhLA=; b=Y2+yE+BIJCAyAZ6u/cahVjD7Rm
	r3TcAMZvEqgeS9bucPHGnkC8xiEW2hZUMSQjTaKKvlX0IFwqsqs9R0+gP1YzV1r03l1GcRcnOS9z9
	zZLuv0AWseOT93i8/0cmJEYs9yJVpOHnZA8l0TeREFCv10g68sJYoNGzDhu1GkzQGgRa1mToIIP4v
	889r+fWE5VAeknU1K/RL6Kw5CSNVAhqh5g0RnWfjdoD/BVCcItYIxiDToJWUEwLVDwaxnNDBV4EcI
	H6M5+RU1mHAnBbAm1pfLqMPyYpraFYz7liguDPYkbYxs9zGKSH3bvy9/G1VUm5lw+/9aJcZaqgxLw
	13F6xLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS34c-0000000F52I-0HDP;
	Sat, 14 Nov 2026 02:00:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS34X-0000000F504-0fAj;
	Sat, 14 Nov 2026 02:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621650;
	bh=moXEvhJNmmtfZmy42YrxK6QLzYWtdJ2Y+rk4roi7QMU=;
	h=From:Subject:Date:To:Cc:From;
	b=qq7hAivaO2E+FGy/90m9xGOscVpxU1UkJcUhqs4tAHx/nZ+KhUQ7Yf0+1ehLlf5+u
	 vb0yqIi+qzjWTCkIfaS1dY0RDa9TsYBPQJ5U0eLhjYiyKmYETEoBuO/oeixXUQj6hZ
	 Uuf75vBHSb3zC6Ia3HaSm12W8lDEaoBRaabx1AQD9rlUd8bNDeZITDK4/QuLw9vv0Z
	 BDRKppWmZbq4tpAr0i/o25AnUnUONjJGYrBLHHtsYLu/SpAgoQ1NG1pQ5GDIMRbZsp
	 aFf1Vox/JM0FisIsQYcuVPQuUWRZoRuU9QaPRlr0lUdHvhfF9DgQzl2DIZ2wuHncM+
	 e3jNW0nm+KaXg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B2C6F17E00AF;
	Sat, 14 Nov 2026 03:00:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 71A8A48002C; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v17 0/7] phy: rockchip: usbdp: Fix runtime muxing between
 USB3 and DP
Date: Sat, 14 Nov 2026 03:00:27 +0100
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42QwW6EIBRFf8WwLhMQ1MHV/EfTBTyfI62KBbVtJ
 v57wZmkjZt2xyWPc97lRgJ6i4HU2Y14XG2wboyBV08ZgU6PV6S2iRckZ3nJFJfUSOodvEFnJ7o
 E00wUetTjMtFJ+1lQAF0xcRZoUJBImTy29nNXPL/cc1jMK8KcsI8Jj+9LdM/3MTJgCHpX11kSc
 34QNx8gftK1X5CuXFFGTaVaU7TSyFxfwPW9Ns7rE7ghmYwOSON5sHOdrdUpEoGTtFVnw+z81/4
 PKy/2LR6Viz8rxwdRrXSjmJZFqQpxUCfDystfVMH+QS1TIeBStmemW5BH6rZt3wxJAJ7BAQAA
X-Change-ID: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Yury Smirnov <yurymonzon@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=moXEvhJNmmtfZmy42YrxK6QLzYWtdJ2Y+rk4roi7QMU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNIoOFAiuTOFyBprjldwD4Wvn5o4wSVI2
 Ovnf0XuJ+sMt4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qaKfoQAJAGQtPnxa/fWHXSgTfFKjSWb+XaEFkXj8cYdxR7mfroVPs0o5nEkPTvEcXApgJOrBl
 A1Vy3EmtyLhWHC2g8P2TVlqvzmUQyI3qA5eTeeC9zQMLizfZyYJgX02Zhnu1uZ4/Bfm+knm49Cm
 Gg+SZ3ulJZKMWpMDsYUcCpG3zb9DWEFMpSCkfBLT4Z11SEuf1drcLMH7LNAp0W7Qvaxc1trysQm
 sVzHmizdM7gNfAzGVpTZ3uV3jwWbY7Lkd/SAZku2nX5/uNP8o7q2uZq28Qk8Yod53X5MJrHNHFa
 x4yGTisD6jNLJMw5QRmic3g0XbJONPweUps3kAHKRObKC0eP0+uIHUY+y0+F5SYldLbHAMUlzQm
 Z31EMSGiNdwS5WTxbi3I3wRI46xaYkGkKz75VzK6tePHRAAgwNiXoNyST1MIQaKwQM4UEFuxS7n
 L1iY1rprdjpGHJg4ayPf26IAXiv2TneO4YVoU7S8dXHGHO8UEQkv2Qae/LfHGDFWDF2bVinu/a0
 4O8j5oCpTopnlD9w1Ej+g7ISt0tQB0N6QEI2rqqovPqgptwYyC1u+hCJ+TjqYQG0NlLUqSKsMXv
 L3xEZtscwjbKrmirGMan3kJUuEQngtv+sLDD8V2PEzy2qONf527+lPCQd6MF71Hrkg/6rCVAeYG
 gp+VAWeH9R5bLUpCizm00zw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_180053_368065_1389787B 
X-CRM114-Status: UNSURE (   7.72  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This (final) cleanup part depends on new DWC3 glue driver series:

https://lore.kernel.org/linux-phy/20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com/

Changes in v17:
- Link to v16: https://patch.msgid.link/20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com
- Rebase to v7.4-rc1 and v19 of the glue driver series. This drops
  the first patch, as the PHY reset notifier has been replaced by
  direct calls added in the glue series, which now also introduces
  sw_mode.
- Add one more patch to gracefully handle DP lane remuxing after cable
  orientation change when the DP controller kept the display output (and
  thus PHY) enabled even with HPD=0. This can apparently happen with
  some DRM compositors.

Changes in v16:
- Link to v15: https://patch.msgid.link/20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com
- Split out "Disable USB3 port during normal power-on" from first patch
- Collect R-b tags from Mani

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Split the series, no patch changes in this part

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (7):
      phy: rockchip: usbdp: Disable USB3 port during normal power-on
      phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
      phy: rockchip: usbdp: Rename mode to hw_mode
      phy: rockchip: usbdp: Fix power state handling
      phy: rockchip: usbdp: Re-init PHY on mux change
      phy: rockchip: usbdp: Add USB-C state without DP enabled
      phy: rockchip: usbdp: Add DP lane setup to power state update

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 223 +++++++++++++++++-------------
 1 file changed, 125 insertions(+), 98 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
prerequisite-message-id: 20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com
prerequisite-patch-id: 4fa3aae8ccfa5383522070179c8777302411082c
prerequisite-patch-id: 0cfab94fd67b6304cd303a9810981aaca328c651
prerequisite-patch-id: c2e1c453454a7589a691fe391dc79e86f09ca7b7
prerequisite-patch-id: dadeaf9e369e04d8b3329493a1a0756ddd6140f0
prerequisite-patch-id: 2c727b8400980c760ca8f1e5fd989a3bf9404020
prerequisite-patch-id: cf4e7d51c77a5eccda6c687730eddd3135d94d91

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


