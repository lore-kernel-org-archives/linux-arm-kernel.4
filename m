Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A7E606B1B6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C0l+ajQ/;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Y7BqJSoJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=j50qeo7+7H5R+nKfOu8rA+1h5BbW5vTqhKtlNRyMzhc=; b=C0l+ajQ/pFL0D2vOR3QkmpYFz5
	8f/Vy3h/lNH6/9cwk3neJmjINVbn/C2jSckKeAYX0oDPN0ekEFaIQPH8aS5QlvW38ell/Hk83qxPZ
	0Y3NTdJUeEttqLZXjtI8ykHf6BcSL3MnvbTQXoSJwJfMYnSDM8+fbOOb8bX1evTAeNnaOyiva+qFg
	MQLLEGEpW/4wPg5WC8wLaRLo0D/U6ERtZ1AhqIf7V8Ha5OF8f1kZVEGi69DMe9C3JJCiif/iqwzDw
	iv6QUW3vyzmBuw8NA7RVbPopSeUL6wxMUIgRYGVkIvDPPJ1XDwtGuC7oYMIFHhGw7V4W9QdIlSuKH
	9QiT7rIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nv-0000000Bxfz-3e4N;
	Thu, 19 Nov 2026 13:03:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nS-0000000BxHQ-2T0L;
	Thu, 19 Nov 2026 13:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795093403;
	bh=nxmeA4mtNSZ0clCsHWnlplVqVoOTDWFcgcE0wBWlVWw=;
	h=From:Subject:Date:To:Cc:From;
	b=Y7BqJSoJO/Nno8fElofOBRkIfRKLlutw/D5W2KELXReMpmOwjd37GJsdZ95J7DCVX
	 ErrvTCOd7FZdRtsj73EjktHWNHaYWeZOQv4Q0jR9/2vF9eyOPih/DdtwAtunRhN38Y
	 4D4/1BuwiheCnGQZbo0ZQgVGryRg5UJev4giimsn4j+2VFts8fSILp5OGu0nZgbzMG
	 0DcsvfbzMQTqg29p2aAwIk0K4TBoLIoL3L83poFN5EoxgcLXvuFRo7oGt+bapABqMF
	 BgIbX11ozaoFmZHFCDxPYzYlJClSoQVzBH5g7sdVj+N6EZloiEENFRPWX14DW1vjbd
	 nFSUT2/8vLIMA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D471F17E0406;
	Thu, 19 Nov 2026 14:03:22 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8E83D48002C; Thu, 19 Nov 2026 14:03:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v4 00/11] PM / devfreq: rockchip-dfi: cleanups and RK3576
 support
Date: Thu, 19 Nov 2026 14:01:50 +0100
Message-Id: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OSw6CMBiEr0K69jf0QYuuvIdhUfqQCrZNC0RDu
 LuAN3D5TSbzzYKySc5kdC0WlMzssgt+A3YqkOqkfxhwemNESsIxxgJSUL3qXARtHaSeVnUNajD
 STzGD9PrIBIc8xRjSCIIJIjRnWpAL2lZjMta9D+O9+XGe2qdR467ZG53LY0if49JM997/9plCC
 ZRYiyvG29KwmwrDINuQ5FmFF2rWdf0CXM8ejAQBAAA=
X-Change-ID: 20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-74727d64d729
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=nxmeA4mtNSZ0clCsHWnlplVqVoOTDWFcgcE0wBWlVWw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr+85pb7hvmL+6vJy7jrGoh3OyZedy2p6yzc
 /Ad3gYBY+nsFokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/vOaAAoJENju1/PI
 O/qa/GYP/j5cae6aFj3rtw1N8LipoThw8puXXG0hlXTTBCbzF44PCDHf2FWQxMNOcCaakTuc4LN
 rguI+AbQl1mhPdtentR62zirPqko1+bgQtuXlh/Cq3rncc/6tZcKNKbYUTo+XCq3M/3UR1cu3s2
 aVBa3+vp0aLL0W/NFeN6qFpkL+YHTNnS85OdYN5bVLKPxIiQiktSbq1Nz499du4Yq6u9xULyekG
 BNRBAWc48uNzTSJ1mZOJk2LKZx6f5B4K9d9cMRIv1m7Np4Fva0Q6eQHgkXiQkYVA13zHmyikkie
 7G9QSDhbWPNXnjcT4bh4KkF7UVnRXGrPSILMBBGZRrYoqSkwAvLuhvX2Cfqg3mNs0+m6nvsIPAb
 nYBu6d7tfLzI1GqL3KX6QHtvS9IS3UyduMvo8IaZpX63yy3fcfxpE+7+zRd9cTPHQWaJq28j7Ua
 IjaweT0XTVt79m8C4w/sY26c0ll5BlymHF1ApBvD0gIsG/rS6lsPXsKjUJxk594Jeq4tESCDSUj
 Iia+HRajKDPWsyfGEKStvDZGZI4mcd30fJNi/4rN7qJhofa23VbYW0qx/jtaWowiwOI9lyhvaH1
 LpExnap/+U5wqqCPU93z59fBSlJrkowIt1TQrNruSGF3yR8fS+lfW7V87s1i4oFvZzBJjbqaz5o
 pjeklEDcvbefHneCwKFs/3A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050326_884094_D6166D09 
X-CRM114-Status: GOOD (  13.87  )
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

This is a combination of the DFI driver patches from the following two
series to ease applying to devfreq tree. It is based on devfreq-next
and there are no other dependencies.

 * https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com/
 * https://lore.kernel.org/linux-rockchip/20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com/

Changes in PATCHv4:
 * Link to v3: https://patch.msgid.link/20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com
 * In PATCHv3 I accidentally used the patches from PATCHv1 as base with
   the wrong DT bindings; this is now fixed
 * I've fixed num_clks typo in kernel doc (Sashiko)
 * I've fixed incorrect LPDDR5 BANK_MODE_MASK for RK3576 (Sashiko)
 * I added a fix at the start of the series correcting LPDDR5 bank
   mode value (Sashiko)
 * I've added a fix at the start of the series avoiding usage of
   uninitialized memory (Sashiko)

Changes in PATCHv3:
 * split out DFI driver patches from both series and merge them into a
   new one; clock controller and DT patches will be sent separately.
 * rebase to devfreq-next
 * collecting Reviewed-by / Acked-by

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Nicolas Frattaroli (6):
      dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588
      dt-bindings: devfreq: event: rockchip,dfi: add rk3576
      PM / devfreq: rockchip-dfi: move to per-variant const structs
      PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability
      PM / devfreq: rockchip-dfi: use bulk clock APIs
      PM / devfreq: rockchip-dfi: make RK3588 use its clocks

Sebastian Reichel (5):
      PM / devfreq: rockchip-dfi: drop incorrect shift of LP5 bank mode
      PM / devfreq: rockchip-dfi: initialize dmc_count structs
      PM / devfreq: rockchip-dfi: move register offsets to variant struct
      PM / devfreq: rockchip-dfi: prepare support for v4 DDRMON
      PM / devfreq: rockchip-dfi: add RK3576 support

 .../bindings/devfreq/event/rockchip,dfi.yaml       |  89 +++++-
 drivers/devfreq/event/rockchip-dfi.c               | 297 +++++++++++++++------
 2 files changed, 290 insertions(+), 96 deletions(-)
---
base-commit: f9316c13d6f621af4f6f4a6089d3c989ffe899e6
change-id: 20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-74727d64d729

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


