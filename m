Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE3606A894
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4JWyav/T;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=lDd+5sic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=; b=4JWyav/Ttt9nUEZ11h+ECQSNGF
	2u2xAymnPJP6A9vgXpqTU7RLEcQUNjhQ1dS+bCBhgTxjNIuPKxghat8vlGF3LLHWdJe2EdbCq9cPk
	6MFj+DDa0ckRNo1zBy2KIRTX1vp6RIbrxWP5ih0Momu2DeJt/sKbsDilE2iQZPNfymY9vivRG6zEB
	b6qA0N5u+wXQNRvA76BVeTjqocg06krroLHGzb/cTaZlriANEuRF3Ubd+Yx+mgMGtHC32I//pDO3h
	C7qDLFIdpe1/X5+wqaLwo1giFajYNPxQ0vQWQLqmnxO1vCUSDSWKncBBK0tzIzEMJlFU989lBOgki
	Qlak2YGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAzz-000000079lm-0LyW;
	Wed, 11 Nov 2026 16:16:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAzw-000000079l7-3lNq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:16:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32057525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413791; x=1795018591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=lDd+5sicZfo58XoTq+KJESFySIMgChWjy0PsdsRN14RZ7WcvJNGbDN7ul0+RI3/IpK
         AWcoBVKWYTnwrYvV20IC6XnQvjxUqaIzrifd/pzVguJjuvtGpstWDGAyPvu9GPb7e1Te
         9zCt54nuSjw/I3lJBDHgCaB2D+WJ648GebW/4Pz9CerYS9EYQNCjP0GsHT9Z9WDso4u5
         12Oc/5xm6kH/gUvA0l7VsvoWG7nAGTP5yxnERT3j7RdTNmwgTroq4aYUJVFPMkDZnmFM
         IszI4WYDeit61MW7FARJgY1/dF9xGq4tQ8VGTQki+5sqX3s1GlpNRS+paUSRtgV3XbxN
         RT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413791; x=1795018591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=HWtkwsRxg8EDzHwJsoFaNP8pYecRTxPI3tHOHWTXNBlTm9wBokEtbl8r/gzsYnVrUa
         ECiAcJaABq5SF5sVTIVP1+K0dGSBC6M/67Hpi0nGE96vvzOEsq97UdAx4dihFm452lJv
         oVJILe3dkzYv5FO+hPugu9UfCgFtkMUTo+6K3i7U5fxconq7NTQUTtxn3LX5GKRpICEr
         HbmLACup/5FrUAg6Y5errDpiqRTNthR1EzR72qi63TEqxgHjRz3JwLv3f/VRkeh2oG0c
         GC1sj70+4wDlnGzQTI/MXEG6jY0+bC6Q+5yZVSps9YG812ckqY3FL5/NeQ2aU5+n8hry
         tGBw==
X-Forwarded-Encrypted: i=1; AL+hErH2/H2stndQwPEHBbuz8ZfpAcf7T+6aJMcNLxzeijPfmE4pHiSM0PBqAZesvVcf9gY6K91ZrJB/gdiB7ZBYKS41@lists.infradead.org
X-Gm-Message-State: APuU4Z/7gdrir5cXqxBk/kcN7nCPc77RxPJV//4A6SbPeZdoDjpic6Fr
	q3gD95XMOxLS+gfhbzml2+iLt9awMzdF4VPoeJzujiONOEQYUj9MKQbvh9eEzXPignQ=
X-Gm-Gg: AYBFou2O8MIkIwzenvN8RxB/8ezCMf8AdqpTMKz2g/T+eGVb+Etoz04RQ9ap9/UwqVW
	2FpEQYXfbFUJ4ULlVyBvrTteKoRx+Yag5tI5SWyTjhGY5a8kQw0aNeegT4zniIki7nspLoODEZB
	BEaXfwX/45RGBD3OvZUtV9KQ9cqjLdui9FtjEjih349I6svXSla99Ex5ogcbeWejxvll05dpNwB
	MtpX3UFm+nNAONG6HtH6YvWQuUhhEFUuSwapYSvGWFUYnAL1q9ukadZJcg4kaYHIcUVZgFli6Pr
	sX8xEcojcrZ74g4Arz+YOopT5oC6q92NJ+ibGA+ekZYd5QzFF1M0kDE5/r5NliIv0xCCoEeqcvi
	JPVGHe/8+uhHkkNT/r2Nj0G5cC6/sT5N/uXORUeMtP3Zl6KnOfyJ5Ehhs3TPgtBzmkNrv0iuWrX
	6FaqUeVbgejbfC30hOMZsBjgmXfphbm8JQWPUQoau4Ocs9kxA8F9iXtbORjS7dkz56lYDdrPZAP
	Sl3VDFGOrpUN7+sLswUIrYSMxrL7YT881fBYBMmRyOMgVKlnjOANP4eqoETPsAhDRuo8s1GZnnN
	F0OUkVAIrmGfxt/wVDEbcSRFOStMXI70Wr/KtRa55J2JNKteM+oZPVvKytnAWGshPRSThnhDabd
	Rt1pMz6H2bn46ghMH6NoJS4sJV98ghIwP0F/4r/C6iqEUkb7xJW4CMpewOEMTGkLQN0ZTCzmsfl
	rg9y+is5rDHf/+RK+WzJdUz1s=
X-Received: by 2002:a05:600c:4e87:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ba0938ae31mr51209845e9.32.1794413791046;
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:29 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero pulses per revolution
Date: Wed, 11 Nov 2026 17:12:45 +0100
Message-ID: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_081633_017143_3DCE16F6 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

A fan sensor cannot produce zero tachometer pulses per revolution.
Add a minimum of one to the shared fan schema so every user rejects
this invalid value.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- New patch: require at least one pulse per revolution in fan-common.

 Documentation/devicetree/bindings/hwmon/fan-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
index 0fb7380816994..63a369628a3a1 100644
--- a/Documentation/devicetree/bindings/hwmon/fan-common.yaml
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -27,6 +27,7 @@ properties:
     description:
       The number of pulse from fan sensor per revolution.
     $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
     maximum: 4
 
   tach-div:
-- 
2.56.0


