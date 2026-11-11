Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ABF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C3jREI+1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZ2CTcXa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=; b=C3jREI+1jgTd2v
	HDq8ciqMbjDe34M5RhR0NI/rFJObn5O/q/VIV6AytHOXm5Ov3UUdphJKoNAtT/FXpcdiFaTYzzU8x
	MosoVKK88yY7Hd+XeukieXSi9kt2yGfEFSbANGk2E8G4Wl+Y2nnoKcqBBKZF05Ohlkyhn8BpzY6SP
	LZJepzj7touywAVav2syKTpjd24nVjcMIa1gBtEY37jZzM+RkyHEH0EZxGLQcYxGl3WtRuQu3Ws+R
	uKmWq8lnL4CL9p0Rr/8TQrFMwf3uepZAyXZ9sOBgal/FTcqMo8OtWZxn1wm8mCcl2foUDTQo6N3aj
	nO9zJD1lDSRe7ngJuVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcT-00000007TYv-3kZe;
	Wed, 11 Nov 2026 19:04:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDcR-00000007TXv-0xJx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:04:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2194581a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423866; x=1795028666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
        b=FZ2CTcXa0/UHTT+K5JtzMDbFeugU+YqYl/VcLUf0qWDo84lsCZv0oBZ88Qu39hIO7W
         3hwljXibnZyZkht+9mWZ0aLWUN+2KLkXDTltyJ6OgX04acs0jThqBN3mNeVUcWIahmCk
         60EczjGrtaBl2yWy+kiP8KEOKXYHjLuDNVJFmEliX8ePMHRsGN/JQ0kzI2VQfBhwuATj
         rTfTCGLuVkCz1ZB+IfHGwdInyXIQiJXyrbLc0/1rQdoGTnlEwasoLTshH7LuwiTNmO65
         47E7sSvbahkNXyWHcETDPVtWYMTfSICZoNzOLCAKHJcjMJazl/W+pwjLWwGNlsToqo8f
         uirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423866; x=1795028666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEOLRJwAl9euldxv8C595NNHRCaNku+5qCdMnuutjK4=;
        b=bQNaFzBEpA4/pYw1a9dXiNbmnbfwxDF9I6fHmpsFdyE+XYN6m0H4o2Jy43VAmF3R3K
         IO/9wGFJC+vAA7PQgyOstCAcVRqvRY7HFtbYalffYS5Qiu7bf3mnVu9UnqGLY5W/fcAi
         ZBzdX9R8n7try91Sokto/Wlce6fD10WZ/COQ6MTxxerWjGxzNZ/etjFRjq/zc0xOOW62
         L/jF0DAVk/InFUtibb3hyGD3mO7majIUaKVr33VfGLVwn0IO0TRJhORmTPd1G1s9/PUA
         SePv7bXjFcivHaHnEO8CQ+zsDW++oELr80PjEIB881XowaI/KPes7U6bxHtDTyR7WHlz
         UlQg==
X-Forwarded-Encrypted: i=1; AL+hErF+RDcsuamrk8pXOlcnqbFfyBQxTrCKvr1D0HSnf51NqRSgkpljLL7zv1DVdoJoe7b0UtaFm5Ty6K+DLDuTLXat@lists.infradead.org
X-Gm-Message-State: APuU4Z9K+NUGxDnxc//up+IlVm4BMHiTQMl5hay96U5RJhhC8yYQd31H
	cKY5ASLr4QYT1Ict1zhjyvqqvH+SeFe+8F/3tu/PucpwmrHIMwb1lIGJ
X-Gm-Gg: AYBFou1ZCDDRG+eMua0IYvpk0qYb6E3y9k9/aoEC9qboZ9F8S41Qp7F2PGix3dCKlzB
	ivlWllZA66cjHbsbxpv/b74C7q29edvUf+BehX3ZCMnww4UqpPD1dmgDZZ6mQ06U91doA3mWPci
	19OdgaFLvyAt1AbBY+04C74xNiU9gSD1KLeFsifnrWx/Mw+P7gypViLQGa45B9nJxCGDzkvOAhL
	7AqKh+SQUKzc+Ovl77l7hixGQrgNCmxh8MupavrXYLqcdVhpbFm9cH+CvjC79L0H7ual8OomSVB
	C3PTsjJlh6JkdbtVJr3bj8WO88KWVe4ATxHW8LWLQmGfMzsN8VrHkULiUKEixqWbz8JPEraTzOZ
	n2pw4DZYm/eGm52xsgBjnAaW5wm0itUDaQpEMYfpyhuQ/xS1KGZ7RIi7czai5fKmkxqMUHREBCs
	jkcYQeeYZmOXrH3eikY1VP+VxGfyqRLjsr4eNZj+1FEad+mLQx3KQbQnUOQLlfjXNQBQ0bt0pTv
	tFmnPtUi2Af6cBBqQw2jeu7D4qWW3xs68H6XLfHo/VfHsZDDt/RwVNH4Ob+W67ZlI1XfMTezDE8
	JTkv2AzBOgkJDn01Ae6WEaQlMswznj0WVps=
X-Received: by 2002:a17:90b:55c3:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3b182f0ab74mr2979207a91.47.1794423865920;
        Wed, 11 Nov 2026 11:04:25 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:24 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:57 -0300
Subject: [PATCH v2 1/7] ARM: dts: imx6q-apalis: Add ready-to-use DTBs with
 HDMI enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-1-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=2682;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=IhvOHZocG3sOxkIY0mTZ8xkrqmTA96SIs4gUIqO21v0=;
 b=0RH9hyedCGLDxqRsacjj700/y3wjOOQwWdmkydZUbod6PkJsolk3iCEIm4MOXpWF1orItNp5+
 rfBds01kbYkB1eHbWn02cxpgaaF7avxlyA6n5rxwvIqVrSMcS/HJ2Vd
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110427_367267_6A17A9A4 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Combine the imx-hdmi overlay with the various versions of the Ixora
Carrier Board and Evaluation Board device trees to provide ready-to-use
DTBs with HDMI enabled on the Apalis iMX6.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cd4c8062e6783..cc0f5f100892f 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -124,6 +124,46 @@ imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-vga.dtbo
 
+imx6q-apalis-eval-hdmi-dtbs := \
+	imx6q-apalis-eval.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-eval-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-hdmi-dtbs := \
+	imx6q-apalis-ixora.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.1.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-ixora-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.1-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx-hdmi.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx-hdmi.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -271,15 +311,25 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-yapp4-phoenix.dtb \
 	imx6dl-yapp4-ursa.dtb \
 	imx6q-apalis-eval.dtb \
+	imx6q-apalis-eval-hdmi.dtb \
 	imx6q-apalis-eval-v1.2.dtb \
+	imx6q-apalis-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-ixora.dtb \
+	imx6q-apalis-ixora-hdmi.dtb \
 	imx6q-apalis-ixora-v1.1.dtb \
+	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
+	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-eval.dtb \
+	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
+	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora.dtb \
+	imx6q-apalis-v1.2-ixora-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \

-- 
2.43.0


