Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB460A381F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M+CbyhXq;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GqM9DJSF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NjyFM1i2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TJKemrzXK1q+mQp0AASaxKgzFL0wc+OvZ98MS05tDK0=; b=M+CbyhXqj3zphV
	9GMeA5Ux5JY3flCQqBXi2PKV63OrTNf0QxuanaNZHj6rtQCNOhRoqcVeLDOsn5Y6LXunr301hWNJ8
	k/5Q0VyVeOUqbN7uuyLvmdulnUSI7lNivnm+Wy3nv5WTfOqC6K48vusOcdkPfke61hwvqpcUEMKxM
	58waj0fLwgsRSB8roYppL1D7R6rqGsdVT7sSBva6jcxq52hEwXuOidTIjoV8bDNJi8lwDk1xV9dGR
	79d+HNhcVcxX952RCSKyn4GcZ6wkOg+A5krbg/fC7n2CZB3HoJmPmT7tPCHNKppQUw6vC5PW67MYC
	DVYiJG1vJQ3Jcy4yQmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoeN-00000004W75-3tCC;
	Tue, 10 Nov 2026 16:24:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQodz-00000004VnK-0skw;
	Tue, 10 Nov 2026 16:24:26 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794327861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJKemrzXK1q+mQp0AASaxKgzFL0wc+OvZ98MS05tDK0=;
	b=GqM9DJSFVl+ZoZFqnw+dkl0tThH/3AKJYMv4RQ4O8tZglMGEi3aYowkJhejVRH8qyYVJBc
	rJrzP28t79/8pxA1lwxIDibiIP6nIUBexOcm6T/Ls96s4CM/hG3vtneND7aZVoo/Zu1/9t
	RTlxjQ2q9jMDoNE6LSX903nFuhFYjFN1KIrha3QPGeNrP3Fx+xLuzgj1sAVKp/6it8Uut5
	0Zjyq9XOvSoHvF4jFfIQLqUF7T7iBG1atgO7VoJqX4LoD8kvEoKaQ0bP17UuibVKqL37DT
	HTtBvJ4Bce2cqMrPejljx1jsr8ZVI7TC2HL1xzAIDiv9hHpttgn5ynZSQnBDiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794327861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJKemrzXK1q+mQp0AASaxKgzFL0wc+OvZ98MS05tDK0=;
	b=NjyFM1i2tJS6CsEWtKuvl7/86vdQGqhGnMQ8Ox5Vv4jCLINtkX9ixDrNh0hG5NK6w+Qess
	jmT2YDPaWdVP9oDg==
Date: Tue, 10 Nov 2026 17:24:08 +0100
Subject: [PATCH v7 07/11] dt-bindings: raspberrypi,bcm2835-firmware: Drop
 unnecessary select
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-otp-driver-v7-7-2345d0ee65f0@linutronix.de>
References: <20261110-rpi-otp-driver-v7-0-2345d0ee65f0@linutronix.de>
In-Reply-To: <20261110-rpi-otp-driver-v7-0-2345d0ee65f0@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794327856; l=1090;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=Racxfoc4BFZdJxwpm7i43GQXuCiRduffKpGtvxfjlFg=;
 b=ijU/2P97KgBOLA9w+pE5519vPJbJzb8Qn1TKF+/9dTTmYNCBFRRHfsOxn1ASykZtKQP8EFXa3
 qkvC2PbgXMHA/3yJ2Sz3i0t/MYB5yyyX3DtEiwyqk6IxnR6SLqCQ80m
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_082423_530952_77C64723 
X-CRM114-Status: UNSURE (   6.72  )
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

The "select" in schema is not necessary anymore since dtschema drops
simple-mfd when constructing the select/filter query for schemas with
compatibles.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml           | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 9519157006b65..02b5b9b480756 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -10,15 +10,6 @@ maintainers:
   - Eric Anholt <eric@anholt.net>
   - Stefan Wahren <wahrenst@gmx.net>
 
-select:
-  properties:
-    compatible:
-      contains:
-        const: raspberrypi,bcm2835-firmware
-
-  required:
-    - compatible
-
 properties:
   compatible:
     oneOf:

-- 
2.47.3


