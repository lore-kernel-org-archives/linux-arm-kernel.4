Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6085606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hHQxDgea;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJSC/6ph
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pxVs869Ky/tzG5WFDjowEDHv4Ebj83QZWV8ziNXTFhQ=; b=hHQxDgeaenOP3RBsMGGwc5PbL1
	5V5pBHLpV543i8HgcmSiD8j0P126/qz8R4JwvwdMYW4OYlHOQJo+voLn8yBu+PfIvlBsyADkVqSnl
	gLQGw47DibAx+hABIhh59gJ7XJtZmhIQoynG99zBslVDyTqUvfjXEbVZi3rn0oPhXyugoFwI8hg5n
	GMEXIUT14Me22G/H1MUrtPtj0cG/sgc0t36JyTImGps+3paa/J2DyIvI9yRppS58tzqcneU4HZTGU
	2y+Z+hfc8De0osdWF3AipgPqWOTUIrLSo+HUO7d9Qu+OuaPaPUgMMaqLAM00lMiCK0/somCcrEhJN
	1C/8KWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVio-0000000CYGf-45Jm;
	Thu, 26 Nov 2026 09:24:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVib-0000000CYAf-3qwS;
	Thu, 26 Nov 2026 09:24:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F2A762C6B;
	Thu, 26 Nov 2026 09:24:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685080;
	b=m8KObYglsdnjDyfZrXKglBAU4uuwtf/pHbwDpxy/LPMYT7POCM6lYDGYnVmtTFImYzWf
	 3R7xSpycQ3fjOUw8G26fa+t/3TrD++6o9KhwsrQoOYl/MDPaKeMofiFkT/G/OH7WkU0S7
	 0Il9dbclTijQ/xdu5IlFMgpUtBXrrDPRicu0UPswOEohSHAFZGBuwN60pczrUTJ8J94/I
	 9SHfyEZr5mwpS9cB3aPZRa4z4rUHl5PiP/J46OyMmC+8IiYfeQo1hTGdPca4GxZpkK3kI
	 45ehChLpDLC7/qbxm1kwpInXjXX9QGzPlzW8ua/G/uSz7MPXR5pR9ErC0fKWJ8rm/og==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685080;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pxVs869Ky/tzG5WFDjowEDHv4Ebj83QZWV8ziNXTFhQ=;
	b=2JOvxCJcQ0N91JawDxcAetXEN6oSCZlg63DNlVDIbfxngbhBe+tWy6kOvzY9tdaHVtZi
	 y16ClmK0o9gokBF1U3VkByv/lM1GBlUW75g87MWwkkMF9JoUoTulMloavjnNafOU+7Ct7
	 MajXSsXaDMFY57ygJy6/H7vN9SKtu1VHty7W6OvXCAiyQs4O9R9YxCxPwsffW3rYiMeA+
	 bJcg9jR0ur+KsE/uZJUFN2uevB1lW8niTh75STMnd1wXft9AvANyj6yn6ZDkWOhSijnq9
	 hVuY36JhGfauWntBOf6WII6fQZtIikygJ08gX7NZM/QjbuxyAPX4wj6sflCiFIqZGNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C7401F000D0;
	Thu, 26 Nov 2026 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685080;
	bh=pxVs869Ky/tzG5WFDjowEDHv4Ebj83QZWV8ziNXTFhQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IJSC/6phejv1PFX7FT8f4pEnn0xH+2io250f2b3hI1+Yi2rUbdX8Nu4dh5VcXS9wd
	 KDHuTuyRMfiMC3dANvuYoSPFkWrDEWdG81DAd4gbI7NNZPvmXTwr/te9trpdUffK+a
	 AQXRw4OP2tNz4V/2psaFyyOjnNRXIZ4QYtAFO2pRfXnuEKcbFS4TPBdA6tEt+B49aC
	 zYd0TvnRR15nlM18wibKH4sb5fk2+PkZZoF1Kx7aX15XebAV14sWwR4ySOdehhfRSI
	 YOsa9QjHAxIql4Kz1jzQKsaTcKO3pWMK5EtZOI2XJibJV5RF/PtZo7pxr+SjloiAu/
	 EwXddjMsudWxA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D16B44D359;
	Thu, 26 Nov 2026 09:24:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Nov 2026 09:24:18 +0000
Subject: [PATCH RESEND v2 2/3] reset: amlogic: Add A9 AO reset controller
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-a9-reset-v2-2-e3d850e68725@amlogic.com>
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
In-Reply-To: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685071; l=1414;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=patSBH/uW6tkb/H97P+dDOJPShFdk5yhMtjXp5whRlQ=;
 b=MHFhPFUHkLDqEv33UPrbcR8spYOwBx0ACgduHP1nFxIhZPgZEQRiTELX5AFyTWTt5MBPzDhJP
 6FYexNy/gc+AFpoSWRliQ6He1ZXbnq4SgZOu+g6dAWo2YkXAG3vrC/P
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/reset/amlogic/reset-meson.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index c303e8590dd6..5e8afbceaf23 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -49,6 +49,14 @@ static const struct meson_reset_param t7_param = {
 	.level_low_reset = true,
 };
 
+static const struct meson_reset_param a9_ao_param = {
+	.reset_ops	= &meson_reset_ops,
+	.reset_num      = 32,
+	.reset_offset	= 0x0,
+	.level_offset   = 0x4,
+	.level_low_reset = true,
+};
+
 static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
@@ -57,6 +65,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,t7-reset",   .data = &t7_param},
+	 { .compatible = "amlogic,a9-ao-reset",      .data = &a9_ao_param},
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);

-- 
2.52.0



