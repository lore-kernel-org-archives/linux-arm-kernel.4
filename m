Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=um8cUaP+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NMZxXPj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=; b=um8cUaP+OviyLz
	fPcDBFbiEkETWVmN0YZ7G+CZwY2U4bvlv4r9gFdukciftex+YV+WSi46BHSNPc9CDbvrI/1NlHh5r
	zYKY8zdgdLJx7QmSU8VGGIWM8fQIfRxIa7uV3mkSkAMd+NeNjZom4vqYqt1k1pQJ29xMY7A3Wnfen
	SeBVoU7wlncMtTFtFP4ZKTGi5ATOyefeWOAGvbe2mI1rhIP/8Y6Y4nuaVdTcYMcPuqnufAXGZIckw
	mHHbYJIiuyqCp0vyln+VXabpDzkk7APGZzr0SOQTOToTfSLQqOKZdb06FEXutpHQZLpPxm5Z5qign
	Z3O2z3Z2LY+PhS+P1P7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvX-0000000BFfE-3j43;
	Thu, 19 Nov 2026 08:55:31 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvO-0000000BFZZ-1GSO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:23 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-55c38cdd5b7so24985161cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078521; x=1795683321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=0NMZxXPj2EvIAYXNCVKTWsRqg7BT5xJfpTUwtintQbHzJGzgwssqqr6XqOfjnmrXBh
         hTHxvr/A7dyY7x7m0EKbqLJNmdID58yG7jhtZu7MkIiCfG1RclzEDWxIg8utqHXUEPq4
         y5bgB87mYKMMTE7WdY84dy/UWlxSm8I4A/VoR5fuj8nARhUAhcpkWeAZBoqpAoWXB/5t
         13cS3Rw22UZwENA3qTV4GQHJW1sQ1MeO215pKL5kRtIqmQl/GSeVC5EdEpawJqrN/M9D
         6QDMkiwI2Z68+MHXGNRe3n3h2G9LAilwJ/Mc7oPtDCsXB5TAKEVHUzdO9YnoAN20zkKa
         ABjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078521; x=1795683321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=TXl6Kuve0CUSOriqQS3Ln4EZNTx2XcXpVWvCzaOZBSj9R42y0t0HYZtRRPED8jjsh5
         xGX4Jamx3GVJe8oEEcRT7E4i8PAeWqHVUxWPdl7euTRPHPAm9WbpJM96x6i2thhTNnc/
         B+Xc/TFwWo45Aenld8ATLG5G3I/jGRkYUDJCWMIhKYQXNZFUijfZY0AVia9PUFcnQDfx
         j9R64ncWtE0tkBN6lsFdaxg4atL5zNciEZkjew1L0bgIxlBmkpsN9pI9C2ziIkiH/Pk4
         cwvFPiEU+yYFv1PyHIZ7VjmJJUV3qrLK5xu//nttd9kJchdnxSfAJHV2syQIL6/dGlED
         zn9Q==
X-Forwarded-Encrypted: i=1; AL+hErGIr3ZakxWdLtlsW6REhaZwuTZKp8TisTDtswPysBl5CnF38ILZyIA8/njkWu+Zwam+4C5XqZNayLvMAc4GRJeg@lists.infradead.org
X-Gm-Message-State: APuU4Z/NaMbknHySJnLmOn6BGZC2z/75gu7tfe0qVr9T29EcDDGXOMHP
	GIiklY87P0r5Nw0qLRd83vZLDH4WHpaPTbupyNJBBH9uDyKVFi9RCIII
X-Gm-Gg: AYBFou3SGe8VQCFR7nHlchfMrXvsfqYYzEv1U/RXF/HqT6fHe+0T1cge5tYWiNfWhDA
	BmNT+9oTiOJyawPiEt+aBcc9znexuDm4Ge2JwoxZuDnQs3egvPN8/1QCAumkY1IYoOs+loXOeJ1
	D0OUwrKbrZiRD8Ev6ymCH2wN4J1nmz0tLdHJmzcsMeXPJCt9Z73kzB8iJvE+pxvurs5PNY3rlRp
	k6cZwmiXQyfeDXDesz8cOdvkM7W/MeUDM8E0N+HanmfGXix0NJnE6PZGOAqJxYPsxFS6VwBzg3s
	ZXX6j2IWtN8oUR0j29f7EhN/mFnnixMY9vSBLyH+juUBY/4TTBlUHLs+bxt05VOx6NKt+sdx68d
	735p0NuQ3TKzjokUD7OjB5KA2k5rfR2hezeVyxxowkLL1AW9oJIzquyv8+gOEF7VfFoZLHYL9i9
	WwobnBVH+KBYyaF8JbIx6kU6LxEZphDf89Ft1vuWHUsO60JvYFvT3zkaBEHwSyZG1pktWinmZkw
	H7o3zX2A5H/j8psiS9CLjtnuF2P2AE7mmvH7xTIJ7v5UrBe82TxvyceJkuNOj+pRm5EcaQ6EO2T
	gXH0KXiVYber+MSI0xffhevZfs1kAG5bEH5pEev3NChHsI7lZ6gDuL/OgS4WvfrSMZOptSb7UNU
	Sz6chzKYYXiri1Mj5gVzDFKBWXcNvE3MiTaDOnwLBIgR/1ReVDY7bT1otlTETPK9nGrI7nvLYTF
	ctXbYwWyUz89cqg/n6fAVhrkjd
X-Received: by 2002:a05:622a:991:b0:536:8e69:8fe6 with SMTP id d75a77b69052e-55d5a572c53mr89110101cf.14.1795078521191;
        Thu, 19 Nov 2026 00:55:21 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:20 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 05/22] ARM: dts: BCM5301X: EA6300: set gmac2 MAC address from nvram
Date: Thu, 19 Nov 2026 00:54:35 -0800
Message-ID: <20261119085452.75708-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005522_347396_F69A53CB 
X-CRM114-Status: GOOD (  11.45  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the et0macaddr nvram cell and assign it to gmac2, so the MAC
address doesn't have to be set from userspace.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 03d5546a147c..f8dd08cc7cca 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -24,6 +24,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -50,3 +54,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1


