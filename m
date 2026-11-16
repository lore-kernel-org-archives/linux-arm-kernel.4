Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C94606A8BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Owrwtndf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iTP6ZJtL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PRwvJorxkByLGTSFno1Iu5DhwXlwxTrPSjgbw9+lMxI=; b=Owrwtndfuc//as
	g8b+wIfpa8+0paHdZCx/EpimFcQYBg4hh6D1SSAOGGY625+HRChF6piNq/wSUZCOP+WKKKMp4c/zt
	yKrX+yqZ2Ad+RYkJgHd/IoB5QmaTwoFxZ2gcWkc/K5DX7t++bmFeM1GxLEPqvqZhE7Solo1f+JfbY
	I7KCGpXiMrW4s0AUdDa62fK4zsPjrWQOrXlTCCeWaO7t1OxIMNo7Lbw1n1uMSPqmF6Cq56V1SriOf
	/yELGtF3a44l0ibhuOV9AJt+Ro/kZUQUWcq12088Oh2nM13vn2+kKu3RVaMaLa6g5EGmPuD+uYTX0
	J4PhZBsWdp+IFBRmpPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUi-00000002mZw-334Q;
	Mon, 16 Nov 2026 14:15:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUe-00000002mXg-2NSj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:15:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5345A43510;
	Mon, 16 Nov 2026 14:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887571F000CA;
	Mon, 16 Nov 2026 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838536;
	bh=PRwvJorxkByLGTSFno1Iu5DhwXlwxTrPSjgbw9+lMxI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iTP6ZJtLdVdpd/VbF72VakFFel44De5q9eZV8MHs5WSmwU6X6M18VK+RDB/lBwbzU
	 8886RbprK5AIpxpbR9LKMqh5V3NkpFExHNBlmwwjuR1JDeDfQgulYVUpycuCVKK3tq
	 lCjFqhYzNQLGTegetqNFZEifPnRG36p1zMP7O7PehM1OsYyuurb9KmZZtBNHtZeHVB
	 GsoHwNzQebSawKrXdjEzTjDMrfq8gmtGHnwcTgceC8scsQ8Ff7DjDjSCBGI5AAe+BE
	 wiBSxjg8BRdQLxFeiv7lS4N0mnHN5bByILcV7PYNRg/UEDo2DuilHw/vpM7OOspHUQ
	 ic8XAtYc37vCQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/8] soc: synaptics: Populate SL2610 system controller DT children
Date: Mon, 16 Nov 2026 21:54:40 +0800
Message-ID: <20261116135442.4827-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The SL2610 system controller currently creates only its fixed clock,
reset and pinctrl MFD devices. DT children such as the MDIO mmio-mux
therefore never become platform devices, leaving their consumers in
deferred probe indefinitely.

Populate enabled DT children after adding the MFD devices. Use the
managed helper to remove these children before the MFD devices during
teardown and probe-error cleanup.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 drivers/soc/synaptics/sl2610-syscon.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/synaptics/sl2610-syscon.c b/drivers/soc/synaptics/sl2610-syscon.c
index c6fc2955ac0d..b7965f4bb963 100644
--- a/drivers/soc/synaptics/sl2610-syscon.c
+++ b/drivers/soc/synaptics/sl2610-syscon.c
@@ -6,6 +6,7 @@
 #include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
 struct sl2610_syscon_data {
@@ -56,9 +57,14 @@ static const struct sl2610_syscon_data sl2610_cpu_data = {
 static int sl2610_syscon_probe(struct platform_device *pdev)
 {
 	const struct sl2610_syscon_data *data = device_get_match_data(&pdev->dev);
+	int ret;
 
-	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
-				    data->cells, data->num_cells, NULL, 0, NULL);
+	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				   data->cells, data->num_cells, NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	return devm_of_platform_populate(&pdev->dev);
 }
 
 static const struct of_device_id sl2610_syscon_of_match[] = {
-- 
2.55.0


