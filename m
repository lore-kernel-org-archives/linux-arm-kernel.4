Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E45606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T26FC7ED;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=obyXd8ix;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0uzOAneY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=; b=T26FC7EDIVLGaliRZlwZJEPg2J
	j4fTvTuzpN8jQaKtepBhG+X6r3KdHxrmHZRhjbogSBzXOJ0UskWY3hAtu4K+St9Zr1XkDLhkSb4mn
	02FooujFWO8Dvr8t4pmLTIh3HZVh05KLhYF41ynTPEGV0sLonN7DnQCXUGGJ565YMCB9tTSMdXyxx
	O2UYXz/EzlyMnG5JGqIqk153AwUuFjVAmB5wLBhKnaLnD1bcsA3tokWT0jDyBkg6o1V9w3KmWf3nO
	uTu4BrYZ4I+ZRbhOed4riD8QFyReUyUumQUbZdhZcBF65+RfDli49rJ/SGq593T3IB/T/kK6us1kK
	m2CBqPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQJV-00000002hwu-1LXn;
	Mon, 23 Nov 2026 09:26:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQHC-00000002haB-1bzw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=; b=obyXd8ixza5nkqR8YIsOmTraqx
	FdxGa3kI0zgu7Lvb3MkZTYiJIKkmau4IBEYJtD6UoAWCA2cgiDhEdY+bHAv+QzOFJu6oHBzKsnXup
	J0wCwlBTzEKqEQTkBQv6D1I2TFmMdLyaRuwzgBFURpfSYJfyQjxdM7aTMJnWM0ZC/vguUtEx4N/5J
	kCUJywnLQ0XtEmM873uUhmsXq/sJXTEwegrH7xSwfHiFOqu/rFguIHBWtnLCAhQ6y5FexdKdRIGMJ
	8UaF3RAmhXFcybQ/LbdnF3FNROyqqYJgK03IhemmpaARKKld/CKK+zRAxP4vYGx3EwHQ/PfOFUxd8
	L6xPDIaA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQH6-00000002uuP-2wdS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:23:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2299830f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425825; x=1796030625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=0uzOAneYKbKmmIPtxWxbUOrwsloV58s3aPE6Y2n9xa7qOpYq293wbacxb6CnhqBqRC
         3R7PFQZtRPC7L8T1j8maiTrDmv08nbr89sserHVR7pxzRDZ2CZ6nA9DBr+/IyDCoKu8B
         ide26vm/e9qr4ugmWXt3WsOigcoyqn29ECtbxmO5/8/3afYqSSakfqpRynZpxyyX2oao
         M07g0fy9OCPUfAATh0Pg2rjr/+vk3FIZf9U0QFFMXuKdGyJDAym5dIb1w3hacpHcSr3T
         0oGlSKzSLiGSl0ezovkHiDFPD6PEfC96fQoFYiDYmjDlsY6W5ScH6U2oVYRykMq4IchK
         Py5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425825; x=1796030625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=HEbGbAceyIatcg4+Cu+7JNoAwUqFnJ5zLihaBU48Ugs+iexG9ZhE01vhFJJSqPMZX+
         fptpcFHH8lfqbPAD60aIona7HBvjcWYUYTQN2T4QGDAIaIFAibPue3KmqcA1lvZrKpJM
         ZSUL0Q/W/r0K8jAf14V4FmgPkuKp6MF/DM+d46XnuFiSArXZi+dX2/mqHm98Wd8nIb51
         D28+Yj7hudbzZzunJbr18sD5aQ34unvaR/RvDJ/hU/1vIeUhtv3MUsLxLvVjSaxyFU7O
         aJ4jgDwktEnUI6ecJ1VnhZoI6dh2nkBTI01jh1Iof2frSITBbwctZg9JXr/Lkypb4nt4
         cwvw==
X-Forwarded-Encrypted: i=1; AL+hErH4JdFqN3IVh/qRFva0u5pxliCAcAQeKdm5c1oOI0Jg64BGsAWp5nGmOurGfXdRyciIDlR85XAiXUCCtTUeJkym@lists.infradead.org
X-Gm-Message-State: APuU4Z8dececIlkQ85W3gJuIrIhSL2KHFzpA3vIKakP0uzEyepS85P8X
	BJtXVcAbmzgurSF2XNIsODqrlRjUiK9PgqavqdFSDA00xI2D8KCUfKlj
X-Gm-Gg: AZFdTZdEk99SxtlasuPfait/4rME0zDBRMUzdUFbbNM3ZOE6edW6e764BsyndEqhojL
	6pznROBmb9a6Gylg2Y1FPxeLlVttEx6Li2GAMLQwZBgKXdiMG12QONdxSF/xLUlbSCsR+Zb36yN
	SzYX7/VWgeIiAzmjtPyKDqIWfB54uXYzVMC6VonMKqG0ncaquvD9aOadMUG3b5E82ld7kE5vTLw
	eTWwzNy2LXEZJ9bs+BrfQwKyKlXp2wG4ncwbWBgnSFIg/N4iE8K+AOa4zPRj3uxLgDcTP6FTMfm
	+2xfN4FJPaqgnMC0iKgGsWTB/ODNwUaR+UFwXy+soVFP/V41cXL1Q3V55/7Lh8FpdTTowUXKJQr
	Skrzae18xCbl7l1wW/Uh8tnIrIatzoySe+klnSMWf74XZ3C/IfaT9iNZ1vU2N5KQ/KUJGXfPEE1
	dLeVxS4nSqshj1IICbdYBlIDWJ9EGCWZkTQtdkJolEgpQt9f31+Wxq+Z2zMFBZkh4ayOH4dlmE/
	h6eeixQC1riC4kDbmAjyo67eyfFaSUx/EJOu12l6oyC4ZRh9xnKaesIsKZB5j/YX0VMU3Vbhzqt
	WH1VHhJnYOp/E18rZQ+VhN5B1qGwwWFSfk2mp+rj6ivgqcC+wIMbhCwks/gFbZeQIQA7dGhfizl
	awTHYxroSD1aEnmGcqWc3J8F8cRzM9k3EueA=
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr276942035e9.15.1795425825278;
        Mon, 23 Nov 2026 01:23:45 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:44 -0800 (PST)
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
	David Virag <virag.david003@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Subject: [PATCH v2 0/5] Add USB support to Exynos7885
Date: Mon, 23 Nov 2026 10:22:37 +0100
Message-ID: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092349_329607_D663076B 
X-CRM114-Status: GOOD (  15.71  )
X-Spam-Score: 0.1 (/)
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

This is a v2 of a previous set [1], which was split into a clk patchset
I did submit back in 2024 and eventually it got applied, and this set,
which I never ended up submitting until now.

This version fixes some things noted by Krzysztof Kozlowski, and also
contains a change made by Umer Uddin, as he recently tried to resubmit
my old patches from github [2], fixing some things up, but missing the
previous remarks.

[1] https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org/

Changes in v2:
- Clk changes not included as they are already applied
- Add Reviewed-by: tags where appropriate
- Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
- Use unsigned long for set_ref_clk_rate
- (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
  error.
- Keep dt nodes ordered by unit address.

David Virag (5):
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  3 ++
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 36 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
 6 files changed, 90 insertions(+)


base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a
-- 
2.56.1


