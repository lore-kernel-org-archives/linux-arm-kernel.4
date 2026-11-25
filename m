Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58699606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RM9bR4Av;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3ztJ26P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=; b=RM9bR4Avor/TNm0N31Bt3zNCXY
	goXcupBWsfVL75eWLx2KFQi4UcqkZaXc5fWB835G1JgOdJor/3Qqt5E7fpv4fJYAD80SlLc61dXUC
	W94QveWcz05skJKZvQbTSw+79I45nBLSQ5bIPi+wopXCTo7h098Abs75e7+AYyCu000Xkvl3eJ0Iu
	T0v5kl1F4lbzTnv44M6bmuMVLbfhXr6tK1Phq87WEmcPB792HFlNmxWhK/Rz2000mmDZghMvG2Ury
	6i06Pidu0rsTeoXQXjNCWrs4MGSaNtHwsbPz6LpbDwGlYiiCroyYzhs0mhehozmK7Yk5oWvxpUmp2
	/QwBQHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEPn-0000000AGMp-2xw4;
	Wed, 25 Nov 2026 14:56:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEPk-0000000AGK4-10R3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:56:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-491846221ffso5051971f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618562; x=1796223362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=;
        b=J3ztJ26PWZqjzUrVr4pZBel+lMVDYKpuLY6X9Ry5Ymta3Lk2EXob7GPDCHtPJP8iRZ
         G6L2w9agow2xdzK18rkdFrIBcuTnkbkcNmFngsn9MuBT2vwGOy65SMyojTdQLFoFZGlY
         TDcnrD+8uI8whewiRYGoA1ktVM68ORLHkuKpzeH84EOI61913U8mtautEkW9tiT5m8B5
         NQuKHkapNih+l4xKwDZh+RoWyDFmATaOz4sZrK0ZQlcv8y3+u5qFwTr/R6/1jC4WAdjo
         8DMQAmFtkZO04TUvTHUjNSjMeGL5EsozdGz28BbuDdmYjbcPmtprONjsbFIOyoW+OMLQ
         yorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618562; x=1796223362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cd+VsEs2FzLrKaZ0JDNDcQff/j0gUW6+LeqT4o7nk8=;
        b=pJC/AjHQ5EG1R9Ws0hsfIvwneUPN9DNB50itpSyLX+cilHCDW9iGT6aXu5+ye5Jx2/
         BLnd4hYBQEyjwr2Cv7iHEJs7n0wE2VK06KQDWik6qJ3JkQ4WyRI4uMIrczT3rHMWENE7
         t1z0TH6uKTCW5+ITTKJLzeJIVR72KIN/B7wiHH5Z+HwCKFFh1zqTYvLkctpTZDfhll1/
         WNqbJrKEf/Z9YvKWAubhvtxOQwI5XG2HN/7YS1cmunu8MVbWN2Z37+eecHh2mcNyWYg5
         lhVGMeUnscqNVazMXqjoE5xajM+w7AfAGxqydyDYPwpOC0kUQyEsFrTI06AHaqiSlxBz
         0Eug==
X-Forwarded-Encrypted: i=1; AL+hErEf8BhFPFaHwOo34HEQLbmw0u+Ob0mR4gWuV90ywYTCjI7dYhvRns3FQ2QF/nHNfuXOT+F15l3B0uOZ0pCRXz+O@lists.infradead.org
X-Gm-Message-State: APuU4Z+B7BPizdLHG1F7Shv0oi88zCWTvanvVAuccFdNFYmtrFix1/wu
	dhlxOxcL0Chyso1bQzjAc5aP7LyXjZ0gkFL8Kf1hn13d4MXRLYMa/6IN
X-Gm-Gg: AZFdTZcwyMdgl7cbAvmf5H9qRsc/Bj49p7R56HX5+Lzn9UrAkUOeG8w2Dehki/3AJQa
	di6H3oE+RPDevffRvQgeeA1dzpoU4DZ8YNkHS15j0TWes2WPc8IfxjocbTtcZIv1M4BqCukCiN1
	1YGWk4pIbpvLOisad7gCcX91VsIRPdciDGXXDB+1NzKf5eVMwx2jSzWK0h+uFWQlO2HWk7AGDHE
	wy7cuacrTvTxnHmiNZG0DcIwsinShmNibIEzlAebG9U1o1kZVtkZNoNhPx9qmXVRncbTANTfXkn
	8WxZkDDSJzNLUEauSqbYO3HninnUZjel+a3mN3higiLibM5e6tMUT+GGhK6/4RvOrHb/Bvk3yN8
	uGFs0ad+9btp7C7VKPHmIjXtLw/MS4X652qPLUKur95Pz9LpUFf5hP/QQt0Jy1WCx32EVpFhjKW
	Gbln+3LlDLtKu7jXDfCcUTBS0jR0sAtAo9yRtITucbSJCebc/uiZJ5zEG26t90cQh39sp9r/FmH
	xRYZlBo+dVCt+8DpdV60xsudluf0r60FD4oJeBkGE0Ecxh5WTFT6cStteT3zTx5wFecPEFgEV7H
	TD5OkasvEVj9CgPNFcHDMz+RCChlLCRICOn3DBgEUP9yjfHn8gM6hiv+N0o4Qe0gDby1rRHSkfT
	vPJNS0io1cClRuMGKKve3E6xRqEf9UteZTg==
X-Received: by 2002:a5d:6f07:0:b0:48f:fcac:a5e2 with SMTP id ffacd0b85a97d-4abb47b243dmr33442304f8f.38.1795618562038;
        Wed, 25 Nov 2026 06:56:02 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:01 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Subject: [PATCH v3 0/5] Add USB support to Exynos7885
Date: Wed, 25 Nov 2026 15:54:51 +0100
Message-ID: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_065604_380879_ACE86760 
X-CRM114-Status: GOOD (  15.40  )
X-Spam-Score: -1.9 (-)
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

This set of patches adds support for USB on the Exynos7885 SoC.
 
The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
PHY that theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

Changes in v2:
- Clk changes not included as they are already applied
- Add Reviewed-by: tags where appropriate
- Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
- Use unsigned long for set_ref_clk_rate
- (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
  error.
- Keep dt nodes ordered by unit address.

Changes in v3:
- In exynos-dwc3 dt-bindings, use an enum with the exynos990 entry to keep
  the exynos850-compatible entries together and keep code clean.
- Add Tested-by and Acked-by tags to phy driver support patch.
- Move maximum-speed property to device dts.
- Move status = "okay"; to the bottom of the usbdrd node to statisfy
  dt-check-style checks.

David Virag (5):
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  4 ++-
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 28 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 31 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
 6 files changed, 93 insertions(+), 1 deletion(-)


base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a
-- 
2.56.1


