Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFFC606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eygC0uk3;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VmsOqUju
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=; b=eygC0uk3HmG7zn
	bczaz43r3Yp3CPGfmCyHi5ZU8M2KSoIMd8hq5/k12UbPfSXkLnFrvJCmyUb702gQgtD1L6/0PU2wm
	QEC8h50kX7ETyFIak0xc7HUeZshXWkk8Bv3/DLoG5JgTeaOjmLiFavOsjaI2KquNLKrTZrM91FsLC
	qqrgkoQ+e+G5UC2tBFeOcuVpuGA17sdfZAGZftr9sSRtDnDmxUbum2t+ZBx149Ri34ESJg6lu5Sxm
	iVuZ7XEoQ4FXWVPpjsk0JoZpFxAXPpLf8n6TT7dqLBxuyHBr6lI4PXqXSjmnPJ5w/JyazJjIFucDZ
	8/NpSFKKQKA872Sszh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZl-0000000DSk5-3TUO;
	Fri, 13 Nov 2026 15:52:29 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtZf-0000000DSfy-0Krn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:52:25 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-980c4258105so1658232241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 07:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585142; x=1795189942; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
        b=VmsOqUjuaO6HF61Q1T0HjqHKWhpsUmOJUfUmdUAEDohmYdmpeqHfdGZP9kLMXAQwWd
         k66/lseqw5V+QeNjBw0/u2OMhANdevq3nZ0K/9vYv5/B4kycyonGJjGiu0HBXH0niP61
         tg4llOduyG6BRlja+iKr79WD53bBvxCkS9Fo+TuN+gHcCNLq+NB4dGfx91GWUwSZfs8f
         KeiJKjxbVSaR1NS7nBZLPgJ012OCcJBWIwILwQdxHIL/G8NLXVqBeiuFI2GthZs2yILO
         no2qA4wBjEAHhfdZlPX4iBfZpDol7Juqgddh9YYmVEPe0E1rH1z/Q+svZIn64tI4mxNl
         hPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585142; x=1795189942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4Kob2gk2RGrwhPW94g+FkLDl6/7shaw/mXXHVd5Qk0=;
        b=FiFXbOAi+Gevg6uSZqD3LtD59Lz+JuwBhMQ2jzENweBhZTNd+pb45w15hH1MQMkx/Y
         QAohBW4toZxw3yLta0VHMWNVO2R8wivhH8LBzxR3haAANzJD2LJfPqecYfuZ2gzQLG+5
         cqe+fPHqR/AduQJZeqXY/VxjQ9Kb10Kr3EFrk2elicIl8/x9FhsxKpXc4viPZrJ4h9wu
         e+QMVnGTM69F5h0Mh+XLt3mkmVVNlpD4J9eHDBZGFN5Mvn5VxbEdVdS5oIGQC21D8+7n
         oJhmsg9eQzeD3JMxfaLjT7hk/absPX7tUkBXAALuiWtZbQAIPK/embfh1s3gyMhnjR8A
         fJDQ==
X-Forwarded-Encrypted: i=1; AL+hErHLUofBcqMNiM8x+1xcOdkg/iUar1t9fawxKT/vZ3lUAkFfOEwgm595mz29nmtdNqUzhJKHHXDKHF3f4XZ9V5SY@lists.infradead.org
X-Gm-Message-State: APuU4Z/xM55NdOmpwxA6G3QniKK9BJd3MCqaiDSWRZAuKGCBuFYtdvtO
	GGBJFcMKQrqPagTrJDV41bMqjEbHmfkg3bmNoaIAfhYMxdF8yn0zBS14
X-Gm-Gg: AYBFou1LEXULzOIzgog1Vn/VPuCnpTIZUNjonNk0ED3AdHyYlMnQnXua4ChmqT0HV6K
	niQsBCGwcBIdGrIlyQRzwJQ7C30XEjjO0MJZ5OEDv/OlpH+rWW1uwJhWrLvMZy1r5RDmov6li1g
	z3tu6A14DHSeWMHuU+MuKo1g6zOk1xcLvExLO3XUxKhWXkbONLP25ZcmSRm+HAObit7RPNrjYQF
	EgZH/Zuy2wviVvnOvRmlVQuqGmmn7/Aa1EgQSoCglK26zYA3Mz2ulL+rMI112ug5k/2oD7kxj86
	Lr0GkgE9+gztzXrgz5LJP9ZkJjogVEZK+cvPvQt306Ki9SPPG/rjZXrziAC7e6Gxsc/ifvWkfP+
	Xo1niY3ENPS6ZAlLFr3rWSaB4TM8H6b689quoV58097kvzISM7mwptB6fkWSkOwG60MgIxIGMbC
	Be4Cfo+qxP9hNRypyMzsJiDZ2p+2c9GUxqq73zzx/duOPFJdDEp0pv/XAbExXne5yZz1Z9cv5WQ
	S0UFVhE2T4m+tYX+/S4X9RZygI9k8YGt/fWRhTJKnwLLu3cWvleEbZXug4MTvLylQuIPO1aj/EI
	aajm+Duor2Tfv3Woq6KcxU4pqDfYzxDo
X-Received: by 2002:a05:6102:3f92:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d64d7b3c04mr1034478137.21.1794585141712;
        Fri, 13 Nov 2026 07:52:21 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:21 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 13 Nov 2026 12:51:14 -0300
Subject: [PATCH v2 3/6] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-3-327f5d37a9c5@toradex.com>
References: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
In-Reply-To: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=1182;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ACMvTzpi3rzHKOD3OMtDyhYbpZE8JqAqCI1yxB7JH0w=;
 b=HoglfcWoz04OuPV1Vqs6i563kJXTViuwqXiS/eO2JdpSsEGKBUKtC3UYpYkiHWO3E1ZIQKdt+
 ldKgsbBl3/UAFWUXAlzaLfYPZA21o510HWbuOJ6lbP7HRwY//8EaqMI
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_075224_043181_135A6B1D 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c8..c28d63293149b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0


