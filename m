Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAA760A263F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tu96nLbC;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GZ6WEMk9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ALZFKbs138rL4X7hGmqZ+xvl7ond3UdYP0thrAs8QzM=; b=tu96nLbCJWlOen
	A/prXg2DKm0u28DaK6suD21j+ilT3JccbuAd4OqxiX32i69a42H/1koUbZZH68OJLT3R+e3ONfd0I
	8nfPXFKHQ93tPrO0P7rrYHX2WZZe8TOhIPzJD2EGc8loU15fj0sQ9xAYH8pmIPHwK7Mx1/Qb0s+0K
	+wXfN7OjmM7QEq7il6LSh8zKwojcldI44lx8d/Le4OOzjfxyV3PsPB8B5zzOPmIEVXOtOJ4sqEHKI
	H6m+WAuqY9D89axtQtBXwUSdis/FaDeKWhMI9RtFdvk/plGWVhPcMEgsyxBl6J6R2qbPmUCFPiGI+
	MOlUFW7YKbUaAN0DzkPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS34b-0000000F51v-3zO4;
	Sat, 14 Nov 2026 02:00:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS34X-0000000F502-0cP3;
	Sat, 14 Nov 2026 02:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621650;
	bh=Y0ahJFIOGX3bRryRmmv/cq+7XRNRRYPyaAzmDErQaZo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GZ6WEMk93JAtIJQEJVlKe6flh2Yf73lPojU69sLTq5xiupNFFI40fH7DX2SnATYK+
	 MWSYn7eQ5WTx314EianQWkx9vqYXRqXA10U5xiJaYXcVEDOJ3lGwmEw+gDBZfIy98a
	 2rI2QlQK+GqVsStWoNF6s2B6FzG1s9pcrvwoJm5rp6LA3pFVUv9BNNDkoXcrZpzXJV
	 cYIJxJZ6m9snJ3CRa+EV3lQBQfhjwVY1WqUqyM8M3BX/RvhNszAe/IhZTznPbhxW+S
	 jfRw2pTWnuXqIgLo+/rFm6SjpKwHsMKIUxrLy2ktEHH8ZqMDZiI5qIOmjOs11ejXVt
	 qrwyOZqp5GwKQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B66DC17E0818;
	Sat, 14 Nov 2026 03:00:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7450D480030; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:29 +0100
Subject: [PATCH v17 2/7] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-2-1af5f566408e@collabora.com>
References: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
In-Reply-To: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Y0ahJFIOGX3bRryRmmv/cq+7XRNRRYPyaAzmDErQaZo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNIUC7YY/gfbXKt7710AWWlX/UHfPtDJ5
 wEUc7CBpV5/X4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qa8x4QAICVEBjAqi2VrmQFH4ChjRkalpYEcqHR6bGJuxMgaxlCNmIacQ5QEYEQ02OXtW4GL/R
 CPCYkUSPX/9tnOHsb5HyrBjOuJbDuot8LGTJTtG+ljSa2kPaSRoR2UYcbAuvU4btKrAkNe0LaoW
 9PdfFqOs4YRLkcDL76EI5z5KSfW4h6syiN3D18UG3Xb0oaYj6d18rqmY292v8hDY8fajlY+jdyp
 lhGu2IrUbFEfWAlQpzqIROLj2Li+XhPNS7wZeww/bYQjtXj5VfUXGHOaWYr/1zaRKoZGBwkV68y
 8LqpZidQUdu4919vkLPv4sZs9mIhiZM/ImQ5xX/w0WnEsxW80dlKj58WPy2KoNCjDEbWG9eW1yD
 R21R5gX30Us2UZNkD/jSrQBERIruK+HidkFs8ciIYooMbOWgg1gqRZLwatMmGyuVnoQ1IUyoTsR
 UW3kTpn/8ZY5kUuPgWlVTy8U5SRxmjMIBF52FrD8BQBJS/ZXdCiVDjALUZG/w0Rt2Drh32CGL9V
 Q/jdPAXMwFckNhbOUBUxOf2VW4g6hL2r+zcva/WcBXq6qdCn1a9XPeTIsyeNIkVJAhMy/0lKqMm
 0ZNnYWwTuifEqF7y5IRKAlbUmROMHdUvG+GpL2ohSiR0MQfHS8SIOpoXXYT5oMTltjgTD8JLkcV
 fiwQPL84muo7LLA4OtW8h3w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_180053_368347_CA288362 
X-CRM114-Status: GOOD (  12.94  )
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

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index d01a819bf794..025c8d52d72c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -754,17 +754,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0


