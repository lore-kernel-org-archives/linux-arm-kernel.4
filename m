Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A136D606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pKpT8Lhr;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=WuC4kPho
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FEXJR2cFvMoPYSyvAdd0ZT9BkGkfe5w1c1yh6i8rz+o=; b=pKpT8Lhr4lIzgHvqgS+Rf4c/My
	dyZHNKoXWW55grd8EX8K+D37LJS0n2DmF7YbdrQ0zV1f9jPgpXYu3QRyYzYG91Yk0zGAc5pgW3Ugq
	TCgeGT9bY06cuFF4klj7kbZHWFlLwuEc3OF0gar4CLKJaHxtKC3b49G6G3U+wljsgl9wks6kihpfw
	MFb/p5LqJJdQutMSv0sddd4kkhI1trCQuR1LiEa97/R6fJb3rJdDPNRmAE/CjU5AHe4Kgcfpr8vkT
	k6QHLkHqOGdLwRT3Jsm3OfGvNe5oyuKGBDAvRogAqfXLTocnAth+NvJuFhSwbDRWAZfGM1sRdJSv4
	iWISNYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZKT-00000001yqP-1ULk;
	Tue, 10 Nov 2026 00:03:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZK7-00000001yX7-34V1;
	Tue, 10 Nov 2026 00:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=K8NTwOd2VMhqShdXjAXjDbndtPFnEs+PaHrTnRAXxNo=;
	h=From:Subject:Date:To:Cc:From;
	b=WuC4kPhobmZ2j/o0+Oj5sS5KbwLns0xJi0oyxbhPmIAGXjtGxFZft63JwP9yfF6Uy
	 QC+NlY5VOz23ukiIsLfYMWi9GlShZhvcQYxGwz4NTMQJaMlc1YX5LmYGQSTN6zgBiv
	 M+xLEQWLW8PTue/dhB25DZB4DOs+pQ+5StsWx8KEiT2qEhw9HzNLuhW/gQjRibhIJA
	 PVVmbCOe80o47/2oRMc6g8SI2ws+72MqRYxL7l0DlXxQ6h/MNIJt3EFMaZSjwctR8C
	 YmrVQ8O6Yzzs5lb18b+Wd8V7/LH/rrG8942uxYOopmJQSHmchoI22pG7IV7JXlwbQV
	 l4lbFmFtX94uQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66E9417E07E5;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 210D148002C; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 0/5] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Date: Tue, 10 Nov 2026 01:02:45 +0100
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOwW7CMAwG4FdBOc/ISZuScNp7TBwa16VhpakSq
 ECo707KpE2aOMDxt+zv900kjp6T2K5uIvLkkw9DDuXHSlBXD3sG3+QsFKoKLRoYuyvEQN/U+RH
 8MAQ4J6eA+jyD1l+Am6bSTm9aY0qRmTFyHj8qvnY/OZ3dgem0uMtG59MpxOvjh0kue2/UTRIkt
 JtGWyqkyyefFPq+diHWawpHsVRO6heViPIFVAECo3StRltoy8/Q4g+VqF9Ai4w6hRUaQuNs+R+
 d5/kOlObW5JABAAA=
