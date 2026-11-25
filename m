Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F5F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nEdBKMKr;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bBkrEDlE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=; b=nEdBKMKrq56byt
	3eJyhG/ry4NP34nQXnp1b4HwSOqJ1GUpPcs1XkP8YDxifG1D1K/j3GxMZyskVHJVkXMmT/xuPCIuo
	oRxe38aDqrpjmfJTm3Cmuu2RxqC8ARhq8IPt4a8U11kC19o3YiirIx3tZio2Sp4Rwk1+xYQxmunHY
	sI2WkWAirqyjZCGvQ9ti2nYhdD+VkJlrfKPoPPXF94uIqppADW6UKUD+/8D0hAB4wMtDD0QRloJBQ
	CTGzgDA/TxSVdMWxxKztW4G2oPww+IsCe90VvUiMcco1Exuhk0t8pUdhVm7IGyeWIq4rdTtk2Pqg/
	NxhE1fuK0uH4o73OJFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0XP-000000087De-2iF1;
	Wed, 25 Nov 2026 00:07:03 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0X8-0000000873h-1BDG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:06:49 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-386ab9ab619so5828621eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565205; x=1796170005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=bBkrEDlE3ckgHQXx7UKy9U8KwQlAVv47I04WBSOt/Uc/Q4IBYdGdsgQXlr6J9WG1lP
         FzP6QX7dOoeBb70R32mSoM8PSw0Gqtp+/IIIAnhsHPwT8c6DUfL8v/oY8FX1RNIe8pgN
         jJ8hC3C/cOOV1r5eyWZ1BbOY6PcFjJNfQCH7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565205; x=1796170005;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=vcK+2iiR4nu+taTuosyFWga2x/VWoQ2rgqJ2k81txslksphCGMDcgw0lxt8Dr7vODS
         UGhqxLyc7qD4CWEpwKJdx8IBN62mrc6NOrwIKycg0XH245AeM1rRZCWYE+E6nhgVoYLC
         tkUl23I7XtWgsTwYBI1yqR1IL74yK0oG8iBRPw824XS220ZcQWLE96XoI34u/3kixp7G
         7+q7Bl2gGourTZ4oxKabda6SstiNEi+6KF+VmnRgjQMHWHF7+mjZ+OVuj73VJwTC3O4+
         Siwt8tNdzg+2WM7+MxOJr0zT11q+V4Af8iCZBWG4p0DV/0Gd9MBGo06frk/QNWDpcauU
         m2qw==
X-Forwarded-Encrypted: i=1; AL+hErFsRT8PaKT5wy7NlOUA3RbDuagR0DEWsBw7a5hZeVzANnU8zBFF96NgkzoB6e1y1B/MjUk2DmKy4OtTkKqBNUhE@lists.infradead.org
X-Gm-Message-State: APuU4Z+qmuR/ft+nMQSaDZirrWrJHpKpbIKGs036X/7oGEXm2FWC9YU4
	XO/wH9mROBFNKx6791LOYxyKqgOx7Xxc0j7rBWMlcBOPlE2azj6XoKbID4ywyY/LlA==
X-Gm-Gg: AZFdTZf1LQKa+oSZPqyuRg6nHFEtt5Vrz/2+wy+I/iMue14Zguj5bb+JKMmJO38jZbf
	ajlzkZLSNJ2j+i4n7B33wh6OqSBkCa9m0zQ27agG88F7VuDgQ424o77oCn8TCpHc/DgH2lBfRcd
	wzFIFc71vF44H7O/B51vtnL10gg6mtPoKZMpG9erGv6dF+Q+V0ItIH0Y0K9AIAbEUspDWVI3hnl
	R/mFYgz6LJ9FpogHhx5JWkVoim3fKXLgKKWp/LWlkge/1L1Spzxme/5tSkscECTKzHTcT5V61Nb
	t/oS4W+giX+QhoXRbmlJ8affprKcGKoctmD5yPUvpXbRrBO4vLJKoKmWvKMQZ9gZYq3mc/Mu8qo
	rFbEWfyec1j97YFLUdovykCKMzZURsisb+WTFMeEipGQonUYeKTRPEJL4UP8kUwB6u2/uWPuCxN
	Qou73Ib+yHbJ1qchd6/sCwi9udL3Be57fuiZnIGE6pd5r2lTNYXG0Xh0Iv7xmGi/aZ4au3SouFw
	8JghjYkBdpUzzYzH1DYFBk5+C2Li3Ki2mn0TkclEIiov9cWSBH6WsySmSGbEfWIOpBAlsz4YrC6
	fZAjFAgtODNYwbKtYV84SRTLnGlF1P7bOASLJAc+4WQL5wj517/fAwIP8Opj+Wy0qzV7Dd0a/mH
	XW4dzlKKXMUgFQg==
X-Received: by 2002:a05:7301:4201:b0:385:b8f4:755d with SMTP id 5a478bee46e88-385b8f47ad3mr16518134eec.20.1795565205307;
        Tue, 24 Nov 2026 16:06:45 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59676267eec.4.2026.11.24.16.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:44 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Tue, 24 Nov 2026 16:03:43 -0800
Message-ID: <20261124160343.v2.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160646_366154_04352DB7 
X-CRM114-Status: GOOD (  13.12  )
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

The Google Tensor SoC known as Laguna introduces a variety of new
drivers, with Google-designed IP. Add entries to the GOOGLE TENSOR SoC
SUPPORT entry to cover the new drivers that interface with the Central
Power Manager (CPM).

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 84b47bbc0d74..ae2b8e8e004d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11509,18 +11509,26 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/power/google,*
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/irqchip/irq-google-*
 F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
+F:	drivers/pmdomain/google/
+F:	drivers/reset/google/
+F:	drivers/soc/google/
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
-F:	include/dt-bindings/clock/google,gs101*
+F:	include/dt-bindings/clock/google,*
+F:	include/dt-bindings/power/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.1.831.g720f3f5937-goog


