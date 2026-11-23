Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB01D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VZ/dpEbk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctfbiD89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=asoXMPMNvjoeTqlgLoucGjPdqO+L2q9h7XtQEksccjc=; b=VZ/dpEbkb9bS3yZpe2fyEWU0IL
	dU6gFdUtWWV+ggve4g6Yt3rRWkhaqPEG/GGqivw6JyhNdwx9svZNclvIHJ+Axg6unyNUiC0Qkjbo7
	ZECCwQkt3j2+RAWcFCYJIseFf1p/tocelIjnIgHelQ10dwDWLFl9uhXR/1YYKwHwxsGvI95gXkf6Q
	Q/h3AkNWpNiqlUcaCE5dkfj8sUqKGgJNIIO8pKm1QkI7kawVnCy/TRss2do/iRFqHNzW9DkGOhkHa
	aKjFKtPfAkptx1l1abhBrwyusRn0nCb1KTl0I9UwQAzWmVRfo8qEV7TC7TP176jZDXhYqaJBZRbPM
	r1uj5YxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVe3-00000003tsd-37xg;
	Mon, 23 Nov 2026 15:07:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVe1-00000003tsG-3xfK;
	Mon, 23 Nov 2026 15:07:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AF014030F;
	Mon, 23 Nov 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795446469;
	b=AnC+qB0r+olFhYYIiNIyr3kyaCRkgEDCaGfRXjDHhbNpaq0IiwrStjWruO+vIfdXKNWg
	 UM7P6xhcrqmLw49TRm5KKpXcBJIREcOOIc4GXPjfuVkIZS9JHF9Cihv6+d3N8YQBmxLoL
	 T7Imz38yhIeTbbcemZRCMojT+jUZenR8EfI61QvUnLli+s6WuHzbkns1IZUEkj9+2OSqd
	 kvQzhaRL9kyhrcL4Z5MCg4EpdrE7pRwO7hOqK8dbYXHqd0E4fboxGmILTubKR9VugKdYZ
	 8Hqs8nKibBwPMJBQk247qRloivf3DqKRQ+h4nwfAj4VStEsZCgVnmROVws/xDDI/JDQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795446469;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=asoXMPMNvjoeTqlgLoucGjPdqO+L2q9h7XtQEksccjc=;
	b=eTHFKoyyE/LzEb7gwF+EWEdoiigp8T3jZADwoo7tcmS+0+9xkXLRm2qAm7isTkCRqZiC
	 2eNmNTaT06ec4OnJh7B+aMXD/t4ZFxCJf9n92VNF/emY+61JApuHW2i7yU1QUngeixFXt
	 5egqpeyLjALiNd9heG/uHDkSWa9glMRey0bsJl1GgS8HD8TlPbp7hH7uQfTdynWdHjibz
	 +QXqQyxix+/9jftePopkovZlCxEQF/Enjna6VDWGkc2OOijz24ZfP9N9W6B4vPZzcKBJZ
	 tzR/x2u62BKK1MT38nCZCQzkFUF9YvBf9Ie1CHOOuVCnx9oAp1rRrB5fACXW1FVMhVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A13D1F000F4;
	Mon, 23 Nov 2026 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446469;
	bh=asoXMPMNvjoeTqlgLoucGjPdqO+L2q9h7XtQEksccjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ctfbiD89wSPMm1gC2JwrbGTEqCvE6wihoVnYhcJv5K8p2hHhb3wz6H/PMRxa038sv
	 xK+kiVOXhTk8snf1DyVDpZOJgxbq1M07bFFYgFQ8TqRzCgQoK82HOQytpZaljiloWN
	 1pOivsj+MJ3EYJVB5/U+Ddq2DJwEbrwm+QEHSEUGJC8nw5NbcdvDMjvXypGXPgiWFu
	 aVfos2iy3qjMkI+sfXYglv2pTrUIEhbtUtsVrr3EUi1EjcR5vPl8YuVhswwq2TtYk3
	 FxXPh5qRqtYo2jUfJzvOPm01RzUnCGHNei1vQW8rhPhw8tqSE3rT6F0oYWfBlCNcxc
	 ORlAavwZOn8CQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8D014C522;
	Mon, 23 Nov 2026 15:07:37 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 23 Nov 2026 16:07:27 +0100
Subject: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Mekotronics
 R58X-Pro
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-rk3588-mekotronics-r58x-pro-v2-2-2a3430cf5f88@pardini.net>
References: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
In-Reply-To: <20261123-rk3588-mekotronics-r58x-pro-v2-0-2a3430cf5f88@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=5tvM2v/b/zAV6i3N+Q541Ucn1iSwSgwcNGoUzeuHrDY=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBrBFa4T7h3xDYAGt7U028mkQDIYNCB6XGbMwBqY
 OOVPpqmQFmJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCawRWuAAKCRA7Xj/jnsft
 6ZJDB/47TCHhmYrhrRHjpapvAGNrJ6mfW83UpP5N+ScNANgPQkOz5pGDsFLxFSgUeeUS471ODaH
 6/MLTG8Os2ucJXb7tcS1wBzSOdUJgXZs2vEcizGqHaKMQZiBOJuFoaBbC50qJBnKjrAhtdYB9zG
 SovI0aWvZnyyJvoS81ER3wcUul/W+dJDlfkEvum98GwIIIBrzD+dpqMwKalCw1sY3lgkp9kf4Ln
 6nuJJGiZyNTADJc9HQGtg9bizAMqVEZx6AZq4X1OqMCeULfVhB8bj7WDAxBLKrkYI34ItMZ05SH
 uoG4yPS1si5lJxII80hnj1TY1YA5Nx8Q2BenbQvvdeQTFS3x
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ricardo Pardini <ricardo@pardini.net>

Add the compatible for the Mekotronics R58X-Pro, an industrial mini PC
based on the Rockchip RK3588 SoC.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..e8817cebdba9c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -864,6 +864,11 @@ properties:
           - const: widora,mangopi-m28k
           - const: rockchip,rk3528
 
+      - description: Mekotronics R58X-Pro
+        items:
+          - const: mekotronics,r58x-pro
+          - const: rockchip,rk3588
+
       - description: mqmaker MiQi
         items:
           - const: mqmaker,miqi

-- 
2.47.3



