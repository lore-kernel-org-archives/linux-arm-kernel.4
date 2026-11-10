Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A907606ED53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vp7GUCRw;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nJNwXkHK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CEGzPwk2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3zMv941SOr8xekXo6fTcnzy/BHJH3qWqyAFRtIyz84M=; b=Vp7GUCRw/5bW1s
	tNUQ/9Sqyg2FuxQAaojHLpaZgNszCCs0nPn2lisdwqg7jJTes2miG3sXfskDl3bdsgkBi3qymDBAg
	EBx+oDRxQ9GgeviXDt3JyZGKTe74mIu7IgLOkq+i+wjz2R+yQfFP/GdSK6AsI8cqYJ1vA9GX90VWA
	ZYiCiPTL9XyHVwJ868saBdVJ/oxKOI1XPt1/wIGZX5k3XCN6r54roDdsPBm1lVed4fX/bWhDmGhHA
	QgnfouclC01YcNytOlcP5YAfd8QN62lmbPS0m1A8FYYToSDemyR/ZBwoRZTlNEGYNThdHjUwfvuRs
	ksZGc8Uw5hn6pYaGTtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSl-00000003wgo-1KtD;
	Tue, 10 Nov 2026 13:00:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSi-00000003wex-2m0h;
	Tue, 10 Nov 2026 13:00:34 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zMv941SOr8xekXo6fTcnzy/BHJH3qWqyAFRtIyz84M=;
	b=nJNwXkHK6aWAwG7hNMuZSOaJeEtc+8K6/+FZ1DxeWWqYE8Fi6QiCjmBPByckwJBfBmOodD
	bDTnHloxmiAWvzBqLWeYwwxdidU2KM0kgHoyB9KQHLbPS+U1xOFxko7HHixeRRSX7RAav0
	xg/sfIVxMYBBHNFQ8gp3gfy0+OMIgUC5FWyy5Ar7t1D/82I8faeh1O8minBwt/lncS2IIv
	/l+YH7Q6YaB68RCAM6eW5GAmLDURAQClQkPdYAYjrFktf6qOBpvVTNY6u1+uTDRqAXGFAW
	Ii96NZ0DV+qwgBa6afsl38wGpyNAldDX56Lfy+0PvbPWLeLlMJ1rxAJawhNbmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zMv941SOr8xekXo6fTcnzy/BHJH3qWqyAFRtIyz84M=;
	b=CEGzPwk2UaIVaZNE6AcGJFmczjwegJpf2M+tZxRblw/zmk7d4D1Ct7jP3ZtYFgXLgcowHw
	va+g/T9ZWRrNFJBQ==
Date: Tue, 10 Nov 2026 14:00:12 +0100
Subject: [PATCH v6 2/5] dt-bindings: raspberrypi,bcm2835-firmware: Include
 'reboot-mode.yaml'
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-tryboot-v6-2-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
In-Reply-To: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=1242;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=fhRlwoURNhKjUwmc6zTXWmbtPey+wbDhPSnSGbef0Xs=;
 b=tcMQeOD7veSQStS4/H8FZmfv5MNZ0e7/VDgB43Ot6i6HFD/MfHP1oMrZnYsJIzJiYzQ3bS1aJ
 u6zPc9T34ONAn2F7e0PEOsyw0Z5zaOTocvZszTgnbziqfeKajoU/ouN
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050032_860777_7BA5CACB 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Raspberry Pi firmware allows to set a reboot mode called tryboot
that allows to try booting from a different partition to allow updating
of the boot partition. Allow reboot mode properties by referencing the
reboot-mode schema. The firmware allows a 32bit value to be sent as
reboot flag so restrict the maxItems to 1.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index dc71fd57834e8..d07e327dd8065 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -138,6 +138,15 @@ properties:
     minimum: 1300
     maximum: 5000
 
+  mode-normal:
+    maxItems: 1
+
+  mode-tryboot:
+    maxItems: 1
+
+allOf:
+  - $ref: /schemas/power/reset/reboot-mode.yaml#
+
 required:
   - compatible
   - mboxes

-- 
2.47.3