X-Change-ID: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3652;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=K8NTwOd2VMhqShdXjAXjDbndtPFnEs+PaHrTnRAXxNo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXydV8ts/JAA6l2huXHuKDiEh/q8l+hYQ9
 kpF7WMQxjdW04kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8nAAoJENju1/PI
 O/qarsUQAKVaPYfSwtKgIMe22dnuXp9/584PSYhTE4IMswI8LQlFxI6sREkq7n9DDNd0jkqCLFl
 KkTiCbuDOULfuuemQrlw2G3dKdkeMds0Mgf9Z0rhVTXK38sQ/LgRW39y+wdja3+vXhfFWJkNCqb
 Neljhx+ybAfDiygkvKdpfGWLT36GkVIoV3ScB/JAybUCSFJN+azzw/ZD6Amcu90HWwGQgw4oPaW
 rIMKoIHZkenLONJUOfzP9+cuzVwBP8Vjjtai8zF9XPNpUHbVcHWQriy8xSLmWRDRGCoNZMuKISY
 iAR5rTPOaCUm0e4haFZHrknDpK2RCAzli8pxfkek9l/8cJTTe4FTmdo68aA7RexUVDzDyLo82Kv
 yPpLPmInBaaPF989+EcrJl53tpr9aD+HfrNhtgpCt8JSXRsRXdmrIoUMYM2OBKx0OymfWQ1y/3B
 NnAz0BP/bNmxS30sOTfAeSzTnh8Uxv41gvSXDflhuKC1uirI3fUSFKOWLlwRiegiD7XRO9oJUsn
 WvR/b7pf293VmbWPi9t3gxChuMvemcUlcvGKFmDsScO+YgNYSemdMu9GHGyfsq9NdfZ29HKMiTc
 AQPketku9jEoslesY0pNBmAJr3XX4JSdJXp3OZk5oqiUWPVZGytDiIvFOeTh0S38xsuEc6Q1SWh
 lRex9Rxx6twST4KHqB+owcA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160251_958782_461EC1EF 
X-CRM114-Status: GOOD (  17.43  )
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

This was noticed on RK3588 EVB1 when resuming from system suspend. This
is technically a fix, but its unclear when the bug was introduced and
system suspend is broken on RK3588 for quite a while and not just due
to this problem. So I think this fix can be merged the normal way via
linux-next.

Changes in v4:
- Link to v3: https://patch.msgid.link/20261105-phy-rockchip-inno-usb2-clock-fix-v3-0-b20608c08b94@collabora.com
- Drop patch avoiding rport->suspended in rockchip_usb2phy_sm_work; it
  was meant as a simple cleanup and Sashiko suggested it is more tricky
- Add new patch removing error handling for regmap_write and
  regmap_write_bits
- Add new patch removing error handling for reset controller
  assert/deassert
- Simplify final two patches due to the dropped error handling
- In the final patch move the 480M clock registration after the
  port_cfg population to properly fix the race condition instead
  of relying on -EAGAIN and the NULL check
- In the final patch create a new helper function deciding between
  handling the PHY suspend in the clock (un)prepare functions; we
  keep the NULL check for port_cfg as this properly handles the
  case of the port sub-node being disabled in DT. From functional
  point of view this setup doesn't make sense (no need to enable
  the PHY if all ports are disabled), but one extra NULL check is
  cheap, so it's better to handle this gracefully.

Changes in v3:
- Link to v2: https://patch.msgid.link/20261001-phy-rockchip-inno-usb2-clock-fix-v2-0-e01bf509359e@collabora.com
- Fix do_suspend negation resulting in SError on RK3576 (Sashiko, CI testing)
- Ensure PHY ports array is initialized in clock enable path (Sashiko)
- Cleanup properly in clock enable error path (Sashiko)

Changes in v2:
- Link to v1: https://patch.msgid.link/20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com
- Move suspend exit code from rockchip_usb2phy_power_on into a
  separate patch and reuse it in the clock prepare function;
  move is done in a separate patch
- Updated commit messages with proper rationale
- Added one more patch dropping useless assignment
  of rport->suspended directly after calling
  rockchip_usb2phy_power_on/off
- Add one more patch unifying and simplifying the debug
  messages for phy init/power_on/power_off/exit

---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Igor Paunovic <royalnet026@gmail.com>
Cc: kernel@collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---
Sebastian Reichel (5):
      phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
      phy: rockchip: inno-usb2: ignore regmap_write return codes
      phy: rockchip: inno-usb2: ignore reset_control return codes
      phy: rockchip: inno-usb2: move suspend handling into new function
      phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 257 ++++++++++----------------
 1 file changed, 96 insertions(+), 161 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


