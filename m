Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D90606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fjLYJlxZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQT1P7uL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=; b=fjLYJlxZ5eCgny
	KopCTXn1T17Ewva4sDf+Jo/sWnCZglZuZlZtaeHoYfDJFHX3okHwzxPMd1imdUQIyWsPPfAxkqZ0A
	WwZCxmGQiueEkkWRJQaeINwjezNeL/33pW7GFUMAB+RqGTtwHn43mKHqIAn1XMZLHSNBaQDYC1Qry
	jOme027LNOIdbF4fSv5Fu4LNMlxUS0iFXFMDaT16MWmgk7Vaq5lLsvd9QNj3OvgZxR/flyBSFAnI/
	KAs4qLTWc8l2mJe7pHJ7EnuEPK+lHVXVY2RTlnAvDcrZhdm5Jwv1NCyPNND9gcet1QQTpynH5yErf
	/JOB/Nf93KL/XuReargw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvX-0000000BFe1-1Qw8;
	Thu, 19 Nov 2026 08:55:31 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvI-0000000BFVw-3REl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:17 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-55d30c054dfso21202871cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078515; x=1795683315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=qQT1P7uLzQhOK2JA77g/F+kPbEfLryfmfrl1XU6ZlsQ9qyMbkx+GVUfxdWsTKLEYIj
         fiQ7RBOnaRKLbuNK+4eHEG04NLpeHZ0DYq9AEB3vfk/X8iUOGGjctgc5VT5qIYDeearG
         e4Sdf/dZqd7g8lfmw/7i2tLm4+mMgi+i592UrJrNRr9EpLR0eOcr2Y0UUHvuzjVPShcZ
         ZzCLylPN2SkTJQQAdRaguf5xl9Hq9kRKx+Orz/ehimRFoAT1yoZqnYmK10OjEnxArbYK
         0BTZUAR9gNzHD1UH01WHG0bSgQfi2i87yVEikF9nAnEZKyJNy4o5isS8BuxAR1dD0Pn9
         Obhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078515; x=1795683315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLUi4V8fbL/C8Xzl13pdMh4F659zGn3/FD5OqVdtaac=;
        b=wTbK+1PNfgbepUg+yPppfRgGD/7Dc1RBIGFuF12IscBpmz/kE1bS+iXdhaAxYYc8hv
         OtFS41BoFRV+F4cswZkn8HpSAQJr8DfyoWJUnnfMruxrxm8kfdLMG83oPPsjoA9uUXKH
         TcHp6Cc2ZYvVchwTSoVUXO7aLwVRTkzpRtg4PfIX3VWfZYrvU22xsHmnqm4bQ3sx1L/p
         8pIewTw1M8z98qdGeUJ/A3a8FWyktkKNPd6AKYjXB5zNzdJRtPTDfz9YmYvwwrzsdfmI
         TwCNn8sBptnDoQZma4cUgqIMAjDZR87OXdy1gsG2b/vyxy3iU1814PmeclM5O3pTa+0S
         QHHw==
X-Forwarded-Encrypted: i=1; AL+hErFEiN15XsqXlFzaAFWX2AYCgwih7eTxrz5Z8XND4k/61LTdyKbXHw/0UQ+FkXE5LdrSlUlDgWP8sHnBK/Lj90W+@lists.infradead.org
X-Gm-Message-State: APuU4Z9KIIFFf3fiQPTcm6NfZVV/Bj7t7gVSXdJRtegbPylFkuVSoZZX
	OAAYI6qdrRTLAiXop9KTdGwFPD65QyTd6vvXRJlLtfeayNDl2qMnR21R
X-Gm-Gg: AYBFou3PX3xW6Fqv/iV/DgPI41yto4TTBxCUXeImpmp3Pt33ltiWJeTo9WMcSE/ZcwT
	BmxvMNb2bIazCpI80LCh762Thezupoa6HO6YSs7DdzK9jOTBgkkTfk7xksOTp1m9dxkpv1TR6Ow
	cVwerzd9WesG7j9nIor+/KyiR68KISUSKG8935aWiZlcna964uSKUoB+kAduKIfuBBXM6qNvRTF
	PIhQofhbIQgoTPksveHCw8QnvqpUsyyW1oVsedUaEbA65rLq7YkpKclFNS42nRPVjto3AGO/YQb
	UKJd0K5HwFoe6eWaUdkpm99tIjyR48OEh2Vom7E1rPzokev5BbkB5TFOfnO0WFIl5AMWppzr3xT
	PDS78XeU6rbepRzszrQ4m9S4+GN8sTYWiLp8z+8X6R0/cakUesm4leu345sZ4ooThS67x+5lOlx
	30uhw4Dvb7gnnBVvBXCBuqHgS1qkWesAzLP58bj8aNn03L72KaH3OTUqze40/71ct5FUz6iCVoH
	5gMePPogJ+CCiYYHuEHkr9a93LFV6Pf3jC8xx2hFkX3q1B5e6Pjq8GdoLknhe89aqYmvqnpSw5T
	cEILoMS9ISVbb0t/lD9lnwPUHmtUC+gTdkGU9K9pVGWVO107nWnWrVWETD9cAXPekpOuM8qU7cg
	mkTk0/bKCcVPlHJXK+0XTplZ5rw4R5Fnfrttc5HxwRiLh8kOlxviDWd2EKQFc4PwIAre0pCthFl
	sy1Q==
X-Received: by 2002:ac8:598f:0:b0:55a:5056:d3c1 with SMTP id d75a77b69052e-55d5a57db2dmr88309061cf.13.1795078515418;
        Thu, 19 Nov 2026 00:55:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:15 -0800 (PST)
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
Subject: [PATCH v2 02/22] ARM: dts: BCM5301X: AC68U: specify switch
Date: Thu, 19 Nov 2026 00:54:32 -0800
Message-ID: <20261119085452.75708-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005516_881081_1E5091B7 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 6e82d2af9f1c..0f369c5d6a5c 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
@@ -97,3 +97,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


