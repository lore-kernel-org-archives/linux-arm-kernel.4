Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B421606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c/taOii3;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HOlW6/Cj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eniu4D6K6YKvNE/gDkqzAbCGGrcDWnEmgR3F4VwagUI=; b=c/taOii3SogNsb7KstdjsVKdki
	V7TJd2JaDKczZlY7DUl3GNPuloJlNEXsl0jY5YBnbCYdy5CDV8+2+16BmyrHmcjkp4r95cZMJ5WOj
	7xDS3TiMPLUFfpEc/q6+KMhtnF10PIjJISKP0sVhXYW+0fcsmryCNt9kC4gcVynGCGBTA/RWYKALo
	o9gC5MiEnPG641S2azO80usGFDF4H0vBz733TYP6mv6lwOzmVbh1EDSqsPHr05Jtom26cH3f4/Xeu
	BUUTae6hbLNIx9aHiVx4+YG6Z6AYdeZpqWk1tyrGgTUKR2PE4bY5Zd4YQvtVFEFISbXINCbkKTHdL
	urldnaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVk-00000004eRQ-17NW;
	Tue, 10 Nov 2026 17:19:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVW-00000004eBf-0F5H;
	Tue, 10 Nov 2026 17:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=PSYSBnjHJTGSOsFMN80hFo0M6LiB3h7DxQOb+h1dEFI=;
	h=From:Subject:Date:To:Cc:From;
	b=HOlW6/Cj7qGg7vmOIKMFsCqLrybu59yyLcduV+G9N7XIMYUMo4YKlBHPAJCMxUQsC
	 RMYnqTFdJODx7SBnbYeAUJZZIm3BH1h2AA1OA6V9QMXLAvPhUkLSdpQ3Unn7LBLSI9
	 3KpZLaFCD6zkpQYN0baNIsTcyQhDX8YO/iHsmUUVeJVOpfIERaMHGX3MXKqPippIG0
	 6sAP+glG740OhRQG5+8EikJo7CDfrFx1V801bOzmvZAb7FBxQLrb/mOc/cj/VWzhq1
	 ri7DDbkV2tmgUzAEguZvHcrY5Dj8NgCmoM+cKGTSH9QQZQmrv+nsBa+WkgttQ+M9Bc
	 tv1F6sFVW5qug==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 559C617E0A6C;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 09FEC48002C; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 0/6] phy: rockchip: inno-usb2: ensure PHY is running
 when clock is requested
Date: Tue, 10 Nov 2026 18:19:13 +0100
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOy07EMAwF0F8ZZY2RnUcfrPgPxKJxExooTZXMV
 IxG/XfSQQKEZlGW17LP9UVkl4LL4uFwEcktIYc4lWDuDoKHbnpxEPqShURZYYsNzMMZUuQ3HsI
 MYZoinLKVwGOZgQ8f4Pq+MtbUvmm0KMycXBlfK56ev3I+2VfHx83dNoaQjzGdrz8stO39o24hI
 PB1b1pWZMvJI8dx7GxM3T3Hd7FVLvIbJUTagUpAcEjWG2yVad0tVP2ghGYHqgpqJVbYMDa21bd
 Q/Qsl3IHqghrqmLGmSmn/F13X9RMcFKbj5QEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4465;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=PSYSBnjHJTGSOsFMN80hFo0M6LiB3h7DxQOb+h1dEFI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUiaAsRwffl1O/xPPm9cFSja+Xnq626vWE
 iNRZgVNTaZKcIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81ImAAoJENju1/PI
 O/qa56IP/3Sx3iJkPehsFus43aCVR94carRvjsg5BdyzY9o9/xYgEkgRfQckWXnzXpwLchi1vnr
 aYupt8ZhMCrdXDdT/sT2DummRb29CztDqNZ3gPEAGSOJnd5K/p1gtWiDvP2ESVO9ftoecoMy2pp
 AADCLvegSfRhL4h1yGSeGjUM5DbjRC8t5yGlUUP8TsLpiOfLT7jsOvlR6LNR+Bw5bzFq0OBp9H3
 bPrIZjwyTRye8FgH7UY1uugUgwKNkMylLAdvj4ZSLqN0kx86EqySOLkJVggqZ921oo/oGkaL58r
 fAcDshPsgkNyn9p/aHvEIZKs0g9+oBAc6ZcVMMXfYdiBSm62ImLTzL1WvfR7i8+AcezrDYgfpMr
 FIgrEbKGO2HvXB1UNBmX847/aXjwRgq3YHgmnPz5b+AgPtxHzAJsZ/bB0UACuHYL/OqeHacH388
 2W0ENMkj5RM65bar/JHlNDyDiQzjzrcFodGQaTbqGQTVDtSpLgOCa5qitnbIJSwiv8PJQcbtdYL
 BtvE+TPG+AHy3YmIZFlhJs/fD30xObju2RyF7QgsF8koA7hYwOhPALN+lXmQVUEFnBJ7hIRKGYy
 KGvjRX789ggekoOmw8kHHJmtqSheUNuDNS22tK43hxAHigCU0O1hthO9oziN6wNTuzY0A4/UF4g
 3crYvo4WNcbCJzvlPqUwhjA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_091942_288271_19D5EA71 
X-CRM114-Status: GOOD (  19.03  )
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

Changes in v5:
- Link to v4: https://patch.msgid.link/20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com
- Add new patch converting 480MHz clock registration to device maanged
  clk_hw helpers instead of using legacy clock framework functions with
  open coded device managed release handlers. This is a cleanup, which
  also allows easy implementation of the next point.
- Restore clock registration back to the original place, so that internal
  users can access it early. The clock provider registration is kept at
  the new place (after initializing the ports) to ensure the clock can
  only be requested when either more than two ports are available or the
  port already being initialized. (Sashiko)

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
Sebastian Reichel (6):
      phy: rockchip: inno-usb2: simplify and unify PHY op debug messages
      phy: rockchip: inno-usb2: ignore regmap_write return codes
      phy: rockchip: inno-usb2: ignore reset_control return codes
      phy: rockchip: inno-usb2: use devm for 480m clock registration
      phy: rockchip: inno-usb2: move suspend handling into new function
      phy: rockchip: inno-usb2: move suspend handling into clock prepare/unprepare for RK3588/RK3576

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 284 ++++++++++----------------
 1 file changed, 103 insertions(+), 181 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260908-phy-rockchip-inno-usb2-clock-fix-edd65b57f884

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


