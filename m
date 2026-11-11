Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F7606A880
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 20:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tq0eHKI7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TzBhbDBb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=; b=tq0eHKI78oiRTk
	A1q8vtHOEDcb8BYCNQcNCIw9gsy+hFt7jlhForxbi2u1uQUZOS1C77kLEBwyBHzHdZFC4NFr3q4ED
	k9YbOPZl9o0NgU3ZQOtS5A3X6Xvl3M/m1lHrMoWUVkrN9EDCo3L/dbVQVCvZq8kaLZ4T3IG7mAE3u
	9l3GRi0OnUEQMwNJanp7ehVKFZXoqaPny2S7TtDOjm0hptp4eaRI1gjX7wowoFYTyd+vFPGhOqPWq
	L7Q2Yz1ESV4oXNpnVYoGZcDJwED8DJuWwxH/RfEAlypxAvpvuip3fRhh7bOsV7IyvDxPGi2kUmb0w
	EgNO9oXGvTkV+gD/eIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRErO-00000007cRI-1JsW;
	Wed, 11 Nov 2026 20:23:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRErH-00000007cOG-3qYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 20:23:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-491846221ffso2517760f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428630; x=1795033430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
        b=TzBhbDBbQn3TaeFnEQcM9KuaWAapv2z6Gr5dB9FJqLw0Rg08nUhmyy5OJeKaQ3IKrA
         Q6XXIsQXairw05KAK7Fx9dzq6SAckX+Ih4mF+89K35qDBrq2lyQvIXc57aIMhabLLsyG
         fN2Gu/61zQlyAbjpDusuHS94e9culUBrx78blKzC6ur9NbnZPgob+VvqZ+3u2FEVct4m
         fXAlBJn5elDtow8kHaUIAzK4nqhpcm0R/3im6nSvFbLa4IW+3t1L0+UHglUI2vJPAKfo
         a6UtGUG3VNxLneIf4yDRLvA6LtZeNkmHh/M48W85MYR0F3O2F3eZvc1bah2luenApc66
         grXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428630; x=1795033430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nAJpmYdLSgdSm/NN0lcHuxpyLL5jp+OxMh8y+0EDcs=;
        b=fx9riLMnmsXUwRhZyVLa57Avq+e+YBdo5S1oX+ETt0UBf0goHEIenmg/JUG+cWTqAI
         H8P2k8x54HYdKY0DRbpT56rvFJN2X5FLsA0xwghSfz8bQZAJxhYRq4CP6Ya/SZ71QXP0
         vCOSN9cj1TfdpuUNhdttBPYyXrtBU5um4qZwRJ7/SSx1tS32sTLxCeg3GDcUXxxg5xD9
         Tlq2lbkLry3zt/1jodNG7Rpqn377ptwSbtASqoz5GRAk8LjBw6qheCVaV2MzHyx/FV5c
         xqKG7QXIAcBRwGS4lX5XS9hflR+4RD/cBKaQ8AjLvK94AjewRF0jFsDVWn4YCrpvQ80U
         s/RQ==
X-Forwarded-Encrypted: i=1; AL+hErF9wg3PGGCbg3xTy7O7tfjj1w2mcfeFGO2xwm9qhf0Jf4ONACN4FUe2qgKObmLyXoeTcx3FPkJUMpTJDiaZax+q@lists.infradead.org
X-Gm-Message-State: APuU4Z/u7Zs1xLGO2ysZb/Al0I3cv8zlovucwAZET9Ur3uJDp1Z3dtxA
	8B0XNZsbpoTC6ZO68lkDc3vdaVlZTNbFN8Tx9k/ZUa/S4yh4k4vRlMqZ
X-Gm-Gg: AYBFou17UGMWsVIAjV/boCesbIcAJmlhIbNqqbW5r/BNV+Zx7uLZ+PrY0eExfiyHnE7
	RFyDu6b6Vx8hh3Gwqyuv/AniI7TjwvBQa6NMWUWL9k9CaNlAE6StXl236PlW4jS0vC+5CoxUQJY
	M9qTaAjeDuLNSBrBQI7NSm2pTI6ryD6XHqX3pvpVKv1j21ZTIlpOMC8jjqedykYMP1dyG2ll7ex
	aibRLDPo51VLtloQB0CNiqvE3vIh7A/NbsuAuRxf6BBMYVp2Nbrjcadw9b06ah/J8ZZ9ZqQmsbk
	ZLX1H2jK6pmDKRHui/x+Y97geCPgeKkew1MM/mBrsDMDs8FQ8OfBXdQA5/u1X7DOparTOYIoLQR
	6egpzhgeuueb5Fd0SYmizLztA+Vdc2Gcsqc+zXGsRmG7EokGSP5k165hYa9HJivnkk1yCARTF1R
	Paif9OjuYopoCG9IMQLoRweq/Y3IaJQLicxB6ZbkhxxWRU36zk/t0GjeLj11nbRZLJApfGZt1Mr
	XcfjjMHJmbTGbCFkXVF1bwQXWd6WEgW3sRV3UuE4inWn1lBVb5knJ8lnfNZGkUoxQyfhA1b1dFU
	Vg3xyVzqV/ZRx98xTom1ZXe5hpnmJCCO15yzjTbXv0ys6a5zZ3YBMjb5PAa/mJQJkaemEfgCHuc
	Zh4HUSipYj1NBEdVjjMNrMCeDZuWG46akJgMP4U113V51M1LQg/C6k1I=
X-Received: by 2002:a05:6000:40e1:b0:48d:ed0a:e064 with SMTP id ffacd0b85a97d-499c64fd304mr6044596f8f.24.1794428629757;
        Wed, 11 Nov 2026 12:23:49 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:49 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
Date: Wed, 11 Nov 2026 21:23:10 +0100
Message-ID: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794420001.git.stefano.r@variscite.com>
References: <cover.1794420001.git.stefano.r@variscite.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_122351_975700_438E4D29 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefano Radaelli <stefano.r@variscite.com>

Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
and its Echo development board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - No changes.

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d0126f54b387..397e1cae92d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,12 @@ properties:
           - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
           - const: fsl,imx8mp
 
+      - description: Variscite VAR-SMARC-MX8M Plus based boards
+        items:
+          - const: variscite,var-smarc-mx8mp-echo
+          - const: variscite,var-smarc-mx8mp
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3


