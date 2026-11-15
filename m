Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B5606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0z4mOLqg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mF6LNayV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Au+xYSfXXUZsK5FaRuCPg8J01k6DSd9f+PtsGeFr/Y=; b=0z4mOLqgg7OML+VPFL79ixJ8Wb
	CfnrMmaOVjwAg+KsndYvHr7qDqwRnkqivYSHeI/i4vK5mv7lmYLxdp8vNlewnjiI4tiGvKr5c2GjA
	JFebx/eW4mO9I8iOY3prSKs28g+ZWvx3qjAKB0kWk/qC7HZU+s5Bq4fs+aq+YeNDIzc00ryGujAwt
	Ba3suO05J7idOlbQH/LIuPaWtQt31A9jD4PTNdGD7hZ1gB3Szjf+sonyO613Nx9PiD26bwmSYmF6B
	W1gHNxesf5n585JeLOGceT6H5s1eP0/XLe7iA9x5J3qtDLFKuEn/MjmUpL8MrawQklwEbHhbRi67n
	bn4GfV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSijl-00000000e6O-266x;
	Sun, 15 Nov 2026 22:30:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSijg-00000000e3j-1XKz;
	Sun, 15 Nov 2026 22:30:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23E66456E4;
	Sun, 15 Nov 2026 22:30:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781808;
	b=huI5dGtnZM+PRYoVGxpeqgXK6eFyx1YtxSSnPH4jdc6i6CVjHDVu0ghE+uqQz2+VJ0R0
	 UHRIb/50r9wnSSrCHTuoJRn+0IyabJ0vLB36podK5tM1LfZvutc/ALn/LHzDVoYXBM4vO
	 PaqDOOlS7Ud0LO0Upy1ByfFq0OHWen/kOdzSO2ddvfBVLbyaQO9FjW/tuShcHBxChrclS
	 pxn6cBuJbqiEFKQA1/WGeG1rUOuVEtNevshrcROPwf9QWEymnbKBSAGoWNx3KUrdGfnpg
	 PLQzXuSapTc0pmL2EpqO2Jy8RwS2Q3SPVegx4dmzTZFGc3VD83eoEUMVPjshGbodIuw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781808;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1Au+xYSfXXUZsK5FaRuCPg8J01k6DSd9f+PtsGeFr/Y=;
	b=tu5uYGXewXVbPTYNZpboSezidhXfSxPez4bp9EkzwR5nbjKN0Pz+yS8N88gQG8QhaGnG
	 VRAB0kjsg/wFImWtzj+biONOE6dHUoZOFjyM/uaQUFCoENAYFg99jt2zYiuBsIOPyRXs8
	 Q4GAl7fwohQ4X1V3I/aouEKdJEqbyMjX9h8Zp8IoTRDJ9c2HkHsI/chMMBANeDFlEcScY
	 OPwLPzO3bnF0gywgXTzGDOOP0pFDFUU/wDJAcjknhLAvsGmApnTHSvu9h50feAz6riA7N
	 adr1EAQAQQcej4fw0w3TJyqqIOIbq5v8PhvgaTyDJPmARmydQoswNKF3J9gi9cLFGfQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C0101F000CB;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781808;
	bh=1Au+xYSfXXUZsK5FaRuCPg8J01k6DSd9f+PtsGeFr/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mF6LNayVjYYYbdXmWKqFaM8qLfAjVbsSEZpRasi3T6RwTM+zYLJaF0h6+unE2B2MZ
	 +GVxwt0jiPzL0esvDM403WBSinSA2bgM4mWNNN2FI4kCYg7CPKdYug0JMp+pYA+KIM
	 CGSoBdilEnLLE94F88iX03nwxQ5G7wMKPvK29BfGIhvOz/JALNBMEuoPkowgDqBJz8
	 dqdlc9TOsbmF0y9rVqAZEWqr80Vnska9j2vrb2MfDb3eD0DrqMze/bzo8QyjnL98DP
	 iEl0gwdtSYtIWGqt5olqyJ+7NuRj1nD25heWDU2Mapzzf5dUPklYbz24FV/wd+UHFZ
	 W+V/QlrYFEN8Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B1D2D4A230;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:40 +0100
Subject: [PATCH 5/7] arm64: dts: amlogic: gxbb: Add ranges to periphs
 pinctrl node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-5-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=xtEn26a5+bgSMy2fwvSPiUC0qAEwWIS7vuMdhcOzhwo=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9Yvo4wHp8KVcjec2G+9VWt/tEnDm1evw5ZGy/auMOCt+
 dLZtm9FRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCROVmMDC83LlQxzVe4Oili
 0YULf9YVOIrLymyI6lv4U/nBGau4K9cY/gdr1bR+O80u/f/t5kDmeX8v27hec9ld9VxxPauH5XK
 JJZwA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

  meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg):
  /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg
  or ranges property
  meson-gxbb.dtsi:367.31-739.4: Warning (unit_address_vs_reg):
  /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg
  or ranges property
  meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg):
  /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
  meson-gxbb.dtsi:367.31-739.4: Warning (simple_bus_reg):
  /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property

The pinctrl node has no reg property of its own, and its empty
"ranges;" does not describe which address space is translated to the
children.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 5c2fe9dc4f80..71bdb66e4f6d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -89,7 +89,7 @@ pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
+		ranges = <0x0 0x14 0x0 0x14 0x0 0x1c>;
 
 		gpio_ao: bank@14 {
 			reg = <0x0 0x00014 0x0 0x8>,
@@ -368,7 +368,8 @@ pinctrl_periphs: pinctrl@4b0 {
 		compatible = "amlogic,meson-gxbb-periphs-pinctrl";
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
+		ranges = <0x0 0x4b0 0x0 0x4b0 0x0 0x84>,
+			 <0x0 0x430 0x0 0x430 0x0 0x40>;
 
 		gpio: bank@4b0 {
 			reg = <0x0 0x004b0 0x0 0x28>,

-- 
2.43.0



