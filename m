Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412F1606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2vJnQth+;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HUJgftab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=; b=2vJnQth+HVIQRSkNE37GpR8JEe
	rjdT/SR9v51kfcjMr+n/6iYNvw+hR/jGHRbLd19tVjikoiYKxPO9uiA8rlTsFXwsWxl0Sl5+LvgGf
	UbuvehOM/ICRwQf3HR29bozdnWq6GMYpJbPGYruT9rSC6rnXVMxzPUVFiIxnCnVQudDLvmQixW859
	deDpiBjdngcUr5OIdS1i/Hbx+YMXl14S8ff0cJY/0uigDMo0e5ehU6Hw+aMBX8F+T/oSVYqvME14/
	SOAjY+GH4YSZ9FQesoGjE14DzpJJ3X3vcOgRErgBmrP5p1tyU1yAqBDuUBR4cJ9xYvH7m1AA+msYx
	T9nsWB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1g-00000006a0r-080M;
	Tue, 17 Nov 2026 17:31:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1c-00000006ZxS-0iVr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:31:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb61185057so1064235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936678; x=1795541478; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
        b=HUJgftab3B0l9y+JIfqvVHEHlnj7elpGHUrQLaj0kiN8hpgMpORnj+s6dlgXXU7U2g
         OhdhGYHU2GaT8zg9A+Yrej8xKOIVhAEclMvX1g6HU8xo0Dgy8q9zkHH3mEokbUx4tFbZ
         OnohFFJ3ap+A5L4McNiRd9j3TR2/xTsKjqDTPMlDsi6UaLGHUXQcTuGHVksr3uin6GcF
         xr7icUBewwPw7+i6HeKaQT6TY1uNdR6rTW9XOqjIH/6d83zekblQSmVbVnbDNSj+eS5K
         +0T3vBFmDXV9pAHRX4Nwulu2pp0Py0kTX80RL4I7cxV1pom3qjZobmv5B7pT/fRzSTZO
         eWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936678; x=1795541478;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
        b=1a1Uvb89ULY/bIR4DmmD4t/j1YwAcUcTdKL4zhbfZX/OORHz2b8tlnpaEBU2sqeclG
         eE1drJEXcHN9U2DjaAh2JhxuOjewziaNVKFSeEf8TzFRFfUTLI7H/BbxEEBWnhXf0WpL
         UXGtTq+onQQV7qcMTJVnzV1uS/anfvd7mjwxM0dWuHTHM6sPPYdnZR0TuIdPOrZJGse+
         U83lKQdV5b550KtD5PpNglx87iFcMHq+EN1nFMF0QJVy7uNHlVk1x2pDxBYtdHzZRD87
         OHiSGVFP2/iYiY3KQ94MJxuFEO/2U1L/0/QtngqKvB7xWP8zPR/98XFieyceY52El/5U
         mTlQ==
X-Gm-Message-State: APuU4Z8JWkViWX6LRhDYy0p60KbwSMmrF8A3axCK5XKnVN7LvqkpTOB6
	AgzSAePaKej7hBGSbVhUesKWog2oY2Qco+A8ooAhlBSEi0F01SXUEAzcj+RvgKw6XGI=
X-Gm-Gg: AYBFou3akRmelkxINe6l+wK6Cygg4xv5updWT1Xz5GThQVFChcpQeV7KagUwr9DGJfQ
	ZTtNC3ZkaTpISUNo70g87qj+LvPRRgDSizbpmwPdvvQ3kbKmqxK6rfcslYcmE64Y1V68Jm1PrDr
	wVqooVVSbP7Lblt4/ycj5j2QCP1kpzn77E6tdZeqWxV+JtK30Ne7iNbOk9va2Y6TcEXJxXDsIuY
	hk8zJJMDZO0aFbWPyZBEXbUrAOL7uEmr89fGU4SgI7Ins1ihvUMWzikBRvE51OfsEKZOkBGQe4J
	kZkQCtiD3m60PZK+I1dFrprQp/aoKdpPkUuMre9R4fQWt1p5D90cdxfEj5aWcjgAupXK016/ReW
	b3D77N60GDbNRDp87p56Z41SnVIUVZvz9f5knPtKBU1m4KBxzaDYn+8nGgtWQEfokpeGSXmAt4s
	HKpNB4OFkYXZThatBtKLk3Eb/OZLGdwuEQ4hEAq8Obi+QWF51MWOTqIlhP8vxtbRkpg9h61+TCU
	+/WQ+Y5EnKG1LbHVFskkgW1iIli6OwFozY1cZ0bRHRHHwwfpwgyoK82ky+6RrVTZFyRbCCFBsPj
	nmQhW1MLWYqOMOOvHLKkq3enIze0ZE06+KHv8BReC69KWbeVkV73VM7g
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr181094395e9.0.1794936677610;
        Tue, 17 Nov 2026 09:31:17 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:15 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Add MediaTek MT8196 SMMU wrapper interrupt controller
Date: Tue, 17 Nov 2026 17:31:03 +0000
Message-Id: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFeP/GoC/y2NQQ7CIBQFr9KwlgQoUOpVTBcf+FVMaCtQNWl6d
 9G6nGTevI1kTAEzOTcbSfgMOcxTBX5qiLvBdEUafGUimNCc847GYnivaY5xpa8Ey4KJGi+Y5KN
 ArRypyyXhGN6/6mU4OK/2jq58U38j4WOtd+XQiIWM1M0xhnJuACwTKPuRWSWBmbZDZZzutOJOg
 vXgObSCGTLs+wd5W3VKwwAAAA==
X-Change-ID: 20261117-mt8196-smmu-wrapper-8d2041f2e65c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_093120_234423_59ED10EA 
X-CRM114-Status: UNSURE (   9.39  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT8196, the multimedia SMMUv3 comes with a MediaTek wrapper that
merges its interrupts into one GIC line, which stays asserted until
each of them is acknowledged in the wrapper.

This series describes the wrapper as an interrupt controller next to the
SMMU node and adds its driver. System suspend is not handled: the
wrapper and the SMMU lose their configuration if their power domain is
turned off. This is to be revisited once arm-smmu-v3 supports runtime
and system sleep [1].

[1] https://lore.kernel.org/all/20260929034510.2023173-1-praan@google.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      dt-bindings: interrupt-controller: Add MT8196 SMMU wrapper
      irqchip: Add MediaTek SMMU wrapper driver

 .../mediatek,mt8196-smmu-wp.yaml                   |  70 ++++++++++
 MAINTAINERS                                        |   7 +
 drivers/irqchip/Kconfig                            |  11 ++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-mtk-smmu-wp.c                  | 145 +++++++++++++++++++++
 5 files changed, 234 insertions(+)
---
base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
change-id: 20261117-mt8196-smmu-wrapper-8d2041f2e65c

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>


