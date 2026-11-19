Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82691606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nms1A8Vs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5vEdQcU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=; b=Nms1A8VsFmqaEk
	FBzpLKQCPOMbYAgBtRyFzz6R5c8Z6e34QrWPbd+LK5lvC4uH1MAw1asiJ3hs/C4G8qLxMJd5qYOO3
	zavF6ZfVL/naPqOHpYQTthwcgji5bg7RdAE/wdPry2OZY4lAmpCiFLoXQCSMITFpSsVfzKHY1VBTM
	pk7vTvJmjB/b5UD21cgKfd9zjETWvnxtu+at1ZFhEltX8RIMdatAQL6YVfD7LQ/7fRiqHLSusr36G
	I4g1Bn3Bnl304J1cUX/HsjUyVnmJGZyFQZ/6mGWBlAtuiIaLM2JVh41xy0zSQEmLRQhe9J2O2EKHr
	gSX4gFzTY26eI/C6d/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvX-0000000BFeq-31FE;
	Thu, 19 Nov 2026 08:55:31 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvM-0000000BFYa-3HNK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:21 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-53664b4860bso20589611cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078519; x=1795683319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=Y5vEdQcUbHz5nNEODHod5Cn65KDA2B/NCIYgKgu0/DVOar7uWBewmnlA3rxLidouSy
         yRkmNOgr15OTZDHCVN4OjCb+LfhhNerpAIwp7HC0PJ/CzQpqY1MnyKNlC4e7oMIyCJEe
         mVHqA52sKuAhjRR96ZUqppUkXZw1WqDfiJ0dW5hXHj6HkUi7cziF+JUP2rYulZQ1z7Y6
         It/0z9fPK9LArhONXEo+9LMSY+hS2bnIGTVkiYtZkUT4H33pVjJ+f+94xPRUj069AJbT
         vzOGlHgC7+FxQXctNmlZWToR/YWacsCuTVzkwlTctwB245uwDzwSFeSUZ60ydXoohCkS
         UWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078519; x=1795683319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVGSXsSTo55Wg6jc3sZandzP2wfVXmFm/f8qxoKsQmE=;
        b=wz/OhygS9YiWFXFKdDJRZWkkprwbdvPGGzxt7xcnLMoNyoKXEUZX9XoMcAE2TUq5R3
         7ccocgm6dBrC7Iv+4yFV/CLLgVuKuytppZerD3eeyDHOkYKNlC7H1G2UCQ/+fyl/Eeh6
         WGAViC1rN0S5ccas9r4bVPR1kWrTXGrfhTUyx1Zxp3DZ/sjR+XZ/Nl4yKfVDC4yUnB31
         btswQncvqZ1uyN7MUjVfUDMlOl56HajzWy54Wu5NEVrHJV6e9UoSi3e3fzgW+PqqPYIG
         jnPjNo/THjTMs0irXD0O+w43n/0svOAy5wf9l0f0/ORzqODFzBs3Gna3Y9xwg8ew5OjT
         7XzQ==
X-Forwarded-Encrypted: i=1; AL+hErHRpqtK4wFGjnQx/RXeoUKQrIR74dIhFlSpjKRBbv1myPUM91YYAGxopO/EuZYOruYNhIupspH8iGqKs4RD1nlx@lists.infradead.org
X-Gm-Message-State: APuU4Z9qmiGwsIHAJCcXzkWK0JXYggbIbjKXdh8/MyG4b1ij+Vy555PF
	+VkqYZNpapSuFdaZuhbXwZBZwFonLQo2nyeNcsmAWAb8H/A/U6Tm1Ywk
X-Gm-Gg: AYBFou1i4nTRCIlWth+LdwWze0gfzlQuf8+h/3UPslmLvBWYW0zNEY9UU3kk6STkQzT
	Vaa234cp5vvHBDyKSDfs2sHkJj9cFR3Eu0K+HqGM64yaCewE1TAiPki77Vb7uuM0E8tSO02HPf6
	AtuOUIQx7h5Y3doo2HW1ZCBtiOSpk/RZfBVO6Zkyk2Pn85nvS2nU6tNAZvB2xWGWh114vy/+B+y
	CDMHYK5rVG9O1Y1p1NwHS6u0eJE7cbgX3YPxuhrYcUV+OWU8ncmQvGZJtStUF65nCF4kN8scJDw
	OSnPfIV9VQlmmGyWq9Dmos2NL5dmbYeKmIPmTNBomAH+2hI+PaBwVALtvu7rOLrqMsnGxOhf0Qw
	oHEThfw9f2cIyepqX5Q9iXmsd/zbf3JNPWD+cXK+S/0DxOY7ft5VNlDKQ6N7H/8bEKuu04msHoG
	7icA8HbUy0pIBCXSPAI8FN7+QvbmxbmH0+yHkOInIP+J05YioBj8ZAuFDApgyByBK7ftJGit6ol
	ffUszc/jHsNFMxVRuRDrX1xmzVO0IQDetJxmBCwC38d0EkAmqxA8sNiUGSSVCuW+AFEf2DfT08k
	6+A5d32xAfoMsqSv98FuWytEz2JA91wZMIae43KvfXpd2EyfJOzjpWBZTmDAHZ/TEM8I64X6x7e
	Q9aAxnv7ScdYFKRhNLDmHb6lxhT4dI1tV11bGa3kUpUxi7PhAaNHTfERAZhYQ7YxPTXtu0mDqgf
	mxLw==
X-Received: by 2002:ac8:5d8a:0:b0:537:af9b:c73 with SMTP id d75a77b69052e-55d5a77052cmr82666381cf.55.1795078519274;
        Thu, 19 Nov 2026 00:55:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:18 -0800 (PST)
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
Subject: [PATCH v2 04/22] ARM: dts: BCM5301X: R7000: specify switch
Date: Thu, 19 Nov 2026 00:54:34 -0800
Message-ID: <20261119085452.75708-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005520_824717_403D2ECF 
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
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 6ea845f3ac1d..65affe615bb8 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -118,3 +118,40 @@ &gmac2 {
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


