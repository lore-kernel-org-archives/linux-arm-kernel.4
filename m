Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8469606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qsgYiZqC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GPzfuUth
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+k/NWSXV+Gb4kP6pdN6Psw2CRLNz63/ZQKflIA7KPmE=; b=qsgYiZqCyqTARmqoE94DqI0gbg
	vCaucP0/smPpNBwg2rqOj/2ZoQd2scE9zQCktVPdmdp7ldOKqlBBSE1EkxT700y5EjQ/rh16VlE7X
	i0raIHAKWSX5tDM07wH/09ahWsiRQv+ygfRQNjNfh7ilRAE/kraLBPc4KbcRqalIivnHZ3r+ukN89
	lMLuKY/e4P8m/ryqoL59xkUVeBuf9rGFgwuO4KxfaQhBztsRDK2d75XPHmqLp8Dnto740poChtgOa
	uZ2pWLv1+ceTxQvi1wRcYww/z34fMizojMbKaCTR5IPYjwEWAKwlhft1vvlN3U6XhkgsonQ+wBxcY
	ghYEP/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl0D-0000000A4TI-0VYa;
	Wed, 18 Nov 2026 19:07:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl02-0000000A4Py-12oc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:07:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B72B63874;
	Wed, 18 Nov 2026 19:07:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795028836;
	b=PBxWD7nSOonEZXHsXBoAvJ+hGThlfm4iYH1ycHhzRYedou4mwbkjmekgnjxCNELCETlD
	 bfkyTTMF5w4400eVlTh8CcKSy89siO2bUQwBBVSP3xsWIrGwiaxtXcIWfBz8vMlWfnhoT
	 JmBDos0LAm2skhOcNcdfckG9jRudm6kWF6TLIRfpWlflnZOJ4er6yr+rgAXqJSS+i/ydr
	 yqW0BbWUCAobFEelNHeu6kduykdGmJLUPKwmDEWr0N2toZKjg5j0znhf2HMdfWMj1899L
	 IchyWBlLwtqKNrb/vXfW7ZAkWH75zSi1+7Hrxk6tK0Y/VssqKr+qF+mceafGdrblRRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795028836;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+k/NWSXV+Gb4kP6pdN6Psw2CRLNz63/ZQKflIA7KPmE=;
	b=OICZsDQs2ZFUz0OvHJxXXiXgV7JpL5TL8ltixFrtbPk/47TRG+QVzqZpyYDbVbK6Cj9z
	 sKc0B0d2oX80hnGsvZ8etlMGQSFRKT1xZODc4HALTpQC4H9Px8ALBwrFw4kqjggc5N6eY
	 nPhozNohlEoUb5s7rAfpBDm7AjzWuhs8u+mIQk6wXv0vMIJMJPP3CnG2yuGcIgUc4dFWU
	 epYI4WsPwkTFnz7+Rdx+q4/5iRYA2VIeqC0UXbOyglTtAn6JjyhHh8iIlxQmEt2ptkTbr
	 d9WjJDFkLcGlafhY789dTHsGhwQxLdSQRE7QukL8v+cVWX3x0+C7nIwpldeI0R2843A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 671551F000C7;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028836;
	bh=+k/NWSXV+Gb4kP6pdN6Psw2CRLNz63/ZQKflIA7KPmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GPzfuUthfXTWFu2YJ2SJdiFEeHUIVHNg3KzuqML5KTotmFsZ8Vx7hKLYkWW6UWAZS
	 qBn0kI/B+0EHPrxX6IkaIsC4qiXKs9OHA+JoB9GTXmmSslLnNkxYkDveWk9FYt+rdb
	 9Vb77hPQKSqKvi0FUI2iEy52rmv5kWC6Ig+IHgz3iiPfmfmdHThAxjjp1YhjUO/+MX
	 yAO0QJFnAs60/FMmDrXgVfKIdhOt6nL308K+m/kNj3nwwSfxqHT5N/IW0uymLDyRw5
	 C3Wa6k5GlOiabY7Uk22umflLQC34UTXAMqjxcFXcVxuilwaC7e6jyczwv3hEbCuCX7
	 uoBXFGcEUZmyA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7B8C4AF46;
	Wed, 18 Nov 2026 19:07:14 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 20:07:14 +0100
Subject: [PATCH 2/3] dt-bindings: arm: altera: add Terasic DE25-Nano
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-de25-nano-v1-2-473d16131f7a@gmail.com>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
In-Reply-To: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795028833; l=924;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=q+ynkvnX0dWnC9dNQRmhhqyaPWV3G/Ese9y4dmoLVu8=;
 b=5n2X0zcxAsj5ooWW6SMw304IiTNsQdgp3JXMjiLvZrnhb21CGSlO2AeBnelg1ZIwpFrtGL8P8
 hjLpjpqX1xSA/YUZZwlwXN75kwiDD0sR4O5IGPfJAHyjQj+iOfzpcWh
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
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
Reply-To: alex.cramt@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexandra Østermark <alex.cramt@gmail.com>

The Terasic DE25-Nano is a development board built around the Agilex 5
A5EB013BB23B SoC FPGA, with 1 GiB of HPS DDR4, a microSD slot, a gigabit
Ethernet port and USB.

Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index ae38ba0dc..75f874e8b 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -118,6 +118,7 @@ properties:
               - intel,socfpga-agilex5-socdk-modular
               - intel,socfpga-agilex5-socdk-nand
               - intel,socfpga-agilex5-socdk-tsn-cfg2
+              - terasic,de25-nano
           - const: intel,socfpga-agilex5
 
       - description: Agilex72 boards

-- 
2.56.0



