Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497C7606D805
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V/X4ip8i;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=gjnYwTDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=; b=V/X4ip8ibgIc3Kvn7eWeCyr7vL
	JPVzX03MpdbsXA4Ic9PR8NLLmFZmwicZZuZEBUCViGNLSVSu3ZYxbb3lyS3LDlt6Z8FRya3lTOPnO
	Mge93fIZ44ACXtd//dO71esHIY1QkFPnz6Wt8F9kdgNAEhXHCZG5n0UT74bI9VHcpsK9/oY5XR0As
	okYHOkVOPpsxKgWclYr6G1GR4HWN6EV4rV4XghB+cmCdlJzm7ija8sSf0GepVkjkQpiYLNqpaBKkz
	1Pbgy/kiK140Z2ndFqXVk7LqVQfDXfKUGsg+dDjsDhrrhLwRuXFrkOBCsZGBiZYhG/00683OBXW0u
	1+aMDPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhBW-0000000Enqi-0KoM;
	Sat, 07 Nov 2026 14:14:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhBT-0000000EnqI-1lax
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 14:14:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso14840135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794060857; x=1794665657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=;
        b=gjnYwTDkIezwU1qoXMNgKU8DDqmsg53SpmreyHWntXVQC89SP3YnXNuomTUOoM5Pom
         3v2nviscXy26g0dQSJjOIrNZB1ToYuAksLV18MIiWMqfYKok71t+7NWTr8S0osF9v5iT
         dTeu58ts+1MlF5782Ml3hgYPSl5b1SRCpyGYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060857; x=1794665657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0t2KdflhR1USZ5uSPDHpmPQ6LbU6AJD684om9GpEew=;
        b=mnak6NIz3CP66NXnBEBgqnA2o20BTVJoCKQXICOS7rhXQRcY0AS3jeMYXQ4xCIR3+D
         Lkt9mUGpxYAVi7Xq/kP5yR79T9CbWUT8ThY+M9yiHKWPbCRIzbjxstHg4qmKfcB1MREC
         r+D0FqK1atCXiL4dduLItDwtPUhchEAHqtvX0Z3ymYIyKCiX+HvIqAI3t9+IbpLAwWFE
         jQjtja1v9eenXMtC23jCtU19G3qElOm07afCdF6a2BxGkz+5/EDA1bv72FFYcwXfiKx5
         6Tmr4pgtcRxgu8CzBJ9pzPl0+yRmF1EuhJ5IGiNaLBcflsbBaPWZ/e8cac3wUBTCrrKL
         pt3w==
X-Forwarded-Encrypted: i=1; AL+hErFyIzPcLlCHEN5fbkHOdPRmgvpQezGdtIhzcPPY1K4Z9c5QY3xK+9h3cyTEWEYwUEuXfp1v+lbnOqc8MgJ2MeaF@lists.infradead.org
X-Gm-Message-State: APuU4Z9L+LFN/eSi8hUqgYfUCQnGK8LwJ7GtHcZ1sH87IKYcybw6CPP9
	aV1cgHBGS8M4H91IgzMy8jJaqAjymGOyOeUKY0f5vZUBAD9RB2/VzaEWYQAzNqix3P4=
X-Gm-Gg: AYBFou1mYe1c8GpNpdOvGGGajIZynzef6CTB9q/IW+icEf8Tyc4VeHpZjbBZVfktZRM
	fRg10T7tbL+d9sggDIYG8VQ0CcUB0XhJz4eLTWnP8e5OtKZqqpFFl0JY13FjQjujPM3MzvrK63y
	NhM1Ru2W7PT/PdZah+9sY2bqT+ageUwZNiBB3R+FkDShOxTO0OBu58jRq/EmN88PWMdZkOtHNC2
	mGtADxui/AyE18nlifLqVAqdgFjdBgLK2sMWkg6aHW7vKOgR93lyOkVZG5TiglTOlr6faG7ZYvG
	SS7dsBX7IvVI8f1xkWx1SRpsW+/zgu9GQEbmohFOxqsBlxxyqycMIPn+jZk9ZUKz7As/xOPh0NZ
	VMO/soKNzplqbVjsHFTZJpbzLZWqPvU4lu0NbClXDrCLhclnxOrWCfDvfXfl9EoAXmk2tt3mI/6
	XqiSbM7IJey4v+qmziKL+wlgJdv94KdJq7Y/P5zy2FVSB8Tl0CFbyKqlAfMuhNLeOlEZ/MfOF2h
	U+2dHLQOfYONdghPon7G9Tlq1rinT2nTdgUnaF4vDRkUFFSak+4I79ZXGbEhN4o+Msowr7FZrQb
	DtxWfw5VMqG2Ptw2FU9pe7WpxIQDLyv5mml0joPWMjWBp/eLs8MPYSATlD5nb+1RwaLTuIqR5YL
	UXr74fTXGqvGooywL41LERBEcQw1OlNwirw2Y+39l/cQ5oxH7GYR/7T9AfYDYgLB2dfae4FCfgW
	0uA2ESaZYZRzL/XerGIZj7j1ATFA==
X-Received: by 2002:a05:6000:178d:b0:48e:5550:c64c with SMTP id ffacd0b85a97d-492753739f8mr11843574f8f.14.1794060856956;
        Sat, 07 Nov 2026 06:14:16 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df21sm9757531f8f.54.2026.11.07.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:14:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] arm64: dts: st: add boot phase tags for Engicam MicroGEA-STM32MP257D-RMM
Date: Sat,  7 Nov 2026 15:13:48 +0100
Message-ID: <20261107141353.2228391-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_061419_525070_22D789AF 
X-CRM114-Status: GOOD (  10.22  )
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

Add the bootph-all tag to the nodes used by the bootloader during the
early stages of bootup.

This includes the console UART with its pins and the display controller,
used for the splash screen.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../dts/st/stm32mp257d-engicam-microgea-rmm.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
index 96b7cb6b5bc1..4495b168fdaf 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts
@@ -163,6 +163,10 @@ sgtl5000_rx_endpoint: endpoint@1 {
 	};
 };
 
+&ltdc {
+	bootph-all;
+};
+
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_a>;
@@ -269,7 +273,20 @@ &usart2 {
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_idle_pins_a>;
 	pinctrl-2 = <&usart2_sleep_pins_a>;
+	bootph-all;
 	/delete-property/ dmas;
 	/delete-property/ dma-names;
 	status = "okay";
 };
+
+&usart2_pins_a {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+
+	pins2 {
+		bootph-all;
+	};
+};
---
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
branch: stm32mp257d-rmm-bootph

-- 
2.43.0


