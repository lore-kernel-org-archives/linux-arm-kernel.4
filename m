Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D570606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JD+8Kpi/;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MTHc+tKj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=; b=JD+8Kpi/xM7QSg
	D6JcgX9z1L5gnoiKrm5JYeH85cVZyIaCVKJRnOIMLqOLzBdg0bop+5yN1G5CEAhfM0o2QH8giIEy/
	kL17RcbYNTQ1nMG6zpZzyXAasfcN8M+SXEPiTpxwqliCjcIDIvXVXoiFzKyJdr1BMvMyRvTkyNKjL
	SV+zYHP2YafNWMbloSGZ8+Cjz7NC0GWH0flCb026Ha5g7jsi6W8mj4EVKT5IYjokvl8ReUARFdlx+
	gKmwgA1lruPnMuH+Dth2/9sweuyZn9Q2CzahrS2s4HwCyJ7XQQlfM/pxNFN9vhlFBYYx9sBkQ5gkx
	8VOXB8MtCTKnfE+OqYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdBw-00000000CN1-3Jhr;
	Sun, 15 Nov 2026 16:34:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdBo-00000000CIp-23Nl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 16:34:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so19742925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 08:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794760486; x=1795365286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=;
        b=MTHc+tKjsJW1McTNSjxrKRqqFASguJJBZ2x0WwBVi488SxHQXLZM64u9lgz2AxrlA0
         d9OzybMnv7VdOD4u2f+GX0jTv7LK9r5evX3NN5mtlSHHyHAwNA/3AdE/hJxi16sMfDCl
         EVulzRH4L34+3usrw43Ly1aBLyzLRhRIsQFvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760486; x=1795365286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4MqBiu+6D9UqT2D4Jf42GEvZrA2Lb2vwka2d+l2yW8=;
        b=hmGtN2PAV9J9dsGRX3OkVxql+WwavGKplqWQWzIJ23qUjwIKQZnSWByca6ZCwb8kpd
         0Jen5XkD1YVabEGhmDJaPiFt8fkNsxLsAqu7xw/imvIe80V/mlTv4ctQ4TFLPCldHa8X
         b0x2qdNEvIQkAxdsIhQf+A/72oOFs9U3Rh0HlyPt7hBjABcm+wm6B75XHTyoW/gkznFD
         Upub1d/5BTPnpWn+d4YNTGVI2kGffpT/8nBV1t0jd+NCv9nEbt96Aln7EosKFXjxElNK
         6Pz6PHfG+chchVIPwsiuvqiSi103RjsMCSYnE8AtLJpb+vGV2+F7+MSZ3D01l6w6+ytG
         bRYg==
X-Forwarded-Encrypted: i=1; AL+hErFzZp6v1o2ESO83UKTGAoUfZzstu6Ci1D5hWGmP95IqROGxBXtZoZ2B1HaV9Kp3fCuPav5qXCisi4v/qchEHanv@lists.infradead.org
X-Gm-Message-State: APuU4Z8GDTz8sz9Cq4NBFmM1ess4pANcOkcFGIJa570ol6iZjQ72Higs
	OiydgP5Lw7cIi4eSeFpTM1YzbVfJxTsTSMutPFNJlEaAqCtwWeIEAhyuxIIrNOUy2Bg=
X-Gm-Gg: AYBFou2dFZEQnh/pa77cE6MunB25pedskQmBXS3MFGX0K+L7dWJSaftZPhnQtVQVY8z
	Se03Ay3SlEsCEOL7eX9nAwJ2bEwpDxbdPXHeSDTZrlEy0x/AJR8mnWSfoUf5R/eEPNwcQrzcyz6
	Y4tmPzNeW74Rxob6YIAJ+kzXqOvPRdB1Zk+zXxv/GXXbk0EnrFVXFcZ/UyZ40TMESt7eABYWI5B
	HAj90kTPL2oGxTWQhQc9E2vYbEL7ObaG6oma9SIVMXfu9560s8VRCEAU6bgBK33IEFKivj30k5e
	XeoCoreeoKEVo7B71hE1l4+9s4XAOfmdeRbMCET/aJZSwHBWF6dSRxgVUvW5PnukHmG4wNxCbRr
	VoJjWi0WSVEjTDhpD4HpKWaTHVH82wHDwSjR14ZV8MqNTpk9QZKtNsKlXbJycYqiqA9F0Ekcu/l
	xia45POtZoo1GA2xvgxJ6v+EdShHMMENvBM9vPAJ6KIJyfAq1FmiOqUVNSK7ZIk+wGB3eaOA7Ox
	wDz3Xgkl0V1zayCMvqGNoXwwJwtJDryedCQg8NsywQ5EK+eBMQISKi6DKvgQzEScOYd4dFh8ilD
	WEiRtpCj/jBI+fF8c7t+Vvb2gQong/ap1rYswJEVf4QDViOFfy6p4e8vri+Vk+IXrkyb6dquc3w
	fCh8sT7E8BVbPTOO6t42ZV85YpWNjoiOmktdvQ1GlUeQ9r6joTIxARRmb/nH4EhSHr0fQkIA3lr
	CdtJoa9UGl3zxqYxDIsVEMt0mUFQ==
X-Received: by 2002:a05:600c:4343:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb5e8a7cc5mr89345295e9.7.1794760486606;
        Sun, 15 Nov 2026 08:34:46 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f782396sm17500021f8f.24.2026.11.15.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:34:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/2] arm64: dts: st: add mmc aliases on stm32mp257f-ev1
Date: Sun, 15 Nov 2026 17:34:30 +0100
Message-ID: <20261115163432.2601947-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
References: <20261115163432.2601947-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_083448_531819_C2802489 
X-CRM114-Status: GOOD (  11.37  )
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

Add aliases for the mmc nodes, so that the SD card and eMMC host
controllers get enumerated in a consistent order on the
STM32MP257F-EV1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 9c38c4fe0c1f..69e3ff4cecd4 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -22,6 +22,8 @@ / {
 	aliases {
 		ethernet0 = &ethernet2;
 		ethernet1 = &ethernet1;
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
 		serial0 = &usart2;
 		serial1 = &usart6;
 	};
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
branch: stm32mp257f-ev1-emmc-aliases

-- 
2.43.0


