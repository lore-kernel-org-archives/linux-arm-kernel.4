Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B2F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gza/QSi0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h+a+DTQ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=; b=Gza/QSi0fzXxHB
	EIGybZ4c+oVTyu4Bppz/UEAAERw4w8Qw21sJNxv5+AbNHND+lS/KVgWfq6vIOe1NSamDiyZ6Iab4M
	VL8GB+UXw71K6hJ7xI0sBy4OZeLZ3MTFtQ/Q+blKxFWsO4o1xfiEAkwLC213+crJvuGrtoCQqDLy+
	Ldln3OlX2RkQB+nUNqW2KWrfgHEk3awGy99roXcR3GQc6JBn5Ipi7hjjsRLrgUpfmtxxLqlvY+HxI
	Ea7W44u+q+v+Z3yJN7wSlNv3MimKelDNIOLkXnqvyhV8KZxfip9tH42c4DOE4pVEAqhENvB2B9PZH
	OfdvydtR1r0YBsyhQYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWs-00000007lYo-2MH3;
	Wed, 18 Nov 2026 05:48:22 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYWq-00000007lY5-0xGn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:21 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1459788eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980899; x=1795585699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=h+a+DTQ1X3l9vBe2iFtViSnkWCL5AKJCs7y1Rfsb+aL6gtwcbweEQ7Xoh8oLEXLDfj
         WmYH935HFfJaayl3PasEhEBeILm3DZcNiXJlBBFx7nPF4Amh9swV3uYtkvxBcOrbovyo
         ihZyKB19Yurhc8AowVg8DFHUEdhtIyN3I1ii4bhb6eqC5N/Be5OKiAZnjPk4jC3JF0vt
         WBXDmvGbVQZoUpSlwmqrB3Xf06s7+YUWYTWv8/TuJKebjf+UkNTg/Kb6Y7zvI/ToeQ/K
         UaRHdv7QMKdEj7PPacsHvM12yuxD1X2W+jnID9NAAzloz3bK1J6w8C6chp5BL27b1shM
         HWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980899; x=1795585699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=FQHU737wdKXMtMSfbzQEiC2AyxmP/mVvg7cdo0ar6bu2ZAQfg8+YEP0ArZX265QM5K
         CoRp2kOfguMUpwNEKUVPPfIRytuPrWq8pcjYTSiEPxHK/B2yLreQEl6tKyNVpgb2B8oL
         Ri6j1Gb94UpFBtfTghzt+w5h8atWtEIX3Ni/KUvB1pgB8z+VZxoCeFZ9sDPWhzByVy40
         jDqihdVp2PSL4OR/MIZnA/Akt5dQ/YpVppUijAjggxaBqLIBFpPDozu6tHzb64aq60Fa
         rkcoNVvPJcFJEOKa5hOMFHWiCVWLwYts98cMH2TEGSaU0gSyYuhKMsOIK1ZpStUv7Wva
         Pbeg==
X-Forwarded-Encrypted: i=1; AL+hErHz6pnVhL6z7SNrndupNJbt0Ji3tRgAljfEwzaCPHhn/bLFntO0bqPsgqNHX+9wv7gieUX5POKYgWDfCUUmhy7d@lists.infradead.org
X-Gm-Message-State: APuU4Z/I915D7Z1K8zfzpbd7NcHW4gln+eA6QWA/EH93C3tsHsqDwvFs
	V5amUfu+rOe/8Lg+ixEJ8nKnel5yZrijcjyRy6y62JAlY6P0g5XeV43R
X-Gm-Gg: AZFdTZcC2OIjTfLnxUEMD93XfSJNxg8EJj4Z1iv6h4N84SJqIoba30mFGY+3SPofAE0
	2PSXFHFrCjn2VRZorNZOd22Lzu5WXFPK0TpyIpRL3Wo2ryuQz1FMELqo4SvJM1Z8At4H8Giv7S1
	R2y2nOFV5rOSg0MpyVWyTGH6KKoZVxb53TXOALsZcKCFQrdrq5A52HaBTZDzcOGoo0KCDham7ce
	5WMKcnLWodQV6igaR6gRfbYkpY0VfzOoRKKN4QQy/KjewU4s/pFlc1GaSS8zGcHftFAc4I/BLEV
	PI1Wczk2le9Dt0dAKlbWhiOMZbNfGSCmYycU5TVabcxQ3uhS77YsEy/jfylG8ZgldFtstJ2sYHm
	U4SUVUyElGis+KkOCmXkT1Tvg6vQkrG+EEDQosxD51hYfynmGm5ATCw49cGszXCum1LGSqMQ6ZI
	dcIdT3OX7Jp1u+Pc6cFguzBkXkdZEG40tVyW0VzDwBoyLIoaXVqvPS5MkVAJM+cOqph4XbUCROd
	aqJKm4TfWcx5Sr4FeBW/sz/f4J84awQZaS0Q7EL97Hm/gpzrQSEU2hj2e7dwWBD4iEr3Iqh89/y
	ghhh6r+oFHVnlwC64xmKMTXr9youuXBcnqj4zG01gM1v3U6SqxOmMLAihHM+dtskhIAvzNCbiWQ
	ATHOYvJl3zMdlhQ7lxHtoCGUBEYauL2X7MyZYIZKYPSnmWxKoDUUpPzoAt0VvCg35XXAu+gVf99
	r0lUs=
X-Received: by 2002:a05:7300:8246:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3827aed49a7mr1623742eec.0.1794980899391;
        Tue, 17 Nov 2026 21:48:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:18 -0800 (PST)
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
Subject: [PATCH 01/17] ARM: dts: BCM5301X: AC56U: specify switch
Date: Tue, 17 Nov 2026 21:47:42 -0800
Message-ID: <20261118054758.132233-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214820_268985_F9C2A91C 
X-CRM114-Status: UNSURE (   9.36  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index 708599f8c4be..574fc4f76e75 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -106,3 +106,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
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


