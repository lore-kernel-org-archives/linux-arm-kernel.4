Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20723606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LX8LgTLr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uFUMfXMV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=; b=LX8LgTLrpOjGj8
	TiRjCr2gEWk4g9h9rlw8KtcjIxodEElV54Z95WIf6wkcgAxmKJG/o+Jg32rQS2MRNqi4Inz2dBPsK
	p61zZJyjcthogTysCsTMJm+jbfBrlAfYv2nd89T+7AtoJPZ8QV7Ttx1dqc+JgGwzJqU+9c2RFuuQ0
	WKrYtjHV2+EMrEK4bz0YCHNr6/TJzW7kghmyl7mCMONEi68ODNfLRph1j60TrW/UBYBW15vKE/aZ6
	vYjRKzcTuWftly1JpkZdVFlnjI1q8RPmEeSuipbVnHK7TpjJzZmHO31JYfJGmAEQQDHY1Upth1AFe
	JuvxppUi1ixxnEFF0hzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEW-0000000ELGf-38w9;
	Thu, 26 Nov 2026 19:34:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDx-0000000EKBz-2jXp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so67145695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721620; x=1796326420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=uFUMfXMVbiHgCbN9IEbXXCGFTKuwoq2Srw6pkJaHShJjkLUK9wKi0ozCH30X9PXY/R
         KLTMGDFnn+Iy5ctnW8fc68/kYMfPVptPA4FeLs7NzI9xhsr04ymFzyaU6oJBpVWMJlnd
         5i9Rx5NSWq9VgSbT6mN3lDpq63ytCughuARF9BjXT0PYgz5ZnadGHLHMJU2yrpbGz7AV
         QtGsZ5wyJ8HXaUJG4gC4tPmty3HyguOVoMUyom4/U2orz9R59YqQJiGeM/dINQG/Bfva
         ydRJBKCuqYbwb6E2xWmwlv7cnoo6Ga4dBi8pz3Ax7D+arWwAX3jZnJF4p7AuwwnjzUYv
         /UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721620; x=1796326420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf5GtpRuXRchR2ff5N5v4AswDiRdBOtYpnk/23HLdl0=;
        b=ttHsZTdWsvnTlES9mbVHsGta+h80JGZEoGZhLL7zN7Y/fg2gpDWtC6AnAvsIRcNaOJ
         ibg2o+V9gC1TpU/iD64BUpIpjwXymehfkW4NWfl/eI87V/iZ+ZTEb+cf8b9A7qV/ksnH
         o1mpwwGN0WfCfRZra4SfqZAzzuCdI3Av6aNFlUFkniPAA9SyaQPHB3G6B2zYATYwNR7d
         kmcv8VA2yWZwTqP2Xt9/OArx34JWqavTFdfTWHrAwFE2vWOOKXvHP/4++XBhHOi4+Gby
         CYdPuej3Gn0TU+mb+cdtBTI+xLjXM5G626HHd16bvln054PYl4JFIjuwh3L+TgOwDxCy
         JucQ==
X-Forwarded-Encrypted: i=1; AL+hErFap/PGYEnzshO6XDfx0/O2kOfhg2dH2874U9J/NhqvF0e8qtqTxJKE+Dq3YVjV6p2/avO8oLZt8nxTe52cJGtO@lists.infradead.org
X-Gm-Message-State: APuU4Z/+zyt70Hpejyr5LpEnfHHufUHqtVsOHeDDsvwGkrzI8svkXjrj
	APCugfTTbH96q5v7gmLppAvJFohyoBAYyFrf81pIsg89g9ICWaMP5+aM
X-Gm-Gg: AZFdTZeqlh/WHiQAMqYWR1oUzkfUsc9UloRmuJ6nETSIxue37yOQTXm4qIa0tXhv98+
	mUntr2zIShyusw7cMAVxyUDW/aAh8QImbj9AFz9yca9Go2P3ZAk/V53aybAqq8i5EDR/26Xuo3u
	CnBUgskOV46zcKh2Q8tB52VbGgIcZpUClzVvIKrEuNzoA7A23912PqOtaU1VgUuUFphgmhhUgjl
	qn2mneDNGPqsfnfMGrhe2JYHP3rqT5R5oduGC3JKp2nwEJ/hREG7nK62U30m4K9bTUJ6rDtG7V7
	4O9lUP8gpl8jRII24aoX/jYJBbtGYplv2y8CQbWNQVm2ynsOB4TMujS8bkEJGd3UpHbZorbN6jJ
	9+037hE3ud3ckrEfeG5UIgU3gc6WbTZ0pzLZxrEph1g8rLKXbN2H7VbLVmWZ0QQnonzvjSYEsb/
	zBY/wuZYNmtE/wqXQp8/Im5PSZwQ5Yz1KDb4l2NbirNHqaQS6bdCsKuyKNBUXL/k07Fvhlcuu+d
	ziXaMX7LFgMkdcbaSH+0y6kOWEOfSzuDL2Oa2sm09qJR6wfoVQ+fGZwYt+vqJtSvBloVpEGweHV
	obo6t/LjinmDUKD1H8dlGIbNlTs1tLO3utaU4rQ1pdUaQok=
X-Received: by 2002:a05:600c:1d86:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb8892099amr474464105e9.30.1795721619820;
        Thu, 26 Nov 2026 11:33:39 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:39 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v13 24/25] arm64: dts: amlogic: g12: add crypto node
Date: Thu, 26 Nov 2026 20:32:40 +0100
Message-ID: <20261126193241.1471372-25-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113343_128414_AF37757D 
X-CRM114-Status: GOOD (  10.38  )
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration for Amlogic G12-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3135566df880..df1383f86366 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1742,6 +1742,13 @@ internal_ephy: ethernet-phy@8 {
 					};
 				};
 			};
+
+			crypto: crypto@3e000 {
+				compatible = "amlogic,g12a-crypto";
+				reg = <0x0 0x3e000 0x0 0x48>;
+				interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_CLK81>;
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.47.3


